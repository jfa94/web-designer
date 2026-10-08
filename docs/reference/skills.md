# Skills Reference

## Invocation

| Runtime | Syntax | Example |
|---|---|---|
| Claude Code | `/web-designer:<skill> [flag] [focus]` | `/web-designer:design-review --audit https://example.com/checkout` |
| Codex | `$web-designer:<skill> [flag] [focus]` | `$web-designer:design-review --audit https://example.com/checkout` |
| claude.ai | Plain-language request that matches a skill description | "Is this checkout accessible?" |

Every runtime can also select a skill automatically when the request matches the skill's `description`.

## Action selection

| Skill | Default action | Flags |
|---|---|---|
| `layout` | Plan a layout spec | `--review` |
| `design-review` | Critique | `--audit` |
| `design-system` | Build the interface guidelines | `--audit`, `--extend`, `--handoff` |
| `research-synthesis` | Synthesis | none |
| `ux-copy` | Write or review copy | none |
| `frontend-design` | Design and build | none |

- A flag can appear anywhere in the request. Any other text in the request is the **focus**, which narrows the action.
- Flags are plain text, so they work the same in every runtime.
- A clear plain-language request also selects an action ("is this accessible?", "audit our design system"). When the action was chosen from plain language, the first line of the response names it.
- One action runs per request. `design-system` asks which to run if two flags appear. For an unknown flag, it lists the valid flags and asks.
- `design-review` is the exception to one action per request: when the user asks for both, it runs the critique, then the audit.

## Shared behaviour

### Resolve Product Guidelines

This section appears word for word in `layout`, `design-review`, `ux-copy`, and `frontend-design`.

| Aspect | Behaviour |
|---|---|
| Lookup | `docs/design/README.md`, or a location named in `AGENTS.md` or `CLAUDE.md`. Reads the page map, then only the pages the task needs |
| Precedence | Requirement (Must / Must not) > Confirmed rule > Inferred rule (followed, flagged as unconfirmed) > the skill's own guidance. A product Default never overrides a Requirement |
| Citation | Cites the rule ID for every decision or finding a rule drives |
| Exceptions | A case covered by a live entry in the exceptions register (`governance.md`) is not a violation |
| Gaps | Where the guidelines are silent or a rule is Open, the skill uses its own guidance and lists the decision as a `design-system --extend` candidate |
| No guidelines | The skill uses its own guidance alone |

### Severity scale

Used by `design-review` (both actions) and `design-system --audit`:

| Severity | Meaning |
|---|---|
| 🔴 Critical | Blocks or derails a primary task, blocks access for a disability group, or risks material harm; no reasonable workaround |
| 🟡 Major | Substantially impairs a task or causes serious confusion or repeated error; any workaround is burdensome |
| 🟢 Minor | Limited, local friction or isolated nonconformance that does not block the task |

- Severity measures user impact. Priority also weighs reach, strategic importance, effort, dependencies, and risk.
- A rule's strength (Must / Should) is reported separately from severity.
- If the product's `governance.md` defines its own scale, that scale is used instead.

---

## `layout`

| Field | Value |
|---|---|
| Purpose | Structure and behaviour decisions: page archetype, navigation, interaction surfaces, foundations, behaviour contracts |
| Not for | Building the interface (`frontend-design`), wording (`ux-copy`), or evaluating an existing design (`design-review`) |
| Rule labels | **Requirement** ("must"), **Default** ("should"), **Exception** (a documented departure, with its reason) |

### Actions

| Action | Selected by | Output heading |
|---|---|---|
| Plan | Default | `## Layout Spec: [Page/flow]` |
| Review | `--review`, or a request to review consistency across screens or equivalent tasks | `## Layout Consistency Review: [Product/area]` |

### Plan workflow

1. Specify the task: goal, information needed, task kind, frequency, reversibility, whether it is revisited, shared, or resumed, and what happens next.
2. Name the navigation type: global, local, in-page, workflow, or contextual.
3. Choose a page archetype.
4. Choose surfaces: inline, disclosure, tooltip, popover, non-modal panel, modal dialog, or dedicated page.
5. Apply foundations: shell and page layers, width policy, content-derived breakpoints, spacing by relationship, grouping, density, scroll and sticky.
6. Declare the behaviour contract: saving model, every state, URL and preserved context, recovery.
7. Check layout-level accessibility: 320 CSS px reflow, focus not hidden, 24×24 CSS px targets, DOM order, single-pointer alternatives to drag, hover content.

Layout Spec sections: Regions, Wireframes (ASCII, one per content-width condition), Surfaces, Behavior Contract, Requirements / Defaults / Exceptions, Open Questions.

### Review workflow

Groups equivalent tasks and compares them on entry point, surface, field order, saving model, validation timing, cancellation, completion feedback, and return location. Classifies each inconsistency by layer (conceptual, navigational, structural, behavioral, state, visual, linguistic) and recommends one rule per group.

