<p>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="site/assets/logo-on-dark.svg">
    <img src="site/assets/logo-on-light.svg" alt="Frontier" width="236" height="60">
  </picture>
</p>

# Plan first. Then let Claude code.

**Frontier** is 18 skills and one workflow that make Claude question, plan, test and review before anything ships. It works in the Claude app (phone, web, desktop) and in [Claude Code](https://claude.com/claude-code).

Once it's installed, you only need to remember one thing: say **"start here"**, or type `/start-here`. It tells you the next step and hands you the command to run.

Landing page: [bgordon01.github.io/frontier](https://bgordon01.github.io/frontier)

> **Renamed from claude-toolkit.** The repo is now `bgordon01/frontier` and the plugin is `frontier`. Old GitHub links redirect.
> - **Plugin users:** remove **toolkit** under **Customize → Plugins** (or with `/plugin` in Claude Code), then add **frontier** from the same marketplace. Commands now start with `/frontier:`.
> - **Install-script users:** run `~/.claude-toolkit/update.sh` once. It moves everything to `~/.frontier` and swaps the house-rules line in your CLAUDE.md. Nothing else to do.
> - **Cloud setup scripts:** the old URL keeps working through GitHub's redirect. Swap in the new one below when convenient.

## Why

Vibe coding goes straight from prompt to code, then guesses at fixes:

| Without a method | With Frontier |
|---|---|
| 1. Prompt | 1. Get questioned (`/grill-me`) |
| 2. 400 lines of code | 2. Write the spec (`/to-spec`) |
| 3. Something breaks | 3. Split into tickets (`/to-tickets`) |
| 4. Prompt again | 4. Build one, test first (`/tdd`) |
| | 5. Review (`/code-review`) |
| *Every fix starts from a guess.* | *Every change starts from a decision you made.* |

Frontier moves your time to the two parts only you can do: deciding what to build, and checking what got built.

## Install

Pick where you use Claude. Each path takes under a minute.

### In the Claude app (phone, web or desktop) — most people start here

Add it once to your Claude account:

1. Open **Customize → Plugins**.
2. Tap **Add**, then **Add marketplace**, and enter `bgordon01/frontier`.
3. Find **frontier** under **Discover** and tap **Add**.

The plugin is now part of your Claude account and works in app chats. If you sign in to Claude Code on your Mac with the same account, it appears there too at the next start, with a `frontier:` prefix on each command, for example `/frontier:start-here`.

It does **not** reach coding sessions in the app's **Code** tab. Those need the one-time setup in [Cloud coding sessions](#cloud-coding-sessions-the-code-tab) below.

### In Claude Code only

Inside Claude Code, run:

```
/plugin install frontier --marketplace bgordon01/frontier
```

### With the install script (Mac)

Use this instead of the plugin if you want shorter commands (`/start-here` rather than `/frontier:start-here`) and the house rules always on. Pick one method per Mac. Using both gives you every skill twice.

You need a Mac with Claude Code already installed.

1. Open the **Terminal** app.
2. Paste this line and press Return:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/bgordon01/frontier/main/install.sh | bash
   ```

3. Restart Claude Code.

If Terminal says you need git, it will tell you the one command to run first. Run it, then paste the line above again.

### Cloud coding sessions (the Code tab)

Coding sessions you start from the app's **Code** tab or [claude.ai/code](https://claude.ai/code) run on a fresh cloud computer each time, and they don't load plugins from your Claude account. Set this up once:

1. In a browser, open [claude.ai/code](https://claude.ai/code) and open your cloud environment's settings. Usually it's called **Default**.
2. Paste this into the **Setup script** box and save:

   ```bash
   #!/bin/bash
   curl -fsSL https://raw.githubusercontent.com/bgordon01/frontier/main/install.sh | bash || true
   ```

3. Start a **new** session and type `/start-here`, with no `frontier:` prefix here.

The cloud keeps a ready-made copy of the setup for about a week, then rebuilds it with the latest Frontier. To get an update sooner, say "update my skills" inside a cloud session.

## Use it

Open Claude Code in any project and type `/start-here`, or just say what you want, like "help me redesign this project". It asks what you'd like to do:

| You want to… | The route |
|---|---|
| **Build something new** | Grill → spec → tickets, then for each ticket: build test-first, polish the design and words, review. |
| **Improve an existing project** | It reads the code, the screens or both and lists what's worth fixing, changing nothing. You pick the fixes, then they become tickets and follow the build route. |
| **Fix a bug** | `/diagnosing-bugs` finds the real cause, `/tdd` adds a failing test and fixes it, `/code-review` checks the fix. |
| **Write or improve copy** | `/copywriting` for new copy, `/copy-editing` for what's there, `/stop-slop` last. |
| **Update my skills** | Gets the latest version of Frontier. |

### The build route, step by step

| # | Step | Commands | What it does | Skills by |
|---|---|---|---|---|
| 01 | Grill | `/grill-me` | Questions your idea, one round at a time, until every decision is made. | Matt Pocock |
| 02 | Spec | `/to-spec` | Writes what you agreed into one spec in your issue tracker. | Matt Pocock |
| 03 | Tickets | `/to-tickets` | Splits the spec into small tickets, each with what blocks it. | Matt Pocock |
| 04 | Build | `/implement`, `/tdd` | Builds one ticket at a time. A failing test comes first, then the code. | Matt Pocock |
| 05 | Polish | `/impeccable polish`, `/copywriting`, `/stop-slop` | Fixes the screen's design, writes the words, removes machine-sounding text. | Paul Bakaus, Corey Haines, Hardik Pandya |
| 06 | Review | `/code-review`, `/impeccable critique` | Checks the change against the spec and the house rules before you move on. | Matt Pocock, Paul Bakaus |

Improving a project rejoins this route at 03 Tickets. Fixing a bug rejoins it at 06 Review.

### How `/start-here` guides you

`/start-here` is a mentor, not an autopilot. It recommends the next step, gives you one sentence on why it matters, and hands you the command to copy and paste. You run it. It never runs a work skill or edits your code itself.

Each recommendation carries a mark:

- 👀 **Looks and reports.** Safe to run.
- ✏️ **Changes files.** It tells you exactly what will change before you run it.
- 🤖 **Can be handed off.** Say "hand it off" and a helper runs it and reports back. Only four steps qualify: a build (`/tdd` or `/implement`), `/stop-slop`, `/impeccable polish` and `/impeccable clarify`. Everything else needs you.

**Nothing changes your files until you say go.** You make the decisions. Claude does the typing.

**It keeps its place in a file.** For build, improve and bug-fix routes, `/start-here` writes a checklist to `tasks/plan.md` in your project: one box per step per ticket, plus your build and test commands, which command form to hand you (`/tdd` or `/frontier:tdd`), and any corner you chose to cut. Every time you run it, it reads that file and reads the checklist back to you, so a long build never loses its thread. The file is committed by default; gitignore it if you'd rather not track it.

**It checks before it ticks.** After a build it re-runs your tests itself. After a wording step it re-runs the banned-words search. For judgement steps like the grill, a design critique or a code review, it ticks the box only once you confirm what you did with the findings. If a check fails, it says so plainly and waits for you to decide. It never re-runs to get green and never switches a test off.

**It teaches, then gets out of the way.** Say "I know the basics, keep it terse" and it drops the why line and just hands over commands. If you want to skip a step, like shipping without tests, it names the cost once, respects your choice, and records it in `tasks/plan.md`.

The first time you use it in a project, it may suggest a setup step: `setup-matt-pocock-skills` (where you keep your tickets) and `impeccable init` (who the product is for). That happens once per project. If your project has its own `CLAUDE.md` describing how work gets done, it follows that process and your project's own build and test commands.

### Prefer typing commands yourself?

Every step is also a command. Use `/start-here` and let it choose, or call any of these directly. With the plugin, add the `frontier:` prefix, for example `/frontier:tdd`.

| Command | What it does | Set |
|---|---|---|
| `/start-here` | Asks what you want to do and walks you through the right route. | Frontier |
| `/grill-me` | Questions your idea until it holds up. | Engineering |
| `/to-spec` | Turns the conversation into a spec in your issue tracker. | Engineering |
| `/to-tickets` | Splits a spec into small tickets with blocking order. | Engineering |
| `/implement` | Builds a piece of work from a spec or ticket. | Engineering |
| `/tdd` | Builds test-first: red, green, refactor. | Engineering |
| `/code-review` | Reviews changes since a commit or branch against your standards. | Engineering |
| `/diagnosing-bugs` | Finds the real cause of a hard bug before fixing it. | Engineering |
| `/improve-codebase-architecture` | Scans a codebase and reports what's worth restructuring. | Engineering |
| `/impeccable critique` | Reviews a screen's design without changing it. | Design |
| `/impeccable polish` | Fixes a screen's layout, type, colour and spacing. | Design |
| `/impeccable clarify` | Rewrites labels, buttons and errors so they read clearly. | Design |
| `/copywriting` | Writes marketing and landing-page copy. | Copy |
| `/copy-editing` | Tightens copy you already have. | Copy |
| `/stop-slop` | Removes phrasing that sounds machine-written. | Copy |

Plus 5 support skills the others call for you: `grilling`, `codebase-design`, `domain-modeling`, `setup-matt-pocock-skills` and `house-rules`. Impeccable also brings 4 helper agents.

## House rules

These sit on top of every skill, in every project. Your project's own `CLAUDE.md` wins where they conflict.

**Design**

- **No AI look:** no purple-to-blue gradients, glowing borders or floating card shadows.
- **Not everything in threes:** variable column spans and dense tables instead of three equal cards.
- **A 4px grid:** every padding, margin and gap is a multiple of 4px.
- **One bold thing per screen:** one statement element. Everything else stays quiet.

**Copy**

- **Banned words:** never "seamless", "empower", "revolutionize", "supercharge" and the rest.
- **Specifics over hype:** "Exports in 2 seconds", not "Blazing fast".

## Update

- **Plugin, in the Claude app:** new versions come from GitHub. Check under **Customize → Plugins**.
- **Plugin, in Claude Code:** run `/plugin`, open **Marketplaces**, select `bgordon01` and choose **Update**, or turn on **auto-update** there so it updates by itself.
- **Install script:** say **"update my skills"** in Claude Code, or paste `~/.frontier/update.sh` in Terminal, then restart Claude Code.

## Remove it

- **Plugin:** remove **frontier** under **Customize → Plugins** in the app, or with `/plugin` in Claude Code.
- **Install script:** paste `~/.frontier/uninstall.sh` in Terminal. It removes everything Frontier added and leaves your own files alone. To delete the downloaded copy too, also run `rm -rf ~/.frontier`.

## Brand

The mark is a **gate**: a horizon line broken by a gap with a post on each side. It stands for the review point where you say go, and the same glyph marks the "waits for your go" steps in the workflow diagram on the landing page.

| | |
|---|---|
| Mark | Single stroke, `M2 20H12V13M20 13V20H30` in a 32×32 box. The arms are longer than the posts so it reads as a line first, not as brackets. |
| Wordmark | "Frontier" in Source Serif 4 600, outlined to paths so it renders without the font installed. |
| Accent | Deep orange `#C2410C` on light, `#F28C4B` on dark. Ink `#1B1A17`, paper text on dark `#EDEAE3`. |
| Type | Source Serif 4 (headlines), Inter (body), JetBrains Mono (commands). |

Files in [`site/assets/`](site/assets):

| File | Use |
|---|---|
| `logo.svg` | Mark and wordmark; switches colours with light/dark mode |
| `logo-on-light.svg`, `logo-on-dark.svg` | Fixed-colour versions of the logo |
| `logo.png` | Logo at 4× for places that don't take SVG |
| `mark.svg` | The gate on its own, for avatars and the plugin icon |
| `favicon.svg`, `favicon-32.png` | Browser tab icons |
| `apple-touch-icon.png` (180×180), `icon-512.png` | Home-screen and app icons |
| `og.png` (1200×630) | Social preview card |

## Landing page

The page lives in [`site/index.html`](site/index.html): one static file, no build step, JavaScript only for the copy buttons, no analytics. On every push to `main` that touches `site/`, the [Pages workflow](.github/workflows/pages.yml) publishes it to [bgordon01.github.io/frontier](https://bgordon01.github.io/frontier). Pages has to be switched on once in the repo settings (**Settings → Pages → Source: GitHub Actions**).

The decisions behind the page, name and logo are in [`docs/frontier/SPEC.md`](docs/frontier/SPEC.md).

## Built on

Frontier picks the skills, wires them into one workflow and adds the house rules. The skills come from four authors, each kept under its original licence:

| Author | Skills | Licence |
|---|---|---|
| [Matt Pocock](https://github.com/mattpocock/skills) | Planning, tickets, test-first building, code review, bug diagnosis | MIT |
| [Paul Bakaus](https://github.com/pbakaus/impeccable) | Impeccable: design critique, polish and UX copy, with 4 helper agents | Apache 2.0 |
| [Hardik Pandya](https://github.com/hardikpandya/stop-slop) | Stop-slop: strips AI writing patterns from prose | MIT |
| [Corey Haines](https://github.com/coreyhaines31/marketingskills) | Copywriting and copy editing for marketing pages | MIT |

How it's put together, kept up to date and changed: [MAINTAINING.md](MAINTAINING.md).

Frontier · MIT licence · by Brent Gordon
