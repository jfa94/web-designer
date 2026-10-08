# Surfaces and Components

Words like "dropdown", "popup", "panel", and "modal" are used loosely. Classify each surface by:
- task scope
- whether the background stays usable
- whether the content is anchored to a trigger
- how long the work lasts
- whether it needs its own location

Choose the behavior before the styling. Rules marked **Default** are conventions; the rest cite the requirement or source.

## Surfaces

### Modal Dialog

- **Use for:** bounded, contextual work, such as renaming with a couple of options, confirming a consequential action, or adding a short note.
- **Use something else:** for sustained editing, substantial reference material, repeated use, several independent sections, or navigation that starts to feel like a second app. Carbon moves frequent or complex tasks into the main interface. Don't use a modal to announce a routine save; that is feedback.
- **Contract (APG):**
  - The background is blocked.
  - Focus moves inside the dialog and is contained there.
  - There is a clear exit.
  - Initial focus depends on the task:
    - a short form: the first input
    - long content: the start of the content
    - an irreversible decision: the least destructive action
  - On close, focus returns to the trigger, or to a logical successor if the trigger is gone.
  - `aria-modal` alone implements none of this. Native `<dialog>` with `showModal()` makes the rest of the page inert.
- **Errors:** never close the dialog after a failed submit. Long bodies scroll, while the title and actions stay usable.
- **Dismissal (Default):**
  - Cancel, the close control, and Escape have the same cancel outcome.
  - None of them silently saves staged changes.
  - Discarding meaningful work triggers the unsaved-changes policy.
  - Clicking outside is not a hidden extra way to save.
- **Nesting (Default):** no routine stacking of modals. Narrowly defined confirmation exceptions are allowed.

### Drawers, Side Panels, Inspectors

| Variant | Purpose | Background |
|---|---|---|
| Navigation drawer | Reach destinations | Persistent or modal, depending on the layout |
| Contextual supporting panel | Inspect info or adjust properties | Stays usable |
| Modal task drawer | Bounded contextual task | Blocked |

A drawer is not inherently less disruptive than a centered dialog (Fluent).

**Default:**
- Similar panels open on the same side.
- Every panel has a title and a close behavior.
- Errors appear inside the affected panel.
- Selecting another object updates the inspector predictably.
- Clicking another row never loses staged edits.

On narrow screens, a panel may become its own view, keeping its parent association and a clear way back.

### Popover

A popover holds small contextual content or interaction tied to a trigger, such as a compact color picker or an explanation with a link.

**Default:**
- Keep the trigger–content relationship obvious.
- Define click-outside and Escape behavior.
- Never grow a popover into a multi-section editor.
- Never let the viewport clip it.

"Popover" describes presentation. You still decide whether its content behaves as a menu, a dialog, or something else.

### Tooltip

A tooltip is brief, supplementary, non-interactive help on a control that is already accessible.
- Never put required instructions, errors, material conditions, or essential definitions only in a tooltip.
- The control needs an accessible name without the tooltip.
- **Requirement (WCAG 1.4.13):** hover and focus content can be dismissed without moving focus, can be hovered without disappearing, and persists.
- **Default:** explanatory content that contains a link or button is an interactive help popover, not a tooltip.

### Accordion and Disclosure

Use these for optional or independently useful sections that users choose to reveal.
- GOV.UK: try the content without an accordion first, don't nest accordions, and don't hide what everyone must read.
- **Requirement:** the heading contains a real button that exposes its expanded state. The revealed content follows it in a logical keyboard sequence.

**Default:**
- Allow several sections open at once when comparison is useful.
- Never collapse a section that contains a validation error without making the error discoverable.
- Don't use accordions in place of a coherent form sequence.
- Keep expansion state when users return from nearby work.

## Navigation and Actions

- **Global navigation:**
  - Collapsing it on narrow screens changes presentation, not meaning; keep destination names and their order.
  - Show the active area.
  - Distinguish a destination from a control that expands child destinations.
  - The collapsed trigger is visible and named.
  - Site navigation uses links and disclosure buttons, not ARIA `menu` roles (APG).
