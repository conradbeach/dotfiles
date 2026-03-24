# Git

- Commit regularly — after each logical chunk of work (a completed step, fix, or feature increment).
- When you make changes as a result of feedback/review, always do it in a new commit. This makes it easier to follow your changes.
- roborev will review each commit automatically in the background. Fix any feedback from roborev.
- Don't push your changes. A human will review and push.
- Projects use git worktrees stored in `.worktrees/` inside the repository root. Typically you will be working inside a worktree, but if you are working in the repository root, ignore the `.worktrees/` directory — do not read, modify, or commit anything inside it.

## Commit Messages

- For the commit title/summary, give a brief description of what the change does.
- Prefix the commit title/summary with `feat`, `fix`, `refactor`, `docs`, etc. to indicate what type of commit it is.
- In your commit message body, focus on the why instead of the what. Your diff shows what changed; explain the why in your message. Answer questions such as:
  - What is the goal and purpose of these changes?
  - Why did you do it this way?
  - What other ways did you consider?
  - What tradeoffs did you make?
  - What would you want to know if you were reading these changes in a few months or you didn't have the context you have now?
