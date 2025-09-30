Build a feature from the plan

## Instructions
Your task is to implement the feature described in the requirements below.

If you're given a Linear issue, fetch the Linear issue using the MCP server. Fetch any
comments in the issue as well. This will provide you with context you neeed to implement things.

Also take a look at @Context_from_Claude.md if it exists; this file was created during a
previous research phase you did and provides helpful context for the work we're doing.

We've already created a development plan in @Plan_from_Claude.md. Your task is
to implement this plan to meet the given requirements. If you find a problem with
the plan, of course feel free to make the necessary changes, but also bear in mind
that the plan has been well thought through.

- Create small, atomic commits as you go.
- Every commit should have tests for the changes. Don't commit untested code. Use the `rails-automated-testing-specialist`.
- For every commit, run linters.
- Once you're confident the requirements of the plan are fully met and your changes are well tested, execute `chp` to run the project checks and confirm everything looks good.
- If everything looks good, you're done. A human will review your changes.

## Requirements
$ARGUMENTS
