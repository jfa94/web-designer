# Governance and Refactoring

Governance decides who may change the guidelines, how, and how a product knows they work. The product's decisions go in `governance.md`; the plugin supplies options, not answers.

## Operating Model

- Centralized: coherent and fast to govern, but can bottleneck or lose product context. Suits highly regulated or high-risk portfolios.
- Federated: strong local ownership, but consistency and maintenance require coordination, and drift follows weak evidence thresholds.
- Hybrid: a core team owns foundations, exceptions and release quality while product contributors propose and build additions. The common durable default, not a universal answer.

Move toward hybrid if the core team becomes a bottleneck; re-centralize if quality fragments.

## Contribution and Triage

Use a visible path: **Request → Triage → Design → Build → Review → Document → Release → Adopt → Measure**. Review is cross-discipline (design, engineering, accessibility, content) and checks accessibility, API, token, documentation and regression expectations before release.

Triage every request into one outcome:
- **Adopt:** an existing pattern already fits; use it unchanged.
- **Extend:** add a variant or capability whose meaning serves several genuine uses.
- **New:** a distinct, useful problem no pattern solves; enter as Experimental.
- **Exception:** a special case; record it in the register with an expiry.
- **Reject:** with the reason and the pattern to use instead.

An exception solves a special case; a new variant solves a recurring case; a rule revision corrects a flawed default. Without this distinction every inconsistency becomes an exception, or every product need becomes a forbidden deviation. A live experiment is a sanctioned exception until its review date, not drift.

## Refactoring Decisions

Classify a request as an exact match, extendable, or genuinely new. The rule of three is a prompt for considering abstraction, not permission to force unlike uses together: a wrong abstraction costs more than duplication (Sandi Metz). Watch for prop bloat, Boolean combinations and conditionals that change semantics; prefer slots, composition or separate components.

Refactor upstream when the same need has at least three genuine uses, when repeated fixes drift, or when one accessibility or behaviour correction must reach every consumer. Do not refactor during urgent delivery without a migration path, when the similarity is superficial, or when a stable local solution costs nothing to maintain.

Use strangler-fig migration:
1. Ship the new path alongside the old.
2. Migrate representative low-risk consumers.
3. Measure failures and ergonomics.
4. Publish migration tooling and deadlines.
5. Deprecate, then remove after evidence shows no supported consumers.

## Lifecycle

Pages and components move **Experimental → Approved → Deprecated → Removed**:
- Experimental states what remains uncertain.
- Approved has representative examples and acceptance tests; a built component alone is not approval.
- Deprecated names its replacement and the removal date.
- Removed leaves a tombstone in the guidelines.

The deprecation window is a product decision set by consumer coupling and release cadence. Published examples: FT Origami 3–6 months for a tightly coupled community; Morningstar ran old and new notifications side by side for six months; Salesforce Lightning gives 18 months to large, disconnected consumers.

## Token Lifecycle and Impact

1. Introduce the replacement and document the mapping.
2. Deprecate with warnings, ownership and usage telemetry.
3. Soft-delete from normal discovery while retaining compatibility.
4. Delete after the declared window and migration evidence.

Any token change is a system-wide regression event: identify dependents, communicate scope, and test viewport, theme, brand, state and contrast combinations.

## Metrics

Keep adoption (who uses the system), compliance (following internal rules) and conformance (meeting an external standard) separate. Operational measures from the research:

| Metric | Formula |
|---|---|
| Token adoption | Styled properties using an approved semantic token / styled properties sampled |
| Component reuse | Instances using the approved component / instances of that UI problem |
| Exception rate | Approved exceptions / implemented patterns, per quarter |
| State coverage | Required states present and reviewed / required states expected |
| Contrast pass rate | Sampled text and UI-state pairs meeting the target / pairs sampled |
| Duplicate-pattern count | Distinct local solutions to the same recurring task |
| Copy conformance | Labels, errors and helper texts matching content standards / sampled |
| Adoption lag | Median time from a published change to product adoption |

These are not outcomes. Also track task completion, avoidable errors, successful recovery, lost work and accessibility defects: a product can be consistently confusing. A score shows a trend and must never become a target (Goodhart). Every metric needs a decision rule, written per product in `governance.md` during the governance interview, for example: "If hardcoded semantic colours rise for two monthly audits, prioritise the missing-token backlog."

## Agentic UI and Regression

- Point agents at the guidelines and the component source or manifest. In a consuming `AGENTS.md` or `CLAUDE.md`, instruct: never invent component properties; inspect the current source.
- Audit quarterly by default; monthly when teams ship significant AI-generated UI. Both are practitioner rules of thumb, not evidence-based standards.
- Visual regression testing detects change from a baseline, not deviation from the guidelines, and only covers the states you enumerate. Baseline important components and journeys per relevant viewport, theme, brand, locale and state, and review changed pixels rather than accepting baselines blindly. Pair it with semantic, interaction and accessibility checks.

Fix the component, not the designer, when the root cause is systemic. Local defects still belong locally.

## `governance.md` Template

```markdown
# Governance

## Ownership
**Owner:** [team or role] | **Model:** [centralised/federated/hybrid] | **Decides disputes:** [role]

## Lifecycle
Experimental → Approved → Deprecated → Removed. **Deprecation window:** [months, and why]

## Contribution
[Path, review participants, triage outcomes, where requests go]

## Severity
| Severity | Meaning |
|---|---|
[The product's scale, or the default Critical / Major / Minor]

## Metrics
| Metric | Formula | Cadence | Decision rule |
|---|---|---|---|

## Exceptions Register
| ID | Violated rule | Context | Why the default fails | Alternative | Evidence | Owner | Review date | Status |
|---|---|---|---|---|---|---|---|---|
| EXC-001 | BTN-002 | Billing summary page | … | … | … | … | 2027-01-31 | Live |
```

An exception is live until its review date; after that it is expired, and the case it covers is a defect until renewed or resolved. Exception IDs follow the same allocation and tombstone rules as rule IDs.