### References

| File | Loaded at |
|---|---|
| `references/page-archetypes.md` | Plan step 3 |
| `references/landing-pages.md` | Plan step 3, for marketing and acquisition pages |
| `references/surfaces-and-components.md` | Plan step 4 |
| `references/foundations.md` | Plan step 5 |
| `references/states-and-contracts.md` | Plan step 6 |

---

## `design-review`

| Field | Value |
|---|---|
| Purpose | Evaluate an existing design or interface |
| Inputs | Figma URL, screenshot, file, webpage, or described flow. Asks for one if nothing usable is supplied |
| Context established | What it is, audience, primary task, design stage, constraints, stated objective. With no focus, it reviews the whole journey |
| Not for | Planning structure (`layout`), system drift or component governance (`design-system`), implementation (`frontend-design`) |

### Actions

| Action | Selected by | Output heading |
|---|---|---|
| Critique | Default | `## Design Critique: [Name]` |
| WCAG 2.2 AA audit | `--audit`, or a request for an accessibility or WCAG check | `## Accessibility Audit: [Design/Page]` |

### Critique

- Evaluation framework: Nielsen's 10 heuristics. Laws of UX and Gestalt principles are used as explanatory terms.
- Every finding cites a heuristic, an observed user datum, or a stated objective (or a product rule ID). Unsourced claims such as "users prefer" are not allowed.
- Five lenses: first impression, usability, visual hierarchy, consistency, accessibility (obvious risks only; conformance claims go to `--audit`).
- Beyond-the-happy-path checks: states, feedback, validation timing, saving model, edge conditions, stress contexts.
- Release-gate scenarios for pre-ship reviews: navigation, saving, cancellation, selection, keyboard, zoom and reflow, content extremes, permissions, async work, recovery.
- Output sections: Overall Impression, Usability, Visual Hierarchy, Consistency, Accessibility, Beyond the Happy Path, What Works Well, Priority Recommendations.

### Audit

- Scope follows WCAG-EM: pages, journeys, technologies, samples, shared components, exclusions.
- Test layers: automated, keyboard, screen reader, zoom and reflow, testing with disabled people.
- Each issue reports its evidence, affected users, severity, criterion, and a specific fix.
- Output sections: Summary, Perceivable, Operable, Understandable, Robust, Color Contrast, Keyboard Navigation, Screen Reader, Priority Fixes, plus handoff annotations.

### References

| File | Loaded at |
|---|---|
| `references/audit-mode.md` | `--audit` |
| `references/wcag-2.2-reference.md` | From the audit workflow, for the full A/AA checklist |
| `references/pre-ship-evidence.md` | Stress cases and test evidence before ship |

---

## `design-system`

| Field | Value |
|---|---|
| Purpose | Build and maintain the product's interface guidelines, audit drift, extend the system, hand off to engineering |
| Owns | Principles, semantics, roles, governance, the guideline format |
| Defers to | `layout` (surfaces, archetypes, state and saving contracts, spacing, grids, breakpoints, validation timing), `design-review` (WCAG 2.2 AA), `ux-copy` (content patterns) |
| Guidelines lookup | A pointer in `AGENTS.md` or `CLAUDE.md`, then `docs/design/README.md`, then any other markdown guideline tree. If none exists, uses `docs/design/` |
| Evidence-only sources | Storybook, zeroheight, Notion, design files |
| Glossary | Reads and links `docs/glossary.md` if present; never writes it |
| Writes | Only inside the guidelines location, plus the agent pointer line if the user agrees. Never product code, tokens, or stories. With no filesystem, returns each page as a fenced block headed with its path |

### Actions

| Action | Selected by | Behaviour | Output |
|---|---|---|---|
| Build the guidelines | Default | Locate and read; infer from code; write the skeleton; show the gap map; interview along the spine; write each answer before the next question | Gap map table, then interview messages, then `## Guidelines Session: [date]` |
| Audit | `--audit`, or e.g. "audit our design system" | Inventory, compare with rules and the exceptions register, classify, rate severity, name the root cause, compute `governance.md` metrics. Proposes guideline edits and waits for approval | `## Design System Audit: [scope]` |
| Extend | `--extend`, or e.g. "add a date-range picker to the system" | Interviews one gap: problem and evidence, existing candidates, rules, anatomy and variants. With no focus, asks what to extend and recommends the top Open item | Proposed page. On approval, written with lifecycle Experimental and rules Confirmed |
| Handoff | `--handoff`, or e.g. "write developer specs for this screen" | Reads the guidelines and cites rule IDs. Lists deviations as exception requests. A deviation from a Requirement is listed as a fix | `## Handoff Spec: [Feature/Screen]`, in chat, or written to a `.md` path given in the request. Never written into the guidelines |

