# Foundations: Principles, Semantics, Roles, and Tokens

This reference covers what the guidelines' foundation pages decide. Spacing, grids, width policies and breakpoints belong to the layout skill; WCAG criteria belong to design-review; content patterns belong to ux-copy. Name those skills when asking; write the product's decision in full on its own page.

All numbers here are starting points from the cited sources, not optima. Write a product value as a Default with its evidence.

## Principles and Personality

Principles exist to settle disagreements. Test each draft against Jared Spool's six tests ("Creating Great Design Principles: 6 Counter-intuitive Tests", 2011):
1. Does it come directly from research?
2. Does it help you say "no" most of the time?
3. Does it distinguish your design from your competitors'?
4. Is it something you might reverse in a future release?
5. Have you evaluated it for this project?
6. Is its meaning constantly tested?

A principle every product could claim ("simple", "intuitive") fails tests 2 and 3; rewrite it or drop it.

Make trade-offs explicit with the "X over Y" form used by the Agile Manifesto ("Working software over comprehensive documentation"): both sides have value, and the statement says which wins in a conflict. Ask the user to rank real pairs the product has fought over.

Bound personality traits with "X but not Y" pairs, as Mailchimp's voice guide does ("weird but not inappropriate, smart but not snobbish"). Each pair names the failure the trait risks.

Set tone per situation on NN/g's four dimensions (Kate Moran, "The Four Dimensions of Tone of Voice"): formal vs casual, serious vs funny, respectful vs irreverent, matter-of-fact vs enthusiastic. Voice stays constant; tone shifts with the user's situation. Record a tone matrix of situations (error, success, onboarding, payment) against the four dimensions.

## Semantics

Every visual property carries meaning, and the guidelines define it: "Size and contrast communicate importance; spacing communicates grouping; colour communicates role; motion communicates change; microcopy communicates intent; state styling communicates what can happen next." When those codes drift, users scan more slowly and make more errors.

- Standardise roles, not raw values. Meaningful regularity makes the same concept, state or action look alike everywhere; uniformity makes unlike things look alike.
- Reserve visual difference for real differences in priority, status or interaction.
- Appearance never determines semantics: a link navigates, a button acts, whatever either looks like.
- Group before decorating: groups, sequence, alignment, text roles, then borders or backgrounds only where they clarify structure.

**Emphasis ladder.** Define which levels exist and what earns each:

| Level | Earned by | Rule of thumb |
|---|---|---|
| Primary | The main action of one decision context | One per decision context, not one per page |
| Secondary | Real alternatives in the same context | Secondary is not unimportant: Cancel may be essential |
| Tertiary | Low-frequency or supporting actions | Never the only route to a frequent task |
| Destructive | A genuinely destructive outcome | Reserve full destructive emphasis for the confirmation step, where destroying is the primary action |

Emphasise by de-emphasising: mute secondary content rather than enlarging the primary. Hierarchy combines size, weight and colour; size alone is weak.

## Colour

Name colours by role, never by hue: `text-secondary` survives a rebrand; `gray-text` does not. Document each role:

| Role | Meaning | Use for | Never for | On-colour | Contrast |
|---|---|---|---|---|---|
| Action / interactive | "You can act here" | Primary buttons, links, active controls | Decoration, headings, status | Text and icons on it | Text 4.5:1; boundaries 3:1 |
| Surface (levels) | Containment and elevation | Page, raised, overlay backgrounds | Status | All text roles | Per text role |
| Text (primary, secondary, disabled) | Reading priority | Body, supporting text, metadata | Interactivity | — | 4.5:1, or 3:1 for large text |
| Border | Boundaries of controls and regions | Inputs, dividers | Emphasis | — | 3:1 where it identifies a control |
| Success, warning, error, info | System status | Feedback and states | Brand accents, categories | Text and icons on it | As text; never colour alone |

- Never convey information by colour alone; pair every state with text, an icon, a shape or an outline.
- Audit real text-and-background pairs, including states, not only the palette.
- Status colours mean status everywhere. A brand colour that doubles as "selected" or "error" makes cues unreliable.
- 60-30-10 (dominant, secondary, accent) is a composition heuristic: a scarce accent reads as "act here". It is not a measured requirement, and contrast wins when they conflict.
- **Dark mode** remaps roles, not values: consume semantic tokens only; never invert primitives. Use at least four perceivable surface levels where hierarchy needs depth, with lighter surfaces higher. Prefer softened light text such as `#ECEDEE` over pure white on large dark areas, and verify contrast. Shadows need higher opacity; brand colours usually need adjustment.
- Test forced colors and high contrast.
- Multiple brands share structure and behaviour, and swap brand intent at the semantic tier. Do not fork component logic to change a palette, type family or radius.

## Type

Define text roles; designers pick a role, not a size: page title → section heading → subsection heading → body → supporting text → metadata → control label. For each role document its semantic use (and heading level), font characteristics, wrapping and truncation, and spacing relationships. Do not reuse body styles as button labels.

- Choose a modular scale deliberately; common ratios are 1.25, 1.333 and 1.5. Higher ratios suit marketing; lower ratios suit dense data.
- Keep long-form measure near 45–75 characters; about `65ch` is a starting point to test with the real typeface and language.
- Use fluid type anchored to rem, for example `clamp(1rem, 0.9rem + 0.5vw, 1.25rem)`; pure `vw` sizing can defeat browser zoom.
- Text must survive the WCAG text-spacing overrides; fixed-height text containers are a common failure.

