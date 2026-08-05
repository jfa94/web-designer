# Landing Page Design Reference

## Overview

This reference provides a framework for designing SaaS landing pages and homepages. It covers page structure, hero design, CTA placement, social proof, visual hierarchy, mobile behavior, and performance.

Numeric conversion lifts below come from individual studies or benchmarks with specific traffic, offers, and implementations. They are examples for forming hypotheses, not universal expected results. Verify the source and context before citing a figure; validate consequential choices with product evidence and experiments.

The core principle: **visitors who can't answer "What is this, and why should I care?" within 5 seconds will leave.** Every design decision serves clarity, trust, and a frictionless path to action.

---

## Page Structure Blueprint

A common SaaS sequence moves from attention → trust → action. Use it as a starting hypothesis, then adapt it to audience, traffic intent, product complexity, price, and evidence.

### Recommended section order

1. **Navigation bar** — Keep choices focused and make the primary action clear. Dedicated campaign pages may test reduced navigation against normal wayfinding.
2. **Hero section** — Headline, subheadline, primary CTA, product visual, micro social proof. This is where ~80% of attention concentrates. See the Hero Section Design section below.
3. **Social proof bar** — Logo bar or "Trusted by X users" immediately below the hero. Establishes credibility before the visitor scrolls.
4. **Problem statement** — Articulates the pain or frustration the audience feels. Makes visitors feel understood before presenting a solution.
5. **Solution / How it works** — A simple 3-step visual process showing how easy it is to get started. Reduces perceived complexity.
6. **Features and benefits** — 3–6 core features maximum. Each framed as a benefit with a supporting visual (screenshot, icon, or illustration).
7. **Deep social proof** — Detailed testimonials (with names, photos, and specific results), case studies, video testimonials, review platform badges.
8. **Use cases or integrations** — Shows versatility and workflow fit. Optional for simple products.
9. **Pricing** — For B2C: transparent, 2–3 plans displayed openly. Hiding pricing increases bounce rates for consumer products. For B2B: may use "Contact Sales" for enterprise tiers.
10. **FAQ section** — Addresses remaining objections. Place common objections here as a safety net (though objections should also be handled inline throughout the page).
11. **Final CTA** — Strong, direct, with reinforced social proof and benefit restatement. This catches visitors who scrolled the entire page.
12. **Footer** — Trust badges, compliance info (GDPR, SOC2 if relevant), contact details, secondary links.

### Page length guidance

Most high-converting SaaS homepages are 3,000–5,000 pixels tall. Match length to product complexity:

- **Simple, low-cost products** (under $20/mo): Shorter pages, fewer sections. Hero + social proof + 3 features + pricing + CTA can be sufficient.
- **Mid-range products** ($20–100/mo): Full structure above. Thorough objection handling matters.
- **High-price or complex products** ($100+/mo): Longer pages with more social proof, detailed feature explanations, comparison tables, and multiple testimonial formats. Longer pages can generate 220% more leads when the product warrants the depth.

---

## Hero Section Design

The hero carries disproportionate weight. 57% of all viewing time occurs above the fold, and visitors form an impression in ~50 milliseconds. Nearly 40% of SaaS websites fail a basic 5-second clarity test.

### Required hero elements

Every hero section needs these five elements working together:

1. **Headline** — Clear, outcome-focused, and sized to the composition. See the ux-copy skill's landing-page reference for headline formulas.
2. **Subheadline** — One sentence that expands on the promise or addresses the top objection.
3. **Primary CTA button** — Single, visually dominant, high-contrast color, action-oriented copy.
4. **Product visual** — Real screenshot, interactive demo, or short animation showing the product in action. Avoid stock photos and abstract illustrations.
5. **Micro social proof** — Logo bar, user count ("Join 50,000+ users"), or review badge (e.g., "4.8 stars on G2") placed near the CTA.

### Layout patterns

Two layouts dominate:

- **Two-column**: Headline + CTA on the left, product visual on the right. Works well when the product visual is compelling.
- **Centered**: Headline centered above CTA, product visual beneath. Works well for clean, minimal designs or when the product visual is wide.

Both work — what matters is that headline, CTA, and trust signal are all visible without scrolling on both desktop and mobile.

### Product visual guidance

- Real screenshots and interactive demos outperform stock photos and abstract illustrations significantly. One company saw 32% higher activation after replacing a hero video with a 15-second interactive demo.
- Video can boost conversions 80–86% vs text-only, but must be click-to-play (never autoplay) and under 90 seconds.
- About 25% of SaaS landing pages use no hero image at all — this can work when clarity and speed are the priority.
- If the product is pre-launch with no real UI, use a mockup or prototype screenshot rather than generic imagery.

---

## CTA Design and Placement

CTA strategy is one of the highest-leverage optimization areas.

### Key principles

