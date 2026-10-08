---
name: ux-copy
description: Write or review interface and landing-page copy. Trigger with "write copy for", "help with UX copy", "what should this button say", "error message for", "empty state copy", "write landing page copy", "write a headline", "improve my homepage messaging", "write CTA text", "create a value proposition", PAS, AIDA, StoryBrand, JTBD, headline formulas, benefit-driven copy, objection handling, microcopy, conversion copy, product-launch messaging, or requests to critique, rewrite, or draft page copy section by section. Use for words and messaging; use layout for page structure and wireframes, and frontend-design for visual design or implementation. Do not use for general content, blog posts, email, or ad copy unless it is explicitly landing-page messaging.
---

# UX Copy

Write or review interface text and marketing-page messaging.

## Resolve Context

If the request does not supply enough context, ask for the screen/flow, user goal and emotional state, audience, voice, constraints, surrounding copy, and what happens after the action. Name controls by what users recognize and control, not system implementation.

## Resolve Product Guidelines

Before deciding anything, look for the product's interface guidelines: `docs/design/README.md`, or a location named in `AGENTS.md` or `CLAUDE.md`. Read its page map, then only the pages this task needs.

- **Precedence:** Requirement (Must / Must not) > Confirmed rule > Inferred rule (follow it and flag it as unconfirmed) > this skill's guidance. A product Default never overrides a Requirement, whether the Requirement comes from the guidelines or from this skill.
- **Cite** the rule ID for every decision or finding a rule drives.
- **Exceptions:** a case covered by a live entry in the exceptions register (`governance.md`) is not a violation.
- **Gaps:** where the guidelines are silent or a rule is Open, use this skill's guidance and list the decision as a design-system `--extend` candidate.

If no guidelines exist, use this skill's guidance alone.

## Core Principles

1. Clear: specific beats clever; remove jargon and ambiguity.
2. Concise: keep every word that carries needed meaning, not fewer words at any cost.
3. Consistent: one concept and action keep one stable name across labels, errors, confirmations, and help.
4. Useful: say what happened, what it means, and what the user can do.
5. Human: active voice, sentence case, and a register appropriate to the user's situation.

A label labels; an example demonstrates. Do not make one string perform two jobs. Write from the user's side of the screen: "Manage notifications," not "Configure webhooks."

## Copy Patterns

### Product UI CTAs

Use second-person-implied, verb-first labels that name the outcome: "Start free trial", "Save changes", "Download report". Avoid `Submit`, `OK`, and unstable labels. This is the product-interface rule.

### Errors

Use **what happened + why (when known) + how to fix it**. Do not blame the user or invent a cause. Preserve input. After failed form submission, move focus to an error summary, link each item to its field, and repeat field-error wording verbatim.

### Empty States

- First use: explain value and offer the first meaningful action.
- User-cleared: confirm the state and offer a next step.
- No results: echo query/filter context and offer broaden/clear actions.
- Error/unavailable: explain and offer recovery.

Never say "No records" while data is loading.

### Confirmation and Consequences

Name the action and object: "Delete 3 files?" State the consequence and use action labels such as "Delete files" / "Keep files". Prefer undo when safely reversible.

### Loading, Success, and Help

Set honest expectations without fake precision. Confirm consequential completion and distinguish queued/syncing from saved. Tooltips add necessary context; they do not restate obvious labels.

## Service Patterns

These follow the GOV.UK Design System content patterns:

- Check answers: summarize consequential inputs in a scannable review step and let users change each section before submission.
- Confirmation page: state completion, reference number when useful, next steps, timing, and contact/saveable record.
- Service problem: use plain language, say what happened to submitted data, preserve answers where possible, and offer a realistic recovery/contact route.

## Stress Cases

For crisis, grief, health, money, safety, or high anxiety, be neutral, direct, and calm. Avoid forced cheer, jokes, blame, and decorative empathy. Read the copy aloud and ask: "What would a thoughtful human do now?" Include the practical next step.

## Localization and Internationalization

- Pseudo-localize in CI to expose truncation, hardcoded text, and concatenation.
- Budget roughly 30–50% expansion for languages such as German and Finnish; design for actual strings rather than truncating meaning.
- RTL is a whole-interface concern—not text alone. Mirror layout, order, motion, and directional icons only when their semantics follow reading direction; do not mirror numbers, logos, media controls, clocks, direction-invariant icons, or data graphics when reversal would change meaning.
- Use locale-aware dates, numbers, currency, Unicode, and plural rules. Never build sentences by concatenating fragments.
- Separate world-readiness checks from professional linguistic and cultural review.

## Landing and Marketing Copy

Use [landing-page copy](references/landing-page-copy.md) for headline formulas, PAS/AIDA/StoryBrand/JTBD, benefit/feature balance, objections, and section templates. Marketing CTA tests may favor first-person ownership such as "Start My Free Trial"; use that only for landing/marketing experiments. Product UI remains verb-first with implied second person. State this context rule once—do not mix voices within one journey.

## Output

```markdown
## UX Copy: [Context]
### Recommended Copy
**[Element]:** [copy]

### Alternatives
| Option | Copy | Tone | Best for |
|---|---|---|---|
| A | [copy] | [tone] | [condition] |
| B | [copy] | [tone] | [condition] |
| C | [copy] | [tone] | [condition] |

### Rationale
[User state, clarity, action/outcome, and evidence]

### Localization Notes
[Expansion, variables/plurals, RTL, idioms, and translator context]
```

## Common Requests

- CTAs and navigation labels
- Errors, validation, and service failures
- Empty, loading, queued, and success states
- Confirmation dialogs and destructive actions
- Onboarding and progressive disclosure
- Tooltips and contextual help
- Landing-page headlines, value propositions, objections, and section copy

## If Connectors Available

- Knowledge base: retrieve approved voice, terminology, and content patterns.
- Design tool: inspect the full flow, hierarchy, character constraints, and neighboring states.
- Feedback/analytics: identify user language and verify where confusion or abandonment occurs.

## Tips

- Produce three meaningfully different alternatives, not synonyms.
- Keep action names stable from button through confirmation.
- Treat placeholders and character counts as constraints, not excuses for ambiguity.
