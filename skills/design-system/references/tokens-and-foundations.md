# Tokens and Craft Foundations

## Three-tier Token Architecture

1. Primitive tokens hold raw palette, size, font, radius, shadow, and duration values (`blue.600`, `space.4`). Components should not normally consume them directly.
2. Semantic tokens express intent (`color.text.muted`, `space.layout.gap`) and reference primitives. Product code prefers this tier.
3. Component tokens express a stable component role (`button.primary.background`) and reference semantic tokens. Add them only when the component needs independent governance.

Do not alias upward, embed meaning in primitive names, or let component tokens become a second raw palette. Follow the Design Tokens Community Group format when interchange matters. Review naming for semantic drift: a token named `brandBlue` cannot safely become orange, while `actionPrimary` can.

## Lifecycle and Impact

1. Introduce replacement and document mapping.
2. Deprecate with warnings, ownership, and usage telemetry.
3. Soft-delete from normal discovery while retaining compatibility.
4. Delete after the declared window and migration evidence.

Published deprecation windows vary widely—roughly 3–18 months. Choose one based on consumer release cadence and risk. Any token change is a system-wide regression event: identify dependents, communicate scope, and test viewport, theme, brand, state, and contrast combinations.

## Type

- Choose a modular scale deliberately; common ratios include 1.25 (major third), 1.333 (perfect fourth), and 1.5 (perfect fifth).
- Keep long-form measure near 45–75 characters; `max-width: 66ch` is a useful default.
- Use fluid type with a rem anchor, for example `clamp(1rem, 0.9rem + 0.5vw, 1.25rem)`. Pure `vw` sizing can fail browser text zoom.
- Name type tokens by semantic role, not screen location.

## Spacing and Grid

- The layout skill's foundations reference owns the spacing scale, relationship-named spacing tokens, grids, width policies, and breakpoints. Tokenize the values it defines.

## Color and Dark Mode

- The 60/30/10 distribution can help establish dominant/support/accent roles; accessibility wins whenever the ratio conflicts with contrast or state recognition.
- Consume semantic tokens only in dark mode. Do not mechanically invert primitives.
- Use at least four perceivable elevation/surface levels when hierarchy requires depth.
- Prefer softened light text such as `#ECEDEE` over pure white for large dark surfaces, while verifying contrast.
- Encode status with more than hue; test forced colors and high contrast.
- For multiple brands, keep structure and behavior shared where possible and swap brand intent at the semantic tier. Do not fork component logic merely to change a palette, type family, or radius.

## Icons and Motion

- Build icon families on a consistent 24px grid with roughly 1.5–2px stroke unless the visual language requires another verified system.
- Tokenize motion durations and easing. Typical state transitions are 150–300ms.
- Prefer transform and opacity for smooth animation, and define a meaningful reduced-motion alternative.

All numbers are starting constraints. Document exceptions when content, platform, brand, or accessibility evidence requires them.
