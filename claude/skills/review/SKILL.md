---
name: review
description: "Run the full code review suite after completing a feature or fix. Use when work is complete and ready for review, when the user invokes /review, or when the Development Workflow calls for the review step. Runs 7 specialized review agents in parallel, addresses their feedback, then does a final PR review pass."
---

# Review

## Round 1: Parallel Reviews

Launch all seven agents simultaneously and wait for all to complete:

1. **Code review** - `@code-reviewer` - Bugs, logic errors, and code quality.
2. **Simplicity review** - `@pr-review-toolkit:code-simplifier` - Opportunities to simplify. For Rails projects, also launch `@rails-simplifier:rails-simplifier` in parallel.
3. **Functionality review** - `@manual-tester` - Verify the changes work as expected.
4. **Architecture review** - `@architecture-strategist` - Architectural soundness.
5. **Test coverage review** - `@test-coverage-reviewer` - Adequate test coverage.
6. **Documentation review** - `@docs-reviewer` - Accurate and adequate documentation.
7. **Security review** - `@security-reviewer` - Security concerns.

Once all seven complete, synthesize their feedback, apply changes that make sense, and ask the human for input on anything uncertain.
After making changes, ask for follow-up reviews from specific subagents if it seems appropriate or helpful.

## Round 2: Final PR Review

After Round 1 feedback has been addressed, run `/pr-review-toolkit:review-pr` for a final comprehensive pass.
