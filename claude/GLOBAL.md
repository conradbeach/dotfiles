## Development Workflow
For any non-trivial change, follow the below steps. You must complete each step.
1. Plan
  - Use the Planning Team approach described in the "Planning Team" section below.
2. Build
  - See the Planning and Building section below.
3. Manual testing
  - See the /manual-testing skill.
4. Automated testing
  - See the /automated-testing skill.
5. CI checks
  - Confirm that tests, linters, etc. are all green. In most of my projects `chp` will do this for you.
6. Review
   - Run the /review skill.

Add the above steps to your task list and confirm with me that you completed them when you're done working.

## Planning Team
For the planning step, create a team with three agents. Then synthesize their findings into a formal plan.

### Team Members

**Codebase Explorer** (subagent_type: `Explore`)
- Deep-dive into existing code relevant to the task
- Map relevant files, trace execution paths, identify existing patterns and conventions
- Identify dependencies, potential conflicts, and constraints
- Answers: "What do we have today and how does it work?"

**Best Practices Researcher** (subagent_type: `best-practices-researcher`)
- Use the @best-practices-researcher agent to evaluate best practices for the work being planned.
- Answers: "What's the right way to do this according to docs and community standards?"

**Architecture Strategist** (subagent_type: `architecture-strategist`)
- Use the @architecture-strategist agent to evaluate appropriate and effective architectural approaches for the work being planned.
- Answers: "What is the best architectural approach and what fits best into our current architecture?"

**Plan Critic** (subagent_type: `general-purpose`)
- Wait for the Codebase Explorer, Best Practices Researcher and Architecture Strategist to finish before running this agent (set `blockedBy` on their tasks)
- Review their findings and the proposed approach
- Challenge assumptions, identify gaps or risks, and suggest simpler alternatives
- Look for over-engineering, missing edge cases, and security concerns
- Answers: "What could go wrong, what's missing, and is there a simpler way?"

### Creating the Plan
1. Start the Codebase Explorer, Best Practices Researcher and Architecture Strategist team members.
2. Once all 3 finish their work, read their findings and resolve any conflicts between recommendations.
3. Create a plan.
4. Present the plan to the Plan Critic.
5. Make updates to the plan based on the Plan Critic's feedback. Do additional research if needed.
6. Present the plan to the user for review.

## Planning and Building
### Before You Build
1. **Learn first** - Study the codebase before implementing. Search for similar functionality to understand how problems are typically solved in this project.
2. **Verify approach** - Search for relevant code to confirm your approach matches existing patterns. Don't assume—verify with existing code.
3. **Consider improvements** - Consider if there's a better solution than what was described.
4. **Be thorough** - Take the time to thoroughly consider and confirm your solution. Be very confident before writing any code.
5. **Ask questions** - Ask as many clarifying questions as needed to fully understand the requirements and the desired solution. Better to ask too many questions than too few.
6. **Look up reference material** - Always read relevant documentation. Use the #context7 MCP Server to look things up. Refer to other materials such as library READMEs, Rails guides, etc. Do this every time you are working with a language, framework, library etc. Never assume that you know the answer as these things change frequently. Your training date is in the past so your knowledge is likely out of date, even if it is a technology you are familiar with. 

### Think Before Coding
Don't assume. Don't hide confusion. Surface tradeoffs.

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### Correctness
- It is very important that changes are correct.
- Double check requirements as needed.
- Double check language or framework documentation to verify the accuracy of your solution.
- Don't guess. For example, if I ask you to upgrade the application to Ruby 3.4, don't guess what the latest 3.4.x version is; look it up.

### Simplicity First
Write simple, readable, maintainable code. When in doubt, choose the more obvious approach.

- Don't write speculative code.
- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### TDD
TDD should lead to more rigor and better results. Always build using red-green-refactor TDD.
Read the /test-driven-development skill.

### Goal-Driven Execution

Define success criteria. Loop until verified.

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:

1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

### Code Principles
- **Simplicity above all** - Write simple, readable, maintainable code. When in doubt, choose the more obvious approach.
- **Single responsibility** - One purpose per method and class
- **Clear intent over clever code** - Be boring and obvious

## Dependencies
- Always double check what the latest version available for a dependency is. Don't assume you know what's current.
- Confirm that you're referencing documentation for the correct version. Use modern patterns.

## Documentation
- If making API changes, make sure to update the API documentation. This is the most important form of documentation.
- Code comments can be helpful when it's hard to make the code fully clear on its own or there's some context the code can't explain. However, generally, adding comments should be unnecessary.

## Git
- Commit regularly — after each logical chunk of work (a completed step, fix, or feature increment). roborev will review each commit automatically in the background.
- Don't push your changes. A human will review and push.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.
