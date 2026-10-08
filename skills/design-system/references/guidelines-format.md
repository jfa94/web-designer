# Guidelines Format

The product's guidelines are markdown in the repository, written for agents first and people second. Every page is self-contained: it states each decision in full and never refers to this plugin or its skills.

## Location and Tree

Reuse an existing guideline location if one is found. Otherwise use `docs/design/`, and create each file only when it has content:

```text
docs/design/
├── README.md        principles, rule legend, page map (created on the first write)
├── foundations/     one page per foundation: colour.md, typography.md, accessibility.md, content.md, navigation.md, motion.md …
├── patterns/        page and task patterns, named by task: collection-pages.md, creating.md, deleting.md, saving.md, search-and-filter.md …
├── components/      one page per component: button.md, dialog.md …
└── governance.md    ownership, lifecycle, contribution, severity, metrics, exceptions register
```

Define a policy once, on the page that owns it, and reference it by rule ID elsewhere. The unsaved-changes policy, for example, lives in `patterns/saving.md` and is cited by forms, dialogs, drawers and editors. If `docs/glossary.md` exists, link it from the README and from `foundations/content.md`; never write to it.

Do not create `DESIGN.md`, `llms.txt`, token exports or tool-specific copies.

## README Template

```markdown
# [Product] Interface Guidelines

[Who and what this covers, in two sentences.]

**Agents:** read this page, then load only the pages whose "Read when" matches the task. Cite rule IDs for every decision a rule drives.

## Principles
1. **[Principle].** [The decision it settles, and what it costs.]

## Reading Rules
- **Must / Must not**: Requirement. An adopted standard (WCAG 2.2 AA) or a hard product constraint. Never overridden by a Default.
- **Should / Should not**: Default. Departures need a live entry in the exceptions register (`governance.md`).
- **Status**: Confirmed (agreed by an owner), Inferred (observed in the code, not yet agreed; follow it and flag it), Open (undecided).
- **Evidence**: Accessibility, Research, Convention, or Policy, with its source or usage count.
- **Precedence**: Requirement > Confirmed rule > Inferred rule. A register exception overrides only the rule and context it names.

## Page Map
| Page | Prefix | Read when | Lifecycle | Confirmed | Inferred | Open |
|---|---|---|---|---|---|---|
| `foundations/colour.md` | COL | Choosing or reviewing any colour | Approved | 9 | 2 | 1 |

Glossary: `docs/glossary.md`
```

Update the counts whenever a page changes.

## Rules

Each rule sits under the field it governs, as one line in the bold `ID · strength` form followed by one imperative sentence, then three labelled lines:

```markdown
**BTN-003 · Must not** use a Button for navigation. Instead, use Link.
- Why: Buttons act on the current page and links change location; assistive technology announces each role differently.
- Evidence: Accessibility · WAI-ARIA APG button pattern
- Status: Confirmed
```

- IDs are the page prefix (declared in the page map) plus three digits. Allocate the highest existing number on that page, tombstones included, plus one. Never reuse an ID.
- An Inferred rule's evidence gives its counts and paths: `Evidence: Convention · 7 of 8 destructive actions (src/pages/…)`.
- One rule states one decision. Split compound rules; a rule nobody could fail is not a rule.
- A removed or rewritten rule leaves a tombstone, and its replacement takes a new ID:

  ```markdown
  ~~**BTN-002**~~ Removed 2026-10-08: replaced by BTN-006.
  ```

- An Open item records the question, options with evidence, a recommendation and an owner. It keeps its ID when confirmed:

  ```markdown
  **BAN-004 · Open** Which treatment marks a warning banner?
  - Options: amber Banner (2 uses: src/pages/billing.tsx, …) · neutral Banner with icon (2 uses: …)
  - Recommendation: amber Banner, because amber is already the warning role on COL-006.
  - Owner: [role or name]
  ```

- Exceptions live only in the exceptions register in `governance.md`, never beside the rule.
- A page's lifecycle is Experimental (state what remains uncertain), Approved (has representative examples and acceptance tests) or Deprecated (names its replacement). Approved does not mean "someone built a component"; implementation is one part of the evidence.

## Page Template

Use these fields, in this order. Omit a field that has no content yet, and report it as missing in the gap map when the page type requires it.

