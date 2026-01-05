---
name: execute-task-manual
description: Execute a spec-workflow task manually with TDD guidance (no Ralph loop). Interactive mode with step-by-step TDD workflow.
arguments:
  - name: task_id
    description: The task ID to execute (e.g., "1.2" or "user-auth/1.2")
    required: true
---

# Execute Task Manually (No Ralph)

Execute a spec-workflow task with interactive TDD guidance. You control each step.

## When to Use This Mode

- You want to review each step before proceeding
- You're learning TDD and want guidance
- The task requires complex decisions
- You prefer interactive over autonomous
- Ralph plugin is not installed

## Workflow

### Step 1: Load Task Context

Use spec-workflow MCP to get task details:
```
Call MCP tool: get_task("{{ task_id }}")
```

Load steering documents for context:
```
Call MCP tool: get_steering_docs()
```

Display task to user:
```
══════════════════════════════════════════════════
TASK: {{ task_id }}
══════════════════════════════════════════════════

Description:
[Task description from MCP]

Acceptance Criteria:
[Criteria from MCP]

Related Files:
[Suggested files/modules]
══════════════════════════════════════════════════
```

### Step 2: RED Phase - Write Failing Test

**Guide the user:**
> "Let's start with the RED phase. We need to write a failing test first."
>
> "Based on the task requirements, I'll create a test file. Where should it go?"
> - Suggested: `src/[module]/test_[feature].py`

**Create test file with test cases based on acceptance criteria:**
```python
import pytest
from src.[module].[feature] import [function_to_test]

class Test[Feature]:
    def test_should_[expected_behavior]_when_[condition](self):
        # Arrange
        [setup code]
        
        # Act
        result = [function_call]
        
        # Assert
        assert result == [expected]
    
    # Additional test cases based on acceptance criteria
```

**Run the test:**
```bash
pytest src/[module]/test_[feature].py -v
```

**Verify it fails:**
> "✅ Test fails as expected (RED phase complete)"
> 
> Or if it passes: "⚠️ Test passes - this means we're not testing new behavior. Let's adjust the test."

**Ask user to confirm before proceeding:**
> "Ready to proceed to GREEN phase? (yes/no)"

### Step 3: GREEN Phase - Implement

**Guide the user:**
> "Now let's write the minimal code to make the test pass."

**Create/modify implementation file:**
```python
# src/[module]/[feature].py

def [function_name]([params]):
    """
    [Docstring based on task requirements]
    """
    # Minimal implementation to pass test
    [implementation]
```

**Run the test again:**
```bash
pytest src/[module]/test_[feature].py -v
```

**Check result:**
- If passes: "✅ Test passes (GREEN phase complete)"
- If fails: "❌ Test still fails. Let's fix the implementation."
  - Show error details
  - Suggest fix
  - Repeat until green

**Ask user to confirm before proceeding:**
> "Ready to proceed to REFACTOR phase? (yes/no)"

### Step 4: REFACTOR Phase

**Guide the user:**
> "Tests are passing. Now let's clean up the code while keeping tests green."

**Suggest refactoring opportunities:**
- Extract helper functions
- Improve variable names
- Remove duplication
- Add type hints
- Improve docstrings

**After each refactoring change, run tests:**
```bash
pytest src/[module]/test_[feature].py -v
```

**Verify still green after each change.**

### Step 5: Check Coverage

**Run coverage report:**
```bash
pytest --cov=src/[module] --cov-report=term-missing src/[module]/test_[feature].py
```

**Check coverage:**
- If >= 80%: "✅ Coverage is good"
- If < 80%: "⚠️ Coverage is [X]%. Add more tests for uncovered lines:"
  - List uncovered lines
  - Suggest additional test cases

### Step 6: Lint Check

**Run linter:**
```bash
ruff check src/[module]/
```

**Fix any issues found.**

### Step 7: Final Verification

**Run all checks:**
```bash
# All tests
pytest -v

# Coverage
pytest --cov=src --cov-report=term-missing

# Lint
ruff check src/
```

**Summary:**
```
══════════════════════════════════════════════════
TASK {{ task_id }} - VERIFICATION
══════════════════════════════════════════════════

✅ / ❌ Tests: [X passed, Y failed]
✅ / ❌ Coverage: [X]% (minimum 80%)
✅ / ❌ Lint: [clean / X issues]

Files Created/Modified:
  - src/[module]/test_[feature].py (created)
  - src/[module]/[feature].py (created)
══════════════════════════════════════════════════
```

### Step 8: Mark Task Complete

**If all checks pass:**
> "All checks passed! Mark task as complete?"

**Call MCP tool:**
```
complete_task("{{ task_id }}")
```

**Confirm:**
```
✅ Task {{ task_id }} marked complete!

Next: Run /tdd:dashboard to see updated progress
      or /tdd:execute-task-manual <next-task-id>
```

## Comparison: Manual vs Ralph

| Aspect | Manual (`execute-task-manual`) | Ralph (`execute-task`) |
|--------|-------------------------------|------------------------|
| Control | You control each step | Autonomous iteration |
| Speed | Slower, interactive | Faster, hands-off |
| Learning | Great for learning TDD | Assumes TDD knowledge |
| Complex decisions | You make them | Claude decides |
| Requires Ralph plugin | No | Yes |
| Best for | Learning, complex tasks | Routine tasks, batch work |
