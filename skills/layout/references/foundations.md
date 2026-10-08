# Layout Foundations

All numbers here are starting defaults. Adopt one coherent set, then document the exceptions.

## Consistency Layers

| Layer | What stays consistent | Typical failure |
|---|---|---|
| Conceptual | Meaning of objects, actions, relationships | "Project" and "workspace" name the same thing on different screens |
| Navigational | Where destinations live, how movement works | Settings in the account menu on one page and the sidebar on another |
| Structural | Anatomy of equivalent page types | Similar detail pages order status, metadata, and actions differently |
| Behavioral | What happens after an action | One toggle saves immediately; another needs an undisclosed Save |
| State | Loading, empty, error, success, recovery | One failed save preserves input; another closes and loses it |
| Visual | Type, spacing, color, dimensions, emphasis | Equivalent warnings use different colors or components |
| Linguistic | Labels and the consequences they imply | "Remove", "Delete", and "Archive" used interchangeably |

WCAG 3.2.3 Consistent Navigation and 3.2.4 Consistent Identification cover parts of this, but they do not require identical pixel positions across responsive layouts. Respect external conventions too (NN/g): internal originality that makes familiar controls behave unexpectedly is a cost.

## Shell and Page Model

| Layer | Responsibility |
|---|---|
| Application shell | Global navigation, account context, product-wide utilities |
| Page identity | Title, object identity, status, location |
| Page actions | Actions on the whole page or object |
| Primary content | What the main task needs |
| Supporting content | Context, summaries, explanations, related items |
| Local feedback | Loading, errors, results for one region |
| Transient surfaces | Menus, popovers, dialogs, temporary panels |

**Default:** place each action so its scope is visible before activation.
- Row Delete goes on the row.
- Bulk Delete goes with the selection controls.
- Delete account goes in account management.

## Page Headers

Define a few header variants and reuse them:

| Variant | Contents |
|---|---|
| Collection | Title, optional description, item count, primary create action |
| Object detail | Name, status, key identifiers, object actions |
| Edit page | Task title, object context, save/cancel policy |
| Guided task | Current question or step, progress where useful, contextual help |
| Dashboard | Purpose, scope, date range, data freshness |

Specify wrapping, stacking, and narrow-width behavior so long titles never push essential actions off-screen.

## Grids and Width Policies

Major containers (cards, tables, forms, text blocks) align to the page grid. Their internal layout follows component rules (Atlassian). Column counts, gutters, and margins change at defined breakpoints. "Every page uses twelve columns" is not a policy.

| Width policy | Use |
|---|---|
| Readable | Articles, explanations, long-form text |
| Task-focused | Forms, focused configuration |
| Standard application | Detail pages, mixed content |
| Wide data | Tables, reports, comparison |
| Workspace | Editors, canvases, multi-pane tools |

**Default:** choose the width policy from the task. Do not stretch every page to the viewport, and do not squeeze a comparison table into an article column.

## Breakpoints From Content

Breakpoints follow the space available to the content region, not a nominal device class (Apple, MDN).

Worked calculation: the main task needs at least 560px, the supporting panel 280px, and the gap is 24px. Two columns therefore need 864px of **content** width, measured after subtracting persistent navigation and page margins. Collapse below that, whatever the device is called.

- Use container queries for components that appear in pages, sidebars, and panels.
- Use media queries for page layout and user preferences.
- Treat hover as an enhancement. Support `pointer: coarse`, keyboard, touch, 320px reflow, and zoom.

## Spacing by Meaning

There is no universal base unit:
- Fluent uses 4px.
- Atlassian uses 8px but also ships 2, 4, 6, 12, and 20px tokens.

Choose one scale, then name tokens by relationship (`field-gap`, `section-gap`, `page-gutter`). Two 16px gaps that express different relationships may need to diverge later.

| Relationship | Illustrative value |
|---|---:|
| Icon to its label | 4–8px |
| Label to its field | 8px |
| Closely related controls | 12px |
| Fields within a group | 16px |
| Groups within a section | 24px |
| Major sections | 32–48px |
| Page-level separation | 64px |

**Default:** internal spacing ≤ external spacing. A label and its help text must read as belonging to their own field, not the next one.

## Hierarchy: Group Before Decorating

1. Organize content into meaningful groups.
2. Establish a logical sequence.
3. Align related information.
4. Differentiate headings, body, and metadata.
5. Add borders, backgrounds, or shadows only where they clarify structure.

Apply "one primary action" per decision context, not per application. A complex page can host several tasks; avoid competing high-emphasis actions within the same task.

## Typography as Layout

- Define text roles: page title → section heading → subsection heading → body → supporting text → metadata → control label. Give each role a semantic use, wrapping behavior, and spacing.
- Constrain reading measure, starting near `65ch`. Test with the real typeface, language, and content; it is not a universal optimum.
- F-pattern findings (NN/g) describe how users scan poorly structured content. They are not an instruction to arrange screens in an F. Meaningful headings and front-loaded wording are the actionable tools.

## Density Follows the Task

| Context | Emphasis |
|---|---|
| Infrequent, unfamiliar task | Clear explanation, generous separation |
| Repetitive expert work | Scan efficiency, predictable alignment, fewer transitions |
| Comparison | Relevant attributes visible together |
| Touch | Comfortable targets and separation |
| Long-form reading | Readable measure, typographic rhythm |

Define density variants at system level (row heights, control sizes, spacing), not per screen. Compact must stay legible.

## Scrolling and Sticky Elements

For each archetype, decide:
- which region scrolls
- what stays sticky
- whether secondary panes scroll independently
- how focus stays visible
- what changes under zoom and on small viewports

- **Requirement:** WCAG 2.4.11 Focus Not Obscured (AA) forbids authored content from **entirely** hiding the focused component.
- **Default:** keep the focused control fully visible. Use `scroll-padding` for sticky headers and bars.
- Reserve space for images and late content, using intrinsic dimensions or `aspect-ratio`. Never insert content above the user's position.
