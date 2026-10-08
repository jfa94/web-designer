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
| `design-review` | `critique` mode: evidence-backed feedback on usability, hierarchy, consistency, and non-happy-path states. `audit` mode: WCAG 2.2 AA audits, keyboard and screen-reader review, contrast, targets, reflow, and handoff annotations |
| `design-system` | Inventory, audit, documentation, extension, governance, refactoring, tokens, and developer handoff |
| `research-synthesis` | Turning existing transcripts, survey results, usability notes, support feedback, and analytics context into themes and opportunities |
| `ux-copy` | Interface microcopy, errors, empty states, CTAs, onboarding, and landing-page messaging |
| `frontend-design` | Distinctive production frontend builds: visual design, typography, color, motion, and performance |

## Routing Guide

| Need | Skill |
|---|---|
| Plan page structure or choose an interaction pattern | `layout` |
| Review an existing design broadly | `design-review` (critique) |
| Audit WCAG conformance | `design-review` (audit) |
| Audit or extend reusable patterns | `design-system` |
| Turn collected evidence into findings | `research-synthesis` |
| Write the words | `ux-copy` |
| Build the interface | `frontend-design` |

For a full landing page, use `layout` for structure, `ux-copy` for messaging, `frontend-design` for implementation, and `design-review` for assembled-flow feedback and the conformance audit.

## Example Invocations

Claude Code:

```text
/web-designer:layout should editing an event's schedule be a modal or a page?
/web-designer:design-review the checkout flow, focus on mobile
/web-designer:design-system audit
/web-designer:ux-copy error message for a declined payment
/web-designer:design-review audit https://example.com/checkout
/web-designer:research-synthesis ./research/checkout-notes.md
/web-designer:frontend-design build the approved landing-page plan
```

Codex:

```text
$web-designer:layout should editing an event's schedule be a modal or a page?
$web-designer:design-review the checkout flow, focus on mobile
$web-designer:design-system audit
$web-designer:ux-copy error message for a declined payment
$web-designer:design-review audit https://example.com/checkout
$web-designer:research-synthesis ./research/checkout-notes.md
$web-designer:frontend-design build the approved landing-page plan
```

## 0.6.0 Rename Map

Version 0.6.0 adds `layout` and merges two review skills. Old names no longer exist.

| Before | Now |
|---|---|
| `critique` | `design-review` (critique mode, the default) |
| `accessibility` | `design-review` (audit mode) |
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
