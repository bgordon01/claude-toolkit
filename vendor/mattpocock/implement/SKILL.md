---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

If the user passes a ticket reference, fetch it from the issue tracker and state its title before starting. If the reference is ambiguous, ask.

Call the Skill tool with "tdd" where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, call the Skill tool with "code-review" to review the work.

Commit your work to the current branch.

## Branch and review lifecycle (Frontier)

Frontier runs this skill **one ticket per branch**: each run starts on a clean branch cut from the latest default branch and ends with the change ready for the user to review. The steps are the same for every tracker; only the hand-over at the end changes. Read `docs/agents/issue-tracker.md` (written by `setup-matt-pocock-skills`) to know which tracker this repo uses. If it's missing, stop and tell the user to run that setup first.

**Before implementing — start clean:**

1. Confirm the project uses git (`git rev-parse --is-inside-work-tree`). If it doesn't, stop and tell the user: a branch per ticket is how a change can be undone, so the build needs git. Offer `git init` plus a first commit; don't run it without a yes.
2. Confirm the ticket is unblocked. Read its blockers the way the tracker file describes (native dependencies, or a `Blocked by:` line). Every blocker must be closed, and its change merged into the default branch, before this ticket starts. If one isn't, stop and name it.
3. Cut a fresh branch from the default branch: switch to it, pull if there's a remote, then `git checkout -b <branch-named-for-this-ticket>`. Never implement on the default branch itself.

Then do the build, tests and `code-review` above, committing to this branch.

**After code-review — hand it over for review, by tracker:**

- **GitHub:** `git push -u origin HEAD`, then open a **draft** PR with `gh pr create --draft`. Use a heredoc for the body: summarise the change and link the ticket (`Closes #<n>` when it fully resolves it, otherwise `Part of #<n>`).
- **GitLab:** `git push -u origin HEAD`, then open a **draft** merge request with `glab mr create --draft`, linking the issue the same way.
- **Jira, Linear or any other tracker:** push the branch if there's a remote, then follow the review step the tracker file describes (for example, a Bitbucket pull request with the ticket key in its title). If it describes none, stop after the push and give the user the branch name and ticket key to link by hand.
- **Local markdown:** don't push. Leave the commits on the branch, mark the ticket file done, and give the user the one command that merges it when they're happy: `git checkout <default-branch> && git merge <branch>`.

If the branch already has an open review, the push already updated it; just report its link. Leave every review as a draft: don't mark it ready, don't enable auto-merge, and don't merge it. The user decides. Report the link, or the branch name for a local tracker, when you're done.
