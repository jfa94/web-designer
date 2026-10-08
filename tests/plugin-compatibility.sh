#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CLAUDE_MANIFEST="$ROOT/.claude-plugin/plugin.json"
CLAUDE_MARKETPLACE="$ROOT/.claude-plugin/marketplace.json"
CODEX_MANIFEST="$ROOT/.codex-plugin/plugin.json"
CODEX_MARKETPLACE="$ROOT/.agents/plugins/marketplace.json"

for file in "$CLAUDE_MANIFEST" "$CLAUDE_MARKETPLACE" "$CODEX_MANIFEST" "$CODEX_MARKETPLACE"; do
  jq empty "$file"
done

claude_name=$(jq -r '.name' "$CLAUDE_MANIFEST")
claude_version=$(jq -r '.version' "$CLAUDE_MANIFEST")
claude_description=$(jq -r '.description' "$CLAUDE_MANIFEST")

[[ "$claude_name" == "web-designer" ]]
[[ "$claude_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
[[ $(jq -r '.name' "$CODEX_MANIFEST") == "$claude_name" ]]
[[ $(jq -r '.version' "$CODEX_MANIFEST") == "$claude_version" ]]
[[ $(jq -r '.description' "$CODEX_MANIFEST") == "$claude_description" ]]
[[ $(jq -r '.plugins[0].name' "$CLAUDE_MARKETPLACE") == "$claude_name" ]]
[[ $(jq -r '.plugins[0].version' "$CLAUDE_MARKETPLACE") == "$claude_version" ]]
[[ $(jq -r '.skills' "$CODEX_MANIFEST") == "./skills/" ]]
[[ $(jq '.interface.defaultPrompt | length == 3 and all(length <= 128)' "$CODEX_MANIFEST") == "true" ]]

jq -e '
  .name == "javier-plugins" and
  .interface.displayName == "Javier\u0027s Plugins" and
  .plugins == [{
    "name": "web-designer",
    "source": {"source": "local", "path": "./"},
    "policy": {"installation": "AVAILABLE", "authentication": "ON_INSTALL"},
    "category": "Productivity"
  }]
' "$CODEX_MARKETPLACE" >/dev/null

skill_count=0
for skill_file in "$ROOT"/skills/*/SKILL.md; do
  skill_dir=$(basename "$(dirname "$skill_file")")
  grep -Fxq "name: $skill_dir" "$skill_file"

  # Keep frontmatter narrow for claude.ai; argument-hint is the one extra key (Claude Code autocomplete).
  frontmatter=$(awk 'NR == 1 && $0 == "---" { next } $0 == "---" { exit } { print }' "$skill_file")
  if grep -vqE '^(name|description|argument-hint): ' <<<"$frontmatter"; then
    echo "$skill_file: frontmatter keys must be name, description, and argument-hint only" >&2
    exit 1
  fi
  description=$(sed -n 's/^description: //p' <<<"$frontmatter")
  if (( ${#description} > 1024 )) || [[ "$description" == *[\<\>]* ]]; then
    echo "$skill_file: description must be <=1024 chars without angle brackets" >&2
    exit 1
  fi
  hint=$(sed -n 's/^argument-hint: //p' <<<"$frontmatter")
  if [[ ! "$hint" =~ ^\"\[.+\]\"$ || "$hint" == *[\<\>]* ]]; then
    echo "$skill_file: argument-hint must be a quoted [bracketed] string without angle brackets" >&2
    exit 1
  fi
  # Hints must advertise the flags each skill defines.
  case "$skill_dir" in
    layout) required_flags="--review" ;;
    design-review) required_flags="--audit" ;;
    design-system) required_flags="--audit --extend --handoff" ;;
    *) required_flags="" ;;
  esac
  for flag in $required_flags; do
    if [[ "$hint" != *"$flag"* ]]; then
      echo "$skill_file: argument-hint lacks $flag" >&2
      exit 1
    fi
  done
  skill_count=$((skill_count + 1))
done
[[ "$skill_count" -eq 6 ]]

# Skills are installed in isolation, so links must stay inside their own skill.
while IFS= read -r md_file; do
  while IFS= read -r link; do
    if [[ "$link" == ../* || ! -f "$(dirname "$md_file")/$link" ]]; then
      echo "$md_file: broken or cross-skill link: $link" >&2
      exit 1
    fi
  done < <(grep -oE '\]\([^)#:]+\.md\)' "$md_file" | sed -E 's/^\]\(//; s/\)$//' || true)
done < <(find "$ROOT/skills" -name '*.md')

if grep -rEn '/web-designer:|\$ARGUMENTS|Claude' "$ROOT/skills"; then
  echo "Shared skills contain runtime-specific instructions" >&2
  exit 1
fi

# Since 0.7.0, flags select actions; a bare action word after a skill name is old syntax.
if grep -nE '^[/$]web-designer:[a-z-]+ (plan|review|critique|audit|document|extend|handoff)( |$)' "$ROOT/README.md"; then
  echo "README examples must select actions with flags" >&2
  exit 1
fi
for example in 'layout --review' 'design-review --audit' 'design-system --audit' 'design-system --extend' 'design-system --handoff'; do
  if ! grep -Fq "web-designer:$example" "$ROOT/README.md"; then
    echo "README lacks a web-designer:$example example" >&2
    exit 1
  fi
done
if grep -rniE '(^|[^a-z-])(plan|review|critique|audit|document|extend|handoff)`? modes?([^a-z]|$)|^#+ modes?$' "$ROOT/skills" "$ROOT/README.md"; then
  echo "Leftover mode wording; actions are flags" >&2
  exit 1
fi

# Skills can't share files, so the severity scale and guidelines block are copied verbatim.
severity_table() { awk '/^[|] Severity [|] Meaning [|]$/ { f = 1 } f && !/^[|]/ { exit } f' "$1"; }
expected=$(severity_table "$ROOT/skills/design-review/SKILL.md")
if [[ $(grep -c . <<<"$expected") -ne 5 ]]; then
  echo "design-review severity table must have exactly three levels" >&2
  exit 1
fi
for file in skills/design-review/references/audit-mode.md skills/design-system/SKILL.md; do
  if [[ "$(severity_table "$ROOT/$file")" != "$expected" ]]; then
    echo "$file: severity table differs from design-review's" >&2
    exit 1
  fi
done

guidelines_block() { awk '$0 == "## Resolve Product Guidelines" { f = 1; print; next } f && /^## / { exit } f' "$1"; }
expected=$(guidelines_block "$ROOT/skills/layout/SKILL.md")
if [[ -z "$expected" ]]; then
  echo "skills/layout/SKILL.md lacks the Resolve Product Guidelines block" >&2
  exit 1
fi
for skill in design-review frontend-design ux-copy; do
  if [[ "$(guidelines_block "$ROOT/skills/$skill/SKILL.md")" != "$expected" ]]; then
    echo "skills/$skill/SKILL.md: Resolve Product Guidelines block differs from layout's" >&2
    exit 1
  fi
done

echo "OK"
