## Development Workflow

For any non-trivial change, follow the below steps. You must complete each step.

1. Plan — use the Planning Team approach.
2. Build — follow the Planning and Building guidelines.
3. Manual testing — follow the Manual Testing guidelines.
4. Automated testing — follow the Automated Testing guidelines.
5. CI checks — confirm tests, linters, etc. are all green. In most projects `chp` will do this.
6. Simplify — run the /simplify skill.
7. Code quality — follow the Code Quality guidelines.
8. Review — run the /review skill.
9. Stage deploy — follow the Stage Deployment guidelines.

Add the above steps to your task list and confirm with me that you completed them when you're done working.

## Dependencies
- Always double check what the latest version available for a dependency is. Don't assume you know what's current.
- Confirm that you're referencing documentation for the correct version. Use modern patterns.

## Code Reviews
- Don't flag every possible edge case. Only raise error handling concerns that are genuinely likely or have meaningful consequences. Avoid defensive coding suggestions for low-probability scenarios.

## Documentation
- If making API changes, make sure to update the API documentation. This is the most important form of documentation.
- Code comments can be helpful when it's hard to make the code fully clear on its own or there's some context the code can't explain. However, generally, adding comments should be unnecessary.

## Fixing Bugs and Errors
- When you're fixing an application error or bug, always check an exception report from our error handling service. If you're not provided one, ask for one. 

## LSP
Remember you have access to LSP servers. Leverage their tools to navigate the codebase more effectively.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.

## Postman
- When interacting with Postman via the MCP server, default to using the personal workspace rather than the team workspace.

## HTTP Requests
- Use the `WebFetch` tool instead of `curl` whenever possible. It's more secure and works better with the permission system.

## Watching
When you're watching processes like deployments or CI runs, remember that you have the `Monitor` tool; it's likely the best tool for that type of job.

## External Communication
- When posting comments, messages, or other communication on my behalf (PR comments, issue comments, chat messages, etc.), make it clear the message is from Claude acting on my behalf.

## Accuracy and Verification
I interact with you like you're a competent colleague. It's very important to me
that I can trust your recommendations, statements, and analysis. But I can only
have that trust in you if you have taken the time to think through what you're
saying and you have taken the time to verify it. Do not make assumptions about
how you think things are. Confirm it in the code. Confirm it with documentation.
Check the API. Whatever you need to do, verify what you believe to be correct.
And take extra time to do it if you need to.
