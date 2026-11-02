---
target: the landing page
total_score: 36
max_score: 40
na_heuristics: 
p0_count: 0
p1_count: 1
target_identity: "file:/home/user/frontier/site/index.html"
target_fingerprint: "sha256:1144050dd1791916dbd29fd4a4cabefa0e0154ca47e60a93668ffb5f84202655"
target_path: /home/user/frontier/site/index.html
timestamp: 2026-11-02T07-57-18Z
slug: site-index-html
---
# Design critique — site/index.html

Method: dual-agent (A: design review · B: detector + browser evidence).

## Design Health Score: 36/40 — Excellent (ship-ready with minor polish)

| # | Heuristic | Score | Key issue |
|---|-----------|-------|-----------|
| 1 | Visibility of system status | 3 | No active-section nav state / scroll cue on a long page |
| 2 | Match system/real world | 4 | Plain, concrete language; no jargon |
| 3 | User control & freedom | 3 | No back-to-top after the 23-row table |
| 4 | Consistency & standards | 4 | One coherent editorial system across sections |
| 5 | Error prevention | 4 | Copy has Press ⌘C fallback; install steps numbered |
| 6 | Recognition over recall | 4 | Commands grouped by colour+label; steps numbered |
| 7 | Flexibility & efficiency | 3 | Copy buttons + anchor nav fine for a Persuade page |
| 8 | Aesthetic & minimalist | 4 | Restrained, confident; minor install whitespace imbalance |
| 9 | Error recovery | 3 | Clipboard failure is the only real path, handled |
| 10 | Help & documentation | 4 | Commands reference + README/GitHub + upgrade note |

## Design specificity: authored (strongly)
A: hero gate panel is the pitch made visible; split + gate-tags + mono commands restate the one promise. Thins only in generic tables/grid.
B (detector + overlay): 0 genuine defects. 21 CLI findings = expected stale-DESIGN.md drift + 1 false positive (full-bleed shell). Overlay: "No anti-patterns found." Contrast passes AA.

## What's working
1. Gate panel is the whole pitch in one object (queued /to-spec, Changes files · waits, Go).
2. Copy discipline — concrete, quiet, no banned words.
3. Real a11y baseline — colour+label, focus-visible, role=img panel, reduced-motion.

## Priority issues
- [P1] Install section looks unfinished on desktop (empty well bottom-left). Fix: rebalance into one ladder. -> layout
- [P2] Mobile menu repeats "Install" 3x. Fix: drop the list row, keep CTA. -> distill
- [P2] Commands table isn't chunked (23 rows; the one cognitive-load fail). Fix: group separators or disclosure. -> distill
- [P3] "Not everything in threes" cell sits in a 3x2 grid of equal cells. Fix: vary spans. -> layout
- [P3] No active-section nav state; verify anchors clear the sticky bar. -> polish

## Persona red flags
- Jordan: "Add to Claude" looks like it installs but only scrolls; install step 1 assumes Claude-app knowledge.
- Riley: hero Go + tag are inert (role=img) but look interactive.
- Casey: 23-row table at 390px is an anchor-less scroll; triple Install.

## Minor observations
- Category dots dilute the "crimson is the one saturated hue" story slightly.
- Hero has two focal points (headline + panel); closest call to one-bold-element.
- "4 Authors" is a soft stat beside 18/6/<1m.
