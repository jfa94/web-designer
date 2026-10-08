# Product Guidelines Format

This is the format `design-system` writes in a consuming repository, and that `layout`, `design-review`, `ux-copy`, and `frontend-design` read. The canonical definition is `skills/design-system/references/guidelines-format.md`. This page summarises it.

## Location

`design-system` looks for guidelines in this order:

1. A pointer in `AGENTS.md` or `CLAUDE.md`.
2. `docs/design/README.md`.
3. Any other markdown guideline tree.

It reuses whichever it finds. If none exists, it uses `docs/design/`.

## Tree

Each file is created only once it has content.

```text
docs/design/
├── README.md        principles, rule legend, page map
├── foundations/     one page per foundation (colour.md, typography.md, accessibility.md, content.md, navigation.md, motion.md …)
├── patterns/        page and task patterns, named by task (collection-pages.md, creating.md, deleting.md, saving.md, search-and-filter.md …)
├── components/      one page per component (button.md, dialog.md …)
└── governance.md    ownership, lifecycle, contribution, severity, metrics, exceptions register
```

Not created: `DESIGN.md`, `llms.txt`, token exports, or tool-specific copies. `docs/glossary.md` is linked from the README and `foundations/content.md` when it exists, and is never written.

## README

| Section | Content |
|---|---|
| Title | `# [Product] Interface Guidelines` |
| Summary | Who and what the guidelines cover, in two sentences |
| Agent instruction | Read this page, load only pages whose "Read when" matches, cite rule IDs |
| Principles | Numbered. Each names the decision it settles and what it costs |
| Reading Rules | The legend for strength, status, evidence, and precedence |
| Page Map | Table: Page, Prefix, Read when, Lifecycle, Confirmed, Inferred, Open |
| Glossary | Link to `docs/glossary.md`, if present |

The page-map counts are updated whenever a page changes.

## Rule syntax

```markdown
**BTN-003 · Must not** use a Button for navigation. Instead, use Link.
- Why: Buttons act on the current page and links change location; assistive technology announces each role differently.
- Evidence: Accessibility · WAI-ARIA APG button pattern
- Status: Confirmed
```

| Part | Values |
|---|---|
| ID | Page prefix (declared in the page map) plus three digits |
| Strength | `Must`, `Must not` (Requirement); `Should`, `Should not` (Default) |
| Statement | One imperative sentence stating one decision. Every "do not" names its replacement |
| Why | One sentence naming the user consequence |
| Evidence | `Accessibility`, `Research`, `Convention`, or `Policy`, then ` · ` and the source or usage count. Inferred rules give counts and paths |
| Status | `Confirmed`, `Inferred`, `Open` |

### Strength

| Strength | Meaning | Departures |
|---|---|---|
| Must / Must not | Requirement: an adopted standard (such as WCAG 2.2 AA) or a hard product constraint | Never overridden by a Default. Goes to the exceptions register with an owner and review date, or is not adopted |
| Should / Should not | Default | Needs a live entry in the exceptions register |

### Status

| Status | Meaning | Consuming skills |
|---|---|---|
| Confirmed | Agreed by an owner | Follow it |
| Inferred | Observed in the code, not yet agreed | Follow it and flag it as unconfirmed |
| Open | Undecided | Use the skill's own guidance; list as an `--extend` candidate |

### Precedence

Requirement > Confirmed rule > Inferred rule > the consuming skill's guidance. A register exception overrides only the rule and context it names.

## ID allocation and tombstones

- A new ID is the highest existing number on the page, tombstones included, plus one.
- IDs are never reused.
- A removed or rewritten rule leaves a tombstone, and its replacement takes a new ID:

  ```markdown
  ~~**BTN-002**~~ Removed 2026-10-08: replaced by BTN-006.
  ```

- A rule rejected during an interview is tombstoned as `Rejected [date]`. A follow-up question then decides what replaces it.

## Open items

```markdown
**BAN-004 · Open** Which treatment marks a warning banner?
- Options: amber Banner (2 uses: src/pages/billing.tsx, …) · neutral Banner with icon (2 uses: …)
- Recommendation: amber Banner, because amber is already the warning role on COL-006.
- Owner: [role or name]
```

