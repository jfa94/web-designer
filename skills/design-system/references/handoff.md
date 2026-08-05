# Design Handoff

Use this specification from design-system document or extend mode. Inspect the actual design and code conventions; do not invent measurements or component APIs.

## Principles

1. Reference semantic/component tokens rather than copying raw values when tokens exist.
2. Show all relevant states and combinations, including focus and read-only.
3. Describe behavior and rationale, not only appearance.
4. Define responsive behavior from content constraints. Widen/narrow until the composition breaks, record that condition, then choose the breakpoint.
5. Reserve final image, embed, ad, and skeleton dimensions to prevent layout shift.
6. Annotate accessibility behavior that cannot be inferred; avoid redundant annotations of correct native semantics.

## Handoff Template

```markdown
## Handoff Spec: [Feature/Screen]

### Overview
[User, job, journey boundaries, source design/version]

### Layout and Tokens
| Region | Constraint/token | Value/reference | Notes |
|---|---|---|---|

### Components
| Component | Verified source/API | Variant/props | Notes |
|---|---|---|---|

### States and Interactions
| Element | State/combination | Trigger | Behavior | Result/focus |
|---|---|---|---|---|

Include touch gestures (swipe, pinch, long-press) where supported, each with a keyboard/pointer equivalent.

### Responsive Reflow
| Component | Content-break condition | Reflow behavior | Container/media query |
|---|---|---|---|

### Content and Edge Cases
- Empty, partial, loading, error, long/short/localized content
- Permissions, offline, queued, syncing, conflict, timeout, and retries
- Character limits, and truncation/wrapping rules and preserved user input

### Motion
| Element | Trigger | Property | Duration/easing | Reduced-motion behavior |
|---|---|---|---|---|

### Accessibility Annotations
- Heading/landmark structure and reading order
- Visible labels, accessible names, descriptions, roles, and states
- Focus order, focus on change, dialog entry/return, keyboard behavior
- Status announcements and image alternatives

### Acceptance Checks
- [Observable implementation and regression checks]
```

## Connector Use

- From Figma or another design tool, pull exact tokens, dimensions, components, and prototype behavior.
- From Storybook/component manifests, verify APIs and supported states.
- Link the spec to implementation work in a tracker only when authorized.
