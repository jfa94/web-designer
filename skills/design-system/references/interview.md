# Interview

Interview to turn evidence into decisions an owner has agreed to. Each answer is written to the guidelines before the next question.

## Message Shapes

**Decision**: one real decision per message.

```markdown
**[Area] · [Question in one line]**
What exists: [counts and paths, or "nothing yet"]
1. [Option]: [what it commits the product to]
2. [Option]: [what it commits the product to]
Recommendation: [option], because [reason tied to this product's users, tasks or evidence].
Generic default: [owning skill and its default, or "none: product policy"]
```

**Batch**: confirm up to 5 Inferred rules at once.

```markdown
**[Area] · Inferred rules to confirm**: reply with the numbers that are wrong, or "all correct".
1. BTN-001 · Should: mark destructive buttons with the danger role (3 of 4 uses: …)
2. …
```

Mark the unrejected ones Confirmed. Each rejection becomes its own follow-up.

**Rejection follow-up**: tombstone the rejected rule (`Rejected [date]`), then ask a Decision about what should happen instead. The answer gets a new ID; never rewrite the rejected rule in place.

**Challenge**: at most once per answer, when it conflicts with a Requirement, the code or an earlier answer.

```markdown
That conflicts with [rule ID, code evidence, or earlier answer]: [evidence].
Keep it as [an exception / a new variant / a rule revision], or change the answer?
```

A deviation from a Requirement is never a Default: it goes to the exceptions register with an owner and review date, or it is not adopted.

**Skip**: "skip" or "don't know" writes an Open item with the options, the recommendation and an owner (ask who, or write "Unassigned"). Move on.

## Spine

Work through the areas in order, skipping anything already Confirmed. A focus in the request overrides the order. Close each area with: "What should I have asked that I didn't?"

### A. Context and Principles → README

