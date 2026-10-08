# Add an Eval Case

For file formats and grader options, see [Eval cases](../reference/eval-cases.md).

1. Create the case directory:

   ```bash
   mkdir -p evals/<case-name>/graders
   ```

2. Write `evals/<case-name>/case.yaml`:

   ```yaml
   schema_version: "1.1"
   name: <case-name>
   context:
     scaffold_script: scaffold.sh
   ```

3. Write `evals/<case-name>/scaffold.sh` and make it executable (`chmod +x`). Pass `guided` to include the pre-written `docs/design/` guidelines, or `bare` for the app alone:

   ```bash
   #!/usr/bin/env bash
   set -euo pipefail
   exec bash "$(dirname "$0")/../fixture/scaffold.sh" guided
   ```

4. Write `evals/<case-name>/prompt.md`. Put the run limits in the frontmatter and the user request in the body. Use flag syntax for actions:

   ```markdown
   ---
   max_turns: 30
   timeout_seconds: 900
   allowed_tools: [Read, Glob, Grep, Skill]
   ---

   design-system --audit colour
   ```

5. Add one file per grader under `graders/`:
   - A `tool_used` grader with `tool: Skill` and `input_match: '<skill-name>'`, to confirm that the skill fired.
   - `tool_used` graders with `min: 0` and `max: 0` on `Edit` and `Write`, for actions that must not change files. Add an `input_match` on `/src/` if only product code must stay unchanged.
   - `regex` graders for exact output that must or must not appear, such as rule IDs or forbidden terms. Use `target: { source: file, path: ... }` to check a file the agent wrote.
   - One `llm` grader with explicit PASS and FAIL conditions for the behaviour that matters most.

6. If the case needs new planted evidence, add it to `evals/fixture/repo/` or `evals/fixture/guidelines/`. Every other case shares the fixture, so rerun them all afterwards.

7. Run the new case:

   ```bash
   claude plugin eval . --case <case-name> --scaffold --allow-tools Write Edit --runs 1 --ablation none
   ```

8. When it passes, run it with the defaults (3 runs and the baseline arm). This confirms the score is stable and that the plugin makes a difference.

To have the CLI build a case for you, run `claude plugin eval init`. It interviews you to collect inputs and design graders. For a blank single-case template, run `claude plugin eval init --bare <name>`.
