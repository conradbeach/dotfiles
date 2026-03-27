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

1. Start the Codebase Explorer, Best Practices Researcher and Architecture Strategist team members.
2. Once all 3 finish their work, read their findings and resolve any conflicts between recommendations.
3. Create a plan.
4. Present the plan to the Plan Critic.
5. Make updates to the plan based on the Plan Critic's feedback. Do additional research if needed.
6. Present the plan to the user for review.
