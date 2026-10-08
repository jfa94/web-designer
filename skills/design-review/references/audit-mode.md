# Audit Mode: WCAG 2.2 AA

Audit a Figma URL, webpage, screenshot, file, or described flow against WCAG 2.2 AA.

Conformance is not the same as usability, and tools cannot determine accessibility. Scope the audit, state what was and was not tested, and never present an automated scan as certification.

## Workflow

1. Resolve the input as described in the SKILL.md.
2. Establish the WCAG-EM scope:
   - pages and screens
   - user journeys
   - technologies
   - representative samples
   - shared components
   - exclusions
3. Test in layers:
   - **Automated:** axe-core, WAVE, Lighthouse, or pa11y.
     - Automation can assess roughly 30–40% of success criteria. axe-core reports finding about 57% of issue volume. These percentages use different denominators.
     - Automation cannot judge whether alt text is meaningful, whether focus order is logical, or whether a custom widget actually works. Those need the manual layers below.
   - **Keyboard:**
     - logical order
     - visible focus
     - no traps
     - skip paths
     - Escape behavior
     - no pointer-only actions
   - **Screen reader:** NVDA with Firefox and VoiceOver with Safari, where available. Verify:
     - names, roles, and states
     - landmarks and headings
     - announcements
   - **Zoom and reflow:**
     - 200% resize
     - 400% / 320 CSS px reflow
     - text-spacing overrides
   - **Testing with disabled people:** include people with relevant access needs for consequential flows.
4. Evaluate every applicable WCAG 2.2 AA criterion. The [WCAG 2.2 reference](wcag-2.2-reference.md) has a fuller checklist.
5. Reproduce each issue. Report:
   - the evidence
   - the affected users
   - severity
   - the criterion
   - a specific fix

## High-Risk Checks

- **Contrast:** normal text needs 4.5:1 and large text 3:1.
  - Large means at least 18pt/24px regular, or 14pt/~18.7px bold.
  - AAA is 7:1 for normal text and 4.5:1 for large text.
- **Color (1.4.1 Use of Color):** color is never the only way to convey information, state, or an error. Pair it with text, icons, or patterns. This is one of the most common real-world failures.
- **Targets:**
  - WCAG 2.2 AA (2.5.8) requires 24×24 CSS px or sufficient spacing. The 44×44 in 2.5.5 is AAA.
  - Apple uses 44pt; Material uses 48dp.
  - Treat 24 as the floor and 44–48 as the target for primary actions.
- **Reflow and text:** check 1.4.4 Resize Text, 1.4.10 Reflow, and 1.4.12 Text Spacing. No content or function may be lost.
- **Input:** check:
  - 2.1.1 Keyboard
  - 2.1.2 No Keyboard Trap
  - 2.5.3 Label in Name
  - 2.5.7 Dragging Movements
  - 2.5.8 Target Size
- **Predictability:** check:
  - 3.2.3 Consistent Navigation
  - 3.2.4 Consistent Identification
  - 3.2.6 Consistent Help
  - 3.3.7 Redundant Entry
  - 3.3.8 Accessible Authentication
- **Status:** use 4.1.3 Status Messages, so that updates are announced without moving focus.

## Semantics and Focus

- **First rule of ARIA:** use a native element when one provides the needed semantics and behavior. No ARIA is better than bad ARIA.
- Follow the WAI-ARIA Authoring Practices Guide (APG) as the canonical reference for how custom widgets behave.
- **Accessible names:**
  - Order of resolution:
    1. `aria-labelledby`
    2. `aria-label`
    3. native label or content
    4. `title`, only as a weak fallback
  - Host-language rules can vary, so test the computed name rather than assuming it.
  - Visible control text must appear in the accessible name.
- **Focus management:**
  - After an SPA route change, move focus deliberately.
  - When a dialog opens, move focus into it. When it closes, return focus to the control that opened it, or to the next logical target.
- **Composite widgets** may use roving `tabindex`:
  - one item at `0`, its peers at `-1`
  - arrow keys move both the active item and focus

## Severity

| Level | Definition |
|---|---|
| 🔴 Critical | Blocks a task or access for a disability group; no reasonable workaround |
| 🟡 Major | Substantially impairs a task, causes serious confusion, or has a burdensome workaround |
| 🟢 Minor | Limited friction or isolated nonconformance that does not block the task |

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
| 1 | [reproduction] | [1.x.x] | [🔴/🟡/🟢] | [group/impact] | [specific fix] |

### Operable
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [2.x.x] | [🔴/🟡/🟢] | [group/impact] | [specific fix] |

### Understandable
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [3.x.x] | [🔴/🟡/🟢] | [group/impact] | [specific fix] |

### Robust
| # | Evidence and location | Criterion | Severity | Affected users | Recommendation |
|---|---|---|---|---|---|
| 1 | [reproduction] | [4.x.x] | [🔴/🟡/🟢] | [group/impact] | [specific fix] |

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

Specify:
- headings and landmarks
- reading order
- image alternatives
- input labels
- ARIA states
- keyboard behavior
- focus after changes
- status announcements

Annotate the behavior that implementation cannot infer. Do not bury teams in redundant labels for obvious native semantics.

## If Connectors Available

- **Design tool:** inspect colors, type sizes, targets, reading order, and component states.
- **Browser or code tools:** run automated checks, and inspect the accessibility tree and computed names.
- **Project tracker:** with the user's permission, create one reproducible ticket per finding, with severity and criterion.

## Context and Limits

- **WebAIM Million 2026:** the sample found detectable WCAG failures on 95.9% of home pages. Six common categories made up 96% of detected errors, and low contrast appeared on 83.9% of pages. Use this to prioritize checks, not to predict any particular product.
- **Overlays are not a substitute for remediation.**
  - A vendor legal report counted 1,023 companies using overlays that were sued in 2024. That is more than 25% of website ADA suits, but it does not prove the overlay caused each suit.
  - Separately, the FTC fined accessiBe $1 million in January 2025 over deceptive claims.
- The [WCAG 2.2 reference](wcag-2.2-reference.md) covers criteria, testing, and a short legal layer.

## Tips

- Test the primary journey, not only isolated components.
- Report observed behavior and reproduction steps before prescribing a fix.
- Prioritize blockers first, then fixes to shared components that have the broadest reach.
