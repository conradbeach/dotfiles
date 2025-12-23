## Planning and Building
- Learn the codebase. Identify common patterns and conventions. Study and plan before implementing.
- Search the codebase for relevant information to confirm that your approach is correct.
- Consider if there are better solutions than what way me described in the requirements. Suggestions for better solutions are always appreciated!
- Ensure your solution is well thought through and handles edge cases.
- Don't make assumptions - verify with existing code.
- Make sure your solution meets all the requirements.
- Consider whether or not your changes would be best placed behind a feature flag.
- Whenever you make changes, update the tests accordingly. All changes must be tested.
- If making API changes, make sure to update the documentation.
- If making visual front-end changes, open the page in Chrome and make sure the UI looks good. Iterate 2-3 times if needed until you’re happy with it.
- Manually test your changes through the web browser or by manually making API requests.
- Once you've finished making changes, review all of your changes and make additional adjustments based on their feedback.

## Code Style
- Focus on writing simple, readable, and maintainable code.
- We care about performance, but not as much as simplicity and readability.
- Single responsibility per method/class.
- Avoid premature abstractions.
- Clear intent over clever code. Be boring and obvious.
- Pragmatic over dogmatic. Adapt to project realities.

## Ruby
- Use modern Ruby features and idioms.
- Generally, lists of arguments, keys, includes, etc. should be in alphabetical
  order.

## Testing
- Mock only when absolutely necessary; use real models and data when possible.
- Follow existing test patterns.
- Use request tests; don't use controller tests.

## Git
- Don't commit your changes. A human will commit your changes after reviewing them.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Tasks/Issues
- If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command. Linear issue IDs look like `DEV-7892`.
- Whenever we're working on a task, check the `~/Obsidian/Conrad/Work/Deseret Book/Development/Tasks` directory for a file containing the identifier of the task. Write your todos in this file under the "Tasks" header. Mark them as done once you complete them. You don't need to include implementation details in this list.
