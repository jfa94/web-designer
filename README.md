# Web Designer Plugin

A focused web-design toolkit with six skills for accessibility, critique, design systems, research synthesis, UX copy, and production-grade frontend design.

## Installation

```bash
claude plugin marketplace add jfa94/web-designer
claude plugin install web-designer@javier-plugins
```

To try a local checkout:

```bash
claude --plugin-dir /path/to/web-designer-plugin
```

## Skills

Skills appear in the slash menu as `/web-designer:<name>` and Claude can invoke them automatically when the request matches their description.

| Skill | Use it for |
|---|---|
| `accessibility` | WCAG 2.2 AA audits, keyboard and screen-reader review, contrast, targets, reflow, and handoff annotations |
| `critique` | Evidence-backed design feedback across usability, hierarchy, consistency, accessibility risk, and non-happy-path states |
| `design-system` | Inventory, audit, documentation, extension, governance, refactoring, tokens, and developer handoff |
| `research-synthesis` | Turning existing transcripts, survey results, usability notes, support feedback, and analytics context into themes and opportunities |
| `ux-copy` | Interface microcopy, errors, empty states, CTAs, onboarding, and landing-page messaging |
| `frontend-design` | Distinctive production frontend builds plus landing-page structure, visual design, responsiveness, and performance |

## Routing Guide

| Need | Skill |
|---|---|
| Audit WCAG conformance | `accessibility` |
| Review an existing design broadly | `critique` |
| Audit or extend reusable patterns | `design-system` |
| Turn collected evidence into findings | `research-synthesis` |
| Write the words | `ux-copy` |
| Plan the layout or build the interface | `frontend-design` |

For a full landing page, use `frontend-design` for structure and implementation, `ux-copy` for messaging, `critique` for assembled-flow feedback, and `accessibility` for the conformance audit.

## Example Invocations

```text
/web-designer:critique the checkout flow, focus on mobile
/web-designer:design-system audit
/web-designer:ux-copy error message for a declined payment
/web-designer:accessibility https://example.com/checkout
/web-designer:research-synthesis ./research/checkout-notes.md
/web-designer:frontend-design build the approved landing-page plan
```

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
