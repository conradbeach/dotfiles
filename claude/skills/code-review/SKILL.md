---
name: code-review
description: Review code changes systematically. Use when reviewing PRs, self-reviewing changes, or evaluating code quality. Covers design review, implementation review, test review, and documentation review in order of importance.
---

# Code Review

## 1. Design and Architecture

Review overall design first. Major structural problems invalidate detailed code review.

- Is the architecture sound?
- Does the approach fit the codebase patterns?
- Are there better alternatives?

## 2. Correctness

Does the feature work correctly and meet all requirements?

## 3. Implementation Code

- **Quality**: Does it improve overall codebase health?
- **Complexity**: Can it be understood and reasoned about relatively easily? If not, it's probably too complex.
- **Readability**: Good names, appropriate comments, clear intent?
- **Overengineering**: Solving speculative problems? Adding unneeded functionality?

## 4. Test Coverage

Compare implementation files to test files:

- Is there good coverage of the changes?
- Are important behaviors tested?

## 5. Test Code Quality

Review each test:

- Will tests be difficult to maintain?
- Are tests simple enough to provide confidence? (There are no tests for the tests.)

## 6. Documentation

- README, wiki pages, inline comments updated as needed?
- YARD docs for public methods if appropriate?
- API docs updated if endpoints changed?
