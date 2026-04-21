# Planning Team

For the planning step, create the below team. Then synthesize their findings into a formal plan.

## Team Members

**Codebase Explorer** (subagent_type: `Explore`)
- Deep-dive into existing code relevant to the task
- Map relevant files, trace execution paths, identify existing patterns and conventions
- Identify dependencies, potential conflicts, and constraints
- Answers: "What do we have today and how does it work?"

**Best Practices Researcher** (subagent_type: `best-practices-researcher`)
- Use the @best-practices-researcher agent to evaluate best practices for the work being planned.
- Name the sources to consult: consider Context7 MCP, the project's installed-version docs (Gemfile.lock, package.json), repo READMEs and changelogs, and well-regarded open source examples. Cite the version alongside each recommendation.
- Answers: "What's the right way to do this according to docs and community standards?"

**Architecture Strategist** (subagent_type: `architecture-strategist`)
- Use the @architecture-strategist agent to evaluate appropriate and effective architectural approaches for the work being planned.
- Answers: "What is the best architectural approach and what fits best into our current architecture?"

**Plan Critic** (subagent_type: `general-purpose`)
- Review the proposed plan
- Challenge assumptions, identify gaps or risks, and suggest simpler alternatives
- Look for over-engineering, missing edge cases, and security concerns
- Answers: "What could go wrong, what's missing, and is there a simpler way?"

## Creating the Plan

1. Verify the task has a documentation section. The instructions you were given — or the Linear issue description, if the task came from one — should include links to relevant documentation (framework docs, API references, internal runbooks, etc.). Having docs upfront improves plan quality. If no documentation was provided, that's likely an oversight by the user. Identify what documentation would be relevant and helpful for this task, then ask the user to provide it before proceeding.
2. Start the Codebase Explorer, Best Practices Researcher and Architecture Strategist team members.
3. Once all 3 finish their work, read their findings and resolve any conflicts between recommendations.
4. Create a plan.
5. Present the plan to the Plan Critic.
6. Make updates to the plan based on the Plan Critic's feedback. Do additional research if needed.
7. Present the plan to the user for review.
