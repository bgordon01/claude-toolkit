---
name: Frontier
description: One warm colour field inside a ruled white column. Claude asks, plans and waits for your go.
colors:
  crimson: "#AF144B"
  crimson-deep: "#870A3C"
  crimson-tint: "#FBF1F4"
  field-blush: "#F4C6D3"
  field-ember: "#E8693A"
  field-scarlet: "#D42A3C"
  field-wine: "#8E0E3B"
  field-shadow: "#4A061C"
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
  gutter-mobile: "24px"
  gutter-desktop: "48px"
components:
  button-white:
    backgroundColor: "{colors.page}"
    textColor: "{colors.crimson}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "16px 24px"
  button-white-hover:
    backgroundColor: "{colors.crimson-tint}"
    textColor: "{colors.crimson-deep}"
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
    backgroundColor: "{colors.page}"
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
  hero-field:
    backgroundColor: "{colors.crimson}"
    textColor: "{colors.page}"
---

# Design System: Frontier

## Overview

**Creative North Star: "The Lit Field in the Ruled Column"**

Frontier is a white page held inside one hairline-ruled column, with a single warm, grainy colour field at the top. Everything below the field is paper and rules: sections are split by full-width hairlines, content sits in uneven two-part splits, and the only colour on the paper is crimson used as a signal (step numbers, the good path, the copied state). The field is the statement; the rest of the page is quiet on purpose.

The field is built from layered radial masses of crimson, scarlet, ember orange and a pale blush top-right, darkened toward the bottom-left where the white headline sits, with a film grain over it that drifts slowly. It reads as warm light, never as a tech gradient: there is no blue or violet anywhere in the system. Type is Inter throughout, heavy and tightly tracked at display size; Fira Code appears only where the reader is looking at something they type or count.

The system is flat. No shadows, no glows, no cards. Depth comes from the field itself and from the 1px rules that frame the column and divide it.

**Key Characteristics:**
- One colour field per page, at the top, inside the frame; white page everywhere else.
- A 1200px column with hairline side rules; sections divided by full-width hairlines.
- Inter for all words, Fira Code only for commands, numbers and the start-here bar.
- Crimson as a signal on paper, never as a large fill outside the field.
- Flat surfaces: no box-shadow anywhere; light theme only.
- Motion limited to a slow grain drift, one hero fade-up and the copy state.

## Colors

A warm, single-hue world: crimson and its neighbours inside the field, warm-tinted greys on white paper outside it.

### Primary
- **Signal Crimson** (`crimson`): the brand accent. Base fill of the field; text colour of the white primary button; step and install numbers; the good-path markers and result line in the before/after; the copied state; the start-here bar text; focus rings; text selection.
- **Pressed Crimson** (`crimson-deep`): hover text on the white button. The brand hover value.
- **Crimson Wash** (`crimson-tint`): the faint pink surface behind the copied chip, the start-here bar, and the white button on hover.

### Secondary (field masses only)
These live only inside the colour field's layered gradient. They are not UI colours and never appear on the white page.
- **Blush** (`field-blush`): the pale mass top-right, placed away from the text.
- **Ember** (`field-ember`): the warm orange mass at upper centre.
- **Scarlet** (`field-scarlet`): the red mass at upper left.
- **Wine** (`field-wine`): the deep mass at the right edge.
- **Field Shadow** (`field-shadow`): the darkening toward the bottom-left that seats the white headline and keeps it legible.

### Neutral
- **Ink** (`ink`): headings, strong text, table first column, chip text.
- **Soft Ink** (`ink-soft`): body copy, ledes, nav links, table cells.
- **Muted Ink** (`ink-muted`): bylines, table headers, tags, fine print, the bad-path numbers.
- **Paper** (`page`): the page and the top bar (the bar is 96% white over content when sticky).
- **Chip Grey** (`chip`): command-chip fill and nav-link hover.
- **Hairline** (`rule`): every frame rule, section rule, table rule and chip/tag border.

### Named Rules
**The One Field Rule.** The layered crimson field appears once per page, at the top, filling the column width. Its masses (blush, ember, scarlet, wine, field shadow) are never used as UI colours elsewhere.

**The Warm Light Rule.** Gradients exist only inside the field, and only in warm hues. No purple-to-blue gradients, no blue or violet anywhere in the system.

**The Crimson Signal Rule.** On white, crimson marks things to act on or follow: numbers, the good path, copied state, the start-here bar, focus. It is text and thin borders, never a large block fill outside the field.

**The Light Only Rule.** Light theme only (`color-scheme: light`). No dark mode, no theme switch.

