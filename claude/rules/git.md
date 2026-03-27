# Git

- Commit regularly — after each logical chunk of work (a completed step, fix, or feature increment).
- When you make changes as a result of feedback/review, always do it in a new commit. This makes it easier to follow your changes.
- roborev will review each commit automatically in the background. Fix any feedback from roborev.
- Don't push your changes. A human will review and push.
- Projects use git worktrees stored in `.worktrees/` inside the repository root. Typically you will be working inside a worktree, but if you are working in the repository root, ignore the `.worktrees/` directory — do not read, modify, or commit anything inside it.
- For commit messages, read and follow the Git commit template.
