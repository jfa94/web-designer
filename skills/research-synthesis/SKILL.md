---
name: research-synthesis
description: Synthesize existing user research into themes, insights, opportunities, segments, and recommendations. Trigger with "synthesize user research", "research synthesis", "analyze these interviews", "find themes in transcripts", "survey results", "usability test notes", "support feedback", NPS/CSAT responses, or app-review analysis. Use only when evidence already exists; do not use for research plans, interview guides, survey design, recruiting, or method selection.
---

# Research Synthesis

Turn supplied evidence into traceable findings.

If a file or path is provided, read it. If nothing is provided, ask for the research data. Do not invent participants, quotes, prevalence, or significance.

## Accepted Inputs

- Interview transcripts or notes
- Survey results (CSV or pasted data)
- Usability-test recordings, transcripts, or notes
- Support tickets and product feedback
- NPS/CSAT responses
- App-store or marketplace reviews
- Quantitative context tied to the qualitative sample

## Workflow

1. Inventory sources, participant/response count, dates, collection method, missing context, and known sample bias.
2. Normalize observations into atomic evidence with stable source IDs such as `P3`, `S17`, or `T42`. Preserve exact wording for quotes.
3. Separate observation from interpretation. "5 of 8 participants selected the wrong action" is an observation; "the labels are ambiguous" is an interpretation to test against evidence.
4. Affinity-map bottom-up: cluster related observations, name each cluster in participant language, split mixed clusters, and retain contradictory/outlier evidence.
5. State themes with prevalence as `X of Y` for the analyzed sample—never extrapolate it to a population without a valid quantitative design.
6. Convert themes to insights: evidence + why it matters + affected context. Then frame opportunities without prematurely prescribing one feature.
7. Rank opportunities by expected impact and effort, with confidence and dependencies visible.
8. Document limitations, researcher interpretation, missing segments, and open questions.

## Synthesis Lenses

- Affinity mapping: group atomic evidence by shared behavior, need, obstacle, or mental model; iterate labels until each cluster tells one coherent story.
- JTBD: phrase a synthesis-side job as "When [situation], I want to [motivation/action], so I can [outcome]." Support each clause from evidence; do not turn this into an interview guide.
- HEART: use Happiness, Engagement, Adoption, Retention, and Task Success to organize available quantitative context. Select only dimensions tied to a decision.
- Task framing: where data exists, report completion/success, time, error/recovery, abandonment, and support escalation alongside qualitative explanations.

Qualitative prevalence is not statistical significance. Analytics can show scale or behavior; it does not explain motivation without interpretation.

## Output

```markdown
## Research Synthesis: [Study]
**Method/sources:** [types] | **Analyzed:** [X participants/responses]
**Date range:** [range] | **Coverage/limits:** [scope]

### Executive Summary
[3–4 sentences: strongest findings, confidence, and product implication]

### Key Themes
#### Theme 1: [Name]
**Prevalence:** [X of Y in this sample] | **Confidence:** [High/Med/Low and why]
**Observation:** [What happened or was said]
**Supporting evidence:**
- "[Exact quote]" — P[n]
- [Behavior/metric] — [source ID]
**Interpretation:** [What the evidence may mean]
**Implication:** [Why it matters]
**Contradictions/outliers:** [Evidence that does not fit]

### Insights → Opportunities
| Insight and evidence IDs | Opportunity | Impact | Effort | Confidence/dependencies |
|---|---|---|---|---|

### Segments Identified
| Segment | Evidence-based characteristics | Needs/job | Observed size |
|---|---|---|---|

### Quantitative Framing
| HEART/task metric | Available signal | What it supports / cannot prove |
|---|---|---|

### Recommendations
1. **[Action/decision]** — [linked themes and evidence]

### Open Questions
- [What remains unknown]

### Methodology and Bias Notes
[Collection limits, sample gaps, analysis choices, and researcher influence]
```

## If Connectors Available

- Intercom/Productboard: retrieve relevant tickets, requests, and NPS evidence; preserve source IDs.
- Amplitude/Mixpanel: quantify observed behaviors and segment differences without treating correlation as cause.
- Notion: compare prior studies and publish only with permission.

## Tips

- Use direct quotes sparingly and never clean them until they mean something different.
- Keep negative cases; a tidy story is not necessarily a true one.
- Tie every recommendation back to evidence and name confidence explicitly.