An Open item keeps its ID when it is confirmed. "Skip" or "don't know" during an interview writes an Open item with an owner, or `Unassigned`.

## Inference thresholds

| Evidence in the code | Written as |
|---|---|
| At least 3 uses, and at least 75% of same-purpose uses alike | Inferred rule, with counts and paths |
| Weaker majority, or two or more competing treatments | Open item, with each treatment's count and paths |
| A single use | Nothing (may be noted in the gap map) |
| A majority that breaks a Requirement | Open item flagged as a Requirement conflict |

## Page template

Fields appear in this order. A field with no content is omitted and reported as missing in the gap map if the page type requires it.

| Field | Component | Pattern | Foundation |
|---|---|---|---|
| Name and identifier | ✓ | ✓ | ✓ |
| Purpose | ✓ | ✓ | ✓ |
| Scope | ✓ | ✓ | ✓ |
| Allowed uses | ✓ | ✓ | |
| Do not use when | ✓ | ✓ | |
| Alternatives | ✓ | ✓ | |
| Anatomy | ✓ | ✓ | |
| Variants | ✓ | | |
| Behaviour | ✓ | ✓ | |
| Data contract | ✓ | ✓ | |
| State model | ✓ | ✓ | |
| Accessibility | ✓ | ✓ | ✓ |
| Responsive behaviour | ✓ | ✓ | |
| Content rules | ✓ | ✓ | |
| Evidence | ✓ | ✓ | ✓ |
| Examples | ✓ | ✓ | ✓ |
| Acceptance tests | ✓ | ✓ | |
| Owner and lifecycle | ✓ | ✓ | ✓ |
| Implementation | ✓ | | |

Foundation pages add role tables between Scope and Accessibility. A page header line has the form `**Prefix:** DLG · **Lifecycle:** Approved · **Owner:** [team]`.

## Lifecycle

| Lifecycle | Requirement |
|---|---|
| Experimental | States what remains uncertain. `--extend` writes new pages at this stage |
| Approved | Has representative examples and acceptance tests. A built component alone is not enough |
| Deprecated | Names its replacement and removal date |
| Removed | Leaves a tombstone |

## Interview spine prefixes

| Area | Pages · prefix |
|---|---|
| A. Context and principles | `README.md` |
| B. Behavioural foundations | `foundations/content.md` · CNT, `foundations/navigation.md` · NAV, `patterns/saving.md` · SAVE, `patterns/feedback.md` · FDBK, `patterns/recovery.md` · REC |
| C. Visual foundations | `foundations/colour.md` · COL, `typography.md` · TYPE, `layout.md` · LAY, `surfaces.md` · SURF, `icons.md` · ICON, `motion.md` · MOT, `states.md` · STATE |
| D. Page and task patterns | `patterns/<task>.md`, prefix from the name (e.g. `deleting.md` · DEL) |
| E. Components | `components/<name>.md`, prefix from the name (BTN, DLG, TBL) |
| F. Governance | `governance.md` · GOV |

## `governance.md`

| Section | Content |
|---|---|
| Ownership | Owner, model (centralised, federated, hybrid), who decides disputes |
| Lifecycle | Experimental → Approved → Deprecated → Removed, and the deprecation window |
| Contribution | Path, review participants, triage outcomes |
| Severity | The product's scale, or the default Critical / Major / Minor |
| Metrics | Table: Metric, Formula, Cadence, Decision rule |
| Exceptions Register | Table: ID, Violated rule, Context, Why the default fails, Alternative, Evidence, Owner, Review date, Status |

An exception is live until its review date. After that it is expired, and the case it covers is a defect until renewed or resolved. Exception IDs (`EXC-001`) follow the same allocation and tombstone rules as rule IDs. Exceptions are recorded only in the register, never next to the rule.

## Agent pointer line

Added once to the repository's `AGENTS.md` or `CLAUDE.md`, and only with the user's consent:

```markdown
Interface guidelines: read `docs/design/README.md` and its page map before any UI work; cite rule IDs and follow Requirements over everything else.
```
