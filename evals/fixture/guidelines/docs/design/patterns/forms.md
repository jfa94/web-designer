# Forms

**Prefix:** FORM · **Lifecycle:** Approved · **Owner:** Design systems team

## Purpose
Collect and validate input with the fewest errors and no lost work.

## Accessibility
**FORM-001 · Must** give every field a visible label. Instead of placeholder-only fields, use TextField's `label`.
- Why: Placeholder text disappears on input and is not a reliable accessible name.
- Evidence: Accessibility · WCAG 2.2 SC 3.3.2 Labels or Instructions
- Status: Confirmed

## Behaviour
**FORM-002 · Should** validate a field when focus leaves it after the user has typed in it, on every form, including public sign-up forms.
- Why: Our users fill short forms and fix errors best one field at a time.
- Evidence: Research · 2026 sign-up usability study (6 of 8 participants)
- Status: Confirmed
