# Add a Skill

This guide adds a seventh skill. Before you start, read [Skill authoring constraints](../reference/skill-authoring-constraints.md).

1. Create `skills/<name>/SKILL.md`. Its frontmatter must contain only `name` (equal to the directory name), `description`, and `argument-hint`:

   ```markdown
   ---
   name: <name>
   description: <what it does>. Trigger with "<phrase>", "<phrase>", .... Use for <scope>; use <other-skill> for <neighbouring concern>.
   argument-hint: "[--flag] [what the user supplies]"
   ---
   ```

   Keep the description to 1024 characters or fewer, with no `<` or `>`. Quote the hint, list every flag the skill defines, and avoid `<` and `>`; Claude Code shows it as autocomplete text after the command. Write it in the existing style: what the skill does, its trigger phrases, then which other skill handles each neighbouring concern.

2. Write the body without naming a runtime. Do not use `Claude`, `/web-designer:`, or `$ARGUMENTS`. Refer to other skills by name in prose ("use the layout skill").

3. If the skill has more than one action, select them with flags. Add a "Choose the Action" section modelled on `skills/layout/SKILL.md` or `skills/design-system/SKILL.md`. Do not describe actions as "modes".

4. If the skill makes design decisions for a product, copy the whole `## Resolve Product Guidelines` section from `skills/layout/SKILL.md` without changing it. To have the structural check enforce the copy, add the skill name to the `for skill in design-review frontend-design ux-copy` loop in `tests/plugin-compatibility.sh`.

5. If the skill rates findings, copy the severity table from `skills/design-review/SKILL.md` exactly. To enforce the copy, add the file to the `for file in ...` loop that compares severity tables in `tests/plugin-compatibility.sh`.

6. Put long material in `skills/<name>/references/*.md`. Link each file from `SKILL.md` with a relative path, and say when to read it. Never link outside the skill directory.

7. Update the skill count everywhere it appears:
   - `[[ "$skill_count" -eq 6 ]]` in `tests/plugin-compatibility.sh`
   - `description` in `.claude-plugin/plugin.json` and `.codex-plugin/plugin.json` (the two must stay identical)
   - `plugins[0].description` in `.claude-plugin/marketplace.json` and `interface.longDescription` in `.codex-plugin/plugin.json`
   - The intro, Skills table, Routing Guide, and "all six skills" sentence in `README.md`

8. Update neighbouring skills' descriptions and bodies so they hand the new concern to the new skill.

9. Run the structural check:

   ```bash
   bash tests/plugin-compatibility.sh
   ```

10. Load the checkout with `claude --plugin-dir .` and invoke the new skill to confirm that it triggers.

11. Optionally, [add an eval case](add-an-eval-case.md) for the skill's key behaviour.

Then [change the plugin version](change-the-version.md) as a minor release.
