---
paths:
  - "**/test_*.*"
  - "**/*_test.*"
  - "**/*.test.*"
  - "**/*.spec.*"
  - "**/*Tests.swift"
  - "**/*Test.cs"
  - "**/*Tests.cs"
  - "**/Test*.xojo_code"
  - "tests/**/*"
  - "**/conftest.py"
---
# Test File Rules

## General Principles

- Name tests descriptively: `should_[behavior]_when_[condition]`
- Use Arrange-Act-Assert pattern
- Test one behavior per test
- Keep tests isolated and independent

## Required Coverage

- Happy path (expected behavior)
- Error cases (exceptions, invalid input)
- Edge cases (empty, null, boundaries)

## Language-Specific Patterns

### Python (pytest)
```python
class TestAuthenticate:
    def test_should_return_user_when_credentials_valid(self):
        # Arrange
        credentials = {"email": "test@example.com", "password": "secret"}
        # Act
        result = authenticate(credentials)
        # Assert
        assert result.email == "test@example.com"
```

### JavaScript/TypeScript (Vitest/Jest)
```typescript
describe('authenticate', () => {
  it('should return user when credentials valid', () => {
    // Arrange
    const credentials = { email: 'test@example.com', password: 'secret' }
    // Act
    const result = authenticate(credentials)
    // Assert
    expect(result.email).toBe('test@example.com')
  })
})
```

### Go
```go
func TestAuthenticate_ValidCredentials(t *testing.T) {
    // Arrange
    credentials := Credentials{Email: "test@example.com", Password: "secret"}
    // Act
    result, err := Authenticate(credentials)
    // Assert
    if err != nil {
        t.Fatalf("unexpected error: %v", err)
    }
    if result.Email != "test@example.com" {
        t.Errorf("got %s, want test@example.com", result.Email)
    }
}
```

### Swift (XCTest)
```swift
final class AuthenticateTests: XCTestCase {
    func testShouldReturnUserWhenCredentialsValid() {
        // Arrange
        let credentials = Credentials(email: "test@example.com", password: "secret")
        // Act
        let result = authenticate(credentials)
        // Assert
        XCTAssertEqual(result.email, "test@example.com")
    }
}
```

### C# (xUnit)
```csharp
public class AuthenticateTests
{
    [Fact]
    public void ShouldReturnUser_WhenCredentialsValid()
    {
        // Arrange
        var credentials = new Credentials("test@example.com", "secret");
        // Act
        var result = Authenticate(credentials);
        // Assert
        Assert.Equal("test@example.com", result.Email);
    }
}
```

### Xojo (XojoUnit)
```xojo
Class TestAuthenticate Inherits XojoUnit.TestGroup
  Sub TestShouldReturnUserWhenCredentialsValid()
    // Arrange
    Dim credentials As New Credentials("test@example.com", "secret")
    // Act
    Dim result As User = Authenticate(credentials)
    // Assert
    Assert.AreEqual("test@example.com", result.Email)
  End Sub
End Class
```

## Fixtures / Setup

- Shared setup goes in appropriate fixture file
- Python: `conftest.py`
- JavaScript: `beforeEach`, `beforeAll`, or setup files
- Go: `TestMain`, helper functions
- Swift: `setUp()` / `tearDown()` methods
- C#: Constructor / `IDisposable` or `[SetUp]` / `[TearDown]`
- Xojo: `Setup()` / `TearDown()` methods
- Clean up resources after tests

## Other Languages

For languages not listed above, apply these principles:

1. **Naming:** Use descriptive names like `test_should_behavior_when_condition`
2. **Pattern:** Arrange-Act-Assert in every test
3. **Isolation:** Each test should be independent
4. **Coverage:** Test happy path, errors, and edge cases

Ask Claude to help adapt patterns to your specific language and framework.
