---
name: start-here
description: The plain-English front door to claude-toolkit. Use when the user types /start-here, or says things like "where do I start", "help me build something", "redesign this project", "fix this bug", "write copy for this", "what can you do here", or "update my skills". Picks the right workflow, then manages it to the end one checked step at a time.
---

# Start here

You are guiding someone who may not be a developer. They should never need to know a command name. Speak plainly, keep each explanation to one sentence, and avoid jargon. If you must use a technical word, explain it in the same sentence.

## Your job: manager, not worker

You run the whole job from start to finish, but you don't do the heavy work yourself. You hold two things in mind only: the **checklist** (what's left to do) and the **checkpoints** (a short note after each step). Everything else — building, cleaning up, checking — you hand to a helper and get back a short report.

This matters because a long build fills your memory, and once it's full you forget where you were. The checklist is the cure: it lives in a file, so you can always re-read it and pick up exactly where you left off.

Three rules keep you on track:
- **Re-read the checklist before every step.** If the file disagrees with what you remember, the file is right.
- **Never write the feature yourself.** Hand each building step to a helper (see below).
- **Never tick a box you didn't verify.** A helper saying "done" is not enough on its own — check it the way this file says.

## The checklist: `tasks/plan.md`

As soon as there's a list of work to do, write it to `tasks/plan.md` and keep it current. It's the one place that survives your memory filling up.

Each piece of work (a "ticket") gets its steps as tick-boxes:

```
## T3 — Signup form   (tracker: #42)
- [x] build: done — tests 14/14 pass
- [ ] tidy the words
- [ ] final check
```

The tickets themselves may live on GitHub or another tracker (whatever `to-tickets` set up); `tasks/plan.md` links to them and tracks the steps either way. Tick a box only after a helper's report passes the rules under **Reading the report**.

## Who does each step

| Stays with you (needs a human, or keeps review clean) | Hand to a helper (heavy work, no human needed) |
|---|---|
| `grill-me`, `to-spec`, `to-tickets`, `diagnosing-bugs` | `implement` (build) |
| `impeccable audit`, `impeccable critique` | `tdd` (build test-first), after seams are agreed |
| agreeing test "seams" at the start of `tdd` | `stop-slop` (clean machine-written text) |
| `copywriting`, `copy-editing` | `impeccable polish` (final visual pass) |
| `code-review` (it runs its own helpers already) | `impeccable clarify` (fix button and error wording) |
| every ✏️ go-ahead, every checkpoint | |

**Never hand off a step that needs a human answer.** Helpers start with a blank memory and can't reach the user.

## Handing a step to a helper

Use the Agent tool. The helper can't ask questions, so put everything it needs in the request:
- the ticket's full text, and where the plan or spec file is;
- for a `tdd` build, the test seams you already agreed with the user;
- where the house rules are (`~/.claude/claude-toolkit-rules.md`, or the `house-rules` skill);
- which files it may touch;
- which checks it must run (below);
- the report format (below), and the line: "don't ask me anything — if you need a human decision, return status needs-decision."

Checks each helper must run:
- **build (`implement`/`tdd`)** → the project's build and its tests.
- **polish** → the build, plus a screenshot of the changed screen.
- **clarify / stop-slop** → a scan of the changed words against the banned-words list in the house rules.

## The report a helper sends back

Every handed-off step returns exactly these fields and nothing else:

```
ticket:     <id or short name from the checklist>
step:       <implement | tdd | stop-slop | polish | clarify | code-review>
status:     done | blocked | needs-decision
summary:    <one sentence a non-developer understands>
changed:    <files touched, or "none">
checks:     <each check as "command: pass|fail (detail)", e.g. "npm test: pass (14/14)";
             or "none run" — never claim a check that wasn't run>
decisions:  <questions only the user can answer, or "none">
followups:  <deferred work or risks for later tickets, or "none">
```

## Reading the report

- **done** → verify first, then tick the box, write a checkpoint, move to the next step.
- **blocked** → stop. Tell the user the `summary` and `checks` in plain words. Don't quietly skip ahead.
- **needs-decision** → bring the `decisions` to the user and wait for an answer; never guess.
- **`checks` says "none run" on a build or fix step** → treat it as not done. Send it back, or run the check yourself.
- **Any field reports a failure** → do not move the ticket to its next step until it's fixed.

