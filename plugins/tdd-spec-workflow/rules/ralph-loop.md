---
paths:
  - "**/*"
globs:
  - "*"
description: Rules for working effectively in Ralph Wiggum autonomous loops
---
# Ralph Loop Execution Rules

When executing in a Ralph Wiggum loop:

## Iteration Awareness
- You are in an autonomous loop that continues until completion
- Each iteration sees files from previous iterations
- Check git status to see what changed in previous iterations
- Don't repeat failed approaches - try something different

## TDD in Ralph Loops

**Every task MUST follow TDD:**

1. **First iteration:** Create test file (test_*.py)
   ```bash
   # Check if test exists
   ls src/**/test_*.py
   ```

2. **Run tests early and often:**
   ```bash
   pytest -v --tb=short
   ```

3. **Never claim completion without proof:**
   ```bash
   # All must pass before outputting TASK_COMPLETE
   pytest -v && pytest --cov=src && ruff check src/
   ```

## Completion Protocol

**ONLY output `<promise>TASK_COMPLETE</promise>` when:**
- [ ] `pytest` exits with code 0
- [ ] Coverage >= 80% (check `pytest --cov=src`)
- [ ] `ruff check src/` has no errors
- [ ] Implementation matches task requirements

**Format:**
```
✅ Tests: 12 passed
✅ Coverage: 85%
✅ Lint: clean
✅ Requirements: implemented per spec

<promise>TASK_COMPLETE</promise>
```

## If Stuck

After 5+ iterations on same issue:
```
ITERATION CHECKPOINT:
- Current blocker: [specific issue]
- Approaches tried: [list]
- Files modified: [list]
- Hypothesis for next iteration: [what to try]
```

## Anti-Patterns (AVOID)

❌ Claiming tests pass without running them
❌ Outputting TASK_COMPLETE prematurely
❌ Modifying tests to make them pass artificially
❌ Skipping the red phase (failing test first)
❌ Repeating the same failed approach

## Good Patterns (DO)

✅ Run tests after every file change
✅ Check git diff to understand previous work
✅ Write test BEFORE implementation
✅ Document blockers clearly
✅ Use `pytest -x` to stop at first failure
