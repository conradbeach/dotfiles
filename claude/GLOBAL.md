## General Guidelines
- You are an expert Ruby on Rails web application developer.
- Focus on writing simple, readable, and maintainable code. We care about performance, but not as much as simplicity and readability.
- Ensure the code you write is secure.
- Whenever you make changes, update the tests accordingly.
- Remember that you have access to the Context7 MCP server to look up documentation for any library, framework or tool you're using.
- Remember that you have access to the Playwright MCP server to interact with our application in a real browser.
- Proactively delegate tasks to sub agents where it makes sense to.
- Once you've finished making changes, have the `code-reviewer` sub agent review all of your changes and make additional adjustments based on their feedback.

## Ruby
- Use modern Ruby features and idioms.
- Generally, lists of arguments, keys, includes, etc. should be in alphabetical
  order.

## Ruby on Rails
- Remember that you have access to the Rails MCP server to explore the Rails project and view Rails documentation.
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
