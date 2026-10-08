# Change the Plugin Version

1. Choose the new `MAJOR.MINOR.PATCH` version. Only digits and dots pass the structural check.

2. Set the version in all three versioned manifests:
   - `.claude-plugin/plugin.json`: `version`
   - `.claude-plugin/marketplace.json`: `plugins[0].version`
   - `.codex-plugin/plugin.json`: `version`

   `.agents/plugins/marketplace.json` has no version field.

3. If the release renames or removes a skill, a flag, an action, or a user-facing term, add a `## <version> Rename Map` section to `README.md` above the previous rename maps. Follow the existing format: a one-line summary, then a `| Before | Now |` table. Do not show old action syntax as an example invocation. The structural check rejects README lines such as `/web-designer:layout review`, but still allows the old syntax inside table cells. It also rejects phrases such as "audit mode" anywhere in the README.

4. Run the structural check:

   ```bash
   bash tests/plugin-compatibility.sh
   ```

5. Commit with a message that starts with the version, in the same style as earlier releases (`0.7.0: design-system builds an internal HIG by interview; flags for actions`).
