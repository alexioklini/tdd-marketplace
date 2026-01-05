---
name: run-tests
description: Run pytest with coverage and show results
---

Run the test suite with coverage:

1. Execute: `pytest -v --cov=src --cov-report=term-missing`

2. Summarize results:
   - Total tests run
   - Passed / Failed / Skipped counts
   - Coverage percentage
   - Uncovered lines (if any)

3. If tests fail:
   - Show the failure details
   - Suggest fixes based on error messages

4. If coverage < 80%:
   - List files with low coverage
   - Suggest which functions need tests

5. Provide next steps:
   - If all green: "Ready to commit!"
   - If failures: "Fix these tests before proceeding"
   - If low coverage: "Add tests for uncovered code"
