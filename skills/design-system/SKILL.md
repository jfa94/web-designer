---
name: design-system
description: Build and maintain a product's interface guidelines, an internal HIG, by inferring the existing system from code and docs and then interviewing to settle every rule; also audit drift, extend the system, and hand off to engineering. Trigger with "design system", "design guidelines", "interface guidelines", "HIG", "document our design system", "design principles", "component library", "component docs", "when to use this component", "design tokens", "colour roles", "style guide", "audit our design system", "design drift", "add a component to the system", "handoff to engineering", "developer specs", "implementation notes", "design specs for developers", or requests to maintain consistency across designs or translate designs into implementation guidance. Flags --audit, --extend, and --handoff select the other actions. Use layout for page structure, design-review to evaluate a design, and frontend-design to build it.
---

# Design System

Produce and maintain the product's interface guidelines: the rules people and agents follow to decide which pattern to use, how it behaves, and what users can rely on. A component library provides building blocks; the guidelines decide which to use and why. Every pattern must answer: **Why this pattern? What behaviour does it promise? How is that verified?**

This skill owns principles, semantics, roles, governance and the guideline format. Other skills own generic defaults; name them when asking, never copy them:
- layout: surfaces, page archetypes, state and saving contracts, spacing, grids, breakpoints, validation timing;
- design-review: WCAG 2.2 AA;
- ux-copy: content patterns.

## Choose the Action

- **Build the guidelines** (default): read, infer, then interview.
- `--audit`: compare the product with its guidelines and report.
- `--extend`: add one pattern or component to the guidelines.
- `--handoff`: turn a design into an implementation spec that cites the guidelines. If the request includes a `.md` path, write the spec there; otherwise reply in chat.

A flag may appear anywhere in the request; any other text is the focus and scopes the action. Run one action per request: if two flags appear, ask which to run. For an unknown `--flag`, list the valid flags and ask.

Without a flag, a clear plain-language request still selects the action: "audit our design system" runs `--audit`, "add a date-range picker to the system" runs `--extend`, "write developer specs for this screen" runs `--handoff`. State the chosen action and its flag in the first line of the response. Anything else runs the default.

`--extend` with no focus asks what to extend, recommending the top Open item.

## Locate and Read

1. Find the guidelines, in order: a pointer in `AGENTS.md` or `CLAUDE.md`; `docs/design/README.md`; any other markdown guideline tree. Reuse whichever exists; otherwise use `docs/design/`.
2. Read the README page map, then the pages the action and focus need.
3. Treat Storybook, zeroheight, Notion and design files as evidence, not as the guidelines.
4. Read and link `docs/glossary.md` if it exists. Never write it.

## Build the Guidelines (Default)

1. Locate and read.
2. Infer the system following [inventory](references/inventory.md). Write the skeleton (README, page map, and every page that has an Inferred rule or Open item) before asking anything.
3. Show the gap map:

   | Spine area | Confirmed | Inferred | Open | Pages missing required fields |
   |---|---|---|---|---|

4. Interview along the spine in [interview](references/interview.md): context and principles → behavioural foundations → visual foundations → page and task patterns → components → governance. Skip Confirmed areas. A focus overrides the order.
5. After every answer, write the decision to its page before asking the next question.
6. Finish with the gap summary. Offer the agent pointer line once.

On a later run, rebuild the gap map from the pages alone and resume from the gaps. There is no state file.

### Interview Cadence

- Ask one real decision per message. Show what the code shows (counts, paths), 2–4 options, a recommendation with its reason, and which skill owns the generic default.
- Confirm Inferred rules in batches of at most 5: "Which are wrong?" Each rejection becomes its own follow-up question.
- Never ask what the code or the docs already answer.
- Challenge an answer once, with evidence, when it conflicts with a Requirement, the code or an earlier answer. A deviation from a Requirement goes to the exceptions register or is not adopted.
- "Skip" or "don't know" writes an Open item with an owner.
- Close each area with: "What should I have asked that I didn't?"
- Keep going until the user stops, or every area is Confirmed or Open with an owner.

### Writing Rules

Follow [guidelines format](references/guidelines-format.md). Each rule is one line plus Why, Evidence and Status:

```markdown
**BTN-003 · Must not** use a Button for navigation. Instead, use Link.
- Why: Buttons act on the current page and links change location; assistive technology announces each role differently.
- Evidence: Accessibility · WAI-ARIA APG button pattern
- Status: Confirmed
```