Interview spine, in order: A. Context and principles, B. Behavioural foundations, C. Visual foundations, D. Page and task patterns, E. Components, F. Governance. A focus in the request overrides the order. Confirmed areas are skipped. There is no state file: a later run rebuilds the gap map from the pages.

Audit finding classes:

| Class | When |
|---|---|
| Defect | Violates a Requirement or Confirmed rule with no live exception, or relies on an expired exception |
| Sanctioned exception | A live register entry covers it |
| Drift: confirm or drop | Violates an Inferred rule |
| Rule gap | A recurring choice no rule covers, or competing treatments |

Audit root causes: local override, missing token, missing variant, undocumented pattern, stale docs.

The format of the files this skill writes is in [Product guidelines format](product-guidelines-format.md).

### References

| File | Loaded at |
|---|---|
| `references/interview.md` | Before the first question of any interview, including `--extend` |
| `references/inventory.md` | Before inferring rules or running `--audit` |
| `references/guidelines-format.md` | Before writing any page |
| `references/tokens-and-foundations.md` | Principles, semantics, colour, type, surfaces, icons, motion, states, accessibility policy, content standards, tokens |
| `references/governance-and-refactoring.md` | The governance area, lifecycle, exceptions, metrics, refactoring decisions |
| `references/handoff.md` | `--handoff` |

---

## `research-synthesis`

| Field | Value |
|---|---|
| Purpose | Turn evidence that already exists into traceable findings |
| Inputs | Interview transcripts or notes, survey results, usability-test material, support tickets and feedback, NPS/CSAT responses, app-store or marketplace reviews, quantitative context tied to the sample. Reads a supplied file or path, and asks for data if none is supplied |
| Not for | Research plans, interview guides, survey design, recruiting, method selection |
| Constraints | Does not invent participants, quotes, prevalence, or significance. Reports prevalence as `X of Y` for the analysed sample |
| Lenses | Affinity mapping, JTBD, HEART, task framing |
| Output heading | `## Research Synthesis: [Study]` |
| Output sections | Executive Summary, Key Themes, Insights → Opportunities, Segments Identified, Quantitative Framing, Recommendations, Open Questions, Methodology and Bias Notes |
| References | none |

---

## `ux-copy`

| Field | Value |
|---|---|
| Purpose | Write or review interface text and landing-page messaging |
| Context requested when missing | Screen or flow, user goal and emotional state, audience, voice, constraints, surrounding copy, what happens after the action |
| Not for | Page structure (`layout`), visual design or implementation (`frontend-design`), general content, blog posts, email, or ad copy that is not landing-page messaging |
| Patterns | Product UI CTAs, errors, empty states (by cause), confirmations, loading, success and help, GOV.UK service patterns, stress cases, localisation and internationalisation |
| CTA voice | Product UI is verb-first with implied second person. First-person CTAs only in landing or marketing experiments |
| Output heading | `## UX Copy: [Context]` |
| Output sections | Recommended Copy, Alternatives (three options A–C), Rationale, Localization Notes |
| References | `references/landing-page-copy.md` (headline formulas, PAS / AIDA / StoryBrand / JTBD / BAB / FAB, objections, section templates) |

---

## `frontend-design`

| Field | Value |
|---|---|
| Purpose | Distinctive, production-grade components, pages, applications, and landing pages |
| Not for | Page structure, wireframes, and surface choices (`layout`), words (`ux-copy`), broad review (`design-review`) |
| Process | Pin down the subject, audience, and the page's single job. Write a compact plan (colour as 4–6 named hex values, type per role, layout with ASCII wireframes, one signature element). Critique the plan against the brief, then build |
| Craft floor | State transitions mostly within 150–300 ms, reduced-motion substitution, `clamp()` fluid type with a rem anchor, semantic-token dark mode, Core Web Vitals at p75 (LCP ≤ 2.5 s, INP ≤ 200 ms, CLS ≤ 0.1) |
| Quality floor | Responsive down to mobile, visible keyboard focus, `prefers-reduced-motion` respected |
| Delivery | Works in the repository's existing stack. Reuses real content, components, and tokens. Exercises the changed flow. Reports the design direction, files changed, verification done, and remaining limits |
| References | none |

---

## Connectors

The plugin bundles no MCP servers. Skills use connected tools when they are available and relevant.

| Category | Examples | Used for |
|---|---|---|
| Design and component catalog | Figma, Storybook | Inspect designs, tokens, components, properties, and states |
| Feedback | Intercom, Productboard | Ground critique and synthesis in user evidence |
| Analytics | Amplitude, Mixpanel | Quantify qualitative themes and task outcomes |
| Knowledge base | Notion | Retrieve voice, design-system, and prior-research guidance |
| Project tracker | Linear, Asana, Jira | Link findings and remediation after approval |

Skills create tracker items and publish to knowledge bases only with the user's permission. `design-system` treats every connector as read-only evidence.
