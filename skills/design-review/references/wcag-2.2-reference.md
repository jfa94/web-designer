# WCAG 2.2 AA Reference

Use the normative W3C WCAG and Understanding documents when making a conformance claim. This is an audit prompt, not a substitute for the standard.

## Complete A/AA Quick Reference

### Perceivable

| Criterion | Level | Audit question |
|---|---|---|
| 1.1.1 Non-text Content | A | Do meaningful images and controls have equivalent text, with decorative content ignored? |
| 1.2.1 Audio-only and Video-only (Prerecorded) | A | Is an equivalent alternative provided? |
| 1.2.2 Captions (Prerecorded) | A | Do prerecorded videos have synchronized captions? |
| 1.2.3 Audio Description or Media Alternative (Prerecorded) | A | Is visual information available through description or a media alternative? |
| 1.2.4 Captions (Live) | AA | Does live synchronized media have captions? |
| 1.2.5 Audio Description (Prerecorded) | AA | Does prerecorded video include audio description where needed? |
| 1.3.1 Info and Relationships | A | Are visual structure and relationships programmatically determinable? |
| 1.3.2 Meaningful Sequence | A | Does source/programmatic order preserve meaning? |
| 1.3.3 Sensory Characteristics | A | Do instructions avoid relying only on shape, color, location, or sound? |
| 1.3.4 Orientation | AA | Does content work without forcing portrait or landscape unless essential? |
| 1.3.5 Identify Input Purpose | AA | Are common personal-data fields programmatically identified? |
| 1.4.1 Use of Color | A | Is color never the sole cue? |
| 1.4.2 Audio Control | A | Can automatically playing audio over three seconds be paused/stopped or controlled independently? |
| 1.4.3 Contrast (Minimum) | AA | Is contrast at least 4.5:1 normal and 3:1 large text? Large is 18pt/24px regular or 14pt/~18.7px bold. |
| 1.4.4 Resize Text | AA | Can text resize to 200% without lost content or function? |
| 1.4.5 Images of Text | AA | Is real text used except where the presentation is essential or customizable? |
| 1.4.10 Reflow | AA | At 320 CSS px/400% zoom, is two-dimensional scrolling avoided except for essential layouts? |
| 1.4.11 Non-text Contrast | AA | Do required UI boundaries, states, and meaningful graphics reach 3:1? |
| 1.4.12 Text Spacing | AA | Does content survive line 1.5×, paragraph 2×, letter .12×, and word .16× spacing? These are tolerance tests, not default typography; fixed-height text containers are the usual failure. |
| 1.4.13 Content on Hover or Focus | AA | Is revealed content dismissible, hoverable, and persistent? |

AAA contrast: 1.4.6 requires 7:1 normal and 4.5:1 large text.

### Operable

| Criterion | Level | Audit question |
|---|---|---|
| 2.1.1 Keyboard | A | Is all functionality available from a keyboard? |
| 2.1.2 No Keyboard Trap | A | Can focus always leave a component through a documented standard method? |
| 2.1.4 Character Key Shortcuts | A | Can single-character shortcuts be disabled, remapped, or limited to focus? |
| 2.2.1 Timing Adjustable | A | Can users turn off, adjust, or extend time limits except documented exceptions? A toast that auto-dismisses its only Undo or retry is a timing risk. |
| 2.2.2 Pause, Stop, Hide | A | Can users control moving, blinking, scrolling, or auto-updating content? |
| 2.3.1 Three Flashes or Below Threshold | A | Is content free of dangerous flash patterns? |
| 2.4.1 Bypass Blocks | A | Can repeated blocks be skipped? |
| 2.4.2 Page Titled | A | Does each page have a descriptive title? |
| 2.4.3 Focus Order | A | Does focus order preserve meaning and operation? |
| 2.4.4 Link Purpose (In Context) | A | Is each link's purpose clear from its text or context? |
| 2.4.5 Multiple Ways | AA | Can users locate pages through more than one method, except process steps? |
| 2.4.6 Headings and Labels | AA | Do headings and labels describe topic or purpose? |
| 2.4.7 Focus Visible | AA | Is keyboard focus visibly indicated? |
| 2.4.11 Focus Not Obscured (Minimum) | AA | Is a focused component not entirely hidden by author-created content? Test sticky headers and footers, drawers, cookie banners, and overlays. New in 2.2. |
| 2.5.1 Pointer Gestures | A | Is multipoint/path interaction available through a single pointer unless essential? |
| 2.5.2 Pointer Cancellation | A | Can users avoid accidental activation through safe down/up-event behavior? |
| 2.5.3 Label in Name | A | Does the accessible name contain the visible label text? |
| 2.5.4 Motion Actuation | A | Is motion-triggered functionality also operable conventionally and disableable? |
| 2.5.7 Dragging Movements | AA | Is a non-drag alternative available unless dragging is essential? New in 2.2. |
| 2.5.8 Target Size (Minimum) | AA | Is the target 24×24 CSS px or sufficiently spaced, subject to exceptions? New in 2.2. |

