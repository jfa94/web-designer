<!-- last-documented: 9b4335a1c735daff09227eb3a5c7501ba6270d56 -->

# Web Designer Plugin Documentation

Web Designer (`web-designer`, version 0.7.0) is a plugin of six agent skills for web design work. One set of skills ships to three runtimes: Claude Code, Codex, and claude.ai. The skills cover:

- `layout`: page structure, page archetypes, interaction surfaces, behaviour contracts, and landing-page structure.
- `design-review`: expert critique, plus a WCAG 2.2 AA audit with `--audit`.
- `design-system`: writes and maintains a product's interface guidelines, plus drift audits, extensions, and engineering handoff.
- `research-synthesis`: turns research evidence you already have into themes and opportunities.
- `ux-copy`: interface microcopy and landing-page messaging.
- `frontend-design`: distinctive, production-grade frontend builds.

## What problem it solves

General-purpose coding agents make design decisions without a consistent method. They pick a modal when a page fits better, call one designer's convention a law of usability, make up severity levels, and write copy, structure, and visuals in one pass. Each skill here gives the agent a narrow job, a workflow, an output template, and evidence rules. The routing rules between skills keep each concern with the skill that owns it.

The plugin is also built around one product artefact, the **interface guidelines**. `design-system` writes them to `docs/design/` in the repository that uses the plugin. `layout`, `design-review`, `ux-copy`, and `frontend-design` read the guidelines before deciding anything, follow them over their own generic defaults, and cite rule IDs. The product's own decisions therefore build up in its repository and take priority over the plugin's generic advice.

## Who it is for

- **Users**: designers, product engineers, and agents working on a web product. Start with the root [README](../README.md), which covers installation, the skill list, and example invocations.
- **Contributors**: people changing the skills, manifests, or eval suite in this repository. Start with [Getting started](getting-started.md).

## Design philosophy

- **Skill content only.** There is no build step, no runtime code, and no bundled MCP server. A skill is a `SKILL.md` file plus optional reference files, and the runtime loads it as-is.
- **Each skill stands alone.** Skills are installed in isolation, so they cannot share files. Content that several skills need is copied word for word, and a structural check keeps the copies identical.
- **One set of skill files for every runtime.** Skill text never names a runtime. Actions are chosen with plain-text flags (`--audit`, `--review`) that behave the same everywhere.
- **Evidence over assertion.** Findings must cite a heuristic, an observation, an objective, or a product rule ID. Severity uses one three-level scale across the plugin.
- **Product rules win.** The skills' guidance is the fallback. The product's Confirmed rules and Requirements override it.

## Contents

### Tutorial

- [Getting started](getting-started.md): load a local checkout, run the structural check, invoke a skill, and run one eval case.

### Architecture

- [Overview](architecture/overview.md): system context and containers.
- [Components](architecture/components.md): the six skills, their reference files, and how they connect through the product guidelines.
- [Deployment](architecture/deployment.md): marketplaces, install paths, and local loading.

### How-to guides

- [Install the plugin](guides/install-the-plugin.md)
- [Add a skill](guides/add-a-skill.md)
- [Change a shared block](guides/change-a-shared-block.md)
- [Change the plugin version](guides/change-the-version.md)
- [Run the eval suite](guides/run-the-evals.md)
- [Add an eval case](guides/add-an-eval-case.md)

### Reference

- [Skills](reference/skills.md): invocation, actions, flags, inputs, outputs, and reference files for each skill.
- [Product guidelines format](reference/product-guidelines-format.md): the `docs/design/` tree, rule syntax, statuses, IDs, and the exceptions register.
- [Manifests](reference/manifests.md): plugin and marketplace manifest fields for both runtimes.
- [Skill authoring constraints](reference/skill-authoring-constraints.md): structural rules that every skill and the README must satisfy.
- [Eval cases](reference/eval-cases.md): case layout, prompt frontmatter, grader types, and the fixture.

### Explanation

- [Skill boundaries](explanation/skill-boundaries.md): why there are six skills and how responsibility is divided.
- [Product guidelines model](explanation/product-guidelines-model.md): why guidelines are built by inference and interview, and how precedence works.
- [Self-contained skills](explanation/self-contained-skills.md): why content is copied rather than shared, and why skill text never names a runtime.
- [Flags and breaking changes](explanation/flags-and-breaking-changes.md): how action selection has changed between versions.

### Glossary

- [Glossary](glossary.md): ubiquitous-language scaffold, pending domain-expert input.
