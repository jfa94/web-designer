# Change a Shared Block

Two blocks are copied word for word across skills. Edit the source, then copy it into every copy so the structural check passes.

## Change the severity scale

1. Edit the table that starts with `| Severity | Meaning |` in `skills/design-review/SKILL.md`. Keep exactly three levels: the table must be five lines, including the header and separator.
2. Copy the edited table, unchanged, into:
   - `skills/design-review/references/audit-mode.md`
   - `skills/design-system/SKILL.md`
3. Check the prose around each table. All three files explain how severity differs from priority and strength, and that a product's `governance.md` scale takes precedence.
4. If you renamed a level, update the evals that check level names:
   - `evals/design-system-audit/graders/severity-scale.md` (pattern `(Critical|Major|Minor)`)
   - `evals/design-system-audit/graders/no-cosmetic.md`
   - `evals/design-system-audit/graders/classification.md`
   - The Severity table in `evals/fixture/guidelines/docs/design/governance.md`
5. If you renamed a level, add a row to the README rename map for the next version (see [Change the plugin version](change-the-version.md)).
6. Run `bash tests/plugin-compatibility.sh`.

## Change the Resolve Product Guidelines block

1. Edit the `## Resolve Product Guidelines` section in `skills/layout/SKILL.md`. The block runs from that heading up to the next `## ` heading.
2. Replace the same section, unchanged, in:
   - `skills/design-review/SKILL.md`
   - `skills/frontend-design/SKILL.md`
   - `skills/ux-copy/SKILL.md`
3. If the change affects lookup or precedence, check that `skills/design-system/SKILL.md` ("Locate and Read", "Writing Rules") and `skills/design-system/references/guidelines-format.md` still agree with it.
4. Run `bash tests/plugin-compatibility.sh`.
5. Run the `layout-product-rule` eval case, which exercises a consuming skill against product rules:

   ```bash
   claude plugin eval . --case layout-product-rule --scaffold --allow-tools Write Edit
   ```
