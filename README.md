# Web Designer Plugin

A focused web-design toolkit with six skills for layout and interaction structure, design review and accessibility audits, design systems, research synthesis, UX copy, and production-grade frontend design.

## Installation

### Claude Code

```bash
claude plugin marketplace add jfa94/web-designer
claude plugin install web-designer@javier-plugins
```

To try a local checkout without installing it:

```bash
claude --plugin-dir /path/to/web-designer-plugin
```

### Codex

```bash
codex plugin marketplace add jfa94/web-designer
codex plugin add web-designer@javier-plugins
```

### claude.ai

On a paid plan, open **Customize → Plugins**, add the marketplace `jfa94/web-designer`, and install `web-designer`. Skills trigger when a request matches their description.

Start a new Claude Code or Codex session after installing so all six skills are available.

## Skills

Claude Code exposes skills as `/web-designer:<name>`; Codex exposes them as `$web-designer:<name>`. Both runtimes can also invoke a skill automatically when the request matches its description.

| Skill | Use it for |
|---|---|
| `layout` | Page structure, wireframes, page archetypes, grids and spacing, responsive behavior, choosing surfaces and components (modal, drawer, page, table, cards), state and saving contracts, and landing-page structure |
| `design-review` | Critique (default): evidence-backed feedback on usability, hierarchy, consistency, and non-happy-path states. `--audit`: WCAG 2.2 AA audits, keyboard and screen-reader review, contrast, targets, reflow, and handoff annotations |
| `design-system` | Default: interview to write and maintain the product's interface guidelines in `docs/design/`. `--audit`: drift against the guidelines. `--extend`: add a pattern or component. `--handoff`: implementation specs that cite the guidelines |
| `research-synthesis` | Turning existing transcripts, survey results, usability notes, support feedback, and analytics context into themes and opportunities |
| `ux-copy` | Interface microcopy, errors, empty states, CTAs, onboarding, and landing-page messaging |
| `frontend-design` | Distinctive production frontend builds: visual design, typography, color, motion, and performance |

## Flags

Some skills have more than one action. With no flag, a skill runs its default action; a flag anywhere in the request selects another. Flags are plain text in the request, so they work the same in Claude Code, Codex, and claude.ai. Run one action per request. A clear plain-language request ("is this accessible?", "audit our design system") also selects the action, and the response names it in its first line.

| Skill | Default | Flags |
|---|---|---|
| `layout` | Plan a layout spec | `--review`: consistency review across equivalent tasks |
| `design-review` | Critique | `--audit`: WCAG 2.2 AA audit |
| `design-system` | Build the interface guidelines | `--audit`, `--extend`, `--handoff` |

## Product Guidelines

`design-system` writes the product's interface guidelines to `docs/design/`: principles, foundations, page and task patterns, components, and governance, with a README page map for agents. Every rule has an ID (`BTN-003`), a strength (Must or Should), and a status (Confirmed, Inferred, or Open). `layout`, `design-review`, `ux-copy`, and `frontend-design` read the guidelines first, follow them over their own defaults, and cite rule IDs.

## Routing Guide

| Need | Skill |
|---|---|
| Plan page structure or choose an interaction pattern | `layout` |
| Review an existing design broadly | `design-review` |
| Audit WCAG conformance | `design-review --audit` |
| Write the product's interface guidelines | `design-system` |
| Audit or extend the guidelines, or hand off to engineering | `design-system --audit`, `--extend`, `--handoff` |
| Turn collected evidence into findings | `research-synthesis` |
| Write the words | `ux-copy` |
| Build the interface | `frontend-design` |

For a full landing page, use `layout` for structure, `ux-copy` for messaging, `frontend-design` for implementation, and `design-review` for assembled-flow feedback and the conformance audit.

## Example Invocations

Claude Code:

```text
/web-designer:layout should editing an event's schedule be a modal or a page?
/web-designer:layout --review the create flows across the admin area
/web-designer:design-review the checkout flow, focus on mobile
/web-designer:design-review --audit https://example.com/checkout
/web-designer:design-system
/web-designer:design-system --audit colour
/web-designer:design-system --extend date-range picker
/web-designer:design-system --handoff the bulk-invite flow
/web-designer:ux-copy error message for a declined payment
/web-designer:research-synthesis ./research/checkout-notes.md
/web-designer:frontend-design build the approved landing-page plan
```

Codex:

```text
$web-designer:layout should editing an event's schedule be a modal or a page?
$web-designer:layout --review the create flows across the admin area
$web-designer:design-review the checkout flow, focus on mobile
$web-designer:design-review --audit https://example.com/checkout
$web-designer:design-system
$web-designer:design-system --audit colour
$web-designer:design-system --extend date-range picker
$web-designer:design-system --handoff the bulk-invite flow
$web-designer:ux-copy error message for a declined payment
$web-designer:research-synthesis ./research/checkout-notes.md
$web-designer:frontend-design build the approved landing-page plan
```

## 0.7.0 Rename Map

Version 0.7.0 selects actions with flags. Bare action words no longer select an action.

| Before | Now |
|---|---|
| `layout plan` | `layout` |
| `layout review` | `layout --review` |
| `design-review critique` | `design-review` |
| `design-review audit` | `design-review --audit` |
| `design-system document` | `design-system` (now an interview that writes `docs/design/`) |
| `design-system audit` | `design-system --audit` |
| `design-system extend` | `design-system --extend` |
| Handoff in `design-system` | `design-system --handoff` |
| Severity High / Medium / Low / Cosmetic | Critical / Major / Minor, in every skill |

## 0.6.0 Rename Map

Version 0.6.0 adds `layout` and merges two review skills. Old names no longer exist.

| Before | Now |
|---|---|
| `critique` | `design-review` (critique, the default) |
| `accessibility` | `design-review --audit` |
| Landing-page structure in `frontend-design` | `layout` |
| Spacing, grid, and breakpoint guidance in `frontend-design` and `design-system` | `layout` |

## 0.4.0 Rename Map

Version 0.4.0 is a breaking consolidation: the duplicate `commands/` entries are removed and five skills were renamed or merged. Old slash names (`/ux-writing`, `/design-handoff`, …) no longer exist; use the table below.

| Before | Now |
|---|---|
| `/critique`, `design-critique` | `critique` |
| `/accessibility`, `accessibility-review` | `accessibility` |
| `/design-system`, `design-system-management`, `design-handoff` | `design-system` |
| `/research-synthesis`, synthesis parts of `user-research` | `research-synthesis` |
| `/ux-copy`, `ux-writing`, `landing-page-copy` | `ux-copy` |
| `landing-page-design`, `frontend-design` | `frontend-design` |

Research planning, interview guides, survey design, and method selection were intentionally removed; this plugin now owns synthesis only.

## Optional Tool Integrations

The plugin bundles no MCP servers. Connected tools are used when available and relevant; every skill also works from supplied files, URLs, screenshots, or text.

| Category | Examples | Enables |
|---|---|---|
| Design and component catalog | Figma, Storybook | Inspect designs, tokens, components, properties, and states |
| Feedback | Intercom, Productboard | Ground critique and synthesis in user evidence |
| Analytics | Amplitude, Mixpanel | Quantify qualitative themes and task outcomes |
| Knowledge base | Notion | Retrieve voice, design-system, and prior-research guidance |
| Project tracker | Linear, Asana, Jira | Link findings and remediation after approval |
