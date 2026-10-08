---
name: design-review
description: Evaluate existing designs and interfaces through expert critique or a WCAG 2.2 AA accessibility audit. Trigger with "what do you think of this design", "give me feedback on", "critique this", "review this mockup", "design feedback", "is this accessible", "accessibility check", "WCAG audit", "can screen readers use this", "color contrast", "accessibility audit", "is this ready to ship", or when a user shares a design and asks for opinions or asks to make it accessible to all users. Use for evaluating what exists; use layout to plan structure, design-system for system drift or component governance, and frontend-design for implementation.
---

# Design Review

Review a Figma URL, screenshot, file, webpage, or described flow.

## Resolve the Input

1. Open a connected Figma URL, webpage, screenshot, or referenced file. If no artifact or useful description is supplied, ask the user to share one before reviewing.
2. Establish:
   - what it is
   - its audience
   - the primary task
   - the design stage
   - constraints
   - the stated objective

   If only the focus is missing, review the complete journey.
3. Choose the mode:
   - `critique` (default): broad expert feedback on usability, hierarchy, consistency, states, and obvious accessibility risks.
   - `audit`: a WCAG 2.2 AA conformance and assistive-technology audit. Follow [audit mode](references/audit-mode.md).
   - If the user asks for both, run the critique, then the audit, and refer from the critique's Accessibility section to the audit.

## Critique Mode

Distinguish three activities:
- **Critique:** collaborative feedback measured against intent. Suitable at any point in design.
- **Expert review:** one specialist inspects the design against experience and principles.
- **Heuristic evaluation:** several independent evaluators inspect against a defined set of heuristics, then reconcile their findings.

One evaluator may surface roughly 35% of usability problems, and 3–5 evaluators roughly 75%. Treat these figures as planning heuristics, not guarantees.

### Evaluation Spine: Nielsen's 10 Heuristics

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

Use the Laws of UX (such as Hick, Fitts, Jakob, and Tesler) and Gestalt principles as explanatory vocabulary, not decorative name-dropping. Every finding must cite one of:
- a heuristic
- an observed user datum
- a stated objective

Ban pseudo-evidence such as "users prefer" without a source.

### Five-Lens Review Flow

1. **First impression:** purpose, emotional signal, and where attention goes in the first two seconds.
2. **Usability:** task path, affordances, navigation, forms, recovery, and Nielsen's heuristics.
3. **Visual hierarchy:** reading order, emphasis, type, spacing, grouping, and scanning.
4. **Consistency:**
   - component, copy, platform, and design-system conventions
   - whether equivalent tasks behave equivalently (surface, saving model, feedback, return location)

   The layout skill's review mode covers this audit by task family.
5. **Accessibility:** obvious risks in contrast, targets, keyboard, focus, and semantics. Route conformance claims to audit mode.

Always include what works. Positive evidence tells the team what to preserve.

### Beyond the Happy Path

- **States:**
  - Enumerate the UI Stack: ideal, empty, partial, loading, error, and the transitions between them.
  - Empty states have distinct causes: nothing created yet, no matches, all done, no permission, data unavailable, setup missing. Never display "No records" while data is loading.
- **Feedback:**
  - Choose feedback at the narrowest scope that explains the problem.
  - Check that anything still needed after a toast disappears (Undo, retry, partial failures) stays available elsewhere.
- **Validation:** check its timing against the form's context. Users must never be shown as wrong before they've had a reasonable chance to answer.
- **Saving:** check that every editable surface makes its saving model (immediate, staged, or autosaved) obvious, and that failed submits keep the user's input.
- **Edge conditions:** check offline, queued, syncing, stale, conflict, timeout, retry, partial success, permissions, and session expiry.
- **Stress contexts:** test names, dates, identity, illness, bereavement, money, and crisis contexts. Read the copy aloud and ask what a careful human would do.

The layout skill owns the detailed state, feedback, saving, and validation defaults. For stress cases and test evidence, see [pre-ship evidence](references/pre-ship-evidence.md).

Release-gate scenarios for pre-ship reviews:

| Area | Scenario |
|---|---|
| Navigation | Open an item from filtered results, then return |
| Saving | Submit while the network request fails |
| Cancellation | Dismiss after making meaningful changes |
| Selection | Select records, paginate, change filters, run a bulk action |
| Keyboard | Complete the task without a pointer |
| Zoom and reflow | Enlarged text and a narrow effective viewport |
| Content extremes | Long names, translated labels, many items, missing values |
| Permissions | Lose access to an action or object mid-task |
| Async work | A slow request completes after the user changes context |
| Recovery | Retry without re-entering valid information |

### Severity and Priority

| Severity | Meaning |
|---|---|
| 🔴 High | Blocks or derails a primary task, risks material harm, or affects many users with no reasonable workaround |
| 🟡 Medium | Causes substantial delay, confusion, or repeated error; a workaround exists |
| 🟢 Low | Local friction or polish issue with limited task impact |
| Cosmetic | Visual defect without current task impact; track it because accumulated cosmetic debt erodes clarity and trust |

Severity is user impact. Priority also weighs reach, strategic importance, effort, dependencies, and risk. Never use the two terms interchangeably.

### Critique Output

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
[Obvious risks; identify what needs a full audit]

### Beyond the Happy Path
| State/edge case | Current behavior | Risk | Recommendation |
|---|---|---|---|

### What Works Well
- [Evidence-backed strength to preserve]

### Priority Recommendations
1. **[change]** — [impact, evidence, and how]
```

## If Connectors Available

- **Design tool:** inspect the source, components, tokens, prototype paths, and states.
- **Feedback or analytics:** test claims against support themes, usability data, funnels, and failure rates.
- **Project tracker:** link reproducible findings. Do not create tickets without permission.

## Tips

- Match the fidelity of feedback to the design stage: direction early, polish late.
- Review the primary journey before isolated screens.
- A pre-ship review is quality-ready only when critical paths and important states have evidence across relevant data, viewports, input modes, and assistive technology.
