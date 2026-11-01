---
name: design-rules
description: Apply whenever writing, editing or reviewing UI code (HTML, CSS, Tailwind, React, Vue, Svelte, SwiftUI, Electron views). Enforces no AI-default styling, asymmetric layouts, a 4pt spacing grid and one bold element per view.
---

# Design rules

Apply these to every UI change. A project's own CLAUDE.md overrides them where they conflict.

## 1. No AI-default palette
- No purple-to-blue (or any violet/indigo/cyan) gradients.
- No glowing or neon borders, no `box-shadow` used as a glow.
- No floating cards with large soft drop shadows.
- Exception: the user explicitly asks for one of these.

## 2. Asymmetry over grids
- Do not lay out three equal cards in a row.
- Use variable column spans (e.g. `col-span-7` + `col-span-5`), a side-aligned headline with content beside it, or a dense table.

## 3. 4pt hard grid
- Every padding, margin, gap and fixed size is a multiple of 4px.
- Tailwind: use the default scale (`1` = 4px). Never arbitrary values like `p-[13px]` or `mt-[7px]`.
- Plain CSS: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64…

## 4. One bold element per view
- Choose exactly one statement element: a large editorial serif headline, or a striking technical/data layout.
- Everything else stays quiet: neutral palette, one or two type sizes, minimal decoration.
- If two elements compete, tone one down.

## Self-check before finishing
- [ ] No banned styling
- [ ] No equal 3-card row
- [ ] All spacing on the 4pt grid
- [ ] Exactly one bold element; name it in your summary
