## Development Workflow
For any non-trivial change, follow the below steps. You must complete each step.
1. Plan
  - We'll use your built in planning mode.
2. Build
  - See the Planning and Building section below.
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
10. CI checks
  - Confirm that tests, linters, etc. are all green. In most of my projects `chp` will do this for you.

Add the above steps to your task list and confirm with me that you completed them
when you're done working.

## Planning and Building
### Before You Build
1. **Learn first** - Study the codebase before implementing. Search for similar functionality to understand how problems are typically solved in this project.
2. **Verify approach** - Search for relevant code to confirm your approach matches existing patterns. Don't assume—verify with existing code.
3. **Consider improvements** - Consider if there's a better solution than what was described.
4. **Be thorough** - Take the time to thoroughly consider and confirm your solution. Be very confident before writing any code.
5. **Ask questions** - Ask as many clarifying questions as needed to fully understand the requirements and the desired solution. Better to ask too many questions than too few.
6. **Look up reference material** - Always read relevant documentation. Use the #context7 MCP Server to look things up. Refer to other materials such as library READMEs, Rails guides, etc. Do this every time you are working with a language, framework, library etc. Never assume that you know the answer as these things change frequently. Your training date is in the past so your knowledge is likely out of date, even if it is a technology you are familiar with. 

### Correctness
- It is very important that changes are correct.
- Double check requirements as needed.
- Double check language or framework documentation to verify the accuracy of your solution.

### Code Principles
- **Simplicity above all** - Write simple, readable, maintainable code. When in doubt, choose the more obvious approach.
- **Single responsibility** - One purpose per method and class
- **No premature abstractions** - Wait until patterns emerge
- **Clear intent over clever code** - Be boring and obvious

## Documentation
- If making API changes, make sure to update the API documentation.
- Comments can be helpful when it's hard to make the code fully clear on its own or there's some context the code can't explain. However, generally, adding comments should be unnecessary.

## Git
- Don't commit your changes. A human will commit your changes after reviewing them.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.
