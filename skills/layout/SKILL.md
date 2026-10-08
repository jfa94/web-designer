---
name: layout
description: Plan and review page layout, information structure, and interaction-surface choices for websites and web applications. Trigger with "lay out this page", "wireframe", "page structure", "information architecture", "navigation structure", "grid", "spacing", "responsive layout", "breakpoints", "dashboard layout", "form layout", "settings page", "list-detail", "modal or drawer", "modal or page", "which component should I use", "tabs or accordion", "table or cards", "pagination or infinite scroll", "landing page structure", "structure my homepage", "improve my page layout", "optimize my page for conversions", hero or above-the-fold layout, CTA placement, landing-page sections and content placement, or requests to make layouts and interactions consistent across screens. Use for structure and behavior decisions; use frontend-design to build the interface, ux-copy for the words, and design-review to evaluate an existing design.
argument-hint: "[--review] [page, flow, or screens]"
---

# Layout

Decide structure before styling: task → page archetype → interaction surface → foundations → behavior contract.

Consistency means **equivalent intentions in equivalent contexts produce equivalent interactions**. It does not mean every task uses the same component: renaming an item, editing a long profile, and adjusting an image are different kinds of work.

Label each rule you give as one of:
- **Requirement**: an adopted standard, such as WCAG 2.2 AA, or a hard product constraint. Say "must".
- **Default**: a convention from a design system or from research. Exceptions are allowed if documented. Say "should".
- **Exception**: a documented departure, with its reason.

Never present one design system's convention as a law of usability. Apple, Material, Fluent, Carbon and GOV.UK optimize for different contexts.

## Resolve Product Guidelines

Before deciding anything, look for the product's interface guidelines: `docs/design/README.md`, or a location named in `AGENTS.md` or `CLAUDE.md`. Read its page map, then only the pages this task needs.

- **Precedence:** Requirement (Must / Must not) > Confirmed rule > Inferred rule (follow it and flag it as unconfirmed) > this skill's guidance. A product Default never overrides a Requirement, whether the Requirement comes from the guidelines or from this skill.
- **Cite** the rule ID for every decision or finding a rule drives.
- **Exceptions:** a case covered by a live entry in the exceptions register (`governance.md`) is not a violation.
- **Gaps:** where the guidelines are silent or a rule is Open, use this skill's guidance and list the decision as a design-system `--extend` candidate.

If no guidelines exist, use this skill's guidance alone.

## Choose the Action

- Plan (default): produce a layout spec for a page, flow, or component placement.
- If the request includes `--review`, or clearly asks to review consistency across screens or equivalent tasks, run the Review Workflow below. When chosen from plain language, say so in the first line of the response.
- Any other text is the focus.

## Plan Workflow

1. **Specify the task.** If the brief leaves any of these out, infer it and say so.

   | Question | Layout consequence |
   |---|---|
   | Primary goal? | Dominant content and action |
   | Information needed to finish? | What must stay visible |
   | Compare, browse, read, enter, configure, or monitor? | Table, collection, document, form, settings, or dashboard |
   | Occasional or frequent? | Acceptable interaction overhead and density |
   | Reversible? | Confirmation and recovery needs |
   | Revisit, share, or resume? | Whether it deserves its own URL |
   | What happens next? | Completion feedback, focus, and destination |

   "Show everything about an event" is not a brief. "Help an organiser find unpaid attendees and send a reminder" is.
2. **Name the navigation type** before choosing its appearance:
   - global: between major product areas
   - local: within an area or object
   - in-page: within the current document
   - workflow: Back/Continue
   - contextual: following a relationship to another object

   Information architecture is not the same as its navigation UI. Test structure separately from visuals (tree testing). Do not use click-count rules as a substitute.
3. **Choose a page archetype** from [page archetypes](references/page-archetypes.md). For marketing and acquisition pages, use [landing pages](references/landing-pages.md).
4. **Choose surfaces** by task scope, whether the background stays usable, whether content is anchored to a trigger, how long the work lasts, and whether it needs its own location:

   | Need | Default surface |
   |---|---|
   | Information essential to the current task | Inline content |
   | Optional detail within the same flow | Disclosure or accordion |
   | Short, non-interactive explanation of a control | Tooltip |
   | Small contextual content with interaction | Popover |
   | Supporting work while main content stays usable | Non-modal panel or inspector |
   | Short task or decision that must finish before returning | Modal dialog |
   | Substantial work, own navigation, or revisit/share/resume | Dedicated page or flow |

   Location does not determine modality. A side drawer can be modal or non-modal, and a full-screen surface is not automatically a page. For component contracts and selection rules, see [surfaces and components](references/surfaces-and-components.md).
