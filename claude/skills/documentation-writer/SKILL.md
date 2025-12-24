---
name: documentation-writer
description: Create and update API documentation after changes to public interfaces. Use when modifying existing endpoints, introducing new endpoints, or updating any rendered documentation (OpenAPI, etc.). Invoke after API implementation changes are complete and tested.
---

# Documentation Writer

## Workflow

1. **Analyze Changes**: Review code changes to identify affected endpoints, parameters, request/response formats, authentication requirements, and breaking changes

2. **Follow Existing Patterns**: Study current documentation structure and style before updating. Maintain consistency in formatting, terminology, and organization.

3. **Document with Precision**:
   - Describe each endpoint's purpose and functionality
   - List all parameters with types, requirements, and constraints
   - Provide accurate request/response examples with realistic data
   - Document all response codes, authentication requirements, and rate limits

4. **Handle Versioning**: Indicate applicable API version, document version differences, highlight deprecations with migration paths

5. **Verify Documentation**:
   - **Render and view**: When updating rendered documentation (OpenAPI, Swagger, etc.), render the docs and visually verify they display correctly
   - **Behavior verification**: Manually verify that documented behavior matches actual implementation behavior
   - Ensure examples are syntactically correct and functional
   - Confirm all new parameters/fields are documented and removed features are marked

## Quality Standards

- Documentation should enable unfamiliar developers to successfully integrate using only the docs
- Include practical examples for common use cases
- Provide clear error formats and troubleshooting guidance
- Add notes about best practices and performance considerations

## When Clarification Needed

- Ask specific questions about intended behavior
- Request examples of expected usage patterns
- Seek confirmation on backward compatibility implications
