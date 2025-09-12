Build a feature end to end

## Instructions
Your task is to build the feature described in the requirements below from start to finish.

If you're given a Linear issue, fetch the Linear issue using the MCP server. Fetch any
comments in the issue as well. This will provide you with the context you need to build things correctly.

Create a sub-agent and assign it to do the work in the /explain-feature-context
command (passing it the requirements I'm giving you).

After the first agent is done, create a new sub-agent and assign it to do the work in the /plan-feature
command (passing it the requirements I'm giving you).

After that agent is done, proceed with the implementation by creating a sub-agent
and assigning it to do the work in the /build-feature-from-plan command.

## Requirements
$ARGUMENTS