- **One primary action, repeated when useful**: Avoid equal visual weight for competing offers. Repeat the same action at natural decision points on long pages; frequency follows page length and evidence.
- **Placement follows composition**: Centered and left-aligned CTAs can both work. Preserve reading flow, proximity to the promise, and clear hierarchy.
- **Proof near claims**: Place relevant, credible proof near the claim or action it supports.
- **Sticky mobile CTA**: Test it when the primary action otherwise becomes hard to reach; ensure it does not obscure content or focus.

### Button design

- Use the accessibility skill's target guidance: 24×24 CSS px is the WCAG AA floor; favor 44–48 for primary actions.
- Make the primary action visually prominent without implying that size alone predicts conversion.
- Color should prioritize contrast against surrounding area, not any specific color. The famous red-vs-green tests were really contrast tests.
- Remove competing clutter around the CTA, then test the complete composition.
- Add generous whitespace around buttons.

### Friction-reducing microcopy beneath CTAs

Include accurate doubt-removing text near CTAs when it answers a real objection:

- "No credit card required"
- "Free 14-day trial"
- "Cancel anytime"
- "Set up in 2 minutes"

For B2C SaaS, where commitment anxiety is high and decisions are fast, this microcopy is often the difference between a signup and a bounce.

### Primary vs. secondary CTAs

- **Primary**: "Start Free Trial", "Get Started Free", "Try It Free" — the main conversion action.
- **Secondary** (optional): "Watch Demo", "See How It Works" — a lower-commitment alternative for visitors not ready to sign up. Display as a text link or ghost button, never as visually equal to the primary CTA.

---

## Social Proof Strategy

93% of consumers say reviews influence purchase decisions, yet 76.8% of marketers don't include social proof on landing pages. This is the most underutilized conversion lever.

### Three-layer approach

Combine these three types for maximum effect:

1. **Quantity proof** — "Join 14 million users", "500,000+ teams trust us". Appeals to herd instinct.
2. **Prestige proof** — Recognizable brand logos. Even 3–5 well-known logos build instant credibility.
3. **Quality proof** — Specific testimonials with names, photos, job titles, and measurable results. "Reduced costs by 40%" dramatically outperforms "Great product!"

### Placement pattern

- **Below hero**: Logo bar or user count (early credibility before the visitor invests effort).
- **Adjacent to feature sections**: Relevant testimonials that validate specific claims.
- **Directly above final CTA**: Strong social proof as last-moment persuasion.

### Data points

- Testimonials can increase conversions by 34%.
- Displaying reviews can boost conversion rates by up to 270%.
- Video testimonials convert 80% better than text.
- Purchase likelihood peaks at 4.0–4.7 star ratings, not 5.0. Perfect scores trigger skepticism.

### Handling no social proof (new products)

For products without users, testimonials, or logos yet:

- **Beta user quotes**: Even 3–5 beta testers providing feedback counts as legitimate social proof. Ask for specific results, not vague praise.
- **Founder credibility**: "Built by a team from [notable company]" or "From the creators of [previous product]".
- **Waitlist count**: "Join 2,000+ people on the waitlist" creates quantity proof before launch.
- **Advisory board or investor logos**: If you have notable advisors or investors, display their names/logos.
- **Industry credentials**: Certifications, compliance badges, security standards, or awards.
- **Media mentions**: Even a single mention in a recognized publication counts.
- **"As seen in" press logos**: Even podcast appearances or guest posts can be displayed.
- **Build-in-public transparency**: Share metrics openly ("We processed 1M requests this month") as an alternative form of credibility.
- **Guarantee as a trust substitute**: When you can't prove others trust you, reduce risk yourself — "30-day money-back guarantee, no questions asked."

If you truly have zero social proof of any kind, lean heavily on risk reversal (free trial, money-back guarantee) and product demonstration (interactive demo, video walkthrough) to compensate.

---

## Visual Hierarchy and Layout Principles

### Whitespace and breathing room

- Generous whitespace around CTAs and between sections improves both readability and perceived quality.
- Dense, cluttered pages signal low quality to visitors — even unconsciously.
- Each section should feel like a distinct "unit" with clear separation.

### Typography

- Body text: minimum 16px on all devices. No zooming should be required.
- Headlines: significantly larger than body (1.5–2x minimum). Weight and size should clearly establish hierarchy.
- Reading level of copy matters more than font choice — see the ux-copy skill's landing-page reference for details.

### Visual scanning patterns

Visitors scan in F-patterns and Z-patterns. Place the most important elements (headlines, CTAs, key visuals) along these natural scan paths:

- Top-left gets the most initial attention.
- Headlines and subheadlines get read; body text mostly gets skanned.
- Users read only about 20% of page text — make every word earn its place.

### Image and media guidance

- Use real product screenshots over illustrations whenever possible.
- Optimize all images (WebP/AVIF formats, lazy loading below-fold content).
- Avoid decorative images that don't communicate product value.
- Icons should supplement text, not replace it.

