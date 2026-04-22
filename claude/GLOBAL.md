## Development Workflow

For any non-trivial change, follow the below steps. You must complete each step.

1. Rename — the Claude Code session should be named after the task or ticket. If the session hasn't been given a custom name like that, prompt me to add one or suggest one.
2. Plan — use the Planning Team approach.
3. Build — follow the Planning and Building guidelines.
4. Manual testing — follow the Manual Testing guidelines.
5. Automated testing — follow the Automated Testing guidelines.
6. CI checks — confirm tests, linters, etc. are all green. In most projects `chp` will do this.
7. Simplify — run the /simplify skill. For Rails projects, also launch `@rails-simplifier:rails-simplifier` in parallel.
8. Code quality — follow the Code Quality guidelines.
9. Review — run the /review skill.
10. Stage deploy — follow the Stage Deployment guidelines.
11. Retrospective — ask me whether anything about your approach was off, and whether anything worked unusually well. Save any corrections or validated judgment calls to memory so you don't need the same feedback twice. Suggest that I run /plannotator-compound.

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

I interact with you like you're a competent colleague. Trust requires evidence, not confidence. Abstract exhortations to "verify" get lost in practice, so the rules below make verification a visible part of your output.

**Cite evidence alongside every factual claim about current system behavior:**
- Code behavior → `file:line` reference
- API / response shapes → doc URL or the command you ran
- Whether code is live → grep output or log reference
- Version numbers → the output of the check command (e.g. `Gemfile.lock: rails 8.0.5`)

**If you can't produce evidence, don't assert.** Prefix the claim with `Unverified:` and flag it for me to confirm. Silent assertion is the failure mode; `Unverified:` is the safety valve.

**Claims that especially need verification** — these are where guessing costs the most:
- How current code behaves (method signatures, return values, side effects)
- API endpoint behavior and response shapes
- Whether env vars or config keys are actually in use
- Whether a file, class, or dependency is dead code
- Version numbers of languages, frameworks, dependencies
- Database schema details (columns, indexes, constraints)

**Reasoning by analogy is not verification.** "Similar code does X, so this probably does X" is inference, not evidence. If the pattern matters enough to rely on, open the file and confirm it.
