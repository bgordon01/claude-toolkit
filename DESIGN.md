---
name: Frontier
description: An editorial review desk for a Claude workflow that plans first and holds every write until you say go.
colors:
  crimson: "#AF144B"
  crimson-hover: "#870A3C"
  crimson-tint: "#FBF3F6"
  crimson-border: "#F5C0C6"
  ink: "#1A1A1A"
  ink-secondary: "#444444"
  ink-muted: "#6E6E6E"
  page: "#FFFFFF"
  surface: "#F8F9FA"
  surface-2: "#F2F3F5"
  line: "#DEE2E6"
  channel-improve: "#1A56A8"
  channel-bug: "#1B7F3A"
  channel-copy: "#D87000"
  channel-design: "#7B3FA0"
typography:
  display:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "clamp(44px, 6.4vw, 72px)"
    fontWeight: 700
    lineHeight: 1.02
    letterSpacing: "-0.025em"
  headline:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "clamp(32px, 4vw, 48px)"
    fontWeight: 700
    lineHeight: 1.08
    letterSpacing: "-0.02em"
  title:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "22px"
    fontWeight: 600
    lineHeight: 1.25
    letterSpacing: "-0.01em"
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.6
  label:
    fontFamily: "Fira Code, 'SF Mono', SFMono-Regular, Consolas, Menlo, monospace"
    fontSize: "12px"
    fontWeight: 500
    lineHeight: 1.4
    letterSpacing: "0.14em"
rounded:
  sm: "6px"
  md: "8px"
  lg: "10px"
  xl: "12px"
  pill: "9999px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "12px"
  lg: "16px"
  xl: "24px"
  "2xl": "32px"
  "3xl": "40px"
  gutter: "64px"
  section-y: "120px"
components:
  button-primary:
    backgroundColor: "{colors.crimson}"
    textColor: "{colors.page}"
    rounded: "{rounded.md}"
    padding: "14px 24px"
  button-primary-hover:
    backgroundColor: "{colors.crimson-hover}"
    textColor: "{colors.page}"
  button-secondary:
    backgroundColor: "{colors.page}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "14px 24px"
  gate-tag-write:
    backgroundColor: "{colors.crimson-tint}"
    textColor: "{colors.crimson}"
    rounded: "{rounded.pill}"
    padding: "5px 10px"
  card:
    backgroundColor: "{colors.page}"
    rounded: "{rounded.xl}"
    padding: "28px"
  codebox:
    backgroundColor: "{colors.surface}"
    rounded: "{rounded.md}"
    padding: "48px 18px 18px"
---

# Design System: Frontier

## Overview

**Creative North Star: "The Review Desk"**

Frontier is drawn as a reviewer's desk: work is staged, labelled, and held for approval before anything runs. The page reads like a precise editorial surface — a centred sheet bounded by visible hairline rules, sections ruled off from one another, and every command and status set in monospace so it reads as a record, not decoration. The whole system exists to make one promise legible: nothing changes your files until you say go. The hero panel freezes that moment — a step queued, tagged "Changes files · waits", and a single crimson **Go** — and the rest of the page restates it in quieter registers.

The mood is calm, confident, and editorial, closer to a well-set documentation site or a financial ledger than a typical dev-tool landing page. Density is high but never loud: hairline tables and tight mono labels carry a lot of information without shouting. Colour is rationed hard — crimson is the one saturated voice and it is spent on the single most important action in view.

This world explicitly rejects the "AI SaaS" defaults: no purple-to-blue gradients, no glows, no floating drop-shadowed cards, no three-up card rows. Depth comes from hairlines and tonal surfaces, not elevation.

**Key Characteristics:**
- A centred 1280px "shell" with visible left/right rules; sections divided by top hairlines.
- Crimson (`#AF144B`) as the only saturated hue, used sparingly.
- Inter for everything readable; Fira Code for every label, command, tag, and number.
- Flat by doctrine — hairlines and off-white surfaces instead of shadows.
- Exactly one bold element per view (the hero headline).