- **Decide:** who the product serves and their most frequent and most consequential tasks; platforms and contexts of use; the accessibility target; three to five principles; personality and tone.
- **Ask:** "Which task, done badly, costs users the most?" "When speed and safety conflict, which wins?" "Name a decision a principle would have settled last month."
- **Technique:** [principles and personality](tokens-and-foundations.md#principles-and-personality).
- **Generic default:** design-review owns the WCAG 2.2 AA target; it is the starting accessibility Requirement.

### B. Behavioural Foundations → foundations/content.md, foundations/navigation.md, patterns/saving.md, patterns/feedback.md, patterns/recovery.md

Settle these before anything visual. Standardising colours and components while these stay open standardises the surface without standardising the experience.

| Decide | Ask | Generic default | Page · prefix |
|---|---|---|---|
| Terminology: one name per object and action | "Are a project and a workspace the same thing?" "Do Remove, Delete and Archive mean different things here?" | ux-copy (wording); layout (action vocabulary) | foundations/content.md · CNT |
| Navigation model: global, local, in-page, workflow, contextual | "Where does each major area live, and does that ever change?" | layout | foundations/navigation.md · NAV |
| Saving models and save scope | "Which surfaces save immediately, which are staged, which autosave?" | layout | patterns/saving.md · SAVE |
| Feedback scope and urgency | "What must the user notice, and what can wait?" | layout | patterns/feedback.md · FDBK |
| Recovery and partial failure | "After a failed save, what is kept, what is lost, what can the user do next?" | layout; ux-copy for error wording | patterns/recovery.md · REC |

### C. Visual Foundations → foundations/

| Decide | Ask | Generic default | Page · prefix |
|---|---|---|---|
| Emphasis ladder and colour roles | "What does your brand colour mean: act here, selected, or brand presence?" | This skill: [semantics](tokens-and-foundations.md#semantics) | colour.md · COL |
| Type roles | "Which text roles exist, and which must never shrink?" | This skill | typography.md · TYPE |
| Spacing, grids, width policies, breakpoints, density | "Which pages are dense expert work, and which are occasional?" | layout | layout.md · LAY |
| Elevation, surfaces, radius | "What does a raised surface promise?" | This skill | surfaces.md · SURF |
| Iconography | "Does an icon ever appear without a label?" | This skill | icons.md · ICON |
| Motion and reduced motion | "What should motion explain?" | This skill | motion.md · MOT |
| Interaction states, disabled vs read-only | "When an action is unavailable, do you hide it, disable it, or explain on activation?" | This skill | states.md · STATE |

Greenfield: define roles, not values. Leave values Open with an owner.

### D. Page and Task Patterns → patterns/

- **Decide:** the page archetypes the product uses (collection, detail, edit, guided task, dashboard, settings), and the task patterns (create, edit, delete, search, filter, bulk actions, upload, navigate back).
- **Ask:** "Which existing task category is this?" before "Which component looks best?"; "Where does each create flow start, and where does it return?"
- **Generic default:** layout (archetypes, surfaces, states and contracts, validation timing).
- **Page · prefix:** one page per archetype or task, named by the task; prefix from its name (`patterns/deleting.md` · DEL).

### E. Components → components/

- **Decide:** for each component in use, every required field of the page template, starting with Allowed uses, Do not use when and Alternatives.
- **Ask:** "When would a designer wrongly reach for this?" "What must never vary?" "Which states ship today, and which are missing?"
- **Generic default:** layout (component selection); design-review (WCAG).
- **Page · prefix:** `components/[name].md`, prefix from the name (BTN, DLG, TBL).

### F. Governance → governance.md

- **Decide:** who owns the guidelines; how changes are proposed and approved; lifecycle and deprecation window; severity scale; metrics and the decision each one drives; the exceptions register.
- **Ask:** "When two teams disagree about a pattern, who decides?" "What would make you deprecate a component?"
- **Generic default:** this skill ([governance](governance-and-refactoring.md)); design-review owns the default severity scale.
- **Prefix:** GOV.

## Policy Forks

Sources genuinely disagree on these. Present the options, recommend from the product's context, and record the rationale. Do not average systems together.

| Fork | Options | Recommend from | Generic default |
|---|---|---|---|
| Loading feedback threshold | No indicator under about 300 ms; Fluent shows none under 1 s | Measured latency of the most common actions | layout |
| Validation timing | On submit (GOV.UK); after meaningful input; by task family | Familiarity and frequency of the form | layout |
| Disabled actions | Disabled with the reason shown; enabled, explaining what is missing on activation | Whether users can discover why the action is unavailable | This skill |
| Button order | Primary first or last; Fluent and Carbon differ | The environment and the order users already know from the product | None: product policy |
| Toast persistence | Timed; persistent until dismissed | Decide recoverability first; anything still needed must also exist elsewhere | layout |
| Modal complexity | One dialog component; separate standard dialog and full-screen task patterns | Whether complex work currently happens in dialogs | layout |
| Form granularity | One question per page; grouped editing | Unfamiliar public tasks vs repeated expert editing | layout |
| Spacing base unit | 4 px (Fluent); 8 px with smaller steps (Atlassian) | Density of the product; the existing scale | layout |
| 60-30-10 colour distribution | Adopt as a starting heuristic; do not use | Whether accent scarcity matches the emphasis ladder; contrast always wins | This skill |
| External vs internal consistency | Follow web convention; keep an established product convention | NN/g: internal originality is not a benefit when familiar controls behave unexpectedly | None: product policy |
| Severity scale | Critical / Major / Minor; the organisation's own scale | An existing triage scale that teams already use | design-review |
| Governance model | Centralised; federated; hybrid | Team count and how products ship | This skill |
| Deprecation window | Months for a tightly coupled internal community; a year or more for large, disconnected consumers (Origami 3–6 months; Salesforce Lightning 18 months) | Consumer coupling and release cadence | This skill |

## Grill Challenges

- **Principle or preference?** If it would not settle a real disagreement or reject an option, it is a preference. Ask which past decision it would have changed.
- **Requirement or Default?** "Must" means no exception without the register. If the answer is "usually", it is a Should.
- **Exception, variant or revision?** An exception solves a special case; a new variant solves a recurring case; a rule revision corrects a flawed default. Ask how many places need it.
- **Who decides?** Every Open item and every exception has a named owner.
- **Does the code agree?** When an answer contradicts what the inventory found, show the counts and ask which is right.

## Stakeholder Questions

For a cross-disciplinary review of the inventory (Brad Frost, "Conducting an Interface Inventory"):
1. What names should we settle on?
2. What patterns should stay, and which should go?
3. Can we merge patterns together easily?
4. How do developers, designers, and managers begin to utilize this shared vocabulary?
5. How do we translate this exercise into a living pattern library?

End every area, and the session, with: "What should I have asked that I didn't?"