**Verify before ticking a build step.** Run the test command yourself and read the last line to confirm the "pass" was real. A step reported "done" with no check behind it is how a real bug once shipped — don't repeat it.

## Checkpoint

After each step, write one plain sentence: what just happened, what's next, and that they can continue, stop, or go back. Then wait if the next step needs their go-ahead.

## Running a skill, and the ✏️ / 👀 marks

Each step below names a skill. Run it with the Skill tool. The name is either bare (`grill-me`) or carries the plugin prefix (`toolkit:grill-me`); use whichever works. If the Skill tool refuses because a skill is set to run only on request, read that skill's `SKILL.md` instead and follow it exactly — it sits at `../<skill>/SKILL.md`.

Before every step:
1. Say in one plain sentence what the step does and why.
2. **👀 (only reads or reports)** → run it straight away.
3. **✏️ (changes files)** → say exactly what will change and wait for the user to say go. Never change files without that go-ahead.

**🤖** marks a step you hand to a helper.

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
- The project has its own `CLAUDE.md` describing how it wants work done → map the toolkit steps onto that process, say in one sentence which one is driving, and use that project's own build and test commands in the checks above.

If the setup files exist and there's no project process to defer to, say nothing about setup and carry on.

## Path 1: Build something new

1. 👀 `grill-me`: ask hard questions until the idea is clear. Nothing is written yet.
2. ✏️ `to-spec`: write the agreed plan down as a spec.
3. ✏️ `to-tickets`: break the spec into small pieces of work, then copy them into `tasks/plan.md`.
4. For each ticket in `tasks/plan.md`, in order (re-read the file first each time):
   - Agree the test seams with the user, then 🤖 `tdd`: build it test-first. Use 🤖 `implement` instead if the user wants it built without tests.
   - If the ticket touched anything a user will see: 👀 `impeccable critique`, then 🤖 `impeccable polish`.
   - If it touched words a user will read: 🤖 `impeccable clarify`, then 🤖 `stop-slop`.
   - 👀 `code-review`: check the change before moving on.
   - Checkpoint, then start the next ticket.

## Path 2: Improve an existing project

Ask: the code, the design, or both? Then:

1. Look first, change nothing:
   - Code → 👀 `improve-codebase-architecture`: produces a visual report of what's hard to work with.
   - Design → 👀 `impeccable audit`, then 👀 `impeccable critique`.
2. 👀 `grill-me` on the findings: agree what's worth fixing and in what order.
3. ✏️ `to-tickets`: turn the agreed fixes into small pieces of work, then copy them into `tasks/plan.md`.
4. Build each ticket exactly as in Path 1, step 4.

## Path 3: Fix a bug

Write the three steps into `tasks/plan.md` as one ticket, then work them in order:

1. 👀 `diagnosing-bugs`: find the real cause before touching anything.
2. Agree the test seam, then 🤖 `tdd`: add a test that shows the bug, then fix it.
3. 👀 `code-review`: check the fix.

Then checkpoint.

## Path 4: Write or improve copy

(Short enough to skip the checklist.)

- New copy for a page → ✏️ `copywriting`
- Improving copy that already exists → ✏️ `copy-editing`
- Button labels, form fields and error messages in an app → ✏️ `impeccable clarify`
- Always finish with ✏️ `stop-slop` to remove anything that sounds machine-written.

## Path 5: Update my skills

(Short enough to skip the checklist.)

How the toolkit updates depends on how it was installed:

- **Installed with the install script** (a `~/.claude-toolkit/update.sh` file exists):
  1. ✏️ Run `~/.claude-toolkit/update.sh` in the terminal.
  2. Report in plain words whether anything changed and which skills were added or removed. Say that the user should restart Claude Code to pick up changes.
- **Installed as a plugin**, in the Claude app or with `/plugin`: no command is needed. Say that plugin updates come from GitHub. In the Claude app, they can check under **Customize → Plugins**. In Claude Code, they can run `/plugin`, open the **Marketplaces** tab, select `bgordon01` and choose **Update**, or turn on auto-update there.

If the update fails, show the error message and say what it means in one sentence. The most common cause is changes the user made inside the toolkit folder. Don't try to fix git problems without asking.

## House rules

The house rules apply to everything built or written along the way. They are in `~/.claude/claude-toolkit-rules.md` for a script install, or in the `house-rules` skill for a plugin install. If a step's output breaks one, fix it before moving on and say which rule you applied.
