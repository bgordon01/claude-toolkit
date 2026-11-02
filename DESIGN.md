---
name: Frontier
description: Transit-map landing for a Claude workflow that plans first and holds the doors until you say go.
colors:
  ground: "#FFFFFF"
  ground-2: "#F2F2F0"
  ink: "#121212"
  muted: "#555551"
  rule: "#DEDEDA"
  line: "#C2410C"
  line-text: "#B13A09"
  sign: "#121212"
  sign-2: "#242422"
  sign-muted: "#B4B4AE"
  sign-line: "#F28C4B"
  blue: "#1F5FAD"
  green: "#1E7F4F"
  yellow: "#A87A00"
typography:
  display:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "clamp(44px, 6vw, 72px)"
    fontWeight: 800
    lineHeight: 1
    letterSpacing: "-0.02em"
  headline:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "clamp(32px, 3.6vw, 44px)"
    fontWeight: 800
    lineHeight: 1.1
    letterSpacing: "-0.02em"
  station:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "22px"
    fontWeight: 900
    lineHeight: 1
    letterSpacing: "-0.02em"
  title:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "20px"
    fontWeight: 800
    lineHeight: 1.2
  body:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "17px"
    fontWeight: 400
    lineHeight: 1.55
  lede:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "19px"
    fontWeight: 400
    lineHeight: 1.55
  label:
    fontFamily: "Overpass, ui-sans-serif, system-ui, sans-serif"
    fontSize: "15px"
    fontWeight: 800
    lineHeight: 1.4
  mono:
    fontFamily: "Overpass Mono, ui-monospace, SFMono-Regular, Menlo, monospace"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.6
rounded:
  xs: "4px"
  sm: "8px"
  md: "12px"
  lg: "16px"
  pill: "999px"
spacing:
  "1": "4px"
  "2": "8px"
  "3": "12px"
  "4": "16px"
  "6": "24px"
  "8": "32px"
  "10": "40px"
  "16": "64px"
  "20": "80px"
  "24": "96px"
  "32": "128px"
  "48": "192px"
components:
  button-primary:
    backgroundColor: "{colors.line}"
    textColor: "{colors.ground}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: "12px 24px"
    height: "52px"
  button-quiet:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    padding: "12px 24px"
    height: "52px"
  button-quiet-hover:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
  button-header:
    backgroundColor: "{colors.line}"
    textColor: "{colors.ground}"
    rounded: "{rounded.pill}"
    padding: "8px 20px"
    height: "40px"
  button-go:
    backgroundColor: "{colors.sign-line}"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    padding: "12px 24px"
    height: "52px"
  signage-band:
    backgroundColor: "{colors.sign}"
    textColor: "{colors.ground}"
    height: "64px"
  departure-board:
    backgroundColor: "{colors.sign}"
    textColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "28px 40px"
  notice:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "24px"
  boarding-path:
    backgroundColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "32px"
  copy-field:
    backgroundColor: "{colors.ground-2}"
    typography: "{typography.mono}"
    rounded: "{rounded.sm}"
    padding: "12px 16px"
  command-chip:
    backgroundColor: "{colors.sign-2}"
    textColor: "{colors.ground}"
    rounded: "{rounded.xs}"
    padding: "4px 8px"
---

# Design System: Frontier

## Overview

**Creative North Star: "The Line Map"**

Frontier is drawn as transit-authority signage: a crisp white map ground, black signage bands with white type, and one orange through line that carries the workflow. Beck and Vignelli diagrams are the source. Lines are thick and round-capped, routes bend at 45 degrees, and stations are a small fixed vocabulary of marks. Each one tells you whether the train runs on or waits for you.

The page is light only (user-pinned): no dark mode and no theme switch. Density is low. Sections breathe on 128px to 192px of vertical padding, copy runs one line per idea, and everything except the Frontier Line stays neutral. Depth comes from black-on-white contrast and tonal panels, never from shadows.

**Key Characteristics:**
- White map ground, black signage bands, orange Frontier Line.
- Overpass for every word, Overpass Mono for every command.
- Station vocabulary: open ring, gate mark, rounded-square terminus.
- Thick round-capped strokes (8px to 12px), 45-degree kinks.
- Flat: no shadows, no gradients, no glows.

## Colors

