# Governance and Refactoring

## Operating Model

- Centralized: coherent and fast to govern, but can bottleneck or lose product context.
- Federated: strong local ownership, but consistency and maintenance require coordination.
- Hybrid: a core team owns foundations and release quality while product contributors propose and build additions. This is the common durable default, not a universal answer.

Use a visible path: **Request → Triage → Design → Build → Review → Document → Release → Adopt → Measure**. Include a compliance-review gate before release for accessibility, API, token, documentation, and regression expectations.

Exceptions need an owner, rationale, scope, start date, expiry/review date, and retirement condition. A live experiment is sanctioned variation until its deadline, not automatically drift.

## Refactoring Decisions

Classify a request:

- Exact match: adopt the existing component unchanged.
- Extendable: add a capability whose semantics serve multiple genuine uses.
- Genuinely new: keep it separate until evidence supports convergence.

The rule of three is a useful threshold for considering abstraction. It is not permission to force unlike use cases together. A wrong abstraction costs more than duplication (Sandi Metz). Watch for prop bloat, Boolean combinations, and conditionals that change semantics; prefer slots, composition, or separate components.

Refactor upstream when the same need has at least three uses, when repeated fixes drift, or when one accessibility/behavior correction must reach every consumer. Do not refactor during urgent delivery without a migration path, when the similarity is superficial, or when a stable local solution has no meaningful maintenance cost.

Use strangler-fig migration:

1. Ship the new path alongside the old.
2. Migrate representative low-risk consumers.
3. Measure failures and ergonomics.
4. Publish migration tooling and deadlines.
5. Deprecate, soft-delete, then remove after evidence shows no supported consumers.

## Metrics with Decisions

Keep adoption, compliance, and conformance separate. A score can show a trend but must never become a Goodhart target. Every metric needs a decision rule, such as: "If hardcoded semantic colors rise for two monthly audits, prioritize the missing-token backlog."

## Agentic UI and Regression

- Publish machine-readable component manifests and expose Storybook or an equivalent catalog through approved tools/MCP.
- In consuming `CLAUDE.md`/`AGENTS.md`, instruct agents: never hallucinate component properties; inspect the current manifest/source.
- Audit quarterly by default; escalate to monthly when teams ship significant AI-generated UI, where cheap variation compounds faster. Both are practitioner rules of thumb, not evidence-based standards.
- Visual regression testing is only as good as the states you enumerate. Baseline important components and journeys per relevant viewport, theme, brand, locale, and interaction state.
- Review changed pixels rather than blindly accepting baselines. Pair VRT with semantic, interaction, and accessibility checks.

The governing principle is "fix the component, not the designer" when the root cause is systemic. Local defects still belong locally.
