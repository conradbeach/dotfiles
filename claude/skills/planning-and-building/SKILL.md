---
name: planning-and-building
description: Approach for planning and implementing code changes. Use when starting new features, bug fixes, or any implementation work. Covers learning the codebase first, verifying approaches, and writing simple maintainable code.
---

# Planning and Building

## Before You Build

### Learn First

Study the codebase before implementing. Identify patterns and conventions already in use. Search for similar functionality to understand how problems are typically solved in this project.

### Verify Your Approach

- Search for relevant code to confirm your approach matches existing patterns
- Don't assume—verify with existing code
- Consider if there's a better solution than what was described in requirements
- Suggestions for improvements are always welcome

### Plan Thoroughly

- Ensure your solution handles edge cases
- Confirm your solution meets all requirements
- Consider whether changes should be behind a feature flag

## Code Style

### Simplicity Above All

Write simple, readable, maintainable code. Performance matters, but not as much as clarity. When in doubt, choose the more obvious approach.

### Design Principles

- **Single responsibility** per method and class
- **No premature abstractions**—wait until patterns emerge
- **Clear intent over clever code**—be boring and obvious
- **Pragmatic over dogmatic**—adapt to project realities
