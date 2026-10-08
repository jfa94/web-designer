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

  # claude.ai skill uploads accept a narrower frontmatter than Claude Code.
  frontmatter=$(awk 'NR == 1 && $0 == "---" { next } $0 == "---" { exit } { print }' "$skill_file")
  if grep -vqE '^(name|description): ' <<<"$frontmatter"; then
    echo "$skill_file: frontmatter keys must be name and description only" >&2
    exit 1
  fi
  description=$(sed -n 's/^description: //p' <<<"$frontmatter")
  if (( ${#description} > 1024 )) || [[ "$description" == *[\<\>]* ]]; then
    echo "$skill_file: description must be <=1024 chars without angle brackets" >&2
    exit 1
  fi
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

echo "OK"
