## General Guidelines
- Focus on writing simple, readable, and maintainable code. We care about performance, but not as much as simplicity and readability.
- Ensure the code you write is secure.
- Think hard and be thorough in your planned solution.
- Make sure you're searching the codebase for relevant information to confirm that your approach is correct.
- Consider if there are better solutions than what way me described in the requirements. Suggestions for better solutions are always appreciated!
- Ensure your solution is well thought through and handles edge cases.
- Make sure your solution meets all the requirements.
- Consider whether or not your changes would be best placed behind a feature flag.
- Whenever you make changes, update the tests accordingly. All changes must be tested.
- If making API changes, make sure to update the documentation.
- If making visual front-end changes, take a screenshot with Playwright and make sure the UI looks good. Iterate 2-3 times if needed until you’re happy with it.
- Manually test your changes through the web browser or by manually making API requests.
- You must delegate tasks to sub agents when the task matches a sub agents area of expertise.
- Once you've finished making changes, review all of your changes and make additional adjustments based on their feedback.

## MCP Tools
- Remember that you have access to the following MCP tools:
  - Context7 to look up documentation for any library, framework or tool you're using.
  - Serena for efficient codebase navigation and editing.
    - Make sure that the current project has been activated with Serena and onboarding has been performed.
  - Playwright to interact with our application in a real browser.

## Ruby
- Use modern Ruby features and idioms.
- Generally, lists of arguments, keys, includes, etc. should be in alphabetical
  order.

## Ruby on Rails
- Strive to follow Rails best practices and conventions.
- Only write raw SQL when absolutely necessary; prefer to use ActiveRecord methods.
- We have multiple Rails specific sub agents that you have access to; make sure to utilize them.

## Testing
- All tests must be written with RSpec.
- Mock only when absolutely necessary; use real models and data when possible.
- Use FactoryBot to create test objects.
- Follow existing test patterns.
- Use request tests; don't use controller tests.

## Git
- Don't commit your changes. A human will commit your changes after reviewing them.

## Files
- Whenever you reference a file, use the full path (relative to the project root); this makes it easier for me to open it in my editor.

## Linear
If a Linear issue is referenced, you can view it by using the `linear_fetch_issue` bash command.
Linear issue IDs look like `DEV-7892`.

## Project Context 
See @.serena/memories/ for project specific context.
