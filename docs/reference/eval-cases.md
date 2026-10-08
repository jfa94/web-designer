# Eval Cases Reference

The eval suite in `evals/` is run with `claude plugin eval`. It is not part of the shipped plugin. Results are written to `evals/results/<timestamp>/` (`aggregate-result.json`, `report.html`), which Git ignores.

## Directory layout

```text
evals/
├── fixture/
│   ├── scaffold.sh              copies the fixture into the case workspace: bare | guided
│   ├── repo/                    Acme Admin app (package.json, src/components, src/pages, src/styles)
│   └── guidelines/docs/design/  pre-written guidelines, added in guided mode
└── <case-name>/
    ├── case.yaml
    ├── prompt.md
    ├── scaffold.sh              calls ../fixture/scaffold.sh with a mode
    └── graders/*.md
```

## `case.yaml`

```yaml
schema_version: "1.1"
name: <case-name>
context:
  scaffold_script: scaffold.sh
```

| Key | Value |
|---|---|
| `schema_version` | `"1.1"` |
| `name` | Case name; matches the directory name |
| `context.scaffold_script` | Script run in the empty case workspace. It runs only when `--scaffold` is passed to `claude plugin eval` |

## `prompt.md`

YAML frontmatter followed by the user prompt sent to the agent.

| Frontmatter key | Used values | Meaning |
|---|---|---|
| `max_turns` | `30`, `40` | Turn limit for one run |
| `timeout_seconds` | `900` | Time limit for one run |
| `allowed_tools` | `[Read, Glob, Grep, Skill]` | Tools declared for the run |

## Grader files

Each file in `graders/` is one grader. The file name is the grader name. Frontmatter configures the grader, and for `llm` graders the body is the rubric. `weight` defaults to `1`.

### `llm`

| Key | Meaning |
|---|---|
| `type` | `llm` |
| `weight` | Score weight (the suite uses `2` and `3`) |
| Body | Rubric with explicit PASS and FAIL conditions |

Judged by an LLM (default model `haiku`, override with `--judge-model`). Counts as a paid grader.

### `regex`

| Key | Default | Meaning |
|---|---|---|
| `type` | | `regex` |
| `pattern` | | Regular expression |
| `flags` | `""` | e.g. `i` |
| `match` | `contains` | `contains` or `not_contains` |
| `target` | `last_message` | `last_message`, `trace`, or `{ source: file, path: <workspace-relative path> }` |

### `tool_used`

| Key | Meaning |
|---|---|
| `type` | `tool_used` |
| `tool` | Tool name, e.g. `Skill`, `Edit`, `Write` |
| `input_match` | Optional regex matched against the tool input |
| `min`, `max` | Optional call-count bounds. `min: 0, max: 0` asserts the tool was never called |

Under `--ablation with-without`, `tool_used: Skill` graders show whether the plugin fired and are not counted in the score.

### `file_exists`

| Key | Meaning |
|---|---|
| `type` | `file_exists` |
| `path` | Workspace-relative path that must exist after the run |

## Fixture

| Mode | Workspace contents |
|---|---|
| `bare` | `evals/fixture/repo/` only: the Acme Admin React app with no guidelines |
| `guided` | `repo/` plus `guidelines/`, which adds `docs/design/` |

Guided-mode guidelines:

| Page | Prefix | Rules |
|---|---|---|
| `README.md` | n/a | One principle ("Recoverable over fast"), reading rules, page map |
| `components/button.md` | BTN | BTN-001 Should, Confirmed; BTN-002 Should, Inferred; BTN-003 Must not, Confirmed; BTN-004 Should, Inferred; BTN-005 Open |
| `patterns/forms.md` | FORM | FORM-001 Must, Confirmed (visible labels); FORM-002 Should, Confirmed (validate on blur after input) |
| `governance.md` | EXC | Ownership, severity scale, EXC-001 (live exception to BTN-001 on the Billing page) |

## Cases

| Case | Fixture | Prompt | Graders |
|---|---|---|---|
| `design-system-audit` | guided | `design-system --audit the whole app` | `skill-fired`; `no-edit`, `no-write`; `severity-scale` (Critical / Major / Minor present); `no-cosmetic` (no "Cosmetic"); `classification` (llm, weight 3: planted findings classified correctly, approval asked before edits) |
| `design-system-handoff` | guided | `design-system --handoff the Team page (src/pages/Team.tsx)` | `skill-fired`; `no-edit`, `no-write`; `cites-rules` (BTN or FORM IDs); `requirement-is-fix` (llm, weight 2: missing label listed as a FORM-001 fix, not an exception request) |
| `design-system-interview` | bare | `design-system` | `skill-fired`; `no-src-edit`, `no-src-write` (nothing under `src/`); `writes-readme` (`docs/design/README.md` exists); `banners-open` (trace has an Open item about banners or warnings); `interview-turn` (llm, weight 2: counts shown, one decision or one batch of at most 5) |
| `design-system-resume` | guided | `design-system` plus "BTN-002 is right. BTN-004 is wrong." | `skill-fired`; `no-src-edit`, `no-src-write`; `btn-002-confirmed`, `btn-004-not-rewritten`, `btn-004-tombstoned` (regex on `docs/design/components/button.md`); `follow-up` (llm, weight 2: one follow-up decision replacing BTN-004) |
| `layout-product-rule` | guided | Plan the layout of a public sign-up form for Acme Admin | `skill-fired` (`layout`); `no-edit`, `no-write`; `cites-form-002`; `follows-product-rule` (llm, weight 2: validation follows FORM-002, every field labelled, gaps listed as extend candidates) |
