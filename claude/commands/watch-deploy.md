---
description: Watch an in-progress deployment to stage or production, smoke test, and monitor for errors
---

## Your task

Watch a deployment to the specified environment, smoke test once it's up, report back, and monitor Rollbar for new errors.

**Environment:** $ARGUMENTS (if empty, default to `stage`)

Only accept `stage` or `production`. If `$ARGUMENTS` is something else, ask the user to clarify before proceeding.

### Steps

1. **Identify the deployment** — Figure out what's being deployed:
   - Which branch corresponds to this environment in the current project (e.g., `stage` branch for stage, `main` or `master` for production).
   - The most recent commit pushed to that branch and the deployment workflow triggered by it.
   - The environment's URL for smoke testing (check project docs, README, or recent deploy history if unsure — ask the user if you can't determine it confidently).
   - Confirm with the user before proceeding if anything is ambiguous, especially for production.

2. **Watch the deployment** — Stream the deployment's progress and react to completion or failure events as they arrive.

3. **Smoke test** — Once the deployment succeeds, verify the site is up by visiting it in a browser or curling it. Confirm you get a healthy response (e.g., 200 status, expected content).

4. **Report success** — Tell the user the deployment succeeded and the site is up. Include:
   - The environment deployed to
   - The commit/PR deployed
   - Confirmation the smoke test passed
   - That you'll continue watching Rollbar for errors

5. **Monitor for errors** — Check Rollbar at 5 minutes and 10 minutes after the deploy for any new errors that might be related to the deployed changes. Report findings to the user. Pace the checks rather than blocking on long sleeps.

### If the deployment fails

- Stop and report the failure to the user with the relevant logs/error.
- For **stage**: you may diagnose and attempt a fix if the cause is clear and low-risk.
- For **production**: do not attempt any fix, rollback, or re-deploy without explicit user confirmation. Report the failure and wait for instructions.

### Production-specific caution

Production deploys have higher stakes. Be extra careful:
- Double-check the branch and commit before claiming the deploy started correctly.
- Do not take any corrective action (rollback, re-deploy, hotfix) without explicit user approval.
- Err toward over-communicating status.
