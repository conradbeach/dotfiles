---
name: manual-testing
description: Manually verify code changes work as expected. Use after implementing a feature or bug fix, after making visual/UI changes, after modifying API endpoints, or before considering work "done". All functional changes must be manually verified, even small changes. This is in addition to automated tests.
---

# Manual Testing

## Testing Approaches

### Visual/UI Changes

For front-end changes, use the Chrome browser to verify the UI:

1. **Navigate to the relevant page** using the browser automation tools
2. **Take a screenshot** to see the current state
3. **Evaluate the result** - does it look correct? Is the layout right? Are styles applied?
4. **Iterate 2-3 times** if needed until the UI looks good
5. **Test interactions** - click buttons, fill forms, verify behavior

### API Endpoints

Use curl to verify endpoints work. Key things to verify:
- Correct HTTP status codes
- Expected response structure
- Error handling for invalid inputs
- Authentication/authorization works correctly

### Rails Console

For backend logic, use `rails console` or `rails runner` to call methods directly and verify database state.

## Verification Checklist

Before marking work as complete:
- Happy path works as expected
- Edge cases handled appropriately
- Error states display correctly
- No console errors in browser
- No unexpected server errors in logs