2.4.12 Focus Not Obscured (Enhanced), 2.4.13 Focus Appearance, and 2.5.5 Target Size (Enhanced, 44×44 CSS px) are AAA.

### Understandable

| Criterion | Level | Audit question |
|---|---|---|
| 3.1.1 Language of Page | A | Is the page's default human language identified? |
| 3.1.2 Language of Parts | AA | Are passages in another language identified, with exceptions for names and vernacular? |
| 3.2.1 On Focus | A | Does focus avoid unexpected context changes? |
| 3.2.2 On Input | A | Do input changes avoid unexpected context changes unless explained first? |
| 3.2.3 Consistent Navigation | AA | Does repeated navigation stay in a consistent relative order? |
| 3.2.4 Consistent Identification | AA | Are same-function components identified consistently? |
| 3.2.6 Consistent Help | A | Do repeated help mechanisms keep a consistent relative order? New in 2.2. |
| 3.3.1 Error Identification | A | Are input errors identified and described in text? |
| 3.3.2 Labels or Instructions | A | Are required labels and instructions supplied? |
| 3.3.3 Error Suggestion | AA | Are known corrections suggested when appropriate and safe? |
| 3.3.4 Error Prevention (Legal, Financial, Data) | AA | Can consequential submissions be reversed, checked, or confirmed? |
| 3.3.7 Redundant Entry | A | Is previously entered information reused or selectable in the same process, with exceptions? New in 2.2. |
| 3.3.8 Accessible Authentication (Minimum) | AA | Is authentication free of unsupported cognitive tests, subject to its alternatives/exceptions? New in 2.2. |

3.3.9 Accessible Authentication (Enhanced) is new at AAA and removes the object-recognition/personal-content exceptions.

### Robust

| Criterion | Level | Audit question |
|---|---|---|
| 4.1.2 Name, Role, Value | A | Are component names, roles, states, values, and changes programmatically available? |
| 4.1.3 Status Messages | AA | Are status updates exposed without receiving focus? |

WCAG 2.2 removed 4.1.1 Parsing. Do not report it as a 2.2 failure.

## Target Guidance

| Source | Minimum/enhanced target |
|---|---|
| WCAG 2.2 AA 2.5.8 | 24×24 CSS px or sufficient spacing, subject to exceptions |
| WCAG 2.2 AAA 2.5.5 | 44×44 CSS px |
| Apple Human Interface Guidelines | 44×44 pt |
| Material Design | 48×48 dp |

Use 24×24 as the conformance floor and 44–48 for primary actions where possible.

## Testing Layers

1. Define scope and representative samples using WCAG-EM.
2. Run axe-core/WAVE/Lighthouse/pa11y; inspect every result and do not treat zero findings as a pass.
3. Complete all journeys by keyboard, including reverse order and dismissal.
4. Test NVDA + Firefox and VoiceOver + Safari; include browse/read and interaction modes.
5. Test 200% resize, 400%/320px reflow, text spacing, high contrast, reduced motion, and forced colors where relevant.
6. Include disabled participants in usability testing for material journeys.

Automation can evaluate roughly 30–40% of success criteria. Axe-core's approximately 57% figure concerns issue volume, not criteria coverage.

## Legal and Procurement Layer

- European Accessibility Act requirements began applying to covered products and services in June 2025; applicability and national enforcement vary.
- UK public-sector bodies work under the Public Sector Bodies (Websites and Mobile Applications) Accessibility Regulations 2018 (PSBAR) and related equality duties.
- US ADA Title II covers state and local government; Title III litigation often concerns public accommodations. Regulatory obligations depend on context and jurisdiction.
- EN 301 549 is the European ICT accessibility procurement standard and incorporates WCAG requirements for web content.

Treat this as issue-spotting only. Obtain jurisdiction-specific legal advice before asserting legal compliance.
