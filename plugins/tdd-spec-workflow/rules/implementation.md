---
paths:
  - "src/**/*"
  - "Sources/**/*"
  - "**/*.swift"
  - "**/*.cs"
  - "**/*.xojo_code"
  - "!src/**/test_*"
  - "!src/**/*_test.*"
  - "!src/**/*.test.*"
  - "!src/**/*.spec.*"
  - "!**/*Tests.swift"
  - "!**/*Test.cs"
  - "!**/Test*.xojo_code"
  - "!src/**/conftest.py"
  - "!src/**/__init__.py"
---
# Implementation Rules (TDD)

**Before writing or modifying this file:**

1. Check if a test file exists for this module
2. If NOT, create the test file FIRST
3. Write failing tests for new functionality
4. Only then implement the code

**Test file locations by language:**

| Language | Pattern | Example |
|----------|---------|---------|
| Python | `test_*.py` | `auth/test_login.py` |
| JavaScript | `*.test.ts` or `*.spec.ts` | `auth/login.test.ts` |
| Go | `*_test.go` | `auth/login_test.go` |
| Rust | `#[cfg(test)]` in same file or `tests/` | inline or `tests/login.rs` |
| Java | `*Test.java` | `LoginTest.java` |
| Swift | `*Tests.swift` | `LoginTests.swift` |
| C# | `*Test.cs` or `*Tests.cs` | `LoginTest.cs` |
| Xojo | `Test*.xojo_code` | `TestLogin.xojo_code` |

**TDD Cycle:**
1. 🔴 Red: Write failing test
2. 🟢 Green: Write minimal code to pass
3. 🔵 Refactor: Clean up while tests pass
