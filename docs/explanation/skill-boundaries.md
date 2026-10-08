# Skill Boundaries

## Why six narrow skills

A runtime can pick a skill by matching the request against each skill's `description`. Each description in this plugin does two things: it lists the phrases that should trigger the skill, and it ends by naming which other skill handles each neighbouring concern ("use layout to plan structure, design-system for system drift..."). Each skill therefore says both what it handles and what it hands off.

The plugin divides the work by **kind of decision**, not by artefact:

- **Structure and behaviour**: which page archetype, which surface, which saving model, which states (`layout`).
- **Evaluation of what exists**: critique and conformance (`design-review`).
- **Product policy**: the rules a product commits to and how they are governed (`design-system`).
- **Evidence to findings**: synthesis of research that already exists (`research-synthesis`).
- **Words** (`ux-copy`).
- **Visual design and implementation** (`frontend-design`).

A landing page shows the split in practice. It goes through `layout` for structure, `ux-copy` for messaging, `frontend-design` for the build, and `design-review` for feedback on the assembled flow and the conformance audit. Each step produces something the next one can use.

## Ownership, not duplication

Each generic default has one owner. `layout` owns surfaces, page archetypes, state and saving contracts, spacing, grids, breakpoints, and validation timing. `design-review` owns WCAG 2.2 AA and the severity scale. `ux-copy` owns content patterns. When another skill needs one of these defaults, it names the owner instead of restating the default. For example, `design-system` interview questions list a "Generic default" line that points to the owning skill.

This matters most for `design-system`, whose instructions say to name other skills' defaults when asking and never to copy them. Each interview question shows the generic default and its owner next to the product-specific options. The answer is then recorded as the product's own decision, kept apart from the generic default.

The two places where content *is* duplicated, the severity table and the Resolve Product Guidelines block, are duplicated because of how skills are installed, not by choice. See [Self-contained skills](self-contained-skills.md).

## What was deliberately left out

Research planning, interview guides, survey design, recruiting, and method selection were removed in 0.4.0. The plugin covers synthesis of evidence that already exists, not how to collect it. `research-synthesis` says so in its description so that it does not trigger on planning requests.

`frontend-design` does not decide page structure, and `layout` does not decide visual style. Version 0.6.0 moved landing-page structure, spacing, grids, and breakpoints out of `frontend-design` and `design-system` into the new `layout` skill. That gave structural decisions a single owner.

## Evaluation versus policy

Both `design-review` and `design-system --audit` produce findings with severities, but they answer different questions:

- `design-review` asks whether a design works for users and whether it conforms to WCAG. Its evidence is heuristics, user data, and stated objectives.
- `design-system --audit` asks whether the product follows its own rules. Its findings are classified against the guidelines: a defect, a sanctioned exception, drift on an Inferred rule, or a gap where no rule exists.

Both use the same severity scale, and both report rule strength (Must / Should) separately from severity.