A neutral transit palette with one brand line colour and three branch colours that appear only as route strokes and timetable dots.

### Primary
- **Frontier Orange** (`line`): the Frontier Line itself, primary buttons, focus rings, link underlines, the highlighted word in the hero headline, selection.
- **Frontier Orange, Text Weight** (`line-text`): a slightly deeper orange for small orange text on white (active station names, hover states, copy buttons), where the line orange is too light for body sizes.
- **Signal Orange** (`sign-line`): the orange on black grounds. Used for the gate mark in the header, the Go button, board sequence numbers, and terminal prompts.

### Secondary
- **Branch Blue** (`blue`), **Branch Green** (`green`), **Branch Yellow** (`yellow`): branch routes only (improve, fix a bug, copy). They appear as route strokes and timetable stop dots, never as text or fills.

### Neutral
- **Map White** (`ground`): page ground and card fill.
- **Platform Grey** (`ground-2`): alternating section bands, copy fields, table row hover.
- **Signage Black** (`ink` / `sign`): body text, station rings, rule tops, and the signage surfaces (header, departure board, terminal).
- **Board Black, Raised** (`sign-2`): command chips and dividers inside black surfaces.
- **Timetable Grey** (`muted`): ledes, secondary text, command captions on white.
- **Board Grey** (`sign-muted`): secondary text on black surfaces.
- **Hairline** (`rule`): 1px row dividers in lists and tables.

### Named Rules
**The One Line Rule.** Orange belongs to the Frontier Line and the actions that move along it. Branch colours never fill a surface or set text.

**The Two Oranges Rule.** Use `sign-line` on black and `line` on white. Small orange text on white uses `line-text`.

## Typography

**Display Font:** Overpass (with ui-sans-serif, system-ui)
**Label/Mono Font:** Overpass Mono (with ui-monospace, Menlo)

**Character:** Overpass descends from Highway Gothic, so headings read as posted signage. Weights 800 and 900 carry every heading, 400 carries reading text, and Mono is reserved for anything you type.

### Hierarchy
- **Display** (800, clamp(44px, 6vw, 72px), 1, -0.02em): the hero headline only.
- **Headline** (800, clamp(32px, 3.6vw, 44px), 1.1, -0.02em, max 22ch, balanced): section headings. Kept below the hero display size so the step map stays the one bold element.
- **Station** (900, 22px, 1, -0.02em): station names on the line and notice headings.
- **Title** (800, 20px, 1.2): list, route and panel headings. Boarding-path headings step up to 900 at 28px; the departure-board station name uses 800 at clamp(28px, 3vw, 36px).
- **Body** (400, 17px, 1.55): reading text.
- **Lede** (400, 19px to 20px, muted, max 54ch): one-line section intros and the hero sub.
- **Label** (800, 13px to 15px, 1.4): table headers, the line bullet, nav (600, 15px).
- **Mono** (400, 12px to 14px): commands, terminal, copy fields. Station captions use 12px; inline code is 0.85em.

### Named Rules
**The Typed-Thing Rule.** If a reader would type it, set it in Overpass Mono. Everything else is Overpass.

**The Sign Case Rule.** Signage is sentence case at heavy weight with tight negative tracking. Nothing is uppercase and nothing is letter-spaced open.

## Layout

The container is 1280px max with 16px side padding (respecting safe-area insets), stepping to 48px from 720px. Sections use 128px vertical padding, rising to 192px from 960px. Every padding, margin and gap sits on the 4px grid.

Splits are asymmetric: the hero runs 6fr/5fr from 1000px, with both buttons on one row, comparison and gate sections 5fr/7fr, install 7fr/5fr, and the departure board 2fr/5fr/4fr. The posted-rules notices sit on a 6-column grid with spans of 4+2, 2+4 and 3+3. Lists (gates, routes, authors, timetable) are ruled rows; below 640px the timetable stacks each row as command and step over its description under a 2px black top rule with 1px hairlines between, not card grids.

The Frontier Line is an 8-column horizontal track from 900px. Below 900px it turns vertical: the track runs down the left edge, markers rotate 90 degrees, and names sit to the right. Breakpoints in use: 640, 680, 720, 900, 960, 1000px.

### Named Rules
**The Spine Rule.** The line map is the page's one bold element. Section headings are large but neutral black; nothing else gets orange mass.

