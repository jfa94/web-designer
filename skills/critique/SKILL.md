---
name: critique
description: Evaluate designs for usability, visual hierarchy, consistency, accessibility, and design principles. Trigger with "what do you think of this design", "give me feedback on", "critique this", "review this mockup", "design feedback", or when a user shares a design and asks for opinions. Use for broad expert review; use accessibility for a WCAG audit and design-system for system drift or component governance.
argument-hint: "<Figma URL, screenshot, file, or description>"
---

# Critique

Review a Figma URL, screenshot, file, webpage, or described flow. Usage: `/web-designer:critique $ARGUMENTS`.

## Resolve the Input

1. Open a connected Figma URL, webpage, screenshot, or referenced file. If no artifact or useful description is supplied, ask the user to share one before reviewing.
2. Establish what it is, its audience, primary task, design stage, constraints, and stated objective. If only the focus is missing, review the complete journey.
3. Separate three activities:
   - Critique: collaborative feedback against intent, suitable throughout design.
   - Expert review: one specialist inspects against experience and principles.
   - Heuristic evaluation: multiple independent evaluators inspect against a defined heuristic set, then reconcile findings.

One evaluator may surface roughly 35% of usability problems; 3–5 may reach roughly 75%. Treat these as planning heuristics, not guarantees.

## Evaluation Spine: Nielsen's 10 Heuristics

1. Visibility of system status
2. Match between system and the real world
3. User control and freedom
4. Consistency and standards
5. Error prevention
6. Recognition rather than recall
7. Flexibility and efficiency of use
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, and recover from errors
10. Help and documentation

Use Laws of UX (such as Hick, Fitts, Jakob, and Tesler) and Gestalt principles as explanatory vocabulary, not as decorative name-dropping. Every finding must cite a heuristic, observed user datum, or stated objective. Ban pseudo-evidence such as "users prefer" without a source.

## Five-Lens Review Flow

1. First impression: purpose, emotional signal, and first two seconds of attention.
2. Usability: task path, affordances, navigation, forms, recovery, and Nielsen heuristics.
3. Visual hierarchy: reading order, emphasis, type, spacing, grouping, and scan behavior.
4. Consistency: component, copy, platform, and design-system conventions.
5. Accessibility: obvious contrast, target, keyboard, focus, and semantic risks; route conformance claims to the accessibility skill.

Always include what works. Positive evidence tells the team what to preserve.

## Beyond the Happy Path

- Enumerate ideal, empty, partial, loading, error, and transitions between them—the UI Stack.
- Check first-use, user-cleared, no-results, and error/permission empty states. Never display "No records" while loading.
- Use a wait ladder: feedback by 100ms; no loader below 300ms; spinner for about 0.3–3s; determinate progress above 3s; add a time estimate above 10s.
- Validate on blur or submit for most fields: reward valid input early, punish invalid input late. Do not interrupt typing.
- Choose feedback by consequence and persistence: inline near a field, snackbar for transient low-risk results, message bar for persistent page-level status, dialog only for blocking decisions.
- Prefer undo over confirmation when reversible. For destructive work, layer spatial separation, precise labels, type-to-confirm for exceptional consequences, and soft-delete/grace periods where possible.
- Check offline, queued, syncing, stale, conflict, timeout, retry, partial success, permissions, and session expiry.
- Stress-test names, dates, identity, illness, bereavement, money, and crisis contexts; read copy aloud and ask what a careful human would do.

See [interaction patterns](references/interaction-patterns.md) for detailed state, form, feedback, and pre-ship checks.

## Severity and Priority

| Severity | Meaning |
|---|---|
| 🔴 High | Blocks or derails a primary task, risks material harm, or affects many users with no reasonable workaround |
| 🟡 Medium | Causes substantial delay, confusion, or repeated error; a workaround exists |
| 🟢 Low | Local friction or polish issue with limited task impact |
| Cosmetic | Visual defect without current task impact; track it because accumulated cosmetic debt erodes clarity and trust |

Severity is user impact; priority also considers reach, strategic importance, effort, dependencies, and risk. Never use the terms interchangeably.

## Output

```markdown
## Design Critique: [Name]
**Artifact/stage:** [source and maturity] | **Objective:** [stated goal]

### Overall Impression
[What works and the largest opportunity]

### Usability
| Finding and evidence | Heuristic/objective | Severity | Recommendation |
|---|---|---|---|

### Visual Hierarchy
- **First attention:** [element and whether that supports the task]
- **Reading flow:** [path]
- **Emphasis:** [assessment]

### Consistency
| Element/location | Evidence | Recommendation |
|---|---|---|

### Accessibility
[Obvious risks; identify what needs a full WCAG audit]

### Beyond the Happy Path
| State/edge case | Current behavior | Risk | Recommendation |
|---|---|---|---|

### What Works Well
- [Evidence-backed strength to preserve]

### Priority Recommendations
1. **[change]** — [impact, evidence, and how]
```

## If Connectors Available

- Design tool: inspect the source, components, tokens, prototype paths, and states.
- Feedback/analytics: test claims against support themes, usability data, funnels, and failure rates.
- Project tracker: link reproducible findings; do not create tickets without permission.

## Tips

- Match fidelity of feedback to the design stage: direction early, polish late.
- Review the primary journey before isolated screens.
- A pre-ship review is quality-ready only when critical paths and important states have evidence across relevant data, viewports, input modes, and assistive technology.
