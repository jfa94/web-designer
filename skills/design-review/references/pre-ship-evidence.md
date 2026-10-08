# Pre-ship Evidence

## Stress and Synchronization Cases

Stress cases (Meyer & Wachter-Boettcher, *Design for Real Life*): design for people at their worst moment, not an imagined calm user. Check for:

- **Names:**
  - names that don't fit Western first/last assumptions
  - diacritics and other scripts
  - long names and single-word names
- **Dates:** around death, illness, pregnancy loss, anniversaries, and crisis events.
- **Circumstances:**
  - shared devices
  - coercive relationships
  - privacy-sensitive notifications
  - financial scarcity
- **Sync and network:**
  - offline, queued, syncing, retrying
  - stale data and conflicts
  - duplicate submission
  - partial failure
- **Forms:**
  - keyboard order
  - autofill and password managers
  - paste and IME input
  - long values
  - locale formats
  - server-side failure
- **Language:** read all user-facing language aloud. Ask: would a thoughtful person say this right now, and what practical help would they offer?

## Test Evidence Before Ship

| Test | What it can establish |
|---|---|
| Unit/component | Logic, rendering contracts, keyboard behavior in isolated states |
| Integration | Boundaries between UI, data, auth, routing, and error handling |
| End-to-end | A critical journey works in a representative environment |
| Visual regression | Enumerated viewport/theme/state output did not change unexpectedly |
| Accessibility automation | Detectable rule violations; never full accessibility |
| Manual/assistive technology | Interaction, comprehension, focus, announcements, and real usability |

Coverage dimensions worth sampling:

| Area | Dimensions |
|---|---|
| Journeys and states | Critical journeys, all UI Stack states |
| Content | Data extremes, locales and RTL |
| Environment | Permissions, network quality, viewport and container sizes, themes |
| Input and display | Keyboard, touch or coarse pointer, reduced motion, zoom |
| Assistive technology | Whichever is relevant |

Quality-ready means:
- critical paths and material failure states have appropriate evidence
- known high-severity defects have an explicit decision
- rollback and recovery are understood

It does not mean every pixel or every possible input has a test.
