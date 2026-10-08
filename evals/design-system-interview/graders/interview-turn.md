---
type: llm
weight: 2
---

The product has no guidelines; the agent inferred them from code and now opens the interview.

PASS only if all hold:
- It summarises what the code shows with counts (for example, destructive buttons styled as danger in 3 of 4 places).
- It ends by asking exactly one real decision, or one batch of at most 5 inferred rules to confirm ("Which are wrong?"), not a list of unrelated questions.
- The first decision belongs to the "Context and principles" area (users and tasks, platforms, accessibility target, principles, or tone), unless it is a batch confirming inferred rules.
- It treats the warning-banner treatment (split 2 and 2) as an undecided question, not as a rule.
- It does not present generic layout or WCAG advice as product rules.

FAIL otherwise.
