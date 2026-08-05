---
name: frontend-design
description: Create distinctive, production-grade web components, pages, applications, and landing-page designs. Trigger with requests to build frontend interfaces, "design a landing page", "structure my homepage", "improve my page layout", "optimize my page for conversions", "wireframe a landing page", hero or above-the-fold design, CTA placement, page structure, visual hierarchy, conversion-focused design, or requests to review or plan landing-page sections and content placement. Use for layout, visual design, and implementation; use ux-copy when the deliverable is words or messaging, and critique for broad review of an existing design.
argument-hint: "<brief, page, or component to build>"
---
This skill guides creation of distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics. Implement real working code with exceptional attention to aesthetic details and creative choices.
The user provides frontend requirements: a component, page, application, or interface to build. They may include context about the purpose, audience, or technical constraints.
## Ground It In The Subject
Before anything else, pin down what this actually is. If the brief doesn't name the subject, the audience, and the single job the page has to do, name them yourself and say so out loud. Distinctive choices come from the subject's own world — its materials, its instruments, its artifacts, its vocabulary. A page about vinyl mastering and a page about tax software should not be able to swap stylesheets. Build with the brief's real content and subject matter throughout, not lorem-ipsum stand-ins that let generic choices slip through unnoticed.
## Design Thinking
Before coding, understand the context and commit to a BOLD aesthetic direction:
- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian, etc. There are so many flavors to choose from. Use these for inspiration but design one that is true to the aesthetic direction.
- **Constraints**: Technical requirements (framework, performance, accessibility).
- **Differentiation**: What makes this UNFORGETTABLE? What's the one thing someone will remember?
**CRITICAL**: Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work - the key is intentionality, not intensity.
## Two Passes: Plan, Critique, Then Build
Don't go straight to code. First pass — write a compact design plan: **Color** as 4–6 named hex values, not vibes. **Type** as a face per role — a characterful display face used sparingly, a body face that complements it, a utility face for captions or data if the content needs one. **Layout** as one-sentence prose plus ASCII wireframes, cheap enough to draw three and compare. **Signature** as the single element this page will be remembered by.
Second pass — critique that plan against the brief before writing a line of code. Ask honestly whether any part of it is what you'd have produced for any other brief in the same category. Where it is, change it and say what you changed and why. Only build once the plan survives its own critique, then follow it exactly and derive every color and type decision from it. Do this thinking in your head, not on the user's screen — show ideas when confidence is high, not while you're still shuffling them.
Then implement working code (HTML/CSS/JS, React, Vue, etc.) that is:
- Production-grade and functional
- Visually striking and memorable
- Cohesive with a clear aesthetic point-of-view
- Meticulously refined in every detail
## Frontend Aesthetics Guidelines
Focus on:
- **Typography**: Choose fonts that are beautiful, unique, and interesting. Avoid generic fonts like Arial and Inter; opt instead for distinctive choices that elevate the frontend's aesthetics; unexpected, characterful font choices. Pair a distinctive display font with a refined body font.
- **Color & Theme**: Commit to a cohesive aesthetic. Use CSS variables for consistency. Dominant colors with sharp accents outperform timid, evenly-distributed palettes.
- **Motion**: Use animations for effects and micro-interactions. Prioritize CSS-only solutions for HTML. Use Motion library for React when available. Focus on high-impact moments: one well-orchestrated page load with staggered reveals (animation-delay) creates more delight than scattered micro-interactions. Use scroll-triggering and hover states that surprise.
- **Spatial Composition**: Unexpected layouts. Asymmetry. Overlap. Diagonal flow. Grid-breaking elements. Generous negative space OR controlled density.
- **Backgrounds & Visual Details**: Create atmosphere and depth rather than defaulting to solid colors. Add contextual effects and textures that match the overall aesthetic. Apply creative forms like gradient meshes, noise textures, geometric patterns, layered transparencies, dramatic shadows, decorative borders, custom cursors, and grain overlays.
NEVER use generic AI-generated aesthetics like overused font families (Inter, Roboto, Arial, system fonts), cliched color schemes (particularly purple gradients on white backgrounds), predictable layouts and component patterns, and cookie-cutter design that lacks context-specific character.
### Calibration: the current defaults
What counts as "generic" shifts over time, so calibrate to now. Right now AI-generated design converges on three specific looks, and recognising them by name is more useful than a vague instruction to be original:
1. Warm cream background (around #F4F1EA), high-contrast serif display, terracotta accent.
2. Near-black background, one bright acid-green or vermilion accent, nothing else.
3. Broadsheet layout — hairline rules, zero border-radius, dense newspaper columns.
Each is a perfectly good answer for *some* brief. The problem is that they show up regardless of subject, which makes them defaults rather than choices. Where the brief specifies a direction, follow the brief exactly — including when it asks for one of these. Where the brief leaves an axis open, don't spend that freedom landing on one of them.
### Structure carries meaning
Structural devices — numbering, eyebrows, dividers, labels — should encode something true about the content rather than decorate it. Numbered markers (01 / 02 / 03) are everywhere in generic work; they earn their place only when the content genuinely is a sequence, where order carries information the reader needs. Interrogate every such device before including it.
Interpret creatively and make unexpected choices that feel genuinely designed for the context. No design should be the same. Vary between light and dark themes, different fonts, different aesthetics. NEVER converge on common choices (Space Grotesk, for example) across generations.
**IMPORTANT**: Match implementation complexity to the aesthetic vision. Maximalist designs need elaborate code with extensive animations and effects. Minimalist or refined designs need restraint, precision, and careful attention to spacing, typography, and subtle details. Elegance comes from executing the vision well.
## Craft Floor
Distinctive work still has to be readable, responsive, fast, and operable.

### Motion
- Keep most state transitions within 150–300ms. Animate transform and opacity where possible; avoid layout-triggering motion.
- `prefers-reduced-motion` means modify motion, not remove all feedback. Substitute shorter fades, instant state changes, or non-motion cues while preserving meaning.

### Spacing, Type, and Color
- Start with an 8pt spacing rhythm and keep internal spacing less than or equal to external spacing so groups read clearly.
- Keep reading measure around 45–75 characters; `max-width: 66ch` is a strong default.
- For fluid type, combine a rem anchor with viewport scaling in `clamp()`. Pure `vw` sizing can defeat text zoom.
- Treat dark mode as semantic-token design, not inversion. Prefer softened light text such as `#ECEDEE` over pure white on large dark surfaces, provide at least four surface/elevation levels when needed, and verify contrast.
- For full token, grid, and foundation guidance, see the design-system skill's tokens-and-foundations reference.

### Responsive Composition
- Choose content-first breakpoints: widen or narrow until the composition breaks, then place the breakpoint there. `642px` is valid when evidence supports it.
- Use container queries for reusable component reflow; use media queries for page layout and preferences.
- Treat hover as enhancement. Accommodate `pointer: coarse`, keyboard, touch, 320px reflow, and zoom rather than assuming a device class.

### Performance
- Meet Core Web Vitals at the 75th percentile: LCP ≤2.5s, INP ≤200ms, CLS ≤0.1.
- Give images intrinsic `width`/`height` or `aspect-ratio`; reserve dynamic and embedded content; never inject content above the user's current position; use `scrollbar-gutter: stable` where scrollbar appearance shifts layout.
- Serve responsive images with `srcset` and `sizes`. Never lazy-load the LCP/hero image; prioritize it and lazy-load below-fold media.

### Interaction and Copy
- Check the WAI-ARIA Authoring Practices Guide before authoring any custom widget; prefer native HTML.
- Use the ux-copy skill for interface text and landing-page messaging. Keep supplied approved copy intact unless rewriting it is in scope.

For marketing-page structure, hero/CTA placement, social proof, and conversion review, see [landing-page design](references/landing-page-design.md).
## Restraint And Self-Critique
Spend your boldness in one place. Let the signature element be the thing people remember and keep everything around it quiet and disciplined; cut any decoration that doesn't serve the brief. Note that playing it safe is its own kind of risk — restraint means concentrating force, not withholding it. Chanel's rule applies: before leaving the house, look in the mirror and take one thing off.
Critique your own work as you build, and take screenshots to look at it if the environment supports them — far more informative than re-reading your own CSS.
### Quality floor
Hit these without announcing them: responsive down to mobile, visible keyboard focus, `prefers-reduced-motion` respected.
### A CSS trap worth naming
Watch your selector specificity. It's easy to generate classes that silently cancel each other — a type-based selector like `.section` against an element-based one like `.cta` is the common case, and section padding and margins are where it usually bites.

## Delivery

- Implement real, working behavior in the repository's existing stack and conventions.
- Reuse real content, components, and tokens; do not invent APIs or replace approved copy with placeholders.
- Exercise the changed flow at relevant viewport sizes, keyboard paths, themes, and loading/error states.
- Report the design direction, files changed, verification performed, and any limits that still require a real device, browser, or assistive technology.

## If Connectors Available

- Design tool: inspect source layout, assets, tokens, components, and prototype behavior.
- Component catalog: verify supported properties and states before implementation.
- Browser: capture and critique screenshots at representative sizes and interaction states.

## Tips

- Spend boldness on one memorable signature and keep supporting elements disciplined.
- Use the landing-page reference for page architecture and the ux-copy skill for messaging.
- Treat performance, accessibility, and responsive behavior as design quality, not cleanup.

Remember: Claude is capable of extraordinary creative work. Don't hold back, show what can truly be created when thinking outside the box and committing fully to a distinctive vision.
