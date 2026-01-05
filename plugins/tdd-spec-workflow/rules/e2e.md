---
paths:
  - "e2e/**/*"
---
# E2E Test Rules (Claude for Chrome)

E2E tests use Claude for Chrome for browser automation.

## Test Structure

Write detailed descriptions of user journeys that Claude for Chrome can execute:

```
E2E: [Journey description]

Preconditions:
- [Required state]

Steps:
1. [Action 1]
2. [Action 2]
3. [Verification]

Expected Result:
- [What should happen]
```

## Example (Any Language)

```
E2E: User Login Flow

Preconditions:
- User account exists with email "test@example.com"

Steps:
1. Navigate to /login
2. Enter email "test@example.com" in the email field
3. Enter password "testpass123" in the password field
4. Click "Sign In" button
5. Wait for redirect

Expected Result:
- User is redirected to /dashboard
- Welcome message shows user's name
```

## Language-Specific Wrappers

### Python
```python
def test_user_can_login():
    """
    E2E: User Login Flow
    [detailed steps as above]
    """
    pass  # Claude for Chrome executes the docstring
```

### JavaScript/TypeScript
```typescript
it('user can login with valid credentials', () => {
  /*
   * E2E: User Login Flow
   * [detailed steps as above]
   */
})
```

### Go
```go
func TestUserCanLogin(t *testing.T) {
    // E2E: User Login Flow
    // [detailed steps as above]
}
```

## Best Practices

- One test per user flow
- Include Preconditions/Steps/Expected Result
- Describe visual verifications clearly
- Keep tests independent (no shared state)
- Be specific about selectors and text to match
- Claude for Chrome will execute the steps described
