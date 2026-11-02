---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
---

Implement the work described by the user in the spec or tickets.

If the user passes a ticket reference, fetch it from the issue tracker and state its title before starting. If the reference is ambiguous, ask.

Call the Skill tool with "tdd" where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, call the Skill tool with "code-review" to review the work.

Commit your work to the current branch.

## Branch and PR lifecycle (Frontier)

Frontier runs this skill **one ticket per branch**: each run starts on a clean branch cut from the latest `main` and ends with a draft PR that's ready to review. Apply these rules around the build steps above.

**Before implementing — start clean:**

1. Confirm the ticket is unblocked. Read its blockers from the issue tracker (GitHub's native dependencies, or a `Blocked by: #n` line). Every blocker must be **closed with its PR merged** before this ticket can start — use the tracker's *Count open blockers* check (`0` means startable). If any blocker is still open, or its PR isn't merged yet, stop and tell the user which one; don't start.
2. Cut a fresh branch from the default branch: `git checkout main && git pull` (use the repo's default branch if it isn't `main`), then `git checkout -b <branch-named-for-this-ticket>`. Never implement on the default branch itself.

Then do the build, tests and `code-review` above, committing to this branch.

**After code-review — open a draft PR:**

3. Push the branch: `git push -u origin HEAD`.
4. Open a **draft** PR against the default branch: `gh pr create --draft --title "<ticket title>" --body "<body>"`. Use a heredoc for the body, summarising what changed and linking the ticket it implements (`Closes #<n>` when this fully resolves the ticket, otherwise `Part of #<n>`). `gh` infers the repo from `git remote -v`. If the branch already has an open PR, the push above already updated it — just report its URL.

Leave it as a draft: don't mark it ready for review, don't enable auto-merge, and don't merge it. The user reviews the draft and decides what happens next. Report the PR URL when you're done.
