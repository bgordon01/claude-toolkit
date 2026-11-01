# claude-toolkit

A set of skills for [Claude Code](https://claude.com/claude-code) that help you plan, build, design and write, without needing to know how any of it works underneath.

Once it's installed, you only need to remember one thing: type **`/start-here`**.

## Install

You need a Mac with Claude Code already installed.

1. Open the **Terminal** app.
2. Paste this line and press Return:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/bgordon01/claude-toolkit/main/install.sh | bash
   ```

3. Restart Claude Code.

If Terminal says you need git, it will tell you the one command to run first. Run it, then paste the line above again.

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

Say **"update my skills"** in Claude Code, or paste this in Terminal:

```bash
~/.claude-toolkit/update.sh
```

Then restart Claude Code.

## Remove it

```bash
~/.claude-toolkit/uninstall.sh
```

This removes everything the toolkit added to Claude Code and leaves your own files alone. To delete the downloaded toolkit too, also run `rm -rf ~/.claude-toolkit`.

## Where the skills come from

The toolkit bundles skills from four authors, each kept under its original licence: [Matt Pocock](https://github.com/mattpocock/skills) (planning, building, reviewing), [Paul Bakaus](https://github.com/pbakaus/impeccable) (design), and [Hardik Pandya](https://github.com/hardikpandya/stop-slop) and [Corey Haines](https://github.com/coreyhaines31/marketingskills) (writing). The house rules are layered on top.

How it's put together, kept up to date and changed: [MAINTAINING.md](MAINTAINING.md).
