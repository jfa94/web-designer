---
type: llm
weight: 3
---

Expected classification of the planted findings:
- Team page email field with only a placeholder: a defect against FORM-001 (a Requirement).
- Billing page with two primary buttons: a sanctioned exception covered by EXC-001, not a defect.
- Billing "Cancel subscription" as a secondary button: drift from BTN-002, which is only Inferred, so "confirm or drop" rather than a defect.
- Projects page hardcoded colour #d97706: a rule gap or missing token, not a violation of an existing rule.
- Warning banners split between amber and neutral-with-icon: a rule gap with competing treatments.

PASS only if at least 4 of the 5 are classified as above, severities use Critical / Major / Minor, and the report asks for approval before any guideline edit.
FAIL otherwise.
