# Stage Deployment

## Overview

Once you're confident your work is complete, deploy the feature branch to stage so the user can test.

## Steps

1. **Merge into stage** — Merge the feature branch into the `stage` branch.
2. **Run checks** — Run `chp` to confirm CI checks pass on the stage branch.
3. **Push** — Push the `stage` branch to the remote.
4. **Watch, smoke test, report, and monitor** — Run the `/watch-deploy stage` command to handle the rest: streaming deploy progress, smoke testing the site, reporting success, and monitoring Rollbar for new errors.

## Important

- **`chp` must be fully green before pushing.** Do not push to `stage` unless every check passes. A broken push leaves the stage branch in a failed state for everyone — not just you. If `chp` fails, fix the issue on the feature branch, re-merge into `stage`, and re-run `chp` until it's clean.
  - **Exception — Media API:** The "Rubocop with Todo Disabled" check is almost always red on `stage` and does not block the deploy. It can be safely ignored.
- Complete all of these steps before notifying the user that work is ready for review.
- If the deployment fails, diagnose and fix the issue before alerting the user.
- The goal is zero wait time for the user — when they see your message, stage is already live and testable.
