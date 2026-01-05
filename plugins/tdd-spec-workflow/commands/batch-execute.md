---
name: batch-execute
description: Execute multiple spec-workflow tasks sequentially using Ralph loops. Perfect for overnight autonomous development.
arguments:
  - name: phase
    description: Execute all tasks in a phase (e.g., "1" or "implementation")
    required: false
  - name: tasks
    description: Comma-separated task IDs (e.g., "1.1,1.2,1.3")
    required: false
  - name: max_iterations_per_task
    description: Max iterations per task (default 25)
    required: false
---

# Batch Execute Tasks with Ralph

Execute multiple tasks sequentially, each with its own Ralph loop.
Ideal for overnight autonomous development.

## Workflow

1. **Identify Tasks**
   
   If `phase` provided:
   ```
   # Get all incomplete tasks in phase
   tasks = spec-workflow: list_tasks(phase="{{ phase }}", status="pending")
   ```
   
   If `tasks` provided:
   ```
   # Parse comma-separated task IDs
   task_list = "{{ tasks }}".split(",")
   ```

2. **Pre-flight Checks**
   - Verify git working directory is clean
   - Run existing tests to establish baseline
   - Confirm tasks exist in spec-workflow

3. **Execute Each Task**
   
   For each task:
   ```
   echo "═══════════════════════════════════════"
   echo "TASK: $task_id"
   echo "═══════════════════════════════════════"
   
   /tdd:execute-task $task_id --max-iterations {{ max_iterations_per_task | default: 25 }}
   
   # Commit after each successful task
   git add -A
   git commit -m "feat: complete task $task_id via Ralph TDD loop"
   ```

4. **Progress Tracking**
   - Log start/end time for each task
   - Track iterations used per task
   - Record any tasks that hit max iterations

5. **Final Report**
   ```
   ═══════════════════════════════════════
   BATCH EXECUTION COMPLETE
   ═══════════════════════════════════════
   Tasks completed: X/Y
   Total iterations: N
   Time elapsed: HH:MM:SS
   Coverage: XX%
   
   Completed:
   - [x] Task 1.1 (12 iterations)
   - [x] Task 1.2 (8 iterations)
   
   Failed/Incomplete:
   - [ ] Task 1.3 (hit max iterations - needs review)
   ```

## Example Usage

```bash
# Execute all tasks in phase 1
/tdd:batch-execute --phase 1

# Execute specific tasks
/tdd:batch-execute --tasks "1.1,1.2,1.3"

# With custom iteration limit
/tdd:batch-execute --phase 2 --max-iterations-per-task 30
```

## Overnight Script

For running overnight, create a wrapper script:

```bash
#!/bin/bash
# overnight-tdd.sh

cd /path/to/project

# Start time
echo "Started: $(date)"

# Run Claude with batch command
claude -p "/tdd:batch-execute --phase 1 --max-iterations-per-task 30"

# End time
echo "Finished: $(date)"

# Send notification (optional)
# curl -X POST "https://your-webhook" -d "TDD batch complete"
```

```bash
# Run before bed
chmod +x overnight-tdd.sh
./overnight-tdd.sh
```

## Safety Features

- Git commit after each successful task (easy rollback)
- Max iterations prevent infinite loops
- Failed tasks logged but don't block subsequent tasks
- Use `/cancel-ralph` to abort current task
- Review git history next morning
