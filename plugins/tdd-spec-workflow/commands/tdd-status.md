---
name: tdd-status
description: Check TDD compliance - test coverage, missing tests, spec-workflow status
---

Check TDD compliance for this project:

1. Run `pytest --cov=src --cov-report=term-missing` to show coverage

2. Find any `src/**/*.py` files without corresponding `test_*.py`:
   ```bash
   find src -name "*.py" ! -name "test_*.py" ! -name "*_test.py" ! -name "__init__.py" ! -name "conftest.py" | while read f; do
     dir=$(dirname "$f")
     base=$(basename "$f" .py)
     test_file="$dir/test_$base.py"
     [ ! -f "$test_file" ] && echo "Missing: $test_file"
   done
   ```

3. Use spec-workflow MCP to check current task status:
   - Call `get_current_phase` to see workflow phase
   - Call `list_tasks` to see pending tasks

4. Report summary:
   - Overall coverage percentage (target: 80%+)
   - Files missing tests (list them)
   - Current spec-workflow phase
   - Number of pending tasks
