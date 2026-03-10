## Development Workflow

For any non-trivial change, follow the below steps. You must complete each step.

1. Plan — use the Planning Team approach.
2. Build — follow the Planning and Building guidelines.
3. Manual testing — follow the Manual Testing guidelines.
4. Automated testing — follow the Automated Testing guidelines.
5. CI checks — confirm tests, linters, etc. are all green. In most projects `chp` will do this.
6. Simplify — run the /simplify skill.
7. Review — run the /review skill.

Add the above steps to your task list and confirm with me that you completed them when you're done working.

## Dependencies
- Always double check what the latest version available for a dependency is. Don't assume you know what's current.
- Confirm that you're referencing documentation for the correct version. Use modern patterns.

## Code Reviews
- Don't flag every possible edge case. Only raise error handling concerns that are genuinely likely or have meaningful consequences. Avoid defensive coding suggestions for low-probability scenarios.

## Documentation
- If making API changes, make sure to update the API documentation. This is the most important form of documentation.
- Code comments can be helpful when it's hard to make the code fully clear on its own or there's some context the code can't explain. However, generally, adding comments should be unnecessary.

## LSP
Remember you have access to LSP servers. Leverage their tools to navigate the codebase more effectively.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.
