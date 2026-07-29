# Web Designer Plugin

A comprehensive web design toolkit that combines design critique, UX writing, accessibility audits, design system management, research synthesis, and developer handoff with specialised landing page copywriting, layout design, and production-grade frontend build skills.

## Installation

```bash
claude plugin marketplace add github:jfa94/web-designer
claude plugin install web-designer@javier-plugins
```

To try it without installing, point Claude Code at a local checkout:

```bash
claude --plugin-dir /path/to/web-designer-plugin
```

## Commands

Explicit workflows you invoke with a slash command:

| Command | Description |
|---|---|
| `/critique` | Get structured design feedback — usability, visual hierarchy, accessibility, and consistency |
| `/design-system` | Audit, document, or extend your design system — components, tokens, patterns |
| `/ux-copy` | Write or review UX copy — microcopy, error messages, empty states, onboarding flows |
| `/accessibility` | Run an accessibility audit — WCAG compliance, colour contrast, screen reader, and keyboard navigation |
| `/research-synthesis` | Synthesise user research — interviews, surveys, usability tests into actionable insights |

## Skills

Domain knowledge Claude uses automatically when relevant. Each is also invocable directly as `/web-designer:<name>`:

| Skill | Description |
|---|---|
| `design-critique` | Evaluate designs for usability, visual hierarchy, consistency, and adherence to design principles |
| `design-system-management` | Manage design tokens, component libraries, and pattern documentation |
| `ux-writing` | Write effective microcopy — clear, concise, consistent, and brand-aligned |
| `accessibility-review` | Audit designs and code for WCAG 2.1 AA compliance |
| `user-research` | Plan, conduct, and synthesise user research — interviews, surveys, usability testing |
| `design-handoff` | Create comprehensive developer handoff documentation from designs |
| `landing-page-copy` | Write high-converting landing page copy using PAS, AIDA, StoryBrand, JTBD, and other frameworks |
| `landing-page-design` | Design landing page layouts optimised for conversion — hero sections, CTA placement, social proof strategy |
| `frontend-design` | Build distinctive, production-grade frontend code (HTML/CSS/JS, React, Vue) with a bold, context-specific aesthetic — no generic AI design |

### When to use which skill

| Task | Skill |
|------|-------|
| Decide how to structure a landing page | `landing-page-design` |
| Write or improve page copy | `landing-page-copy` |
| Full landing page (layout + copy) | Use both `landing-page-design` and `landing-page-copy` |
| Build the actual coded page, component, or app | `frontend-design` (after planning with the other two) |
| Review an existing design | `design-critique`, `accessibility-review` |
| Spec a design for engineering | `design-handoff` |

## Example Workflows

### Writing Landing Page Copy

```
/landing-page-copy My SaaS project management tool for freelancers
```

Get section-by-section copy — hero headline, subheadline, problem statement, features, testimonials, and CTAs — all optimised for conversion.

### Full Landing Page Workflow

1. `/landing-page-design` — plan the page structure and layout
2. `/landing-page-copy` — write the copy for each section
3. `/frontend-design` — build the coded page from the plan and copy
4. `/critique` — review the assembled page for usability and consistency
5. `/accessibility` — audit for WCAG compliance

### Getting Design Feedback

```
/critique the checkout flow, focus on mobile
```

Share a Figma link, screenshot, or describe your design. Get structured feedback on usability, visual hierarchy, consistency, and accessibility.

### Developer Handoff

```
/design-handoff
```

Share a Figma link and get a complete spec: measurements, design tokens, component states, interaction notes, and edge cases.

## Optional Tool Integrations

This plugin bundles no MCP servers — connect whichever tools you already use at user scope and the commands will take advantage of them automatically. Everything works without them.

| Category | Examples | What It Enables |
|---|---|---|
| **Design tool** | Figma | Pull designs, inspect components, access design tokens |
| **User feedback** | Intercom, Productboard | Raw feedback, feature requests, NPS data |
| **Project tracker** | Linear, Asana, Jira | Link designs to tickets, track implementation |
| **Knowledge base** | Notion | Brand guidelines, design principles, research repository |
| **Product analytics** | Amplitude, Mixpanel | Usage data for research synthesis and design decisions |