## Typography

**Display Font:** Inter (with -apple-system, Segoe UI, Roboto, sans-serif)
**Body Font:** Inter (same stack)
**Label/Mono Font:** Fira Code (with ui-monospace, SFMono-Regular, Menlo, monospace)

**Character:** One sans family doing everything from an 800-weight, tightly tracked display down to 12px tags; the monospace is reserved for literal things you type or count, so it reads as "this is a command".

### Hierarchy
- **Display** (800, clamp 48–96px, 0.98, -0.035em): the hero headline on the field, white, max 11ch, balanced wrap.
- **Hero sub** (400, clamp 18–22px, 1.5): the one-line sub under the display, white at 92%.
- **Headline** (700, clamp 32–48px, 1.08, -0.025em): section titles, max 20ch, balanced.
- **Headline small** (700, clamp 24–32px, 1.15, -0.02em): a secondary statement inside a section (the "say go" line), max 16ch.
- **Title** (600, 24px, 1.25, -0.015em): step names.
- **Title small** (600, 20px, 1.3, -0.01em): before/after column heads; the wordmark.
- **Lede** (400, 18px, 1.6): one line under each section headline, Soft Ink, max 56ch. Install steps also use 18px.
- **Body** (400, 16px, 1.6): paragraphs and table text, Soft Ink, 46–64ch.
- **Fine / Nav** (14px): footnotes and footer at 400; top-bar links at 500.
- **Label** (500, 13px, 1.4): table column headers, Muted Ink, sentence case. The byline is 400 at 13px.
- **Tag** (500, 12px, 1): bordered honesty labels such as "Example".
- **Mono command** (Fira 400, 14px, 1.5): command chips.
- **Mono line** (Fira 400, 15px, 1.5): the quoted request and "Then say start here".
- **Mono number** (Fira 500, 13–16px): step numbers (15px crimson), list counters (13px), star counts (16px, tabular).
- **Mono bar** (Fira 500, 16px, 1.2): the "Copy: start here" bar.

### Named Rules
**The Mono Means Command Rule.** Fira Code is used only for commands, step and list numbers, numeric table values, quoted prompts and the start-here bar. Headlines, body, labels, tags and nav are always Inter.

**The Bare Headline Rule.** Headlines stand alone. No eyebrow or kicker line above a headline; a lede sits below it instead.

**The Plain Words Rule.** No hype in any UI text: never revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, or "unlock your potential". Lead with the mechanism and a number.

## Layout

The page is a single centred column, 1200px max, with 1px Hairline rules on its left and right edges running the full height. Horizontal gutters are 24px on mobile and 48px from 768px. Sections are separated by a full-width 1px top rule and padded 96px top and bottom (64px below 768px).

Inside sections, content splits unevenly: before/after and the "say go" block use 5fr / 7fr from 900px; each step uses a 48px number column, 4fr text and 6fr commands. Columns are divided by a vertical hairline, not by gaps between boxes. Lists (steps, install, table rows) are separated by bottom hairlines with 24–32px vertical padding. Below 640px the table reflows into stacked rows.

The top bar is 72px, sticky, with a bottom rule. Its content sits on that rule: Brent's cut-out photo stands on the bar's bottom edge, with wordmark and byline beside it and nav right-aligned. The hero field fills the first screen on mobile (100svh minus the bar) and is at least 640px from 768px, capped at 880px, with content bottom-aligned.

Breakpoints: 640px, 768px, 900px.

### Named Rules
**The 4px Grid Rule.** Every padding, margin and gap is a multiple of 4px (observed scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 96). No arbitrary values.

**The Ruled Frame Rule.** Structure is drawn with 1px Hairline rules: column edges, section tops, column dividers, list rows. Content never sits in cards.

**The Uneven Split Rule.** Side-by-side content uses unequal spans (5/7, 4/6). No rows of three equal cards, ever.

**The One Bold Element Rule.** Each view has exactly one statement element, and on this page it is the colour field with its display headline. Everything below stays in neutral ink on white.

## Elevation & Depth

The system is completely flat: no element has a box-shadow. Depth comes from two things only, the colour field (light and grain) and the hairline rules that frame and divide the paper. The sticky top bar separates from scrolling content with its bottom rule and a 96% white fill, not a shadow or blur.

### Named Rules
**The Flat Paper Rule.** No shadows, no glows, no floating cards. If something needs separating, give it a hairline rule.

## Shapes

