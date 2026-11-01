---
name: start-here
description: The plain-English front door to claude-toolkit. Use when the user types /start-here, or says things like "where do I start", "help me build something", "redesign this project", "fix this bug", "write copy for this", "what can you do here", or "update my skills". Picks the right workflow and walks the user through it one explained step at a time.
---

# Start here

You are guiding someone who may not be a developer. They should never need to know a command name. Speak plainly, keep each explanation to one sentence, and avoid jargon. If you must use a technical word, explain it in the same sentence.

## How to run a step

Each step below names a skill. Run it with the Skill tool. Depending on how the toolkit was installed, the name is either bare (`grill-me`) or carries the plugin prefix (`toolkit:grill-me`); use whichever is available. If the Skill tool refuses because a skill is set to run only on request, read that skill's `SKILL.md` instead and follow it exactly. It sits next to this file's folder, as `../<skill>/SKILL.md`.

Before every step:
1. Say in one plain sentence what the step does and why.
2. **If the step only reads or reports** (marked 👀 below), run it straight away.
3. **If the step changes files** (marked ✏️ below), say exactly what will change and wait for the user to say go. Never change files without that go-ahead.

After every step, say in one or two sentences what happened and what comes next, then ask if they want to continue, stop, or go back.

## 1. Find out what they want

If their message already makes it clear, skip straight to that path. Otherwise ask:

> What would you like to do?
> 1. **Build something new**: a feature, page or app
> 2. **Improve an existing project**: clean up the code, the design, or both
> 3. **Fix a bug**: something is broken
> 4. **Write or improve copy**: words on a page, emails, buttons
> 5. **Update my skills**: get the latest version of this toolkit

## 2. First-time project setup

For paths 1, 2 and 3, check the current project before starting (this is just looking, so no need to ask):
- No `docs/agents/issue-tracker.md` → the planning skills don't know where to save tickets yet. Offer ✏️ `setup-matt-pocock-skills`. It asks a few questions, then writes a small settings file.
- No `PRODUCT.md` and the project has a user interface → the design skill doesn't know who the product is for yet. Offer ✏️ `impeccable` with the `init` command. It interviews the user, then writes `PRODUCT.md`.

If both files exist, say nothing about setup and carry on.

## Path 1: Build something new

1. 👀 `grill-me`: ask hard questions until the idea is clear. Nothing is written yet.
2. ✏️ `to-spec`: write the agreed plan down as a spec.
3. ✏️ `to-tickets`: break the spec into small pieces of work.
4. For each ticket, in order:
   - ✏️ `tdd`: build it test-first. Use `implement` instead if the user wants it built without tests.
   - If the ticket touched anything a user will see: 👀 `impeccable critique`, then ✏️ `impeccable polish`.
   - If it touched words a user will read: ✏️ `impeccable clarify`, then ✏️ `stop-slop`.
   - 👀 `code-review`: check the change before moving on.

## Path 2: Improve an existing project

Ask: the code, the design, or both? Then:

1. Look first, change nothing:
   - Code → 👀 `improve-codebase-architecture`: produces a visual report of what's hard to work with.
   - Design → 👀 `impeccable audit`, then 👀 `impeccable critique`.
2. 👀 `grill-me` on the findings: agree what's worth fixing and in what order.
3. ✏️ `to-tickets`: turn the agreed fixes into small pieces of work.
4. Build each ticket exactly as in Path 1, step 4.

## Path 3: Fix a bug

1. 👀 `diagnosing-bugs`: find the real cause before touching anything.
2. ✏️ `tdd`: add a test that shows the bug, then fix it.
3. 👀 `code-review`: check the fix.

## Path 4: Write or improve copy

- New copy for a page → ✏️ `copywriting`
- Improving copy that already exists → ✏️ `copy-editing`
- Button labels, form fields and error messages in an app → ✏️ `impeccable clarify`
- Always finish with ✏️ `stop-slop` to remove anything that sounds machine-written.

## Path 5: Update my skills

How the toolkit updates depends on how it was installed:

- **Installed with the install script** (a `~/.claude-toolkit/update.sh` file exists):
  1. ✏️ Run `~/.claude-toolkit/update.sh` in the terminal.
  2. Report in plain words whether anything changed and which skills were added or removed. Say that the user should restart Claude Code to pick up changes.
- **Installed as a plugin**, in the Claude app or with `/plugin`: no command is needed. Say that plugin updates come from GitHub. In the Claude app, they can check under **Customize → Plugins**. In Claude Code, they can run `/plugin`, open the **Marketplaces** tab, select `bgordon01` and choose **Update**, or turn on auto-update there.

If the update fails, show the error message and say what it means in one sentence. The most common cause is changes the user made inside the toolkit folder. Don't try to fix git problems without asking.

## House rules

The house rules apply to everything built or written along the way. They are in `~/.claude/claude-toolkit-rules.md` for a script install, or in the `house-rules` skill for a plugin install. If a step's output breaks one, fix it before moving on and say which rule you applied.
