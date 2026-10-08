# Manifests Reference

The repository has four JSON manifests. Constraints marked **enforced** are checked by `tests/plugin-compatibility.sh`.

## `.claude-plugin/plugin.json`

Claude Code plugin manifest. This is the source the other manifests are compared against.

| Field | Value | Constraint |
|---|---|---|
| `name` | `web-designer` | Enforced: must equal `web-designer` |
| `version` | `0.7.0` | Enforced: `MAJOR.MINOR.PATCH` digits only |
| `description` | Six-skill toolkit summary | Source for the Codex manifest comparison |
| `author.name` | `Javier Flores` | |
| `keywords` | `design`, `ux`, `accessibility`, `frontend`, `design-system`, `copywriting`, `layout` | |

## `.claude-plugin/marketplace.json`

Claude Code marketplace.

| Field | Value | Constraint |
|---|---|---|
| `name` | `javier-plugins` | |
| `owner.name` | `Javier Flores` | |
| `description` | Marketplace description | |
| `plugins[0].name` | `web-designer` | Enforced: equals the Claude manifest `name` |
| `plugins[0].source` | `./` | |
| `plugins[0].description` | Same text as the manifest description | Not enforced |
| `plugins[0].version` | `0.7.0` | Enforced: equals the Claude manifest `version` |

## `.codex-plugin/plugin.json`

Codex plugin manifest.

| Field | Value | Constraint |
|---|---|---|
| `name` | `web-designer` | Enforced: equals the Claude manifest |
| `version` | `0.7.0` | Enforced: equals the Claude manifest |
| `description` | Six-skill toolkit summary | Enforced: equals the Claude manifest |
| `author.name`, `author.url` | `Javier Flores`, `https://github.com/jfa94` | |
| `homepage` | `https://github.com/jfa94/web-designer#readme` | |
| `repository` | `https://github.com/jfa94/web-designer` | |
| `keywords` | Same list as the Claude manifest | Not enforced |
| `skills` | `./skills/` | Enforced: must equal `./skills/` |
| `interface.displayName` | `Web Designer` | |
| `interface.shortDescription` | One-line summary | |
| `interface.longDescription` | Same text as `description` | Not enforced |
| `interface.developerName` | `Javier Flores` | |
| `interface.category` | `Productivity` | |
| `interface.capabilities` | `Read`, `Write` | |
| `interface.websiteURL` | `https://github.com/jfa94/web-designer` | |
| `interface.defaultPrompt` | Array of prompt strings | Enforced: exactly 3 entries, each at most 128 characters |

## `.agents/plugins/marketplace.json`

Codex marketplace. It has no `version` field.

Enforced: `name` must be `javier-plugins`, `interface.displayName` must be `Javier's Plugins`, and the `plugins` array must equal the one below exactly:

```json
{
  "name": "javier-plugins",
  "interface": { "displayName": "Javier's Plugins" },
  "plugins": [
    {
      "name": "web-designer",
      "source": { "source": "local", "path": "./" },
      "policy": { "installation": "AVAILABLE", "authentication": "ON_INSTALL" },
      "category": "Productivity"
    }
  ]
}
```

## Cross-manifest summary

| Value | Claude manifest | Claude marketplace | Codex manifest | Codex marketplace |
|---|---|---|---|---|
| Plugin name | `name` | `plugins[0].name` | `name` | `plugins[0].name` |
| Version | `version` | `plugins[0].version` | `version` | absent |
| Description | `description` | `plugins[0].description` (not enforced) | `description` | absent |

All four files must be valid JSON (enforced).
