---
name: Frontier
description: A clean white page in a hairline-ruled column. Claude asks, plans and waits for your go.
colors:
  crimson: "#AF144B"
  crimson-deep: "#870A3C"
  crimson-tint: "#FBF1F4"
  ink: "#1A1A1A"
  ink-soft: "#474244"
  ink-muted: "#6B6567"
  page: "#FFFFFF"
  chip: "#F4F2F3"
  rule: "#E4E1E2"
typography:
  display:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "clamp(48px, 9vw, 96px)"
    fontWeight: 800
    lineHeight: 0.98
    letterSpacing: "-0.035em"
  hero-sub:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "clamp(18px, 2.2vw, 22px)"
    fontWeight: 400
    lineHeight: 1.5
  headline:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "clamp(32px, 4.4vw, 48px)"
    fontWeight: 700
    lineHeight: 1.08
    letterSpacing: "-0.025em"
  headline-sm:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "clamp(24px, 3vw, 32px)"
    fontWeight: 700
    lineHeight: 1.15
    letterSpacing: "-0.02em"
  title:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "24px"
    fontWeight: 600
    lineHeight: 1.25
    letterSpacing: "-0.015em"
  title-sm:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "20px"
    fontWeight: 600
    lineHeight: 1.3
    letterSpacing: "-0.01em"
  lede:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "18px"
    fontWeight: 400
    lineHeight: 1.6
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.6
  button:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "16px"
    fontWeight: 600
    lineHeight: 1
  fine:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.5
  nav:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "14px"
    fontWeight: 500
    lineHeight: 1
  label:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "13px"
    fontWeight: 500
    lineHeight: 1.4
  tag:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif"
    fontSize: "12px"
    fontWeight: 500
    lineHeight: 1
  mono-command:
    fontFamily: "Fira Code, ui-monospace, SFMono-Regular, Menlo, monospace"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.5
  mono-line:
    fontFamily: "Fira Code, ui-monospace, SFMono-Regular, Menlo, monospace"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.5
  mono-number:
    fontFamily: "Fira Code, ui-monospace, SFMono-Regular, Menlo, monospace"
    fontSize: "15px"
    fontWeight: 500
    lineHeight: 1.6
  mono-bar:
    fontFamily: "Fira Code, ui-monospace, SFMono-Regular, Menlo, monospace"
    fontSize: "16px"
    fontWeight: 500
    lineHeight: 1.2
rounded:
  focus: "4px"
  tag: "6px"
  sm: "8px"
  md: "12px"
spacing:
  "1": "4px"
  "2": "8px"
  "3": "12px"
  "4": "16px"
  "5": "20px"
  "6": "24px"
  "8": "32px"
  "10": "40px"
  "12": "48px"
  "16": "64px"
  "24": "96px"
  "28": "112px"
  "32": "128px"
  gutter-mobile: "24px"
  gutter-desktop: "48px"
components:
  button-primary:
    backgroundColor: "{colors.crimson}"
    textColor: "{colors.page}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "16px 24px"
  button-primary-hover:
    backgroundColor: "{colors.crimson-deep}"
    textColor: "{colors.page}"
  chip:
    backgroundColor: "{colors.chip}"
    textColor: "{colors.ink}"
    typography: "{typography.mono-command}"
    rounded: "{rounded.sm}"
    padding: "8px 12px"
  chip-copied:
    backgroundColor: "{colors.crimson-tint}"
    textColor: "{colors.crimson}"
  startbar:
    backgroundColor: "{colors.crimson-tint}"
    textColor: "{colors.crimson}"
    typography: "{typography.mono-bar}"
    rounded: "{rounded.md}"
    padding: "20px 24px"
  tag:
    textColor: "{colors.ink-muted}"
    typography: "{typography.tag}"
    rounded: "{rounded.tag}"
    padding: "4px 8px"
  nav-link:
    textColor: "{colors.ink-soft}"
    typography: "{typography.nav}"
    rounded: "{rounded.sm}"
    padding: "8px 12px"
  nav-link-hover:
    backgroundColor: "{colors.chip}"
    textColor: "{colors.ink}"
  top-bar:
    backgroundColor: "{colors.page}"
    height: "72px"
---

# Design System: Frontier

## Overview

**Creative North Star: "The Ruled White Column"**

Frontier is a clean white page held inside one 1200px column with hairline side rules. Sections are split by full-width hairlines, never boxed into cards, and side-by-side content sits in uneven splits. The page reads like a well-kept notebook: ruled, numbered, quiet.

The one bold element is the display headline at the top: Inter 800, tightly tracked, set in Ink on white, with its last word in Crimson. Everything after it stays restrained. Crimson appears on white as a signal: the one filled primary button, step and list numbers, the good path in the before/after, the copied state and the focus ring. Fira Code appears only where the reader is looking at something they type or count.

The system is flat. No gradients, no grain, no shadows, no glows. Structure comes from 1px Hairline rules and white space; depth is not simulated.