Corners are softly rounded and small: 12px for the primary button and the start-here bar, 8px for command chips, nav links and the skip link, 6px for tags, 4px for the focus ring. The column, sections and table are square-edged and defined by rules, not by rounded containers. Borders are always 1px; the only non-solid line is the dashed hairline above each before/after result. Icons are inline SVG strokes (the arrow at 16px, the mark at 24px), never glyph characters.

## Components

### Buttons
Confident and quiet: a white slab on the warm field.
- **Shape:** gently rounded (12px).
- **Primary (white on field):** Paper fill, Signal Crimson text, Inter 600 16px, 16px 24px padding, trailing 16px arrow.
- **Hover:** fill shifts to Crimson Wash and text to Pressed Crimson over 0.2s; the arrow moves 4px right.
- The white button is the only filled button in the system; it lives on the field.

### Chips (command chips)
Literal commands you tap to copy.
- **Style:** Chip Grey fill, 1px Hairline border, Ink text in Fira Code 14px, 8px radius, 8px 12px padding. Wraps in a flex row with 8px gaps.
- **Hover:** border darkens slightly and fill deepens a step.
- **Copied:** on tap the text becomes "Copied" with a crimson border, Crimson Wash fill and crimson text for 1.6s, then restores. Each chip carries an aria-label of "Copy" plus the command.

### Start-here bar
The page's second call to copy.
- **Style:** full width up to 560px, Crimson Wash fill, pale crimson border, crimson Fira Code 500 16px, 12px radius, 20px 24px padding, trailing arrow.
- **Hover:** border turns full crimson. On tap the label reads "Copied. Paste it into Claude" for 1.6s.

### Tags
- **Style:** Inter 500 12px, Muted Ink, 1px Hairline border, 6px radius, 4px 8px padding. Labels illustrative content honestly (for example "Example"), placed beside a heading, never above it.

### Navigation
- **Top bar:** 72px sticky bar, items bottom-aligned on the bar's rule. Wordmark is Inter 600 20px with the 24px mark; byline Inter 13px Muted Ink.
- **Links:** Inter 500 14px Soft Ink, 8px 12px padding, 8px radius; hover adds Chip Grey fill and Ink text. Below 640px only Install remains.
- **Footer:** Inter 14px Muted Ink, links underlined in Soft Ink.
- **Text links:** inherit their surrounding colour, underlined at 1px with a 4px offset.

### Numbered lists
- **Steps:** a 48px Fira Code crimson number column, an Inter title and short body, then the step's command chips; each row ruled at the bottom.
- **Trails (before/after):** two-digit Fira Code counters in Muted Ink on the bad path and crimson on the good path; the final "waits for your go" item and the good result line are crimson.
- **Install:** two-digit crimson Fira Code counters with Inter 18px steps, ruled rows.

### Data table
Ruled rows only, no fills or zebra stripes. Headers Inter 500 13px Muted Ink; first column Ink 600; numeric column Fira Code tabular. Reflows to stacked grid rows below 640px.

### Colour field (signature)
The hero. Layered radial masses over a crimson base (see Colors), with an SVG fractal-noise grain at 70% opacity in soft-light blend. The grain drifts in 8 steps over 24s and stops under reduced motion. Headline, sub and actions fade up 12px over 0.9s, staggered by 0.08s, and do not animate under reduced motion. Nothing else on the page animates.

## Do's and Don'ts

### Do:
- **Do** keep exactly one colour field per page, at the top, inside the ruled frame, with text seated on its darker bottom-left.
- **Do** separate sections and list rows with 1px Hairline rules and divide columns with a vertical rule.
- **Do** split side-by-side content unevenly (5fr / 7fr, or 48px / 4fr / 6fr).
- **Do** keep every padding, margin and gap on the 4px grid.
- **Do** use Fira Code for anything the reader types or counts, and Inter for everything else.
- **Do** use crimson on white only as a signal: numbers, the good path, copied state, focus, the start-here bar.
- **Do** make every command a tap-to-copy chip with a visible Copied state.
- **Do** pause the grain and the fade-up under reduced motion.

### Don't:
- **Don't** use purple-to-blue gradients, or any blue or violet; gradients exist only inside the warm field.
- **Don't** add glows (blurred colour halos behind buttons or text) or any box-shadow, floating or offset.
- **Don't** put content in cards, and never set three equal cards in a row.
- **Don't** add a second bold element below the field; section headlines stay in Ink on white.
- **Don't** put an eyebrow or kicker above a headline.
- **Don't** set headlines, labels or tags in Fira Code.
- **Don't** use the field masses (blush, ember, scarlet, wine) as UI colours on the white page.
- **Don't** add a dark theme or a theme switch.
- **Don't** write revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer or "unlock your potential" in any UI text.
