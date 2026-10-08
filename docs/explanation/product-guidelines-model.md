# The Product Guidelines Model

## Guidelines, not a component library

A component library gives a team building blocks. It does not tell anyone which block to use, when not to use it, or what behaviour users can rely on. `design-system` produces the missing part: an internal set of human interface guidelines. Every pattern answers three questions: *Why this pattern? What behaviour does it promise? How is that verified?*

Storybook, zeroheight, Notion pages, and design files count as evidence for the guidelines, not as the guidelines themselves. The guidelines are markdown files in the product's own repository, written for agents first and people second. The consuming skills read them before deciding anything.

## Infer first, then interview

The skill does not start with a blank questionnaire. It first takes an inventory of the code: tokens, components, stories, call sites grouped by purpose, hardcoded values, and breakpoints. From that it writes **Inferred** rules wherever practice is consistent (at least 3 uses, at least 75% of them alike) and **Open** items wherever practice is split. Only then does it interview, asking just the questions the code cannot answer.

This has two effects:

- The interview stays short and grounded. Each question shows what the code does (counts and paths), offers two to four options, and gives a recommendation. Inferred rules are confirmed in batches of up to five ("Which are wrong?"), not one at a time.
- Existing practice is not mistaken for policy. An Inferred rule is followed, but flagged as unconfirmed until an owner agrees. A majority practice that breaks a Requirement becomes an Open item, never an Inferred rule. Being common does not make a practice correct.

The interview order puts **behavioural foundations before visual ones**: terminology, navigation, saving models, feedback, and recovery come before colour and type. The reasoning given in the skill is that standardising colours and components while those questions are still open standardises how the product looks without standardising how it behaves.

## Why every answer is written immediately

After each answer, the skill writes the decision to its page before it asks the next question. The guidelines are the only record. There is no state file, and a later session rebuilds the gap map from the pages alone. A session can therefore stop at any point without losing work. A new session, or a different agent, picks up exactly where the files leave off. Decisions are also recorded while their context is fresh.

## Strength, status, and precedence

Two independent axes describe each rule:

- **Strength** says how binding the rule is. *Must* is a Requirement, either an adopted standard such as WCAG 2.2 AA or a hard product constraint. *Should* is a Default that permits a registered exception.
- **Status** says how settled the rule is: Confirmed (an owner agreed), Inferred (observed, not agreed), or Open (undecided).

Consuming skills apply: Requirement > Confirmed > Inferred > the skill's own guidance. The plugin's generic advice is deliberately last. It applies only where the product has not decided, and even then the decision is listed as an `--extend` candidate, so gaps are visible.

Severity is kept separate from both axes. Severity measures the impact on users, while strength measures how binding the rule is. Every skill that rates findings reports the two separately.

## Exceptions, variants, and revisions

Without a clear distinction, every inconsistency turns into either an exception or a forbidden deviation. The model separates three responses:

- An **exception** handles a special case. It lives only in the register in `governance.md`, with an owner and a review date. When it expires, the case becomes a defect again.
- A **variant** handles a recurring case. It is added to the component or pattern.
- A **rule revision** corrects a flawed default. The old rule gets a tombstone and the new one a new ID.

A departure from a Requirement is never a Default. It goes to the register or it is not adopted. This is also why `--handoff` lists a Requirement deviation as a required fix, never as an exception request.

## Stable IDs and tombstones

Consuming skills cite rule IDs (`BTN-003`) in their outputs, and handoff specs and audit findings cite them too. If an ID were reused or a rule rewritten in place, those citations would silently start pointing at a different decision. So IDs are never reused, a removed or rewritten rule leaves a tombstone, and its replacement gets a new number. A rejected Inferred rule is tombstoned rather than edited, and a follow-up question decides what replaces it.

## Self-contained pages

Each guideline page states its decisions in full and never mentions this plugin or its skills. As a result, the guidelines can be read and followed without the plugin. A policy is defined once, on the page that owns it, and cited by ID everywhere else.

## Greenfield products

With no existing system, the skill defines **roles, not values**. It settles what the brand colour means or which text roles exist, and leaves the specific values Open with an owner. In the same spirit, the format requires proposed values and illustrative numbers to be labelled as Defaults, not as research findings.
