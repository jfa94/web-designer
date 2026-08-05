---
name: accessibility
description: Audit designs and code for WCAG 2.2 AA accessibility. Trigger with "is this accessible", "accessibility check", "WCAG audit", "can screen readers use this", "color contrast", "accessibility audit", or requests to make designs or code accessible to all users. Use for conformance and assistive-technology review; use critique for broader design feedback and frontend-design for implementation.
argument-hint: "<Figma URL, URL, file, or description>"
---

# Accessibility

Audit a Figma URL, webpage, screenshot, file, or described flow against WCAG 2.2 AA. Usage: `/web-designer:accessibility $ARGUMENTS`.

Conformance is not usability, and tools cannot determine accessibility. Scope the audit, state what was and was not tested, and never present an automated scan as certification.

## Workflow

1. Resolve the input. Open connected designs or URLs, read referenced files, or request the missing artifact and context.
2. Establish the WCAG-EM scope: pages/screens, user journeys, technologies, representative samples, shared components, and exclusions.
3. Test in layers:
   - Automated: axe-core, WAVE, Lighthouse, or pa11y. Automation can assess roughly 30–40% of success criteria; axe-core reports finding about 57% of issue volume. These denominators differ.
   - Keyboard: logical order, visible focus, no traps, skip paths, Escape behavior, and no pointer-only action.
   - Screen reader: NVDA + Firefox and VoiceOver + Safari where available; verify names, roles, states, landmarks, headings, and announcements.
   - Zoom and reflow: 200% resize, 400%/320 CSS-pixel reflow, and text-spacing overrides.
   - Disabled-user testing: include people with relevant access needs for consequential flows.
4. Evaluate every applicable WCAG 2.2 AA criterion. Use the reference for a fuller checklist.
5. Reproduce each issue and report evidence, affected users, severity, criterion, and a specific fix.

## High-Risk Checks

- Contrast: normal text 4.5:1; large text 3:1. Large means at least 18pt/24px regular or 14pt/~18.7px bold. AAA is 7:1 normal and 4.5:1 large.
- Targets: WCAG 2.2 AA 2.5.8 requires 24×24 CSS px or sufficient spacing; 2.5.5's 44×44 is AAA. Apple uses 44pt and Material 48dp. Treat 24 as the floor and 44–48 as the target for primary actions.
- Reflow and text: check 1.4.4 Resize Text, 1.4.10 Reflow, and 1.4.12 Text Spacing without lost content or function.
- Input: check 2.1.1 Keyboard, 2.1.2 No Keyboard Trap, 2.5.3 Label in Name, 2.5.7 Dragging Movements, and 2.5.8 Target Size.
- Predictability: check 3.2.3 Consistent Navigation, 3.2.4 Consistent Identification, 3.2.6 Consistent Help, 3.3.7 Redundant Entry, and 3.3.8 Accessible Authentication.
- Status: use 4.1.3 Status Messages so updates are announced without moving focus.

## Semantics and Focus

- First rule of ARIA: use a native element when one provides the required semantics and behavior. No ARIA is better than bad ARIA.
- Follow the WAI-ARIA Authoring Practices Guide (APG) as the canonical reference for custom widget interaction.
- Accessible names generally resolve from `aria-labelledby`, then `aria-label`, then native label/content mechanisms, with `title` only as a weak fallback; host-language rules can vary, so test the computed name instead of assuming. Visible control text must appear in the accessible name.
- Move focus deliberately after SPA route changes and to a dialog when it opens; on close, return it to the invoking control or the next logical target.
- Composite widgets may use roving `tabindex`: one item at `0`, peers at `-1`, and arrow keys move both active item and focus.

## Severity

| Level | Definition |
|---|---|
| Critical | Blocks a task or access for a disability group; no reasonable workaround |
| Major | Substantially impairs a task, causes serious confusion, or has a burdensome workaround |
| Minor | Limited friction or isolated nonconformance that does not block the task |

## Output

```markdown
## Accessibility Audit: [Design/Page]
**Standard:** WCAG 2.2 AA | **Scope:** [screens/journeys] | **Date:** [date]
**Methods:** [automated/manual/AT] | **Not tested:** [limits]

### Summary
**Issues:** [X] | **Critical:** [X] | **Major:** [X] | **Minor:** [X]

### Perceivable
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [1.x.x] | [level] | [group/impact] | [specific fix] |

### Operable
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [2.x.x] | [level] | [group/impact] | [specific fix] |

### Understandable
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [3.x.x] | [level] | [group/impact] | [specific fix] |

### Robust
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [4.x.x] | [level] | [group/impact] | [specific fix] |

### Color Contrast
| Element | Foreground | Background | Ratio | Required | Pass? |
|---|---|---|---|---|---|

### Keyboard Navigation
| Element | Tab order | Enter/Space | Escape | Arrow keys | Focus result |
|---|---|---|---|---|---|

### Screen Reader
| Element | Name/role/state announced | Issue |
|---|---|---|

### Priority Fixes
1. **[fix]** — affects [who] and blocks [what]
```

## Handoff Annotations

Specify headings, landmarks, reading order, image alternatives, input labels, ARIA states, keyboard behavior, focus after changes, and status announcements. Annotate behavior the implementation cannot infer; do not bury teams in redundant labels for obvious native semantics.

## If Connectors Available

- Design tool: inspect colors, type sizes, targets, reading order, and component states.
- Browser/code tools: run automated checks and inspect the accessibility tree and computed names.
- Project tracker: with user permission, create one reproducible ticket per finding with severity and criterion.

## Context and Limits

The WebAIM Million 2026 sample found detectable WCAG failures on 95.9% of home pages; six common categories represented 96% of detected errors, and low contrast appeared on 83.9%. Use this to prioritize checks, not to predict a specific product. Accessibility overlays are not a substitute for remediation. A vendor legal report counted 1,023 overlay-using companies sued in 2024—more than 25% of website ADA suits—but that does not prove the overlay caused each suit; the FTC separately fined accessiBe $1 million in January 2025 over deceptive claims. See [WCAG 2.2 reference](references/wcag-2.2-reference.md) for criteria, testing, and a short legal layer.

## Tips

- Test the primary journey, not only isolated components.
- Report observed behavior and reproduction steps before prescribing a fix.
- Prioritize blockers, then shared-component fixes with the broadest reach.
