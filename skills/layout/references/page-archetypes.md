# Page Archetypes

A component inventory does not stop every page from becoming a new composition. Start from an approved archetype. Material's canonical layouts (feed, list–detail, supporting pane) separate content relationships from the way those relationships adapt to the available space.

| Archetype | Anatomy and use | Adaptation and common mistake |
|---|---|---|
| Reading or information | Title, summary where helpful, structured body, optional table of contents, related material | Keep the reading column constrained. Do not hide the main document in accordions just to shorten the page. |
| Collection or search results | Title, search, filters, sort, results, result count, continuation controls | Keep the discovery state when users open an item and return. Choose cards, rows, or a table by task. |
| Object detail | Identity, status, key attributes, grouped details, related records, scoped actions | Stack secondary information on narrow screens without separating it from its meaning. Do not give each property group its own interaction pattern. |
| Focused form | Task title, necessary explanation, fields in a clear sequence, validation, submission | Usually one field column. A read-only summary beside the form does not count as a second input column. |
| Grouped settings | Stable category navigation, clearly titled groups, explicit saving behavior | Make it obvious whether changes save immediately, per section, or for the whole page. |
| Guided process | One meaningful stage at a time, Back/Continue, saved progress where needed, review, completion | Avoid progress indicators that mislead when branching changes the number of steps. |
| List–detail workspace | A browsable list and the selected item visible together | On narrow screens, users move between list and detail, and the selection and list position are kept. |
| Dashboard | Scope and time range, prioritized indicators, exceptions needing attention, routes to investigation | Do not fill the page with equal-sized widgets that support no stated decision. |
| Editor with supporting panel | Primary working surface plus contextual tools, properties, or preview | Keep the selected content and its controls connected. Do not make the inspector modal when users need the work behind it. |
| Marketing or acquisition | Proposition, explanation, evidence, material conditions, a clear next step | Do not import app-level navigation complexity, and do not hide costs or conditions in transient help. See [landing pages](landing-pages.md). |

The last column matters as much as the anatomy: it defines what must stay consistent when the composition changes.

## Worked Example: Task → Pattern

This example is a hypothetical event-planning app, and its choices are proposals. The consistency comes from classifying each task, not from forcing every edit into one component.

| Task | Pattern | Reason |
|---|---|---|
| Browse visually distinctive activities | Card collection | Images and short summaries help users evaluate each item |
| Compare registration records | Table | Consistent attributes and bulk operations matter |
| Open an event from search | Detail page | Stable, revisitable location |
| Return to search | Restore query, filters, position | The user is continuing a discovery task |
| Rename a draft event | Inline edit | One small value doesn't justify a task surface |
| Edit schedule, venue, booking rules | Dedicated edit page | Substantial work across related sections |
| Adjust display settings while viewing a calendar | Non-modal supporting panel | The user sees the result while changing settings |
| Change an immediate email preference | Switch | Takes effect independently |
| Compose several advanced search constraints | Filter drawer with explicit Apply | Users build the criteria before results update |
| Briefly explain an unfamiliar metric | Tooltip | Supplementary, non-interactive help |
| Booking conditions required for purchase | Inline content | Essential to the decision |
| Archive an easily recoverable draft | Direct action plus a persistent recovery route | No confirmation needed for a recoverable action |
| Permanently delete an event and related records | Confirmation specific to the consequence | Destructive, and its scope matters |
| Complete a booking | Confirmation page | Durable record and next steps |

For a new feature, ask "Which existing task category is this?" before "Which component looks best?"