## Surfaces, Elevation, and Radius

Define a small set of named surface levels (`surface-base`, `surface-raised`, `surface-overlay`) and say what each promises (for example, "raised means it floats above content and can be dismissed"). Prefer space, background contrast or a shadow over borders for separation. Use a short radius scale with a role per step; do not let radius vary by taste.

## Icons

- One family: a consistent grid (commonly 24px) and stroke weight (commonly 1.5–2px), one style (outlined or filled) and one cap and corner convention. Clarity overrides consistency when a metaphor demands it.
- Most icons need visible text labels; truly universal icons are rare. An unlabelled icon needs an accessible name and should be limited to well-known actions.
- One meaning per icon across the product.

## Motion

Motion explains change: cause and effect, spatial relationships and continuity. Functional motion is consistent motion with an off-switch.

- Tokenise durations and easing. Typical state transitions run 150–300ms with natural easing.
- Animate `transform` and `opacity`.
- Under `prefers-reduced-motion: reduce`, replace non-essential movement with fades or colour shifts rather than removing all feedback.

## Interaction States and Timing

Every interactive component documents its state matrix: default, hover, focus, active/pressed, disabled, loading, error/invalid, selected, read-only, visited and dragged, plus meaningful combinations (selected + hover).

- Hover is never the only signal of interactivity, and touch has none.
- Focus is always visible: never remove `outline` without a contrasting replacement. A control you cannot reach and operate by keyboard with visible focus blocks release.
- Response-time limits (Jakob Nielsen): about 0.1s feels instantaneous; about 1s keeps the user's flow of thought; about 10s is the limit of attention. The layout skill owns loading-indicator defaults.

**Disabled vs read-only.** Disabled means unavailable now: usually unfocusable and exempt from contrast, so it hides information. Read-only means the value is shown but not editable: it stays perceivable, focusable and copyable. Never use disabled for read-only. If a disabled action must stay discoverable, use `aria-disabled` and say why; or keep it enabled and explain what is missing on activation (the policy fork in the interview).

**Optimistic UI.** Use it only for frequent, low-risk, near-certain actions (like, toggle, add to cart, send a message), with rollback and a clear message if the assumption fails. Never use it for destructive or critical actions such as payments and deletions, and never imply a save succeeded when it was only attempted.

## Form Labels

The layout skill owns field anatomy and validation timing. The foundations add:
- Top-aligned labels are the default; left-aligned labels can suit unfamiliar data that users read carefully. Avoid inline labels; floating labels need care.
- Mark whichever is rarer, required or optional, and mark it the same way everywhere.
- The visible label text appears in the accessible name, so voice control can target it.

## User Preferences

Respect `prefers-reduced-motion`, `prefers-color-scheme` and `prefers-contrast`. Treat hover as an enhancement on `pointer: coarse`. Test at 200% and 400% zoom, with reduced motion and dark mode on.

## Accessibility Policy

`foundations/accessibility.md` records:
- **Target:** WCAG 2.2 AA is the usual operative target; AAA criteria are adopted selectively and named.
- **Requirement vs guidance:** WCAG is a conformance standard; the ARIA Authoring Practices Guide is informative implementation guidance.
- **Stronger internal rules** worth deciding: focused controls fully visible (AA requires only "not entirely hidden"); a primary-action target size above the 24×24 CSS px floor.
- **Assistive-technology matrix:** at minimum NVDA with Firefox and VoiceOver with Safari, plus keyboard-only and zoom.
- **Definition of done:** keyboard operability and visible focus; automated checks in CI (they catch only part of the issues); manual screen-reader checks for new patterns. Components are retested in the product: an accessible component library does not guarantee accessible products.
- **Documents:** an accessibility statement and, for procurement, a VPAT-based Accessibility Conformance Report, if the product needs them. Who owns them and how often they are reviewed.

## Content Standards

`foundations/content.md` records voice ("X but not Y" traits), the tone matrix, casing, and a terminology table: one approved term per object and action, rejected synonyms, and the consequence each action label implies (Remove detaches, Delete destroys, Archive retains). Link `docs/glossary.md` if it exists. The ux-copy skill owns the copy patterns themselves.

## When to Break Consistency

Equivalent intentions in equivalent contexts produce equivalent interactions; unlike tasks may rightly use different patterns. External consistency with web conventions usually wins over internal consistency. Break a convention only when task efficiency or understanding improves enough to pay for the extra learning, and record it: an exception solves a special case, a new variant a recurring case, and a rule revision corrects a flawed default.

## Token Architecture

1. Primitive tokens hold raw palette, size, font, radius, shadow and duration values (`blue.600`, `space.4`). Components should not normally consume them directly.
2. Semantic tokens express intent (`color.text.muted`, `space.layout.gap`) and reference primitives. Product code prefers this tier.
3. Component tokens express a stable component role (`button.primary.background`) and reference semantic tokens. Add them only when the component needs independent governance.

Do not alias upward, embed meaning in primitive names, or let component tokens become a second raw palette. Follow the Design Tokens Community Group format when interchange matters. Review names for semantic drift: a token named `brandBlue` cannot safely become orange, while `actionPrimary` can. Add theming once semantic tokens cover text, background, border and action roles. The guidelines document roles and point to token files; they never copy token values. Token lifecycle and change impact are in [governance](governance-and-refactoring.md).
