---
name: review
description: Run the full code review suite after completing a feature or fix. Use when work is complete and ready for review, when the user invokes /review, or when the Development Workflow calls for the review step. Runs specialized review agents in parallel and addresses their feedback.
---

# Review

Launch all of the agents below simultaneously and wait for all to complete:

1. **Code review** - `@code-reviewer` - Bugs, logic errors, and code quality.
2. **Functionality review** - `@manual-tester` - Verify the changes work as expected.
3. **Architecture review** - `@architecture-strategist` - Architectural soundness.
4. **Silent failure review** - `@silent-failure-hunter` - Silent failures, inadequate error handling, and inappropriate fallback behavior.
5. **Test coverage review** - `@test-coverage-reviewer` - Adequate test coverage.
6. **Documentation review** - `@docs-reviewer` - Accurate and adequate documentation.
7. **Security review** - `@security-reviewer` - Security concerns.

Once all agents complete, synthesize their feedback, apply changes that make sense, and ask the human for input on anything uncertain.
After making changes, ask for follow-up reviews from specific subagents if it seems appropriate or helpful.