## Elevation & Depth

Fully flat. There are no box-shadows anywhere. Depth comes from three tones: white map ground, Platform Grey bands and fields, and Signage Black surfaces (header, departure board, terminal). The header is a sticky black band; the safe-area strip above it is painted black to match.

### Named Rules
**The Printed Sign Rule.** Surfaces are printed, not lifted. Separate with tone or a 2px black stroke, never a shadow or a glow.

## Shapes

Lines are drawn, not boxed: 8px route strokes, a 12px main track, round caps and joins, and 45-degree bends. The station vocabulary is fixed:
- **Open station:** a white ring with a 4px black stroke. The step runs straight away.
- **Gate:** the brand gate mark (`M2 20H12V13M20 13V20H30` in a 32-unit box, scaled to 64 on the line) in orange, with a black 6px bar across the gap that lifts on Go. The step waits for your go.
- **Terminus:** a black rounded square (8px radius inside a 64-unit box).

Corners: 4px chips and focus rings, 8px fields, 12px notices, 16px board, terminal and path panels, and full pills for buttons and the line bullet. Borders are 2px black for emphasis (the recommended install path, list tops) and 1px hairline for row division and notices.

## Components

### Buttons
- **Shape:** full pill (999px), 2px border slot, minimum 52px tall (40px in the header).
- **Primary:** Frontier Orange with white text, 800 weight, 12px 24px. Hover brightens 8% and the arrow slides 4px right; active nudges down 1px.
- **Quiet:** transparent with a 2px black border; hover fills black with white text.
- **Go (departure board):** Signal Orange with black text. It is the only button on black.
- **Focus:** 3px orange outline, 4px offset.

### Signage Band (header)
A sticky 64px black band: the gate mark in Signal Orange at 36px beside "Frontier" (800, 24px), then plain nav links in Board Grey. The links hide under 680px and leave only Install.

### The Frontier Line (signature)
Eight stations: Start, six steps, Shipped. A black pill train with an orange nose eases into each station (`cubic-bezier(.16, 1, .3, 1)`, 400ms plus 260ms per stop, capped at 1400ms). It rolls through open stations and stops at gates until Go. On Go, the gate bar lifts 24px and fades over 0.6s. The active station name turns `line-text` and its ring turns orange. With reduced motion there is no travel, and stations stay selectable.

### Departure Board
A black panel (16px radius) under the line. Its three columns hold the station name, what the station does with command chips and credits, and the status with the Go button. Content fades and rises 8px over 0.35s on change.

### Notices (posted rules)
A white panel with a 1px hairline border, 12px radius and 24px padding. A 48px line pictogram (3px strokes, black with one orange accent) sits beside a Station-weight heading and a muted line.

### Timetable
A full-width table with tabular numerals. Headers are 800 13px over a 2px black rule, rows are divided by hairlines, and the row turns Platform Grey on hover. The stop column carries a 12px colour dot for the line or branch.

### Copy Field
A Platform Grey strip (8px radius) holding a mono command, with a text "Copy" button in `line-text` at its right edge. The button reads "Copied" on success.

### Terminal
A black panel (16px radius). The top bar is 12px mono in Board Grey. The body is 14px/1.9 mono, with your input in Signal Orange and Claude's output in Board Grey.

## Do's and Don'ts

### Do:
- **Do** draw workflow as a line with stations: round caps, 8px to 12px strokes, 45-degree bends.
- **Do** use the open ring for steps that only read, and the gate mark for steps that change files.
- **Do** put commands in Overpass Mono, and on black surfaces put them in `sign-2` chips.
- **Do** separate list rows with a 2px black top rule and 1px hairlines.
- **Do** keep every padding, margin and gap on the 4px grid.
- **Do** keep the light theme; set `color-scheme: light`.

### Don't:
- **Don't** add shadows, gradients, glows, or purple-to-blue colour of any kind.
- **Don't** lay out three equal cards in a row; use variable spans or ruled rows.
- **Don't** give a view a second bold element alongside the Frontier Line.
- **Don't** use branch blue, green or yellow for text, fills or buttons.
- **Don't** use `line` orange for small text on white; use `line-text`.
- **Don't** add a dark mode or a theme switch.
