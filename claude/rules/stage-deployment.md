# Stage Deployment

## Overview

Once you're confident your work is complete, deploy the feature branch to stage so the user can test.

## Steps

1. **Merge into stage** — Merge the feature branch into the `stage` branch.
2. **Run checks** — Run `chp` to confirm CI checks pass on the stage branch.
3. **Push** — Push the `stage` branch to the remote.
4. **Watch the deployment** — Use `/loop` to monitor the deployment until it succeeds. Check deployment status using `gh` (e.g., `gh run list --branch stage`, `gh run watch`). Poll until the deployment run completes successfully.
5. **Report** — Once the deployment is confirmed successful, tell the user: the feature has been tested, looks good, and is on stage ready for them to test.

## Important

- Complete all of these steps before notifying the user that work is ready for review.
- If the deployment fails, diagnose and fix the issue before alerting the user.
- The goal is zero wait time for the user — when they see your message, stage is already live and testable.