**Key Characteristics:**
- White page everywhere; a 1200px column with hairline side rules.
- Sections divided by full-width hairlines; content never sits in cards.
- One bold element per view: the display headline, with one word in Crimson.
- Inter for all words; Fira Code only for commands, numbers, quoted prompts and the start-here bar.
- Crimson as a signal on white; the primary button is its only solid fill.
- Flat surfaces: no box-shadow, no gradients; light theme only.
- Motion limited to one hero fade-up, the copy state and short hover transitions.

## Colors

A white-and-ink palette with one crimson accent and nothing else.

### Primary
- **Signal Crimson** (`crimson`): the primary button fill, the word "code." in the hero headline, step and install numbers, the good-path counters and result line, the copied state, the start-here bar label, text selection and the 2px focus ring.
- **Pressed Crimson** (`crimson-deep`): primary button hover only.
- **Crimson Wash** (`crimson-tint`): the start-here bar background and the copied-chip background. Never a section or page background.

### Neutral
- **Ink** (`ink`): headlines, display, strong text, table first column, chip text.
- **Soft Ink** (`ink-soft`): the hero sub, ledes, body copy, nav links, quoted prompts.
- **Muted Ink** (`ink-muted`): byline, tags, table headers, footnotes, footer, the before-path counters.
- **Paper** (`page`): the page and the top bar (at 96% opacity so content passes faintly under it on scroll).
- **Chip Grey** (`chip`): command-chip fill and nav-link hover fill.
- **Hairline** (`rule`): every rule, the column edges and chip and tag borders.

### Named Rules
**The Crimson Signal Rule.** On white, crimson marks things to act on or follow: the primary button, one word of the headline, numbers, the good path, the copied state, the start-here bar, focus. The primary button is the only solid crimson block; nothing else gets a crimson fill.

**The No Gradient Rule.** No purple-to-blue gradients, no blue or violet anywhere in the system, and no gradients at all on this page.

**The Light Only Rule.** Light theme only (`color-scheme: light`). No dark mode, no theme switch.

## Typography

**Display Font:** Inter (with -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif)
**Body Font:** Inter (same stack)
**Label/Mono Font:** Fira Code (with ui-monospace, SFMono-Regular, Menlo, monospace)

**Character:** One sans family carrying everything from an 800-weight, tightly tracked display down to 12px tags, with Fira Code reserved for the literal text a reader types or counts.

### Hierarchy
- **Display** (800, clamp 48–96px, 0.98, -0.035em): the hero headline only, max 11ch, balanced wrap, Ink with one Crimson word.
- **Hero Sub** (400, clamp 18–22px, 1.5): one line under the display in Soft Ink, max 60ch.
- **Headline** (700, clamp 32–48px, 1.08, -0.025em): section titles in Ink, max 20ch.
- **Headline Small** (700, clamp 24–32px, 1.15, -0.02em): a secondary statement inside a section, max 16ch.
- **Title** (600, 24px, 1.25): step names.
- **Title Small** (600, 20px, 1.3): before/after column heads and the wordmark.
- **Lede** (400, 18px, 1.6): one line under each section headline, max 56ch; install rows.
- **Body** (400, 16px, 1.6): paragraphs and table text, 46–64ch.
- **Button** (600, 16px, 1): the primary button label.
- **Fine / Nav / Label / Tag** (14px 400 / 14px 500 / 13px 500 / 12px 500): footnotes and footer, top-bar links, table headers in sentence case, bordered honesty tags.
- **Mono** (Fira Code 14–16px, 400–500): command chips, step and list numbers (decimal-leading-zero), quoted prompts, "Then say start here", tabular star counts, the start-here bar.

### Named Rules
**The Mono Means Command Rule.** Fira Code is used only for commands, step and list numbers, numeric table values, quoted prompts, "Then say start here" and the start-here bar. Headlines, body, labels, tags and nav are always Inter.

**The Bare Headline Rule.** Headlines stand alone. No eyebrow or kicker line above a headline; a lede sits below it instead. A tag may sit beside a heading on its baseline, never above it.

**The Plain Words Rule.** No hype in any UI text: never revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, or "unlock your potential". Lead with the mechanism and a number.

## Layout