- **Breadcrumbs:**
  - They show hierarchy, not browsing history. Use them only when the hierarchy helps orientation, and don't invent depth.
  - "Back to results" restores a working context. A breadcrumb moves up the hierarchy.
- **Tabs:**
  - For related, parallel panels where seeing one at a time is fine.
  - Not when users must read everything, compare across panels, follow a sequence, or move between unrelated pages (GOV.UK).
  - **Default:** no wrapping onto multiple rows, no tabs used as a stepper, no unexplained disabled tabs. Choose the narrow-screen behavior deliberately; a dropdown is not automatic.
  - There is no universal limit on the number of tabs.
- **Step indicators:**
  - They show progress, not navigation. Back and Continue control the workflow.
  - Make steps clickable only when revisiting them is supported, and define what happens to later answers when an earlier one changes.
  - Visiting a screen does not mean the step is complete.
- **Buttons vs links:**
  - A link goes somewhere. A button does something. Styling never changes that.
  - Labels name the outcome ("Create event", not "OK"), and identical actions use identical words.
  - Destructive emphasis is only for destructive outcomes.
  - Visually secondary is not the same as unimportant: Cancel can be essential.
- **Menu button vs overflow vs split button (Fluent):**

  | Control | Meaning |
  |---|---|
  | Menu button | Opens a set of commands, with menu keyboard behavior |
  | Overflow menu | Lower-priority commands that aren't always shown |
  | Split button | Runs the main action directly, or picks a related alternative |

  Never hide the only route to the page's main task in an overflow menu.
- **Toolbars and segmented controls:**
  - ARIA `toolbar` brings an arrow-key composite model, so use it only where that model helps.
  - A segmented control is one of three things, each with its own keyboard and state model:
    - tabs, if it switches panels
    - a radio group, if it picks one value
    - toggle buttons, if its options are independent
  - Appearance never decides semantics.

## Forms

- **One primary input column (GOV.UK, Baymard).**
  - Compact groups of tightly related fields are fine.
  - A read-only summary beside the form is fine.
  - Multiple independent input columns create ambiguity about order.
- **Field anatomy:** label → optional hint → control → validation message.
  - Required or optional status always sits in the same place.
  - Labels stay visible. Placeholders are hints, never labels.
  - Error text states the problem and the fix.
  - Fields grow when text wraps.
- **Text input vs textarea:** use the expected length. Field width should signal the expected input, but must survive enlarged text. Submission failure never loses user input.
- **Choosing a control:**

  | Need | Control | Rule |
  |---|---|---|
  | One choice; options worth seeing | Radio group | Clear group question; consider "None" or "I don't know"; don't preselect answers to questions (showing an existing setting's value is fine) |
  | Independent choices | Checkboxes | An exclusive "None" needs explicit behavior; define parent, child, and indeterminate states |
  | One choice from an understandable set; seeing all options not needed | Select | Use a searchable pattern when finding the item is the task |
  | Find in a large set | Combobox | Define: free entry or restricted to the list; whether typing commits a value; loading and stale results; no matches; what Escape does; how to clear. A highlighted suggestion never commits silently. |
  | A setting that takes effect immediately | Switch | Show pending and failure states; never leave it visually on after a failed save |
  | A draft value saved by Save or Submit | Checkbox | Don't use a switch for this |
  | Known date (such as a birth date) | Separate day, month, and year inputs | Direct entry; never page back through decades |
  | Date relative to a calendar | Date picker plus typed entry | Show the format; define time zone and range semantics; explain unavailable dates; ranges need rules for incomplete, reversed, and partly cleared values |
  | Relative position in a range | Slider | Add direct entry when precision matters; show units and endpoints; never make dragging the only way |
  | Upload | File input (a drop zone is optional) | States: selected → uploading → uploaded → processing → complete or failed. "Transferred" is not "accepted". Define replace, remove, retry, and multiple files. |