- **Strength:** Must / Must not is a Requirement (an adopted standard or hard product constraint); Should / Should not is a Default that permits a registered exception.
- **Status:** Inferred (observed, not agreed), Confirmed (agreed by an owner), Open (undecided). Precedence: Requirement > Confirmed > Inferred.
- **IDs:** the page prefix declared in the page map plus three digits. Allocate the highest existing ID on the page, tombstones included, plus one. Never reuse an ID; a removed or rewritten rule leaves a tombstone.
- **Open items** record the question, options, recommendation and owner, and keep their ID when confirmed.
- Edit only the page that owns a decision, then update the README page-map counts.
- Pages are self-contained: state each decision in full; never mention this plugin or its skills.
- With no existing system, define roles, not values; values stay Open with an owner.
- Write only inside the guidelines location, plus the consented pointer line. Never touch product code, tokens or stories.
- With no filesystem, return each page as a fenced block headed with its path.

### Gap Summary

```markdown
## Guidelines Session: [date]
**Settled:** [rule IDs confirmed or written this session]
**Open:** | ID | Question | Owner |
**Missing required fields:** [page: fields]
**Next area:** [spine area, and the first question to ask]
```

## Audit (`--audit`)

1. Resolve the guidelines. If none exist, report the inventory's competing treatments as Open candidates and recommend running the default action.
2. Scope the audit with the focus; otherwise audit the area the gap map ranks first.
3. Take the inventory ([inventory](references/inventory.md)).
4. Compare it with the rules and the exceptions register.
5. Classify each finding, rate its severity, and name its root cause.
6. Compute the metrics the product's `governance.md` defines.
7. Propose guideline edits and wait for consent before writing any. Never edit product code.

| Class | When |
|---|---|
| Defect | Violates a Requirement or Confirmed rule with no live exception, or relies on an expired exception |
| Sanctioned exception | A live register entry covers it |
| Drift: confirm or drop | Violates an Inferred rule |
| Rule gap | A recurring choice no rule covers, or competing treatments |

| Severity | Meaning |
|---|---|
| 🔴 Critical | Blocks or derails a primary task, blocks access for a disability group, or risks material harm; no reasonable workaround |
| 🟡 Major | Substantially impairs a task or causes serious confusion or repeated error; any workaround is burdensome |
| 🟢 Minor | Limited, local friction or isolated nonconformance that does not block the task |

Rate visual issues by their impact like any other. Report a rule's strength separately from severity. If `governance.md` defines another scale, use it.

```markdown
## Design System Audit: [scope]
### Summary
**Findings:** [X] | **Critical:** [X] | **Major:** [X] | **Minor:** [X] | **Rule gaps:** [X]

### Findings
| Rule | Strength | Class | Severity | Layer | Evidence (path) | Root cause | Fix |
|---|---|---|---|---|---|---|---|

### Inventory
| Purpose | Treatment | Uses | Paths |
|---|---|---|---|

### Metrics
| Metric | Value | Decision rule triggered? |
|---|---|---|

### Proposed Guideline Edits (need approval)
1. [Confirm, drop, add or revise: rule ID and wording]
```

Layer is one of conceptual, navigational, structural, behavioural, state, visual or linguistic. Export findings to a tracker only with permission.

## Extend (`--extend`)

Interview one gap at a time:
1. **Problem and evidence:** the user need, where it recurs, and what is used today.
2. **Existing candidates:** for each, an exact match, extendable, or genuinely new. The rule of three is a prompt, not a quota; a wrong abstraction costs more than duplication.
3. **Rules:** allowed uses, do-not-use conditions with alternatives, behaviour, data contract and states.
4. **Anatomy and variants:** what may vary and what must not. Prefer composition over boolean-prop combinations.

Show the proposed page. On approval, write it with lifecycle Experimental and its rules Confirmed, then update the page map.

## Handoff (`--handoff`)

Follow [handoff](references/handoff.md). Read the guidelines first and cite rule IDs. List deviations as exception requests; a deviation from a Requirement is a fix, never an exception request. Never write feature specs into the guidelines.

## References

- [Interview](references/interview.md): read before the first question of any interview, including `--extend`.
- [Inventory](references/inventory.md): read before inferring rules or running `--audit`.
- [Guidelines format](references/guidelines-format.md): read before writing any page.
- [Tokens and foundations](references/tokens-and-foundations.md): read for principles, semantics, colour, type, surfaces, icons, motion, states, accessibility policy, content standards and tokens.
- [Governance and refactoring](references/governance-and-refactoring.md): read for the governance area, lifecycle, exceptions, metrics and refactoring decisions.
- [Handoff](references/handoff.md): read for `--handoff`.

## If Connectors Available

Treat every connector as read-only evidence:
- Design tool or Storybook: inventory real variants, properties, tokens and states.
- Knowledge base: read existing guidance; publish only with permission.
- Code search: trace token and component consumers and hardcoded values.
- Tracker: export findings and migrations after approval.

## Tips

- Fix the component, not each designer, when evidence shows a system gap.
- Prefer composability within explicit constraints over endless variants.
- Write decisions while the context is fresh; that is why every answer is written before the next question.
