# Inventory and Inference

Infer the system from what exists before asking anything. An inventory records unique treatments; an audit judges them. Count visual variants even when they share a component name: "37 button styles" is evidence, not yet a verdict.

Use read and search tools only. Run an analysis tool only if it is already installed in the repository (`node_modules/.bin`); never install or fetch one, and never launch the application.

## Source Order

1. Existing guidelines: the location found by the skill, then any other design docs, Storybook docs, or a linked knowledge base.
2. Tokens and theme: CSS custom properties, theme objects, Tailwind config, token JSON.
3. Components: the shared component directory, with each component's props and variants.
4. Stories: which states and combinations each story covers.
5. Usage: imports and call sites of each component and variant, grouped by purpose.
6. Hardcoded values: colours, sizes, radii, shadows and durations that bypass tokens.
7. Breakpoints: media and container queries, and the values they use.

For a large repository, inventory one area per run (the focus, or the area the gap map ranks first) and say which areas remain.

## Signals

| Signal | How to read it | What it suggests |
|---|---|---|
| Purpose clusters | Group call sites by what the element does (destructive action, navigation, warning), not by component name | Candidate rules and competing treatments |
| Stories vs states | Compare story coverage with the state model (loading, error, disabled, read-only …) | Missing states; a State model field to ask about |
| Boolean props | Count boolean props and props that combine | Prop bloat; a Variants rule or a split |
| Breakpoints | Compare breakpoint values across files | Device-named or inconsistent breakpoints |
| ARIA usage | `role`, `aria-*`, and native elements per component | Accessibility field content and likely defects |
| Hardcoded values | Literals where a token exists, or repeated literals with no token | Missing token or local override |
| Labels | Button and link text for equivalent actions | Terminology drift ("Remove", "Delete", "Archive") |

Never invent component properties. Quote them from source, a manifest or stories.

## Codify What You Find

For each purpose cluster:

| Evidence | Write |
|---|---|
| At least 3 uses, and at least 75% of same-purpose uses alike | An **Inferred** rule, with counts and paths in Evidence |
| Weaker majority, or two or more competing treatments | An **Open** item, with each treatment's count and paths |
| A single use | Nothing; mention it in the gap map if relevant |
| A majority that breaks a Requirement | An **Open** item flagged as a Requirement conflict; never an Inferred rule |

Write the skeleton (README with page map, plus each page that has at least one rule or Open item) before the first interview question. Inferred rules are followed by consuming work but flagged as unconfirmed until an owner confirms them.

## Audit Comparison

For `--audit`, compare the inventory with the written rules and the exceptions register:

| Class | When |
|---|---|
| Defect | Violates a Requirement or Confirmed rule with no live exception, or relies on an expired exception |
| Sanctioned exception | A live register entry covers it |
| Drift: confirm or drop | Violates an Inferred rule |
| Rule gap | A recurring choice no rule covers, or competing treatments |

Name the root cause for each finding:
- **local override**: the system supports it; this call site departs;
- **missing token**: no token expresses the value's role;
- **missing variant**: a recurring need the component cannot express;
- **undocumented pattern**: consistent practice with no rule;
- **stale docs**: the rule no longer matches a deliberate change.

Fix a local override locally. Fix the other causes in the system.

Report adoption (who uses the system), compliance (following internal rules) and conformance (meeting an external standard) separately.