| Field | What to document | Answered by | Component | Pattern | Foundation |
|---|---|---|---|---|---|
| Name and identifier | Stable name used in design and code, and the ID prefix | Code | ✓ | ✓ | ✓ |
| Purpose | The user problem it solves | Interview | ✓ | ✓ | ✓ |
| Scope | Where it applies | Interview | ✓ | ✓ | ✓ |
| Allowed uses | Positive selection criteria | Interview | ✓ | ✓ | |
| Do not use when | Conditions that require something else; anti-patterns | Interview | ✓ | ✓ | |
| Alternatives | The replacement for each excluded case, and why | Interview | ✓ | ✓ | |
| Anatomy | Required and optional parts | Code | ✓ | ✓ | |
| Variants | What may vary, and what must not | Code, then interview | ✓ | | |
| Behaviour | Trigger, interaction, dismissal, completion | Code, then interview | ✓ | ✓ | |
| Data contract | Saving model, persistence, recovery | Interview | ✓ | ✓ | |
| State model | Loading, empty, error, success, disabled, read-only, permission | Code, then interview | ✓ | ✓ | |
| Accessibility | Semantics, focus, keyboard, announcements, applicable criteria | Code, then interview | ✓ | ✓ | ✓ |
| Responsive behaviour | Reflow, overflow, stacking, surface changes | Code, then interview | ✓ | ✓ | |
| Content rules | Labels, tone, terminology, message structure | Interview | ✓ | ✓ | |
| Evidence | Sources, context, confidence, date reviewed | Code and interview | ✓ | ✓ | ✓ |
| Examples | Approved examples, counterexamples, boundary cases | Code | ✓ | ✓ | ✓ |
| Acceptance tests | Observable conditions required for release | Interview | ✓ | ✓ | |
| Owner and lifecycle | Responsible team, lifecycle, version, replacement plan | Owner | ✓ | ✓ | ✓ |
| Implementation | Source path, import, story; never copied props | Code | ✓ | | |

Foundation pages add their role tables (see [tokens and foundations](tokens-and-foundations.md)) between Scope and Accessibility.

## Worked Example

Abbreviated, for a product that has confirmed these decisions:

```markdown
# Dialog

**Prefix:** DLG · **Lifecycle:** Approved · **Owner:** Design systems team

## Purpose
Complete a short task about the current object without leaving the parent view.

## Allowed Uses
**DLG-001 · Should** use a Dialog for a bounded edit, a short contextual creation task, or confirming a consequential action.
- Why: The parent view stays in place, so the user returns to the same context.
- Evidence: Policy · settled 2026-10-08
- Status: Confirmed

## Do Not Use When
**DLG-002 · Should not** use a Dialog for substantial editing, browsing several objects, routine success messages, or multi-step onboarding. Instead, use a dedicated page, a supporting panel, or a toast.
- Why: Long or branching work in a dialog loses its place on refresh and cannot be linked or resumed.
- Evidence: Convention · 2 of 14 dialogs do this today (src/settings/…, src/onboarding/…)
- Status: Confirmed

## Data Contract
**DLG-004 · Must not** commit changes on Cancel, Escape or the close button.
- Why: Every dismissal means "leave without saving", whichever control is used.
- Evidence: Policy · saving model SAVE-002
- Status: Confirmed

## Acceptance Tests
Complete the task; cancel it; trigger a validation failure; simulate a save failure; dismiss after editing; use only the keyboard; enlarge text to 200%; close it after the triggering item was removed.

## Implementation
`src/components/Dialog.tsx` · `import { Dialog } from "@/components/Dialog"` · story `Components/Dialog`
```

## Writing Style

- Write decisions, not aspirations. "Use modals sparingly" selects nothing, excludes nothing and cannot be tested; DLG-001 and DLG-002 do all three.
- Address the reader directly, in the imperative, in the present tense. Use the product's glossary terms.
- Lead with when to use something, then when not to, then the alternative. Every "do not" names its replacement.
- Explain why in one sentence the reader could repeat to a colleague. Name the user consequence, not the aesthetic.
- Show a real example and a real counterexample from the product when one exists.
- Label proposed values and illustrative numbers as Defaults, not as research findings.

## Agent Pointer

With consent, add this line once to the repository's `AGENTS.md` or `CLAUDE.md`:

```markdown
Interface guidelines: read `docs/design/README.md` and its page map before any UI work; cite rule IDs and follow Requirements over everything else.
```
