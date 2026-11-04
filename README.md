<p>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="site/assets/logo-on-dark.svg">
    <img src="site/assets/logo-on-light.svg" alt="Frontier" width="236" height="60">
  </picture>
</p>

# Plan first. Then let Claude code.

**Frontier** makes Claude ask questions, write a plan, test and review before it changes your code. You stop re-prompting things that broke, because the decisions were made before the code was written.

[Landing page](https://bgordon01.github.io/frontier)

## Install

In the Claude app: **Customize → Plugins → Add → Add marketplace**, type `bgordon01/frontier`, then add **frontier** from **Discover**. It also reaches Claude Code on the same account.

Using Claude Code without the app? Run `/plugin install frontier --marketplace bgordon01/frontier`.

## Use it

Say **start here**. That's the only thing to remember. (Typed shortcut: `/frontier:start`.)

```
You:     start here
Claude:  What would you like to do? 1 Build something new · 2 Improve a project
         3 Fix a bug · 4 Write copy · 5 Design something · 6 Update my skills
You:     1, a booking page for my salon
Claude:  First step: hard questions until the idea is clear. Nothing is written yet.
         👀 Run /frontier:grill-me
```

From there it hands you one step at a time:

- **Nothing changes until you say go.** 👀 steps only look. ✏️ steps change files, and you're told what first.
- **Tickets go where you already work.** GitHub, GitLab, Jira, Linear, or plain files in your project. You choose the first time it matters.
- **Each piece is built on its own branch** and waits for your review, so nothing touches your working version until you keep it.
- **It checks before it ticks.** It re-runs your tests after every build and never switches a test off to pass.
- **It keeps its place** in `tasks/plan.md`, so long jobs don't lose the thread.

## The steps it walks you through

| Step | Command | What it does |
|---|---|---|
| Question | `/frontier:grill-me` | Asks until every decision is made |
| Plan | `/frontier:to-spec` | Writes the agreed plan down |
| Split | `/frontier:to-tickets` | Breaks the plan into small tickets |
| Build | `/frontier:implement` | Builds one ticket, test first, on its own branch |
| Review | `/frontier:code-review` | Checks the change against the plan |
| Fix a bug | `/frontier:diagnosing-bugs` | Finds the real cause first |
| Design | `/frontier:impeccable critique` | Reviews a screen; `polish` fixes it |
| Copy | `/frontier:copywriting` | Writes page copy |
| Clean up words | `/frontier:stop-slop` | Removes phrasing that sounds machine-written |

You don't need to memorise these; `start here` hands each one over. Every command, the design flow and the optional browser check are in the [guide](docs/guide.md).

## Update or remove

Claude app: **Customize → Plugins**. Claude Code: run `/plugin`, then **Marketplaces** → `bgordon01` → **Update**, or remove **frontier** from the same menu.

## Built on

Skills by [Matt Pocock](https://github.com/mattpocock/skills) (planning, tickets, building, review; MIT), [Paul Bakaus](https://github.com/pbakaus/impeccable) (Impeccable design; Apache 2.0), [Hardik Pandya](https://github.com/hardikpandya/stop-slop) (stop-slop; MIT) and [Corey Haines](https://github.com/coreyhaines31/marketingskills) (copywriting; MIT), with Frontier's house rules on top.

Maintainers: [MAINTAINING.md](MAINTAINING.md). Frontier · MIT licence · by Brent Gordon
