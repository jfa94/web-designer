# Acme Admin Interface Guidelines

These guidelines cover the Acme Admin web app: account, billing, team and project management for workspace owners.

**Agents:** read this page, then load only the pages whose "Read when" matches the task. Cite rule IDs for every decision a rule drives.

## Principles
1. **Recoverable over fast.** Every consequential action can be undone or is confirmed first, even when that costs a step.

## Reading Rules
- **Must / Must not**: Requirement. An adopted standard (WCAG 2.2 AA) or a hard product constraint. Never overridden by a Default.
- **Should / Should not**: Default. Departures need a live entry in the exceptions register (`governance.md`).
- **Status**: Confirmed (agreed by an owner), Inferred (observed in the code, not yet agreed; follow it and flag it), Open (undecided).
- **Evidence**: Accessibility, Research, Convention, or Policy, with its source or usage count.
- **Precedence**: Requirement > Confirmed rule > Inferred rule. A register exception overrides only the rule and context it names.

## Page Map
| Page | Prefix | Read when | Lifecycle | Confirmed | Inferred | Open |
|---|---|---|---|---|---|---|
| `components/button.md` | BTN | Choosing, placing or styling any button | Experimental | 2 | 2 | 1 |
| `patterns/forms.md` | FORM | Building or reviewing any form | Approved | 2 | 0 | 0 |
| `governance.md` | EXC | Checking ownership, severity or an exception | Approved | — | — | — |
