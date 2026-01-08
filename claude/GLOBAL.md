## Development Workflow
For any non-trivial change, follow the below steps. You must complete each step.
1. Plan
  - We'll use your built in planning mode.
2. Build
  - See the planning-and-building skill.
3. Manual testing
  - See the manual-testing skill.
4. Automated testing
  - See the automated-testing skill.
5. Code review
  - Once your work is complete, have the @code-reviewer agent review your changes.
6. Simplicity review
  - Have the @pr-review-toolkit:code-simplifier agent review your changes for opportunities to simplify.
7. Functionality review
  - Have the @manual-tester agent test your changes.
8. Test coverage review
  - Have the @test-coverage-reviewer agent confirm your code has sufficient coverage.
9. Security Review
  - Have the @security-reviewer agent check for security concerns in the changes.

Add the above steps to your task list and confirm with me that you completed them
when you're done working.

## Documentation
- If making API changes, make sure to update the API documentation.
- Comments can be helpful when it's hard to make the code fully clear on its own or there's some context the code can't explain. However, generally, adding comments should be unnecessary.

## Git
- Don't commit your changes. A human will commit your changes after reviewing them.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.
