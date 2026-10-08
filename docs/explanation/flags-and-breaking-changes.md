# Flags and Breaking Changes

## Why flags select actions

Before 0.7.0, a bare word after the skill name selected an action: `layout review`, `design-review audit`, `design-system extend`. Version 0.7.0 replaced these with flags: `layout --review`, `design-review --audit`, `design-system --extend`. Bare action words no longer select anything.

A flag can appear anywhere in the request. Everything that is not a flag is the focus, which narrows the action.

Flags are plain text, so they need no support from the runtime. They work the same way whether a skill is invoked with `/web-designer:` in Claude Code, `$web-designer:` in Codex, or by description matching in claude.ai. This fits the rule that one set of skill files must work in all three (see [Self-contained skills](self-contained-skills.md)).

Plain language still works. "Is this accessible?" selects the audit without a flag. When the action is chosen that way, the response names the action in its first line, so the user can see which action ran. One action runs per request. `design-system` asks which to run if it sees two flags, and lists the valid flags if it sees an unknown one.

The structural check enforces the change. It rejects README examples that use bare action words, requires a flag example for each non-default action, and rejects "audit mode"-style wording in the skills and README. The check describes actions as flags, never as modes.

## A history of consolidation

The plugin has been narrowed and reorganised several times. Each breaking release records a rename map in `README.md` so that existing users can translate old invocations:

| Version | Change |
|---|---|
| 0.4.0 | Removed duplicate `commands/` entries. Merged and renamed skills into `critique`, `accessibility`, `design-system`, `research-synthesis`, `ux-copy`, `frontend-design`. Removed research planning |
| 0.5.0 | Added Codex support (`.codex-plugin/`, `.agents/plugins/`) |
| 0.6.0 | Added `layout`. Merged `critique` and `accessibility` into `design-review`. Moved landing-page structure, spacing, grid, and breakpoint guidance into `layout` |
| 0.7.0 | Flags select actions. `design-system` default became an interview that writes `docs/design/`, and handoff became `--handoff`. Severity became Critical / Major / Minor in every skill, replacing High / Medium / Low / Cosmetic |

Each step left one skill responsible for each concern. After the 0.6.0 merge, `design-review` covers both critique and the WCAG audit: its description scopes it to "evaluating what exists". After 0.7.0, the critique, the WCAG audit, and the design-system audit all use the same severity table.

The rename maps sit in the user-facing README, not only in commit history.
