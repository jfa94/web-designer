# Install the Plugin

## Claude Code

1. Add the marketplace:

   ```bash
   claude plugin marketplace add jfa94/web-designer
   ```

2. Install the plugin:

   ```bash
   claude plugin install web-designer@javier-plugins
   ```

3. Start a new session. The skills are available as `/web-designer:<skill>`.

To use a local checkout without installing it, run `claude --plugin-dir /path/to/web-designer-plugin`.

## Codex

1. Add the marketplace:

   ```bash
   codex plugin marketplace add jfa94/web-designer
   ```

2. Install the plugin:

   ```bash
   codex plugin add web-designer@javier-plugins
   ```

3. Start a new session. The skills are available as `$web-designer:<skill>`.

## claude.ai

Requires a paid plan.

1. Open **Customize → Plugins**.
2. Add the marketplace `jfa94/web-designer`.
3. Install `web-designer`.

On claude.ai, skills run when a request matches their description.

## Point a repository at its guidelines

After `design-system` has written guidelines in a repository, it offers to add an agent pointer line to `AGENTS.md` or `CLAUDE.md`. Accept the offer so that agents read `docs/design/README.md` before any UI work. The exact line is in [Product guidelines format](../reference/product-guidelines-format.md#agent-pointer-line).