One centred column, max 1200px, with 1px Hairline rules on its left and right edges and a minimum height of the viewport. Inner gutter is 24px, 48px from 768px. A 72px sticky top bar sits at the top of the column with a bottom rule; its contents (Brent's cut-out photo, the wordmark and byline, the links) are all seated on that rule, the photo flush to it and the text 16px above it.

The hero is white, padded 96px top and bottom (128px / 112px from 768px), and holds text only: display, sub, then the actions row (primary button and the mono "Then say start here") with 16px / 24px gaps. Each following section opens with a full-width top rule and is padded 96px (64px below 768px). Inside sections, lists are ruled rows (top rule on the list, bottom rule on every row) and paired content uses unequal spans: 5fr / 7fr for before/after and the review-gate statement, 48px / 4fr / 6fr for step rows from 900px. Below those widths everything stacks to one column, with a horizontal rule replacing the vertical divider. Below 640px the table collapses to stacked rows.

### Named Rules
**The 4px Grid Rule.** Every padding, margin and gap is a multiple of 4px (observed scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 96, 112, 128). No arbitrary values.

**The Ruled Frame Rule.** Structure is drawn with 1px Hairline rules: column edges, section tops, column dividers, list and table rows. Content never sits in cards.

**The Uneven Split Rule.** Side-by-side content uses unequal spans (5/7, 4/6). No rows of three equal cards, ever.

**The One Bold Element Rule.** Each view has exactly one statement element; on this page it is the display headline. Section headlines below it stay in Ink at headline scale, and nothing else gets display treatment.

## Elevation & Depth

Flat. There is no box-shadow, gradient, blur or glow anywhere in the build. Separation is done with 1px Hairline rules and with space. The sticky top bar is Paper at 96% opacity with a bottom rule, not a shadow.

### Named Rules
**The Flat Paper Rule.** No shadows, no glows, no floating cards. If something needs separating, give it a hairline rule.

## Shapes

Mostly square. Rules and the column are hard-edged; rounding is reserved for interactive or labelled objects: focus ring (`rounded.focus`), tags (`rounded.tag`), chips, nav links and the skip link (`rounded.sm`), the primary button and the start-here bar (`rounded.md`). The mark is a rounded square with a crimson chevron and cursor. Icons are inline 16px stroked SVG arrows (1.8 stroke, round caps).

## Components

### Buttons
Confident and plain: one filled button per view.
- **Shape:** gently rounded (`rounded.md`).
- **Primary:** Signal Crimson fill, white label, 16px / 24px padding, a 16px arrow 8px after the label.
- **Hover / Focus:** fill shifts to Pressed Crimson over 0.2s; the arrow nudges 4px right. Focus is the global 2px crimson outline at 4px offset.
- **Secondary:** none. The alternative action beside the button is a mono line, not a second button.

### Chips
- **Style:** Fira Code 14px in Ink on Chip Grey with a Hairline border, 8px / 12px padding. Every command is a chip, and every chip copies on tap.
- **State:** hover darkens border and fill slightly; on copy the label becomes "Copied" in Crimson on Crimson Wash with a Crimson border for 1.6s, then restores.

### Tags
- **Style:** 12px Inter in Muted Ink, Hairline border, no fill, 4px / 8px padding. Used for honesty labels such as "Example", placed beside a heading on its baseline.

### Navigation
- **Top bar:** 72px, sticky, Paper at 96% with a bottom Hairline. Left: photo, mark, "Frontier" (20px 600) and "by Brent Gordon" (13px Muted Ink). Right: links in 14px 500 Soft Ink, 8px / 12px padding; hover goes Ink on Chip Grey. Below 640px only "Install" remains.
- **Footer:** a ruled row of 14px Muted Ink text with Soft Ink links.

### Start-here Bar
The one phrase every visitor needs, as a tap-to-copy bar: Fira Code 16px 500 in Crimson on Crimson Wash, a pale crimson border, `rounded.md`, 20px / 24px padding, up to 560px wide, with a 16px arrow at the right. Hover sets the border to Crimson; copying swaps the label to "Copied. Paste it into Claude" for 1.6s.

### Ruled Step Row
A numbered row: Crimson mono number, then title and body, then its command chips, split 48px / 4fr / 6fr from 900px and ruled at the bottom. Counters elsewhere (before/after trails, install steps) use the same decimal-leading-zero mono numbers.

### Ruled Table
Rows divided by hairlines only; 13px Muted Ink headers, Ink first column at 600, Soft Ink body, mono tabular numbers. Links are Ink with a 1px underline at 4px offset.

## Do's and Don'ts

### Do:
- **Do** keep the page white inside the 1200px ruled frame, with the display headline as the one bold element.
- **Do** separate sections and list rows with 1px Hairline rules and divide columns with a vertical rule.
- **Do** split side-by-side content unevenly (5fr / 7fr, or 48px / 4fr / 6fr).
- **Do** keep every padding, margin and gap on the 4px grid.
- **Do** use Fira Code for anything the reader types or counts, and Inter for everything else.
- **Do** use crimson on white only as a signal: the primary button, one headline word, numbers, the good path, copied state, focus, the start-here bar.
- **Do** make every command a tap-to-copy chip with a visible Copied state.
- **Do** turn off the hero fade-up and smooth scrolling under reduced motion.

### Don't:
- **Don't** use purple-to-blue gradients, any gradient, or any blue or violet.
- **Don't** add glows (blurred colour halos behind buttons or text) or any box-shadow, floating or offset.
- **Don't** put content in cards, and never set three equal cards in a row.
- **Don't** add a second bold element; section headlines stay in Ink at headline scale.
- **Don't** put an eyebrow or kicker above a headline.
- **Don't** set headlines, labels or tags in Fira Code.
- **Don't** give anything but the primary button a solid crimson fill.
- **Don't** add a dark theme or a theme switch.
- **Don't** write revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer or "unlock your potential" in any UI text.