5. **Apply foundations** from [foundations](references/foundations.md):
   - shell vs page layers, and placing each action at its scope
   - width policy
   - breakpoints derived from content
   - spacing by relationship
   - grouping before decoration
   - density
   - scroll and sticky decisions
6. **Declare the behavior contract** from [states and contracts](references/states-and-contracts.md):
   - the saving model: immediate, staged, or autosaved
   - every state: ideal, empty (by cause), loading, partial, error, success
   - what lives in the URL and what survives returning
   - recovery after failure
7. **Check layout-level accessibility requirements:**
   - 320 CSS px reflow without two-dimensional scrolling, except content that needs it, such as data tables
   - focused controls are never fully hidden by sticky or overlay content
   - targets meet 24×24 CSS px or the spacing exception
   - DOM order matches the visual reading order
   - every drag has a single-pointer alternative
   - hover-revealed content can be dismissed and hovered, and it persists

### Editing Classification

| Kind of edit | Default |
|---|---|
| One low-risk value in a collection | Inline edit |
| Small contextual transaction | Standard modal |
| Ongoing adjustment while viewing the result | Non-modal inspector or supporting panel |
| Substantial, multi-section editing | Dedicated page |
| Sequence with meaningful stages and dependencies | Guided flow |

## Plan Output

```markdown
## Layout Spec: [Page/flow]
**Task:** [primary goal, user, frequency] | **Archetype:** [name] | **Width policy:** [readable/task/standard/wide data/workspace]

### Regions
| Region | Contents | Scope of actions | Scroll/sticky |
|---|---|---|---|

### Wireframes
[ASCII wireframe per layout condition, labeled by the content constraint that triggers it, e.g. "content width ≥ 864px: list + detail"]

### Surfaces
| Task/interaction | Surface | Why (and rejected alternative) |
|---|---|---|

### Behavior Contract
**Saving model:** [immediate/staged/autosaved, and save scope]
| State | Presentation | Recovery/next action |
|---|---|---|
**Preserved context:** [URL state, filters, position, selection lifetime]

### Requirements, Defaults, Exceptions
- **Requirement:** [...]
- **Default:** [...]
- **Exception:** [rule, context, reason]

### Open Questions
- [Decision needed]
```

## Review Workflow (`--review`)

1. Group equivalent tasks across the product: every create flow, delete, filter/search, settings change, and error recovery.
2. Compare each group side by side on: entry point, surface, field order, saving model, validation timing, cancellation, completion feedback, and return location.
3. Classify each inconsistency by layer:
   - conceptual (object meaning)
   - navigational (where things live)
   - structural (anatomy of equivalent pages)
   - behavioral (what an action does)
   - state (loading/empty/error/recovery)
   - visual
   - linguistic (labels and implied consequences)
4. Recommend one rule per group, with its exceptions. Do not average several design systems together; pick a coherent decision and record why.

```markdown
## Layout Consistency Review: [Product/area]
| Task family | Variant/location | Differs on | Layer | User impact | Recommended rule |
|---|---|---|---|---|---|

### Rules to Adopt
1. **[Rule]**: [Requirement/Default], [rationale], [exceptions]
```

## Common Mistakes

- **Styling decides semantics.** A segmented control may be tabs, a radio group, or toggle buttons, and each has different keyboard and state behavior.
- **Cards everywhere.** A card around every section makes unrelated groups look equally important. Use cards only where an item is evaluated as a unit.
- **Tables turned into cards on mobile** when the task is comparison. Keep the table and let it scroll horizontally.
- **Device-named breakpoints** ("tablet") instead of the content width where the composition breaks.
- **Forms with two independent columns of inputs.** Use one input column. Tightly related field groups and a read-only summary beside the form are fine.
- **A modal for substantial or repeated editing,** or a modal just to announce a routine save.
- **Equal-sized dashboard widgets** that don't say which decisions they support.
- **Main task hidden in an overflow menu,** or important actions reachable only on hover.
- **"No items found" for every non-success state.**
- **Select all without saying whether it means this page or all matching items.**
- **Every page stretched to the viewport.** A short form gains nothing from ultrawide inputs.

## If Connectors Available

- Design tool: inspect existing page structures, components, and breakpoints before proposing new ones.
- Component catalog: map each chosen surface to an existing component and its supported states.
- Browser: capture the current layout at the widths where content breaks.
