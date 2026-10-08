# Button

**Prefix:** BTN · **Lifecycle:** Experimental · **Owner:** Design systems team

## Purpose
Trigger an action on the current page.

## Allowed Uses
**BTN-001 · Should** use at most one primary Button per decision context.
- Why: A single primary action tells the user which choice the product expects.
- Evidence: Policy · settled 2026-09-15
- Status: Confirmed

**BTN-002 · Should** use the danger variant for an action that destroys or ends something.
- Why: Users scan for the danger treatment before committing to an irreversible action.
- Evidence: Convention · 3 of 4 destructive actions (src/pages/Settings.tsx, src/pages/Team.tsx, src/pages/Projects.tsx)
- Status: Inferred

## Do Not Use When
**BTN-003 · Must not** use a Button for navigation. Instead, use Link.
- Why: Buttons act on the current page and links change location; assistive technology announces each role differently.
- Evidence: Accessibility · WAI-ARIA APG button pattern
- Status: Confirmed

## Content Rules
**BTN-004 · Should** label a Button with a verb and its object.
- Why: "Delete project" states the consequence; "OK" does not.
- Evidence: Convention · 8 of 9 button labels (src/pages/…)
- Status: Inferred

## State Model
**BTN-005 · Open** Should a loading Button stay focusable?
- Options: disabled while loading (current: src/components/Button.tsx) · `aria-disabled` and focusable
- Recommendation: `aria-disabled`, so focus is not lost mid-action.
- Owner: Design systems team

## Implementation
`src/components/Button.tsx` · `import { Button } from "../components/Button"` · story `Components/Button`