---

## Mobile Optimization

Mobile traffic and conversion vary sharply by acquisition channel and product. Treat any desktop/mobile gap as a prompt to inspect intent, performance, layout, forms, and measurement—not proof that viewport caused the gap.

### Mobile-specific requirements

- Two-column desktop layouts must collapse to single-column with headline and CTA visible without scrolling.
- Tap targets: WCAG AA uses a 24×24 CSS px floor or spacing provisions; favor 44–48 for primary actions and provide adequate separation.
- Forms: request minimal information on mobile. Collect additional data post-signup.
- Body text: 16px minimum, no zoom required.
- Sticky floating CTA: ensures the conversion action is always one tap away.
- Images and video: serve optimized responsive formats; prioritize and eagerly load the LCP/hero asset, and lazy-load appropriate below-fold media.
- Test on real devices, not just browser resize.

### The mobile conversion gap

The 2x desktop-to-mobile conversion gap is one of the largest opportunities in B2C SaaS. Closing even a fraction of this gap significantly increases total signups without additional traffic.

---

## Page Speed

Speed is the invisible multiplier under every other optimization.

### Key data

- Conversion rates drop 4.42% for every additional second of load time (0–5 seconds).
- Pages loading in 1 second convert 3x higher than those loading in 5 seconds.
- Bounce probability increases 32% from 1→3 seconds, 90% at 5 seconds.
- On mobile, 53% of visitors leave if a page takes more than 3 seconds.

### Target and tactics

Target Core Web Vitals at p75: **LCP ≤2.5s, INP ≤200ms, CLS ≤0.1**. The frontend-design skill owns the implementation checklist.

- Compress images (WebP/AVIF).
- Lazy load below-fold content.
- Minimize render-blocking JavaScript.
- Use a CDN.
- Minify CSS and JavaScript.
- Prioritize critical rendering path.

Speed should be the first optimization priority — it makes every subsequent design improvement more effective.

---

## B2C vs. B2B Design Differences

When designing for B2C specifically:

- **Shorter, more visual pages** — less text, larger product visuals, more whitespace.
- **Direct CTAs** — "Start Free Trial" and "Get Started" rather than "Book a Demo" or "Request a Quote."
- **Transparent pricing** — display plans openly. Don't hide behind "Contact Sales."
- **Urgency and scarcity** — countdown timers and limited offers are more effective when there's no buying committee requiring deliberation.
- **Self-serve onboarding** — minimize friction. No forms asking for company size, role, or phone number.
- **Emotional design** — use color, imagery, and copy that evoke feeling (relief, excitement, belonging) rather than pure rational persuasion.

When designing for B2B:

- Longer pages are acceptable — buying committees need more information.
- "Book a Demo" and "Talk to Sales" are valid primary CTAs for enterprise products.
- ROI calculators, comparison tables, and case studies carry more weight.
- Compliance and security badges (SOC2, GDPR, HIPAA) are more prominent.
- Pricing may legitimately require "Contact Sales" for custom enterprise tiers.

---

## Common Design Mistakes

1. **Multiple competing CTAs** — "Start Free Trial" and "Book a Demo" and "Download Whitepaper" all given equal visual weight. Pick one primary action.
2. **Stock photos instead of product visuals** — generic business imagery signals "we have nothing real to show you."
3. **Hidden pricing** — for B2C products, this is almost always a conversion killer.
4. **No social proof** — or social proof relegated to a single section near the bottom.
5. **Navigation overload** — too many header links that distract from the primary conversion path.
6. **Slow pages** — a 5-second load time negates most design optimizations.
7. **Ignoring mobile** — designing desktop-first and hoping it "works" on mobile.
8. **Feature dumps** — listing 15+ features instead of focusing on 3–6 that matter most.
9. **No visual hierarchy** — everything looks equally important, so nothing stands out.
10. **Asking too much too soon** — long forms, credit card required upfront, or forced account creation before the visitor sees value.

---

## Quick Checklist

Use this to audit any SaaS landing page:

- [ ] Can a visitor understand what the product does within 5 seconds?
- [ ] Is the headline clear, outcome-focused, and appropriate to the composition?
- [ ] Is there one clear, high-contrast primary CTA above the fold?
- [ ] Does the primary action recur at natural decision points without competing offers?
- [ ] Is there social proof (logo bar or user count) visible without scrolling?
- [ ] Do field Core Web Vitals meet LCP ≤2.5s, INP ≤200ms, and CLS ≤0.1 at p75?
- [ ] Is pricing transparent and easy to find?
- [ ] Are there specific, quantified testimonials (not vague praise)?
- [ ] Does the mobile experience show headline + CTA without scrolling?
- [ ] Is there friction-reducing microcopy near every CTA ("No credit card required")?
- [ ] Are objections addressed throughout the page, not just in the FAQ?
- [ ] Is the reading level accessible (5th–7th grade)?