## Colors

A near-monochrome ink-on-white palette with a single crimson accent and a muted five-colour channel reserved for categorising commands.

### Primary
- **Crimson** (`#AF144B`): the one saturated voice. Used for the single most important mark in a view — the primary button, the active command (`/to-spec`), the "Go" action, mono eyebrows, and links. **Crimson-hover** (`#870A3C`) is its pressed/hover state. **Crimson-tint** (`#FBF3F6`) with **Crimson-border** (`#F5C0C6`) forms the soft pill behind a "Changes files · waits" tag.

### Neutral
- **Ink** (`#1A1A1A`): headlines, primary body text, table-key cells, the mark's outline.
- **Ink Secondary** (`#444444`): secondary body, table cells, mono labels.
- **Ink Muted** (`#6E6E6E`): captions, footnotes, window-chrome labels. Floor tone — passes AA on white (~4.7:1); keep it off tinted surfaces where it drops.
- **Page** (`#FFFFFF`): the sheet. **Surface** (`#F8F9FA`) and **Surface-2** (`#F2F3F5`): recessed fills for codeboxes, the active step, hover rows. **Line** (`#DEE2E6`): every hairline — borders, the shell rules, table and grid dividers.

### Tertiary — Command channel
A muted five-colour set that only ever appears as a small dot beside a text label, never as a fill: **Core** = crimson, **Improve** (`#1A56A8`), **Fix a bug** (`#1B7F3A`), **Copy** (`#D87000`), **Design** (`#7B3FA0`, drawn as an outline ring).

### Named Rules
**The One Red Column Rule.** Crimson is the single saturated hue, and at most one fully-saturated crimson mark appears per view (on the landing page, the "Go" button). Tints and the channel dots are muted on purpose so the one red mark keeps its weight.

## Typography

**Display / Body Font:** Inter (with `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`)
**Label / Mono Font:** Fira Code (with `'SF Mono', SFMono-Regular, Consolas, Menlo, monospace`)

**Character:** Inter carries everything meant to be read — a tight, modern grotesque with hard negative tracking on display sizes. Fira Code carries everything meant to be scanned as a record: eyebrows, step numbers, command names, status tags, and stats. The split is the system's signature.

### Hierarchy
- **Display** (700, `clamp(44px, 6.4vw, 72px)`, lh 1.02, tracking -0.025em): the hero headline only — the one bold element.
- **Headline** (700, `clamp(32px, 4vw, 48px)`, lh 1.08, tracking -0.02em): section titles.
- **Title** (600, 22px, lh 1.25): step names, card and block headings.
- **Body** (400, 16px, lh 1.6; ledes 18–20px): paragraphs and table text; measure ~60–65ch.
- **Label** (500, 12px Fira Code, tracking 0.14em, UPPERCASE): eyebrows (crimson) and mono section labels (ink-secondary). Stats and step numbers are Fira Code 500 at 32px / 28px.

### Named Rules
**The Mono Label Rule.** If it is a command, a status, a number, a step index, or a category, it is set in Fira Code. If it is a sentence, it is set in Inter. Nothing in between.

## Layout

A single centred **shell**, `max-width: 1280px`, bounded by 1px left/right rules so the sheet reads as a bounded surface. Content sits in a 64px inner gutter (`--gut`, 20px on mobile). Sections are stacked and separated by a 1px top rule, each with 120px of vertical breathing room (`--sec`, 72px on mobile). Composition favours asymmetry over equal columns: a 60/40 hero (text + gate panel), 40/60 and side-aligned splits, and dense full-width tables. All spacing is on a strict 4px grid.

## Elevation & Depth

**Flat by doctrine.** The system uses no shadows at all. Depth and separation come from three devices only: 1px hairlines (`#DEE2E6`), tonal recession (off-white `#F8F9FA` / `#F2F3F5` surfaces for codeboxes, the active step, hover rows), and the shell's structural side-rules. Shared-hairline grids (1px gaps over a line-coloured background) make groups of cells read as one ruled table rather than floating cards.

