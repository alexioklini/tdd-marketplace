---
name: execute-task
description: Execute a spec-workflow task using Ralph Wiggum loop with TDD enforcement. Autonomous iteration until tests pass.
arguments:
  - name: task_id
    description: The task ID to execute (e.g., "1.2" or "user-auth/1.2")
    required: true
  - name: max_iterations
    description: Maximum Ralph loop iterations (default 20)
    required: false
---

# Execute Task with Ralph Loop (TDD Enforced)

Execute a spec-workflow task autonomously using Ralph Wiggum loop.
The loop continues until all tests pass and the task is complete.

## Prerequisites

**Ralph Wiggum plugin must be installed.** If `/ralph-loop` command is not available:

```
/plugin install ralph-wiggum@claude-plugins-official
```

## Workflow

1. **Load Task Context**
   - Use spec-workflow MCP to get task details: `get_task("{{ task_id }}")`
   - Load steering documents for project context
   - Identify the feature/module being implemented

2. **Build Ralph Prompt**
   
   Construct a TDD-focused prompt for Ralph:
   
   ```
   TASK: {{ task_id }}
   
   REQUIREMENTS:
   [Task description from spec-workflow]
   
   TDD WORKFLOW (MANDATORY):
   1. RED: Write failing test first (test_*.py)
   2. GREEN: Write minimal implementation to pass
   3. REFACTOR: Clean up while tests stay green
   
   COMPLETION CRITERIA:
   - All tests pass: `pytest -v`
   - Coverage >= 80%: `pytest --cov=src`
   - No linting errors: `ruff check src/`
   - Implementation matches requirements
   
   ITERATION RULES:
   - Each iteration: run tests, fix failures, iterate
   - If stuck after 5 iterations: document blockers
   - Output <promise>TASK_COMPLETE</promise> when ALL criteria met
   
   START WITH THE TEST FILE.
   ```

3. **Execute Ralph Loop**
   
   ```
   /ralph-loop "{{ constructed_prompt }}" \
     --completion-promise "TASK_COMPLETE" \
     --max-iterations {{ max_iterations | default: 20 }}
   ```

4. **On Completion**
   - Verify all tests pass one final time
   - Mark task complete in spec-workflow: `complete_task("{{ task_id }}")`
   - Report summary: tests written, coverage, files changed

## Example Usage

```
/tdd:execute-task 1.2
/tdd:execute-task user-auth/1.3 --max-iterations 30
```

## What Ralph Does

Each iteration:
1. Claude works on the task (writes test → implements → runs test)
2. Claude tries to exit
3. Stop hook checks for "TASK_COMPLETE"
4. If not found, same prompt re-fed with updated file state
5. Claude sees previous changes, continues work
6. Repeat until tests pass and promise output

## Safety

- `--max-iterations` prevents runaway loops
- Git history tracks all changes (can revert)
- Tests must actually pass (not just claimed)
- Use `/cancel-ralph` to stop manually

## Alternative: Manual Mode

If you prefer interactive step-by-step execution (or don't have Ralph installed):

```
/tdd:execute-task-manual 1.2
```

Manual mode guides you through each TDD phase with confirmation prompts.

| Mode | Command | Best For |
|------|---------|----------|
| **Autonomous** | `/tdd:execute-task` | Routine tasks, batch work, overnight |
| **Manual** | `/tdd:execute-task-manual` | Learning TDD, complex decisions |
