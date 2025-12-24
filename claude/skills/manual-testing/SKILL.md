---
name: manual-testing
description: Manually verify code changes work as expected. Use after completing implementation work, in addition to automated tests. Covers visual UI testing in Chrome, API endpoint testing, and Rails console verification. Activates when changes are complete and ready for verification.
---

# Manual Testing

After completing a set of changes, manually verify that the code functions as expected. This is in addition to writing automated tests.
All functional changes must be manually verified, even small changes.

## When to Manually Test

- After implementing a feature or bug fix
- After making visual/UI changes
- After modifying API endpoints
- Before considering work "done"

## Testing Approaches

### Visual/UI Changes

For front-end changes, use the Chrome browser to verify the UI:

1. **Navigate to the relevant page** using the browser automation tools
2. **Take a screenshot** to see the current state
3. **Evaluate the result** - does it look correct? Is the layout right? Are styles applied?
4. **Iterate 2-3 times** if needed until the UI looks good
5. **Test interactions** - click buttons, fill forms, verify behavior

### API Endpoints

For API changes, make requests to verify the endpoint works:

```bash
# GET request
curl -s http://localhost:3000/api/endpoint | jq

# POST request with JSON
curl -s -X POST http://localhost:3000/api/endpoint \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}' | jq

# With authentication (if needed)
curl -s http://localhost:3000/api/endpoint \
  -H "Authorization: Bearer TOKEN" | jq
```

Key things to verify:
- Correct HTTP status codes
- Expected response structure
- Error handling for invalid inputs
- Authentication/authorization works correctly

### Rails Console

For backend logic, use the Rails console or Rails runner to verify behavior.

Useful console techniques:
- Create/find records to test with
- Call methods directly and inspect results
- Check database state after operations
- Verify associations and validations


## Verification Checklist

Before marking work as complete:

- [ ] Happy path works as expected
- [ ] Edge cases handled appropriately
- [ ] Error states display correctly
- [ ] No console errors in browser
- [ ] No unexpected server errors in logs
- [ ] Changes match the requirements