### Named Rules
**The Flat Rule.** No `box-shadow`, no glow, no gradient — ever. This is a house rule, not a preference. A surface that needs to stand out gets a hairline or a tonal fill, not elevation.

## Shapes

Gentle, consistent rounding: 6px (small inline marks), 8px (buttons, codeboxes, nav items), 10px (the active gate step), 12px (cards, tables, the hero panel, splits), and full pills (9999px) for status tags only. Borders are always 1px `#DEE2E6` — never a thick or coloured left-border accent. The brand mark is a chevron-and-cursor (`›`) inside a 7px-radius square.

## Components

### Buttons
- **Shape:** 8px radius (`{rounded.md}`), Inter 600 at 16px, 14px 24px padding.
- **Primary:** solid crimson (`#AF144B`) on white text; hover deepens to `#870A3C`. The arrow nudges right on hover.
- **Secondary:** white with a 1px `#DEE2E6` border and ink text; hover darkens the border to ink. One primary per action cluster, never two.

### Status tags (gate-tags)
- **Reads-only:** mono 11px uppercase in a pill with a 1px `#DEE2E6` border, ink-secondary text — quiet.
- **Changes files · waits:** the same pill in crimson-tint (`#FBF3F6`) with a crimson border (`#F5C0C6`) and crimson text — the visual cue for a write step.

### Cards / Containers
- **Corner:** 12px. **Background:** white. **Border:** 1px `#DEE2E6`. **No shadow.** Internal padding 28–32px. Grids of cells share hairlines (1px gaps on a line-coloured ground) so they read as a ruled table.

### Tables
- Dense, full-width, hairline-ruled. Header row: Fira Code 12px uppercase, ink-secondary, under a 1px ink bottom border. Rows separated by `#DEE2E6`; hover fills the row with `#F8F9FA`. On mobile they reflow to a two-column stacked grid.

### Codeboxes
- Off-white (`#F8F9FA`) surface, 8px radius, 1px border, Fira Code 14px. A mono "Copy" button sits top-right and confirms with "Copied" (crimson) or a `Press ⌘C` fallback.

### Navigation
- Sticky, white, 72px tall, 1px bottom rule. Brand mark + wordmark left; text links (Inter 500, 15px, ink-secondary → crimson on hover) and a primary Install button right. Below 768px the links collapse to a hamburger panel.

### The Gate Panel (signature)
A quiet window-chrome card that freezes the review moment: a title bar with three dots, two checked "done" steps, then an active step in a recessed `#F8F9FA` block — the queued `/to-spec` in crimson mono, a "Changes files · waits" tag, a "Go ahead?" prompt, and the lone saturated crimson **Go** button. It is `role="img"` (decorative), stays flat, and is the one place the whole promise is shown rather than told.

## Do's and Don'ts

### Do:
- **Do** keep crimson rare — one saturated crimson mark per view, on the single most important action.
- **Do** set every command, status, number, and category in Fira Code; everything readable in Inter.
- **Do** build structure from 1px hairlines and off-white surfaces, and keep the shell's side-rules visible.
- **Do** put every padding, margin, gap and size on the 4px grid.
- **Do** pair any channel colour with a text label; the dot alone never carries meaning.
- **Do** keep exactly one bold element per view (the hero headline on the landing page).

### Don't:
- **Don't** use shadows, glows, or gradients of any kind.
- **Don't** place three equal cards in a row; vary spans or use a dense ruled table.
- **Don't** reach for a purple-to-blue "AI" palette; the channel purple is a muted outline swatch, not a decorative gradient.
- **Don't** add a second saturated element that competes with the hero headline or the one crimson action.
- **Don't** use arbitrary off-grid values (`13px`, `p-[7px]`).
