# claude-toolkit

A set of skills for Claude and [Claude Code](https://claude.com/claude-code) that help you plan, build, design and write, without needing to know how any of it works underneath.

Once it's installed, you only need to remember one thing: say **"start here"**, or type `/start-here`.

## Install

### In the Claude app (phone, web or desktop)

Add it once to your Claude account:

1. Open **Customize → Plugins**.
2. Tap **Add**, then **Add marketplace**, and enter `bgordon01/claude-toolkit`.
3. Find **toolkit** under **Discover** and tap **Add**.

That's it. The toolkit is now part of your Claude account. If you sign in to Claude Code on your Mac with the same account, it appears there too at the next start. In Claude Code, the commands carry a `toolkit:` prefix, for example `/toolkit:start-here`.

### In Claude Code only

Inside Claude Code, run:

```
/plugin install toolkit --marketplace bgordon01/claude-toolkit
```

### With the install script (Mac)

Use this instead of the plugin if you want shorter commands (`/start-here` rather than `/toolkit:start-here`) and the house rules always on. Pick one method per Mac. Using both gives you every skill twice.

You need a Mac with Claude Code already installed.

1. Open the **Terminal** app.
2. Paste this line and press Return:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/bgordon01/claude-toolkit/main/install.sh | bash
   ```

3. Restart Claude Code.

If Terminal says you need git, it will tell you the one command to run first. Run it, then paste the line above again.

### Cloud coding sessions (the Code tab)

Coding sessions you start from the app's **Code** tab or [claude.ai/code](https://claude.ai/code) run on a fresh cloud computer each time. If the toolkit's commands don't show up there, set this up once:

1. In a browser, open [claude.ai/code](https://claude.ai/code) and open your cloud environment's settings. Usually it's called **Default**.
2. Paste this into the **Setup script** box and save:

   ```bash
   #!/bin/bash
   curl -fsSL https://raw.githubusercontent.com/bgordon01/claude-toolkit/main/install.sh | bash || true
   ```

3. Start a new session and type `/start-here`.

The cloud keeps a ready-made copy of the setup for about a week, then rebuilds it with the latest toolkit. To get an update sooner, say "update my skills" inside a cloud session.

## Use it

Open Claude Code in any project and type `/start-here`, or just say what you want, like "help me redesign this project". It asks what you'd like to do:

| You want to… | What happens |
|---|---|
| **Build something new** | It questions your idea until it's clear, writes a plan, splits it into small pieces, then builds, designs and checks each piece in turn. |
| **Improve an existing project** | It looks over the code, the design or both without changing anything, and shows you what's worth fixing. You choose what to fix, then it fixes it piece by piece. |
| **Fix a bug** | It finds the real cause first, then fixes it and checks the fix. |
| **Write or improve copy** | It writes or tightens the words, then removes anything that sounds machine-written. |
| **Update my skills** | It downloads the latest version of this toolkit. |

Every step is explained in one sentence before it runs. Anything that only looks and reports runs straight away. **Anything that would change your files waits for you to say go.**

The first time you use it in a project, it may ask a few setup questions: where you keep your to-do list, and who the product is for. That happens once per project.

### Prefer typing commands yourself?

Every step is also a command. Some favourites:

| Command | Does |
|---|---|
| `/grill-me` | Questions your idea until it holds up |
| `/to-tickets` | Splits a plan into small pieces of work |
| `/tdd` | Builds one piece, with tests |
| `/impeccable critique` | Reviews a screen's design, without changing it |
| `/impeccable polish` | Fixes a screen's design |
| `/code-review` | Checks a change before you move on |
| `/stop-slop` | Removes machine-sounding writing |

## House rules

These apply to everything the toolkit builds or writes, in every project:

- **No "AI look":** no purple-blue gradients, glowing edges or floating shadows.
- **Not everything in neat rows of three:** layouts vary.
- **Consistent spacing:** every gap comes from the same set of sizes.
- **One bold thing per screen:** everything else stays calm.
- **No buzzwords:** never "seamless", "empower", "revolutionize" and friends.
- **Specifics over hype:** "Exports in 2 seconds", not "Blazing fast".

## Update

- **Plugin, in the Claude app:** new versions come from GitHub. Check under **Customize → Plugins**.
- **Plugin, in Claude Code:** run `/plugin`, open **Marketplaces**, select `bgordon01` and choose **Update**, or turn on **auto-update** there so it updates by itself.
- **Install script:** say **"update my skills"** in Claude Code, or paste `~/.claude-toolkit/update.sh` in Terminal, then restart Claude Code.

## Remove it

- **Plugin:** remove **toolkit** under **Customize → Plugins** in the app, or with `/plugin` in Claude Code.
- **Install script:** paste `~/.claude-toolkit/uninstall.sh` in Terminal. It removes everything the toolkit added and leaves your own files alone. To delete the downloaded toolkit too, also run `rm -rf ~/.claude-toolkit`.

## Where the skills come from

The toolkit bundles skills from four authors, each kept under its original licence: [Matt Pocock](https://github.com/mattpocock/skills) (planning, building, reviewing), [Paul Bakaus](https://github.com/pbakaus/impeccable) (design), and [Hardik Pandya](https://github.com/hardikpandya/stop-slop) and [Corey Haines](https://github.com/coreyhaines31/marketingskills) (writing). The house rules are layered on top.

How it's put together, kept up to date and changed: [MAINTAINING.md](MAINTAINING.md).