- **Validation timing is a policy, not a constant:**

  | Context | Default |
  |---|---|
  | Unfamiliar, substantial public-facing form | Validate on submit (GOV.UK) |
  | Clear format issue that can be checked early | Non-disruptive feedback after meaningful input |
  | Availability check, such as a username | After a pause or on completion, with a visible pending state |
  | Correcting a previously shown error | Clear or update the error once the fix is reliably recognized |

  The principle: never present users as wrong before they've had a reasonable chance to answer. After a multi-field submit:
  - show an error summary at the top
  - link it to the fields
  - move focus to it (GOV.UK)

## Collections

- **List:** for scanning a sequence to recognize one item and act on it. Define:
  - the identity
  - the order of metadata (consistent across item types)
  - whether the row itself is interactive
  - which actions are always visible
  - selection
  - truncation
  - what survives on narrow screens
- **Card:** for evaluating an item as a unit (image, title, summary, action).
  - Not for tabular data, prose, or decoration (USWDS).
  - Comparison attributes sit in the same position on every card.
  - No competing primary actions.
  - Never make a whole-card link that contains other controls.
- **Table:** for comparing consistent attributes.
  - Specify column purpose, default sort, sortable columns, selection scope, row actions, empty values, and loading and error behavior.
  - Right-align numeric quantities, not identifiers.
  - **Default:** keep a comparison table as a scrollable table on narrow screens. Stacking suits directory-like data only.
- **ARIA grid:** an interactive composite with arrow-key cell navigation. Use a native `<table>` for ordinary data. A CSS grid is layout, not semantics.
- **Tags, chips, badges (Carbon):** "pill" is a shape, not a component. Choose a variant:

  | Variant | Meaning |
  |---|---|
  | Status badge | Shows state; not interactive |
  | Category tag | Labels an item |
  | Applied-filter chip | An active constraint; can be removed |
  | Selectable chip | Toggles a selection |
  | Overflow indicator | Reveals more labels |

  Interactive and read-only variants look different. Never combine selecting, navigating, and removing in one target.
- **Search:**
  - State the scope (the app, this collection, a type, this page).
  - Keep the query separate from filters.
  - Define whether results update on Enter or live.
  - Show pending results.
  - "No matches" and "search failed" are different states.
  - Keep the query when the user returns.
  - Label mixed suggestion groups: recent queries, objects, commands.
- **Filters and sort:** filters change which results appear; sort changes their order. Specify:

  | Decision | Rule to define |
  |---|---|
  | Timing | Applied immediately, or staged behind Apply |
  | Current state | How applied filters are shown |
  | Removal | Remove one; Clear all |
  | Result feedback | Count, loading, no results, failure |
  | Persistence | What survives navigation, refresh, and a new session |
  | Pagination | What happens to the current page when criteria change |
  | Narrow screens | Inline, disclosure, or drawer |

  Immediate quick filters and a staged advanced drawer can coexist only if each one's behavior is obvious.
- **Pagination, Load more, infinite scroll:**

  | Mechanism | Prefer when |
  |---|---|
  | Pagination | Location, revisiting, and structured navigation matter |
  | Load more | Browsing continues, but the user controls expansion |
  | Infinite scroll | Continuous consumption suits the task, and return and recovery are solved |

  - There is no universal number of items per page (Baymard).
  - Users return to the same position after opening an item.
  - Public, indexed collections need crawlable page URLs, because crawlers don't click "Load more".
- **Carousel:**
  - **Default:** no auto-rotation.
  - If rotation exists, it stops when focus enters and does not restart on its own (APG).
  - Essential information never depends on a later slide.
  - Show the position, provide previous and next controls, and give an accessible route to all content.
- **Charts and dashboard widgets:**
  - Each one answers a question. Specify purpose, metric definition, unit, scope, period, freshness, comparison baseline, and next action.
  - Provide a non-graphic route to the data (USWDS).
  - Importance decides prominence; the grid does not.
