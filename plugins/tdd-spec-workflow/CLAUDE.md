# TDD Spec Workflow Plugin (with Ralph)

This project uses Test-Driven Development with spec-workflow-mcp and Ralph Wiggum for autonomous task execution.

## ⚠️ Dependencies

### 1. spec-workflow-mcp Server (Required)
Requires Node.js 18+. If MCP tools aren't available, ensure `.mcp.json` exists:
```json
{
  "mcpServers": {
    "spec-workflow": {
      "command": "npx",
      "args": ["-y", "@pimzino/spec-workflow-mcp@latest", "."],
      "env": {
        "SPEC_WORKFLOW_DASHBOARD": "true",
        "SPEC_WORKFLOW_PORT": "5000"
      }
    }
  }
}
```

### 2. Ralph Wiggum Plugin (Optional - for autonomous mode)
Only needed if using `/tdd:execute-task` (autonomous) or `/tdd:batch-execute`:
```
/plugin install ralph-wiggum@claude-plugins-official
```

**Not needed** if using `/tdd:execute-task-manual` (interactive mode).

### 3. Verify Setup
```
/tdd:verify-setup
```

## Quick Commands

| Command | Description |
|---------|-------------|
| `/tdd:init` | Initialize project (auto-detects mode) |
| `/tdd:init --mode full` | Full init for new repo |
| `/tdd:init --mode steering` | Create steering docs only |
| `/tdd:init --mode entries` | Add TDD entries to existing docs |
| `/tdd:execute-task <id>` | Execute task with Ralph loop (autonomous) |
| `/tdd:execute-task-manual <id>` | Execute task interactively (no Ralph) |
| `/tdd:batch-execute` | Execute multiple tasks overnight |
| `/tdd:dashboard` | Open spec-workflow dashboard (port 5000) |
| `/tdd:status` | Check TDD compliance and coverage |
| `/tdd:run-tests` | Run tests with coverage |
| `/tdd:verify-setup` | Check all dependencies |

## Task Execution Modes

| Mode | Command | Description |
|------|---------|-------------|
| **Autonomous** | `/tdd:execute-task <id>` | Ralph loop iterates until tests pass |
| **Manual** | `/tdd:execute-task-manual <id>` | Interactive, step-by-step TDD guidance |
| **Batch** | `/tdd:batch-execute --phase 1` | Multiple tasks overnight (uses Ralph) |

**When to use which:**
- **Autonomous**: Routine tasks, overnight work, when you trust the process
- **Manual**: Learning TDD, complex decisions, reviewing each step
- **Batch**: Multiple related tasks, overnight execution

## Init Modes

**Auto-detect** (default): Analyzes what exists and chooses mode

| Mode | When | What it does |
|------|------|--------------|
| `full` | New repo (no CLAUDE.md) | Creates everything, asks about tech stack & testing tools |
| `steering` | Has CLAUDE.md, no steering | Creates steering docs, asks about testing strategy |
| `entries` | Has both | Adds TDD sections to existing files |

## Testing Strategy

The `/tdd:init` command asks about your tech stack and recommends testing tools:

| Test Type | Purpose | Example Tools |
|-----------|---------|---------------|
| **Unit** | Test functions/classes in isolation | pytest, Vitest, Jest, go test, cargo test, XCTest, xUnit, XojoUnit |
| **Integration** | Test component interactions, APIs | pytest + httpx, supertest, testcontainers, WebApplicationFactory |
| **E2E** | Test full user flows through UI | Claude for Chrome, Playwright, Cypress, XCUITest, WinAppDriver |

**Supported Languages:** Python, JavaScript/TypeScript, Go, Rust, Java/Kotlin, Swift, C#, Xojo

**Other Languages:** If you use a language not listed, `/tdd:init` will ask you to specify your testing tools and commands. TDD principles are universal!

## Ralph Wiggum Integration

Tasks are executed using Ralph loops for autonomous iteration:

```bash
# Execute single task (iterates until tests pass)
/tdd:execute-task 1.2

# Execute all phase 1 tasks overnight
/tdd:batch-execute --phase 1 --max-iterations-per-task 30

# Cancel current loop if needed
/cancel-ralph
```

**How Ralph TDD Works:**
1. Ralph loads task from spec-workflow MCP
2. Prompt enforces TDD: "Write test FIRST"
3. Claude writes test → runs → fails (red)
4. Claude implements → runs → passes (green)
5. If tests fail, loop continues automatically
6. Outputs `<promise>TASK_COMPLETE</promise>` when done
7. Task marked complete in dashboard

## Test Commands (configured during init)

Commands are configured based on your tech stack. Examples:

**Python:** `pytest`, `pytest --cov=src`
**JavaScript:** `npm test`, `vitest --coverage`
**Go:** `go test ./...`, `go test -cover`
**Rust:** `cargo test`, `cargo tarpaulin`
**Swift:** `swift test`, `swift test --enable-code-coverage`
**C#:** `dotnet test`, `dotnet test --collect:"XPlat Code Coverage"`
**Xojo:** Run via Xojo IDE (XojoUnit)

## TDD Workflow (Red-Green-Refactor)

**With Ralph (recommended):**
```bash
/tdd:execute-task 1.2
# Ralph handles everything automatically
```

**Manual:**
1. Read task from dashboard (`/tdd:dashboard`)
2. Write test file FIRST
3. Run tests - confirm FAILS (red)
4. Implement minimal code to pass
5. Run tests - confirm PASSES (green)
6. Refactor if needed
7. Commit
8. Mark task complete in dashboard

## Steering Documents
Project context lives in `.spec-workflow/steering/`:
- `product.md` - Vision, goals, priorities
- `tech.md` - Stack decisions, TDD policy
- `structure.md` - Architecture, conventions

## Completion Criteria (for Ralph)

A task is only complete when:
- [ ] All tests pass (unit + integration)
- [ ] Coverage meets threshold (default 80%)
- [ ] No lint errors
- [ ] Implementation matches spec requirements

## Warnings
- Do NOT mark a task complete without tests
- Do NOT skip the "red" phase (failing test first)
- Always run `/tdd:execute-task` in a git-tracked directory
