# Getting Started

This tutorial loads a local checkout of the plugin into Claude Code, runs the structural check, invokes a skill, and runs one eval case.

## Prerequisites

- Claude Code (the `claude` CLI), signed in
- `bash`, `git`, and `jq`

## 1. Clone the repository

```bash
git clone https://github.com/jfa94/web-designer.git web-designer-plugin
cd web-designer-plugin
```

## 2. Run the structural check

```bash
bash tests/plugin-compatibility.sh
```

The script prints `OK`. If it prints an error instead, the message names the file and the rule that failed. [Skill authoring constraints](reference/skill-authoring-constraints.md) lists every rule.

## 3. Start Claude Code with the local plugin

Start Claude Code from the repository root and point it at the checkout:

```bash
claude --plugin-dir .
```

The plugin is loaded for this session only, without being installed.

## 4. Invoke a skill

In the session, enter:

```text
/web-designer:layout should editing an event's schedule be a modal or a page?
```

The response is a layout spec that begins with `## Layout Spec:` and contains Regions, Wireframes, Surfaces, and Behavior Contract sections. Exit the session when you have read it.

## 5. Run one eval case

From the repository root, run the read-only `layout-product-rule` case once, without the no-plugin baseline:

```bash
claude plugin eval . --case layout-product-rule --scaffold --allow-tools Write Edit --runs 1 --ablation none
```

The first run in this directory asks you to confirm that you trust the plugin. `--scaffold` copies the eval fixture into the case workspace. The case depends on that fixture, so do not leave the flag out. The run uses your own Claude credentials and costs API usage.

When it finishes, the command prints the case score and writes `aggregate-result.json` and `report.html` to a new timestamped folder under `evals/results/`. Git ignores that folder.

## Next steps

- Read the [architecture overview](architecture/overview.md) to see how the parts fit together.
- To change a skill, read [Skill authoring constraints](reference/skill-authoring-constraints.md) first.
- To run the full suite, see [Run the eval suite](guides/run-the-evals.md).
