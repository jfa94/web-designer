---
name: design-system
description: Audit, document, extend, and hand off design systems. Trigger with "design system", "component library", "design tokens", "style guide", "handoff to engineering", "developer specs", "implementation notes", "design specs for developers", or requests to maintain consistency across designs or translate designs into implementation guidance. Use for system-level reuse and specifications; use critique for a product-design review.
argument-hint: "[audit | document | extend] <component or system>"
---

# Design System

Manage a system in one of three modes: `audit`, `document`, or `extend`. Usage: `/web-designer:design-system $ARGUMENTS`.

If no mode is supplied, infer it only when the request is unambiguous; otherwise ask. Handoff is an output of document/extend, not a fourth mode.

## Shared Workflow

1. Resolve design, code, Storybook, documentation, and tracker inputs.
2. Inventory before auditing. An inventory records unique treatments; an audit judges them. Count visual variants even when they share a component name—the "37 button styles" reveal is useful evidence, not yet a verdict.
3. Classify drift: token, component, pattern, documentation, or behavioral.
4. Distinguish sanctioned, time-boxed exceptions (including live experiments) from unintentional drift.
5. Record adoption (teams using it), compliance (following internal policy), and conformance (meeting an external standard) separately.
6. Route each finding: fix a local defect locally; fix a recurring or missing capability in the system.

Useful inventory tools include `react-scanner`, Project Wallace/CSS Stats, Figma Design Lint, Storybook, and component manifests. Never hallucinate component properties: inspect the manifest, source, or Storybook/MCP data. Add that rule to a consuming repository's `CLAUDE.md` or `AGENTS.md` when asked to configure agent guidance.

## Audit Mode

Check naming, token usage, component coverage, pattern consistency, docs, behavior, accessibility, responsive behavior, and visual regression coverage. Each finding needs severity, evidence, location, root cause (`local override`, `missing token`, `undocumented pattern`, or another specific cause), remediation, and local-defect/system-gap routing.

```markdown
## Design System Audit
### Summary
**Components reviewed:** [X] | **Issues:** [X] | **Score:** [X/100]
> The score is a trend line, never a target. No metric without a decision rule: [what change follows each threshold].

### Inventory and Drift
| Unique treatment/location | Drift type | Sanctioned? | Evidence |
|---|---|---|---|

### Naming Consistency
| Issue | Components | Recommendation |
|---|---|---|

### Token Coverage
| Category | Defined | Hardcoded/incorrect values | Root cause |
|---|---|---|---|

### Component Completeness
| Component | States | Variants | Docs | VRT | Score |
|---|---|---|---|---|---|

### Findings
| Severity | Location/evidence | Root cause | Route | Specific remediation |
|---|---|---|---|---|

### Priority Actions
1. [Action, owner/decision rule, and expected system effect]
```

Export findings to a tracker only with permission. Token changes are system-wide regression events: enumerate consumers and test every affected viewport, theme, brand, and state.

## Document Mode

Document purpose and non-use cases, variants, API, tokens, all states and combinations, content, accessibility, responsive reflow, and migration status.

```markdown
## Component: [Name]
### Purpose and Use
[What it solves, when to use it, and when not to]

### Variants and API
| Variant/property | Type/default | Use and constraints |
|---|---|---|

### State Matrix
| State/combination | Visual | Behavior | Accessibility |
|---|---|---|---|

### Tokens and Responsive Behavior
| Token/component condition | Usage or reflow behavior |
|---|---|

### Do / Don't
| Do | Don't |
|---|---|

### Code Example and Migration Notes
[Verified example; deprecated alternatives and path]
```

The base state matrix covers default, hover, focus, active/pressed, disabled, loading, error/invalid, selected, read-only, visited, and dragged, plus meaningful combinations. Disabled controls are unavailable and usually unfocusable; read-only values remain perceivable and often focusable/copyable.

## Extend Mode

Use the rule of three as a prompt, not a quota. Map the request to an exact match, an extendable pattern, or a genuinely new need. A wrong abstraction is costlier than duplication; avoid prop-bloat and prefer slots/composition when variants combine independently.

```markdown
## New/Extended Component: [Name]
### Problem and Evidence
[User need, repeated uses, and system gap]

### Existing Patterns
| Candidate | Exact/extend/new | Why it fits or fails |
|---|---|---|

### Proposed API, Variants, and States
| Property/variant/state | Behavior | Constraints |
|---|---|---|

### Tokens, Accessibility, and Reflow
[Verified token references, APG pattern, content-first break conditions]

### Adoption and Migration
[Strangler path, deprecations, owners, telemetry]

### Open Questions
- [Decision]
```

Do not refactor stable, isolated duplication merely for symmetry. Favor upstream changes after roughly three genuine uses, when drift cost exceeds migration risk, or when accessibility/behavior needs one authoritative fix.

## Handoff

For implementation-ready specifications, use [handoff](references/handoff.md). Define reflow per component and choose breakpoints where content breaks—`642px` is valid. Never substitute device labels for behavior. Reserve final dimensions in skeletons.

## Governance and Foundations

- [Tokens and foundations](references/tokens-and-foundations.md): three-tier tokens, naming, dark mode, type, spacing, grid, color, and icons.
- [Governance and refactoring](references/governance-and-refactoring.md): contribution, exceptions, deprecation, migration, AI-generated UI audits, and VRT.

## If Connectors Available

- Design tool/Storybook: inventory real variants, properties, tokens, and states.
- Knowledge base: compare documentation and publish updates only with user permission.
- Code search: trace token/component consumers and hardcoded values.
- Tracker: export findings and migrations after approval.

## Tips

- Fix the component, not each designer, when evidence shows a system gap.
- Prefer composability within explicit constraints over endless variants.
- Document while context and decisions are fresh.
