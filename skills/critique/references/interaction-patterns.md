# Interaction Patterns and Pre-ship Review

## UI Stack

For each important surface, inspect:

| State | Questions |
|---|---|
| Ideal | Does the main path make the next action obvious? |
| Empty | Is it first use, user-cleared, no results, or unavailable/error? |
| Partial | What appears when only some data or permissions are available? |
| Loading | Is prior content preserved? Is the loading label honest? |
| Error | Can the user understand, recover, and retain their work? |
| Transition | What receives focus and what is announced after change? |

For empty data tables, distinguish loading from empty. Carbon's data-table pattern replaces the table—including its headers—with the empty state, so screen-reader users never navigate an announced-but-empty structure.

## Perceived Wait Ladder

| Delay | Feedback |
|---|---|
| ≤100ms | Immediate visual/state response |
| <300ms | No loader; avoid flicker. Fluent extends this to no indicator under 1s |
| ~1–3s | Spinner or skeleton with an honest label |
| >3s | Determinate progress when measurable |
| >10s | Progress plus time estimate and safe background/cancel behavior |

Skeletons must reserve the final dimensions. Never imply determinate progress when the system cannot estimate it.

## Validation and Forms

- Reward early, punish late: confirm obviously valid input without delay; defer most error interruption until blur or submit.
- Put labels above fields; do not use placeholders as labels.
- Error summaries receive focus after a failed submit, link to fields, and repeat field-error wording verbatim.
- Preserve entered values and explain what happened, why when known, and how to recover.
- Baymard reports 70.22% average cart abandonment and observed average checkout flows with 23.5 form elements; its benchmark suggests many sites need only 12–14. Treat this as evidence to remove unnecessary fields, not a universal target.
- Test keyboard order, autofill, password managers, paste, IME, long values, locale formats, and server-side failure.

## Feedback Escalation

1. Is a decision required before work can continue? Use a dialog, with focus containment and return.
2. Is the issue tied to one control? Use inline feedback next to it.
3. Must the status persist or affect the page/section? Use a message bar or inline status region.
4. Is it transient, low-risk, and already complete? A snackbar may work; include undo when meaningful.

Do not use a toast for errors that require action, content users must copy, or the only confirmation of a high-value action.

## Prevention and Recovery

- Prefer reversible actions and undo.
- Separate destructive controls spatially and visually from routine actions.
- Use forcing functions or poka-yoke where a mistake would be costly: constrain impossible dates, require prerequisites, and preview consequences.
- Escalate confirmation with risk. Type-to-confirm is for rare, severe, hard-to-reverse actions—not routine deletion.
- Prefer soft deletion and a clear retention/grace period where policy permits.

## Stress and Synchronization Cases

Stress cases (Meyer & Wachter-Boettcher, *Design for Real Life*)—design for people at their worst moment, not an imagined calm user:

- Names that do not fit Western first/last assumptions; diacritics, scripts, long and single-word names.
- Dates around death, illness, pregnancy loss, anniversaries, and crisis events.
- Shared devices, coercive relationships, privacy-sensitive notifications, and financial scarcity.
- Offline, queued, syncing, retrying, stale, conflict, duplicate submission, and partial failure.
- Read all user-facing language aloud. Ask: would a thoughtful person say this now, and what practical help would they offer?

## Test Evidence Before Ship

| Test | What it can establish |
|---|---|
| Unit/component | Logic, rendering contracts, keyboard behavior in isolated states |
| Integration | Boundaries between UI, data, auth, routing, and error handling |
| End-to-end | A critical journey works in a representative environment |
| Visual regression | Enumerated viewport/theme/state output did not change unexpectedly |
| Accessibility automation | Detectable rule violations; never full accessibility |
| Manual/assistive technology | Interaction, comprehension, focus, announcements, and real usability |

Coverage dimensions worth sampling: critical journeys, all UI Stack states, data extremes, locales/RTL, permissions, network quality, viewport/container sizes, themes, keyboard, touch/coarse pointer, reduced motion, zoom, and relevant assistive technology.

Quality-ready means critical paths and material failure states have appropriate evidence, known high-severity defects have an explicit decision, and rollback/recovery is understood. It does not mean every pixel or possible input has a test.
