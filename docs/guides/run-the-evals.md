# Run the Eval Suite

Every run uses your own Claude credentials and costs API usage. By default, each case runs 3 times, plus a no-plugin baseline arm.

1. Change to the repository root.

2. Run the whole suite:

   ```bash
   claude plugin eval . --scaffold --allow-tools Write Edit --runs 3 --threshold 0.67 --max-cost-usd 15 --no-publish
   ```

   - `--scaffold`: every case copies the Acme Admin fixture into its workspace with a scaffold script, and scaffold scripts run only with this flag.
   - `--allow-tools Write Edit`: always pass it. `Write` and `Edit` are gated in eval runs. Without them, `design-system-interview` and `design-system-resume` cannot write their pages, and the "writes nothing" checks in the other cases pass trivially.
   - On the first run in this directory, the command asks you to confirm that you trust the plugin.

3. Narrow or tune the run as needed:

   | Goal | Option |
   |---|---|
   | Run one case or a set of cases | `--case <glob>`, e.g. `--case 'design-system-*'` |
   | Fewer or more runs per case | `--runs <n>` |
   | Skip the no-plugin baseline arm | `--ablation none` |
   | Run cases in parallel | `-j <n>` (1–8; all runs share one rate limit) |
   | Cap spend | `--max-cost-usd <usd>` |
   | Keep the HTML report off claude.ai | `--no-publish` |
   | Inspect a case workspace after the run | `--keep-temp` |
   | Change the pass bar | `--threshold <0..1>` (default 1.0; the command exits 1 if any case scores below it) |
   | Change the LLM judge | `--judge-model <model>` (default `haiku`) |

4. See [Eval cases](../reference/eval-cases.md) for what each case checks.

5. Read the results. Each run creates `evals/results/<timestamp>/`:
   - `report.html`: scores, prompts, and grader verdicts.
   - `aggregate-result.json`: for each case, `aggregates.score` and `aggregates.passRate`. With the baseline arm, it also has `scoreWithout`, `passRateWithout`, and `delta`. Each run under `arms` records its grader verdicts and a `tracePath`.

`evals/results/` is ignored by Git, so results are never committed.
