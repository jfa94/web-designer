---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, or applications. Generates creative, polished code that avoids generic AI aesthetics.
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
## Writing Is Design Material
A brief rarely arrives with real copy, which means you're writing it — and weak copy makes a design feel as templated as weak type does. Words are there to make the interface easier to understand and therefore easier to use, so bring the same intent to them as to spacing and color.
Write from the user's side of the screen. Name things by what people recognise and control, never by how the system is built — someone manages notifications, not webhook config. Specific always beats clever. Use active voice and say exactly what a control does: "Save changes", not "Submit". Keep an action's name stable through the whole flow, so the button that says "Publish" produces a toast that says "Published" — that consistency is how people learn their way around.
Treat failure and emptiness as moments for direction rather than mood. An error explains what went wrong and how to fix it, in the interface's voice; it doesn't apologise and it's never vague. An empty screen is an invitation to act. Keep the register plain — sentence case, no filler, tone tuned to the audience — and let each element do exactly one job: a label labels, an example demonstrates, nothing quietly does double duty.
## Restraint And Self-Critique
Spend your boldness in one place. Let the signature element be the thing people remember and keep everything around it quiet and disciplined; cut any decoration that doesn't serve the brief. Note that playing it safe is its own kind of risk — restraint means concentrating force, not withholding it. Chanel's rule applies: before leaving the house, look in the mirror and take one thing off.
Critique your own work as you build, and take screenshots to look at it if the environment supports them — far more informative than re-reading your own CSS.
### Quality floor
Hit these without announcing them: responsive down to mobile, visible keyboard focus, `prefers-reduced-motion` respected.
### A CSS trap worth naming
Watch your selector specificity. It's easy to generate classes that silently cancel each other — a type-based selector like `.section` against an element-based one like `.cta` is the common case, and section padding and margins are where it usually bites.
Remember: Claude is capable of extraordinary creative work. Don't hold back, show what can truly be created when thinking outside the box and committing fully to a distinctive vision.
