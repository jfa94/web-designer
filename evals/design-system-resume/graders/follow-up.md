---
type: llm
weight: 2
---

The user confirmed BTN-002 and rejected BTN-004 ("label a Button with a verb and its object").

PASS only if all hold:
- The response asks one follow-up decision about what should replace BTN-004, with options and a recommendation.
- It does not ask the user to re-confirm BTN-001, BTN-003, FORM-001 or FORM-002, which are already Confirmed.
- It does not claim a replacement rule for BTN-004 was adopted.

FAIL otherwise.
