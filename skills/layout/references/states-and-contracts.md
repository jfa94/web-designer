# States and Interaction Contracts

Most component catalogs leave out cross-component contracts. Declare them per surface, so behavior doesn't get improvised screen by screen.

## State Coverage

For each important surface, cover:

| State | Questions |
|---|---|
| Ideal | Does the main path make the next action obvious? |
| Empty | Which cause applies? (see below) |
| Partial | What appears when only some data or permissions are available? |
| Loading | Is earlier content kept? Is the loading label honest? |
| Error | Can the user understand it, recover, and keep their work? |
| Transition | What receives focus, and what is announced after the change? |

## Feedback Scope

Place feedback at the **narrowest scope that accurately explains the problem** (Fluent, Carbon).

| Situation | Default |
|---|---|
| A field contains an error | Field-level explanation |
| Several submitted fields need fixing | Error summary plus field errors; the summary repeats the field wording verbatim |
| A section can't load | Message inside that section |
| The whole page is unavailable | Page-level error state |
| A low-risk action completed | Local state change or non-disruptive status |
| A persistent condition affects the page | Page-level message bar |
| A consequential decision is needed before continuing | Confirmation dialog |

- **Message bars:**
  - State the issue, its consequence, and the available action. Never truncate essential text.
  - Place the bar inside the region it concerns.
  - A condition that stays important after dismissal needs a persistent indicator; remove stale warnings once the cause is resolved.
  - Not every message is an assertive screen-reader alert.
- **Toasts:**
  - Use them for brief, non-critical feedback that doesn't need focus.
  - Decide persistence and recoverability before duration. There is no universal 3–5s rule; Fluent and Carbon differ, and neither is an accessibility guarantee.
  - **Default:** anything that still matters after the toast disappears (information, Undo, retry) must stay available elsewhere.
  - Never use a toast for:
    - errors that need action
    - content users must copy
    - partial failure
    - the only confirmation of a high-value action
  - Status changes reach assistive technology without moving focus (WCAG 4.1.3). Routine success doesn't justify an assertive alert.
- **Completion pages (GOV.UK):** for consequential submissions, bookings, and applications. They state:
  - what happened
  - any references
  - what happens next
  - where to get help

  Distinguish "request received", "processing started", and "completed".

## Loading

| Delay | Feedback |
|---|---|
| ≤100ms | Immediate visual or state response |
| <300ms | No loader, to avoid flicker (Fluent: no indicator under 1s) |
| ~1–3s | Spinner or skeleton with an honest label |
| >3s | Determinate progress when it can be measured |
| >10s | Progress plus an estimate, and safe background or cancel behavior |

| Pattern | Use |
|---|---|
| Button pending state | A submitted action is processing; prevents duplicate submits |
| Inline loading indicator | A local region is updating |
| Skeleton | The content structure is known; reserve the final dimensions |
| Indeterminate progress | Work is happening but can't be measured |
| Determinate progress | Completion can genuinely be calculated |
| Background-job status | Work continues while the user does something else |

Never show an invented percentage. Don't erase usable content during a refresh.

## Empty States (Carbon)

| Cause | Message and action |
|---|---|
| Nothing created yet | What belongs here and how to create the first item |
| No filter matches | The criteria produced nothing; offer to adjust them |
| All work completed | Confirm completion; don't push users to create something |
| No permission | Explain the access needed, where appropriate, and an authorized way forward |
| Data unavailable | The failure, plus retry or recovery |
| Required setup missing | Name the prerequisite |

"No items found" is never a catch-all. Empty data tables replace the whole table, headers included, with the empty state, so screen-reader users don't navigate an empty structure. Keep loading and empty distinct.

## Saving Models

| Model | Meaning | Required behavior |
|---|---|---|
| Immediate | Each change takes effect on its own | Pending and failure feedback sit on the changed control or region |
| Staged | Changes stay a draft until committed | Save commits; Cancel discards; leaving follows the unsaved-changes policy |
| Autosaved | Work persists without a final Save | Communicate saving state, failures, and how to recover |

**Default:**
- Every editable surface declares its model and its Save scope (field, section, object, or page).
- Never mix models invisibly. If an immediate switch sits next to staged fields, group and explain them separately.
- A single inline edit commits one way. Don't save on Enter, blur, and a button all at once without a stated rule.

## Action Vocabulary

| Label | Meaning |
|---|---|
| Save | Commit staged edits |
| Apply | Apply selected configuration or criteria |
| Continue | Advance in a process, subject to validation |
| Submit | Send a completed transaction or request |
| Cancel | Abandon the current uncommitted task |
| Close | Dismiss a surface; its saving behavior is already clear |
| Back | Return to an earlier location or stage |
| Remove | Detach or take out of this collection |
| Delete | Destroy the underlying item |
| Archive | Keep the item, but out of active use |

Never use "Done" to avoid deciding whether a button saves, closes, or advances.

## Unsaved Changes

The states are: unchanged → edited → saving → saved → failed. For each one, define which navigation and dismissal are allowed.
- Failed submissions keep the user's values, and retry is possible.
- Warn only when meaningful work is really at risk, and use the same discard confirmation everywhere.
- `beforeunload` is unreliable, especially on mobile (MDN). It doesn't replace saving or recovering drafts.
- Document how long drafts are kept.

## Context Preservation

| State | Treatment |
|---|---|
| Current object or major section | Addressable URL |
| Search, sort, applied filters | Kept on return; in the URL where appropriate |
| Pagination or scroll position | Restored with the result set |
| Unsaved form content | Draft policy that fits the sensitivity and the task |
| Open optional section | Kept where it supports nearby work |
| Selected rows | Explicit lifetime and scope |
| Tooltip visibility | Temporary |

Returning from a detail view never resets the query, filters, or position that led there (Baymard).

## Bulk Selection

- Distinguish "select all on this page" from "select all N matching items", and show which one is active.
- Define what happens to the selection when the user paginates, filters, re-sorts, deletes some items, or loses permission on an item.
- Confirmations describe the actual affected set ("Send reminders to 214 unpaid attendees"), not a generic command.

## Prevention and Recovery

For every important action, specify:
- what stays visible
- what stays editable
- what was saved and what wasn't
- what the user can do next

"Something went wrong" is not an error design.

- Multi-item operations define partial success. "8 updated, 2 failed" lists the failures persistently and offers a retry for just those items.
- Prefer reversible actions with Undo, and soft delete with a stated retention period where policy allows.
  - A recoverable action needs no confirmation.
  - A destructive action gets a confirmation specific to its consequence.
  - Type-to-confirm is only for rare, severe, hard-to-reverse actions.
- Separate destructive controls from routine ones, spatially and visually.
- Use forcing functions where mistakes are costly: block impossible dates, require prerequisites, preview consequences.
- Remove fields that aren't needed. Baymard observed an average of 23.5 checkout form elements where 12–14 often suffice. Treat this as evidence, not a target.
