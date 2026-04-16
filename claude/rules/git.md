# Git

- Commit regularly — after each logical chunk of work (a completed step, fix, or feature increment).
- When you make changes as a result of feedback/review, always do it in a new commit. This makes it easier to follow your changes.
- roborev will review each commit automatically in the background. Fix any feedback from roborev.
- Be thoughtful about pushing to remotes. Generally, you should ask permission or be very confident I want you to.
- Projects use git worktrees stored in `.worktrees/` inside the repository root. Typically you will be working inside a worktree, but if you are working in the repository root, ignore the `.worktrees/` directory — do not read, modify, or commit anything inside it.
- For commit messages, read and follow the Git commit template.
  - Add yourself (Claude) as a co-author.
  - Do not include Linear issue IDs or other ticket references in commit messages.
