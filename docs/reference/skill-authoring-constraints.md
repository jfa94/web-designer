# Skill Authoring Constraints

Every change to `skills/` or `README.md` must satisfy these constraints. `tests/plugin-compatibility.sh` enforces each one, and prints `OK` when all hold. On failure it exits non-zero and, for most rules, names the file and the rule.

For the reasons behind these constraints, see [Self-contained skills](../explanation/self-contained-skills.md).

## Skill set

| Constraint | Detail |
|---|---|
| Skill count | Exactly 6 `skills/*/SKILL.md` files |
| Name | `SKILL.md` contains the exact line `name: <directory name>` |

## Frontmatter

| Constraint | Detail |
|---|---|
| Allowed keys | Only `name:` and `description:` lines, between the opening `---` and the closing `---` |
| Description length | At most 1024 characters |
| Description characters | No `<` or `>` |

Error: `<file>: frontmatter keys must be name and description only` or `<file>: description must be <=1024 chars without angle brackets`.

## Links

| Constraint | Detail |
|---|---|
| Scope | Every markdown file under `skills/` |
| Pattern checked | Links of the form `](path.md)`, where the path contains no `#` or `:` |
| Rule | The target must not start with `../` and must exist relative to the linking file |

Links therefore stay inside their own skill directory. Links with an anchor (`file.md#section`) or a scheme are not checked.

Error: `<file>: broken or cross-skill link: <link>`.

## Runtime-neutral wording

No file under `skills/` may contain any of these strings:

| Forbidden string | Reason |
|---|---|
| `/web-designer:` | Claude Code invocation syntax |
| `$ARGUMENTS` | Runtime-specific argument placeholder |
| `Claude` | Runtime name |

Error: `Shared skills contain runtime-specific instructions`.

## Flag syntax

| Constraint | Scope | Detail |
|---|---|---|
| No bare action words in examples | `README.md` | No line may start with `/web-designer:<skill>` or `$web-designer:<skill>` followed by `plan`, `review`, `critique`, `audit`, `document`, `extend`, or `handoff` as a bare word |
| Required flag examples | `README.md` | Must contain `web-designer:layout --review`, `web-designer:design-review --audit`, `web-designer:design-system --audit`, `web-designer:design-system --extend`, `web-designer:design-system --handoff` |
| No "mode" wording | `skills/`, `README.md` | Case-insensitive: none of `plan`, `review`, `critique`, `audit`, `document`, `extend`, `handoff` followed by a space (optionally after a backtick) and `mode` or `modes`. No heading that is only `Mode` or `Modes` |

Hyphenated names such as `audit-mode.md` do not match the "mode" rule.

Errors: `README examples must select actions with flags`, `README lacks a web-designer:<example> example`, `Leftover mode wording; actions are flags`.

## Copied blocks

| Block | Extracted as | Source | Must match in |
|---|---|---|---|
| Severity table | From the line `\| Severity \| Meaning \|` to the last consecutive table row | `skills/design-review/SKILL.md` | `skills/design-review/references/audit-mode.md`, `skills/design-system/SKILL.md` |
| Resolve Product Guidelines | From the line `## Resolve Product Guidelines` up to the next `## ` heading | `skills/layout/SKILL.md` | `skills/design-review/SKILL.md`, `skills/frontend-design/SKILL.md`, `skills/ux-copy/SKILL.md` |

| Constraint | Detail |
|---|---|
| Severity levels | The source table has exactly 5 lines: header, separator, and three levels |
| Guidelines block present | `skills/layout/SKILL.md` must contain the block |
| Byte-identical copies | Each copy equals its source exactly |

Errors: `design-review severity table must have exactly three levels`, `<file>: severity table differs from design-review's`, `skills/layout/SKILL.md lacks the Resolve Product Guidelines block`, `skills/<skill>/SKILL.md: Resolve Product Guidelines block differs from layout's`.

## Manifests

The script also validates the manifests. See [Manifests](manifests.md). Manifest failures exit non-zero without a dedicated message, apart from the `jq` output.
