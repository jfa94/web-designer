# Self-Contained Skills

## Skills are installed in isolation

A runtime may install or upload each skill on its own, with no guarantee that its sibling skills are present. A link from one skill to another skill's reference file can therefore break. This is why the structural check rejects any link that starts with `../` or points to a missing file.

The plugin follows three rules as a result:

- **Links stay inside the skill.** `layout` links to `references/foundations.md`, its own file. When `frontend-design` needs spacing guidance, it names "the layout skill's foundations reference" in prose rather than linking to it.
- **Shared content is copied, not referenced.** The severity scale and the Resolve Product Guidelines block are needed by several skills, so each skill carries its own copy. The structural check compares the copies with their source, which turns the duplication into a single source of truth: one file is canonical, and the check fails if a copy differs.
- **Ownership is stated in prose.** Instead of importing another skill's defaults, a skill names the owner (see [Skill boundaries](skill-boundaries.md)).

The trade-off is extra work when editing. Changing either shared block means editing three or four files ([Change a shared block](../guides/change-a-shared-block.md)). The alternative was a skill that works when installed with its siblings and quietly loses guidance when installed alone. The plugin accepts the extra editing to avoid that.

## One set of skill files for three runtimes

The same `skills/` directory ships to Claude Code, Codex, and claude.ai. Each runtime invokes skills differently: `/web-designer:<skill>` in Claude Code, `$web-designer:<skill>` in Codex, and automatic matching in claude.ai. If skill text described any one of these, it would be wrong in the other two. So skill files never contain `/web-designer:`, `$ARGUMENTS`, or the word `Claude`. Runtime-specific syntax lives only in `README.md` and these docs.

For the same reason, actions are chosen with plain-text flags rather than runtime features (see [Flags and breaking changes](flags-and-breaking-changes.md)). Connectors are described by category ("design tool", "knowledge base"), not by a specific MCP server, because the plugin bundles none and each user connects their own.

## The narrowest frontmatter wins

Claude Code accepts more `SKILL.md` frontmatter keys than claude.ai skill uploads do. Because one file serves both, the plugin uses only what claude.ai accepts: `name` and `description`, with the description kept to 1024 characters or fewer and free of angle brackets. Everything else, including how to select actions, goes in the skill body.
