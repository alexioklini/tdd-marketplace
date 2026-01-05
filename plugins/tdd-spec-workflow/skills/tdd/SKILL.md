---
name: tdd
description: Test-Driven Development expert for any language with Ralph Wiggum loops. Use when writing tests, implementing features with TDD, or executing tasks autonomously. Supports Python, JavaScript/TypeScript, Go, Rust, Java, and more.
---

# TDD Skill (Multi-Language + Ralph)

You are a TDD expert optimized for Ralph Wiggum autonomous loops. Guide through proper Red-Green-Refactor methodology with clear completion signaling.

## Ralph Loop Context

When running in a Ralph loop:
- Each iteration sees your previous changes
- Tests must ACTUALLY pass (not just claimed)
- Output `<promise>TASK_COMPLETE</promise>` ONLY when ALL criteria met
- If stuck, document what's blocking (helps next iteration)

## Red Phase (Write Failing Test)

1. Understand the requirement from spec-workflow task
2. Write a test describing expected behavior
3. Run the test command
4. Verify it FAILS (if it passes, you're not testing new behavior)

**Ralph tip:** Start EVERY task by creating the test file. The loop will iterate until implementation passes.

## Green Phase (Make It Pass)

1. Write MINIMAL code to pass the test
2. No extra features, no over-engineering
3. Run tests - verify it PASSES
4. If it fails, fix the implementation (not the test)

**Ralph tip:** Run tests after EVERY change. The loop sees test results.

## Refactor Phase

1. Clean up while keeping tests green
2. Run tests after each change
3. Extract functions, improve names, remove duplication

## Completion Criteria (MUST ALL BE TRUE)

Before outputting `<promise>TASK_COMPLETE</promise>`:

1. All tests pass (exit code 0)
2. Coverage meets threshold (typically >= 80%)
3. No linting errors
4. Implementation matches requirements

Only when ALL pass:
```
All tests passing. Coverage at [X]%. No lint errors.
Implementation complete per spec requirements.

<promise>TASK_COMPLETE</promise>
```

---

## Language-Specific Patterns

### Python (pytest)

**Test Structure:**
```python
import pytest
from src.module import function_name

class TestFunctionName:
    def test_should_return_expected_when_valid_input(self):
        # Arrange
        input_data = "valid"
        
        # Act
        result = function_name(input_data)
        
        # Assert
        assert result == "expected"
    
    def test_should_raise_error_when_invalid_input(self):
        with pytest.raises(ValueError, match="Invalid"):
            function_name(None)
```

**Commands:**
- Run: `pytest -v`
- Coverage: `pytest --cov=src --cov-report=term-missing`
- Lint: `ruff check src/`

---

### JavaScript/TypeScript (Vitest/Jest)

**Test Structure:**
```typescript
import { describe, it, expect } from 'vitest'
import { functionName } from './module'

describe('functionName', () => {
  it('should return expected when valid input', () => {
    // Arrange
    const input = 'valid'
    
    // Act
    const result = functionName(input)
    
    // Assert
    expect(result).toBe('expected')
  })
  
  it('should throw error when invalid input', () => {
    expect(() => functionName(null)).toThrow('Invalid')
  })
})
```

**Commands:**
- Run: `npm test` or `vitest`
- Coverage: `vitest --coverage`
- Lint: `eslint src/`

---

### Go

**Test Structure:**
```go
package module

import (
    "testing"
)

func TestFunctionName_ValidInput(t *testing.T) {
    // Arrange
    input := "valid"
    
    // Act
    result := FunctionName(input)
    
    // Assert
    if result != "expected" {
        t.Errorf("got %s, want %s", result, "expected")
    }
}

func TestFunctionName_InvalidInput(t *testing.T) {
    defer func() {
        if r := recover(); r == nil {
            t.Errorf("expected panic")
        }
    }()
    FunctionName("")
}
```

**Commands:**
- Run: `go test ./...`
- Coverage: `go test -cover ./...`
- Lint: `golangci-lint run`

---

### Rust

**Test Structure:**
```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_function_name_valid_input() {
        // Arrange
        let input = "valid";
        
        // Act
        let result = function_name(input);
        
        // Assert
        assert_eq!(result, "expected");
    }

    #[test]
    #[should_panic(expected = "Invalid")]
    fn test_function_name_invalid_input() {
        function_name("");
    }
}
```

**Commands:**
- Run: `cargo test`
- Coverage: `cargo tarpaulin`
- Lint: `cargo clippy`

---

### Java/Kotlin (JUnit 5)

**Test Structure:**
```java
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class FunctionNameTest {
    @Test
    void shouldReturnExpectedWhenValidInput() {
        // Arrange
        String input = "valid";
        
        // Act
        String result = functionName(input);
        
        // Assert
        assertEquals("expected", result);
    }
    
    @Test
    void shouldThrowWhenInvalidInput() {
        assertThrows(IllegalArgumentException.class, () -> {
            functionName(null);
        });
    }
}
```

**Commands:**
- Run: `./gradlew test` or `mvn test`
- Coverage: JaCoCo plugin
- Lint: `./gradlew spotlessCheck`

---

### Swift (XCTest)

**Test Structure:**
```swift
import XCTest
@testable import MyModule

final class FunctionNameTests: XCTestCase {
    func testShouldReturnExpectedWhenValidInput() {
        // Arrange
        let input = "valid"
        
        // Act
        let result = functionName(input)
        
        // Assert
        XCTAssertEqual(result, "expected")
    }
    
    func testShouldThrowWhenInvalidInput() {
        // Assert
        XCTAssertThrowsError(try functionName(nil)) { error in
            XCTAssertEqual(error as? MyError, .invalidInput)
        }
    }
}
```

**Commands:**
- Run: `swift test` or Xcode ⌘U
- Coverage: `swift test --enable-code-coverage`
- Lint: `swiftlint`

---

### C# (xUnit)

**Test Structure:**
```csharp
using Xunit;

public class FunctionNameTests
{
    [Fact]
    public void ShouldReturnExpected_WhenValidInput()
    {
        // Arrange
        var input = "valid";
        
        // Act
        var result = FunctionName(input);
        
        // Assert
        Assert.Equal("expected", result);
    }
    
    [Fact]
    public void ShouldThrow_WhenInvalidInput()
    {
        // Assert
        Assert.Throws<ArgumentException>(() => FunctionName(null));
    }
    
    [Theory]
    [InlineData("a", 1)]
    [InlineData("b", 2)]
    public void ShouldMapCorrectly(string input, int expected)
    {
        Assert.Equal(expected, MapFunction(input));
    }
}
```

**Commands:**
- Run: `dotnet test`
- Coverage: `dotnet test --collect:"XPlat Code Coverage"`
- Lint: `dotnet format --verify-no-changes`

---

### Xojo (XojoUnit)

**Test Structure:**
```xojo
// TestFunctionName.xojo_code
Class TestFunctionName Inherits XojoUnit.TestGroup
  
  Sub TestShouldReturnExpectedWhenValidInput()
    // Arrange
    Dim input As String = "valid"
    
    // Act
    Dim result As String = FunctionName(input)
    
    // Assert
    Assert.AreEqual("expected", result)
  End Sub
  
  Sub TestShouldRaiseExceptionWhenInvalidInput()
    Try
      Call FunctionName(Nil)
      Assert.Fail("Expected exception not raised")
    Catch err As RuntimeException
      Assert.Pass("Exception raised as expected")
    End Try
  End Sub
  
End Class
```

**Commands:**
- Run: Via Xojo IDE (XojoUnit app)
- Coverage: Manual tracking (no built-in coverage)
- Lint: Use IDE warnings

**Note:** Xojo has limited testing infrastructure. Consider:
- Separating business logic into testable modules
- Using XojoUnit for unit tests
- Manual E2E testing with documented test cases
- Claude for Chrome for web app testing

---

### Other Languages (Generic Pattern)

For languages not listed above, apply these universal TDD patterns:

**Test Structure (Pseudocode):**
```
// Test file: test_function_name.[ext] or function_name_test.[ext]

TestGroup FunctionNameTests {
  
  Test ShouldReturnExpectedWhenValidInput() {
    // Arrange - Set up test data
    input = "valid"
    
    // Act - Call the function
    result = FunctionName(input)
    
    // Assert - Verify the result
    AssertEqual(result, "expected")
  }
  
  Test ShouldThrowWhenInvalidInput() {
    // Arrange
    input = null
    
    // Act & Assert
    AssertThrows(() => FunctionName(input), ExpectedError)
  }
}
```

**Universal Principles:**

1. **Test Naming:** `test_should_[behavior]_when_[condition]` or `ShouldBehaviorWhenCondition`

2. **Arrange-Act-Assert:** Every test has three sections:
   - Arrange: Set up test data and mocks
   - Act: Call the function/method under test
   - Assert: Verify the result

3. **One Assert Per Test:** Keep tests focused on a single behavior

4. **Test Isolation:** Each test should be independent, no shared state

5. **Coverage Goals:**
   - Happy path (expected behavior)
   - Error cases (exceptions, invalid input)
   - Edge cases (empty, null, boundaries)

**Questions to Adapt to Your Language:**

| Question | Why It Matters |
|----------|----------------|
| How do you define a test function? | Some use decorators, some use naming conventions |
| How do you group related tests? | Classes, modules, describe blocks? |
| How do you assert equality? | `assert`, `expect`, `Assert.Equal`, etc. |
| How do you test for exceptions? | Try-catch, `assertThrows`, `expect().toThrow()`? |
| How do you mock dependencies? | Built-in, third-party library, manual? |
| How do you run tests? | CLI command, IDE, build tool? |
| How do you measure coverage? | Built-in, plugin, third-party tool? |

**Example Adaptation for Hypothetical Language "Foo":**

If user says: "I use FooTest framework with `@test` annotations"

```foo
// test_calculator.foo
import FooTest
import Calculator

class CalculatorTests {
  @test
  func shouldAddTwoNumbers() {
    // Arrange
    let calc = Calculator()
    
    // Act
    let result = calc.add(2, 3)
    
    // Assert
    FooTest.assertEqual(result, 5)
  }
  
  @test
  func shouldThrowOnDivideByZero() {
    let calc = Calculator()
    FooTest.assertThrows(() => calc.divide(10, 0))
  }
}
```

---

## E2E Tests (Claude for Chrome)

For all languages, write descriptive docstrings/comments for browser automation:

```
E2E: User login flow

Steps:
1. Navigate to /login
2. Enter email "test@example.com"
3. Enter password "password123"
4. Click "Submit" button
5. Verify redirect to /dashboard
6. Verify welcome message shows username

Claude for Chrome will execute these browser interactions.
```

---

## Ralph Loop Iteration Strategy

**Iteration 1-3:** Focus on test structure
- Create test file with all test cases
- Run tests - expect failures
- Skeleton implementation

**Iteration 4-8:** Implementation
- Make tests pass one by one
- Fix failures, don't change tests
- Check coverage

**Iteration 9+:** Polish
- Reach coverage threshold
- Fix lint errors
- Final verification

**If stuck after 10+ iterations:**
```
BLOCKER IDENTIFIED:
- Issue: [describe the problem]
- Attempted: [what was tried]
- Hypothesis: [what might fix it]
- Next iteration will try: [specific action]
```

---

## Test Type Guidelines

### Unit Tests
- Test individual functions/methods in isolation
- Mock external dependencies
- Fast execution (< 1 second each)
- Location: Co-located with source or `tests/unit/`

### Integration Tests
- Test component interactions
- Use real dependencies where possible (testcontainers)
- May be slower
- Location: `tests/integration/`

### E2E Tests
- Test full user flows
- Use Claude for Chrome
- Slowest, but most confidence
- Location: `e2e/`

---

## Common Debugging

1. **Test fails unexpectedly**: Check test isolation, shared state
2. **Coverage too low**: Add edge case tests, error path tests
3. **Lint errors**: Run auto-fix (`ruff check --fix`, `eslint --fix`)
4. **Flaky tests**: Check for race conditions, timing issues
