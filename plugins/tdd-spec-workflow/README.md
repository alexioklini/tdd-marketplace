# TDD Spec Workflow Plugin (with Ralph)

A Claude Code plugin that enforces Test-Driven Development with spec-workflow-mcp and Ralph Wiggum autonomous loops.

## Features

- **Multi-Language Support** - Python, JavaScript/TypeScript, Go, Rust, Java/Kotlin, Swift, C#, Xojo, and custom languages
- **Ralph Wiggum Integration** - Autonomous task execution loops
- **spec-workflow-mcp** - Spec-driven development with real-time dashboard
- **TDD Enforcement** - Hooks block commits without passing tests
- **Flexible Testing** - Recommends tools based on your stack, or use your own
- **Claude for Chrome E2E** - Browser automation tests
- **Path-scoped Rules** - Context-aware guidance
- **Overnight Batch Execution** - Run multiple tasks while you sleep

## Requirements

| Requirement | Version | Purpose |
|-------------|---------|---------|
| **Node.js** | >= 18.0.0 | Runs spec-workflow-mcp server |

**Language-specific requirements** are configured during `/tdd:init` based on your tech stack.

## Installation

### Step 1: Install this plugin

```bash
# From local directory
claude plugin add ./tdd-spec-workflow

# Or from marketplace (if published)
claude plugin install @your-org/tdd-spec-workflow
```

### Step 2: Install Ralph Wiggum (Optional - for autonomous mode)

Only needed if you want to use autonomous task execution:

```
/plugin install ralph-wiggum@claude-plugins-official
```

| Execution Mode | Requires Ralph |
|----------------|----------------|
| `/tdd:execute-task` (autonomous) | ✅ Yes |
| `/tdd:execute-task-manual` (interactive) | ❌ No |
| `/tdd:batch-execute` (overnight) | ✅ Yes |

### Step 3: Verify MCP Server Configuration

The plugin includes `.mcp.json` for spec-workflow-mcp. If it's not auto-loaded, create it manually in your project root:

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

### Step 4: Verify Setup

```
/tdd:verify-setup
```

This checks all dependencies are installed correctly.

## Quick Start

```bash
# For a NEW project (creates everything, asks about your project)
/tdd:init --mode full

# For EXISTING project with CLAUDE.md (creates steering docs)
/tdd:init --mode steering

# For project with CLAUDE.md AND steering (just adds TDD entries)
/tdd:init --mode entries

# Or let it auto-detect
/tdd:init

# Open the dashboard to see tasks
/tdd:dashboard

# Execute a single task autonomously (Ralph loop)
/tdd:execute-task 1.2

# Execute all phase 1 tasks overnight
/tdd:batch-execute --phase 1
```

## Commands

| Command | Description |
|---------|-------------|
| `/tdd:init` | Initialize project (auto-detects mode) |
| `/tdd:init --mode full` | Full init for new repository |
| `/tdd:init --mode steering` | Create steering docs, update CLAUDE.md |
| `/tdd:init --mode entries` | Add TDD entries to existing docs |
| `/tdd:verify-setup` | Check all dependencies are installed |
| `/tdd:execute-task <id>` | Execute task with Ralph loop (autonomous) |
| `/tdd:execute-task-manual <id>` | Execute task interactively (no Ralph) |
| `/tdd:batch-execute` | Execute multiple tasks sequentially |
| `/tdd:dashboard` | Open spec-workflow dashboard |
| `/tdd:status` | Check coverage and missing tests |
| `/tdd:run-tests` | Run pytest with coverage |

### Task Execution Modes

| Mode | Command | Requires Ralph | Best For |
|------|---------|----------------|----------|
| **Autonomous** | `/tdd:execute-task 1.2` | Yes | Routine tasks, overnight |
| **Manual** | `/tdd:execute-task-manual 1.2` | No | Learning TDD, complex tasks |
| **Batch** | `/tdd:batch-execute --phase 1` | Yes | Multiple tasks at once |

**Autonomous mode** (Ralph loop):
- Iterates automatically until tests pass
- Hands-off execution
- Great for overnight batch work

**Manual mode** (no Ralph):
- Interactive step-by-step guidance
- Confirms each phase (Red → Green → Refactor)
- No Ralph plugin required
- Great for learning or complex decisions

### Init Modes Explained

The `/tdd:init` command automatically detects your project state:

| Project State | Auto Mode | What Happens |
|---------------|-----------|--------------|
| Empty repo | `full` | Creates CLAUDE.md, steering docs, asks about project |
| Has CLAUDE.md only | `steering` | Creates steering docs, adds TDD section to CLAUDE.md |
| Has CLAUDE.md + steering | `entries` | Adds TDD entries to existing files |

**Full mode** asks you questions to customize:
- Project name and purpose
- Tech stack and conventions
- Build/test commands
- Product goals and structure

## Supported Languages

The plugin has built-in recommendations for:

| Language | Unit Testing | Integration | E2E |
|----------|--------------|-------------|-----|
| Python | pytest | pytest + httpx | Claude for Chrome |
| JavaScript/TypeScript | Vitest, Jest | supertest | Claude for Chrome |
| Go | go test | httptest | Claude for Chrome |
| Rust | cargo test | cargo test | Claude for Chrome |
| Java/Kotlin | JUnit 5 | Testcontainers | Claude for Chrome |
| Swift | XCTest | URLProtocol | XCUITest |
| C# | xUnit | WebApplicationFactory | WinAppDriver |
| Xojo | XojoUnit | XojoUnit | Manual |

### Using Other Languages

If your language isn't listed, select "Other" during `/tdd:init`. You'll be asked:

1. What unit testing framework to use
2. What integration testing approach
3. What E2E testing tool (Claude for Chrome works for any web app)
4. What commands to run tests
5. What test file naming convention

**Example for a hypothetical language:**
```
/tdd:init

> What programming language? Other

> What unit testing framework?
  "We use FooTest with @test annotations"

> What command runs unit tests?
  "foo test src/"

> What command runs with coverage?
  "foo test --coverage src/"
```

TDD principles (Red-Green-Refactor) work universally regardless of language!

## Spec-Driven Workflow Guide

Complete walkthrough from project setup to task execution using the spec-workflow-mcp server.

### Overview: The Spec-Driven Development Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. STEERING    │ ──▶ │  2. SPECS       │ ──▶ │  3. TASKS       │
│  (Context)      │     │  (Features)     │     │  (Work Items)   │
└─────────────────┘     └─────────────────┘     └─────────────────┘
        │                       │                       │
        ▼                       ▼                       ▼
  Product vision          Feature specs           Executable tasks
  Tech decisions          Acceptance criteria     TDD implementation
  Project structure       Dependencies            Test + Code
```

### Step 1: Initialize Project & Create Steering Documents

**Option A: Full initialization (new project)**
```
/tdd:init --mode full
```
This creates steering documents interactively.

**Option B: Moving from pure Claude Code to spec-driven, test-driven and Ralph-based development**
```
/tdd:init --mode steering
```
This creates steering documents for a project that already has CLAUDE.md, transitioning you to the full TDD workflow.

**Option C: Moving from spec-driven development to spec-driven, test-driven and Ralph-based development**
```
/tdd:init --mode entries
```
This adds TDD workflow entries to existing CLAUDE.md and steering documents, enabling Ralph-based task execution.

**Option D: Use MCP tools directly (advanced)**

> ⚠️ **Note:** This creates the spec-workflow structure but does NOT add TDD-specific content. 
> After using MCP tools, run `/tdd:init --mode entries` to add TDD methodology to your docs.

First, initialize the spec-workflow project structure:
```
Use MCP tool: init_project with arguments:
  project_path: "."  (or your project root)
```

This creates:
```
.spec-workflow/
├── steering/      # Product, tech, structure docs
├── specs/         # Feature specifications
├── approvals/     # Specs pending/approved
└── archive/       # Completed specs
```

Also create the MCP configuration if not present:
```
Use MCP tool: ensure_mcp_config
```

Or manually create `.mcp.json`:
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

Then create steering documents (these won't include TDD sections - add them manually or run `/tdd:init --mode entries` after):

```
Use MCP tool: create_steering_doc with arguments:
  name: "product"
  content: |
    # Product Vision
    
    ## Overview
    A task management API for small teams.
    
    ## Goals
    1. Simple REST API for CRUD operations
    2. User authentication
    3. Team collaboration features
    
    ## Target Users
    - Small development teams (5-15 people)
    - Project managers
    
    ## Success Metrics
    - API response time < 100ms
    - 99.9% uptime
```

```
Use MCP tool: create_steering_doc with arguments:
  name: "tech"
  content: |
    # Technical Decisions
    
    ## Stack
    - Language: Python 3.11
    - Framework: FastAPI
    - Database: PostgreSQL
    - Testing: pytest
    
    ## Development Methodology
    Strict TDD with spec-workflow and Ralph.
```

```
Use MCP tool: create_steering_doc with arguments:
  name: "structure"
  content: |
    # Project Structure
    
    src/
    ├── api/           # FastAPI routes
    ├── models/        # SQLAlchemy models
    ├── services/      # Business logic
    └── tests/         # Co-located with source
```

### Step 2: Create a Feature Spec

Create a detailed specification for a feature:

```
Use MCP tool: create_spec with arguments:
  name: "user-authentication"
  content: |
    # User Authentication Spec
    
    ## Overview
    Implement user registration and login functionality.
    
    ## Requirements
    
    ### 1. User Registration
    - Accept email and password
    - Validate email format
    - Hash password with bcrypt
    - Return JWT token on success
    
    ### 2. User Login
    - Accept email and password
    - Verify credentials
    - Return JWT token on success
    - Return 401 on failure
    
    ### 3. Token Validation
    - Validate JWT signature
    - Check token expiration
    - Extract user ID from token
    
    ## API Endpoints
    
    POST /auth/register
    - Body: { email, password }
    - Response: { token, user }
    
    POST /auth/login
    - Body: { email, password }
    - Response: { token, user }
    
    GET /auth/me
    - Headers: Authorization: Bearer <token>
    - Response: { user }
    
    ## Acceptance Criteria
    - [ ] Registration creates user in database
    - [ ] Passwords are never stored in plain text
    - [ ] JWT tokens expire after 24 hours
    - [ ] Invalid credentials return 401
    - [ ] All endpoints have tests with >80% coverage
    
    ## Dependencies
    - PostgreSQL database (from tech steering)
    - bcrypt for password hashing
    - PyJWT for token handling
```

### Step 3: View Tasks in Dashboard

Open the spec-workflow dashboard:

```
/tdd:dashboard
```

Or list tasks via MCP:

```
Use MCP tool: list_tasks with arguments:
  spec_name: "user-authentication"
  status: "pending"
```

### Step 4: Execute Tasks

**Option A: Autonomous execution (with Ralph)**

```bash
# Execute single task
/tdd:execute-task user-authentication/1.1

# Execute all tasks in the spec overnight
/tdd:batch-execute --spec user-authentication
```

**Option B: Interactive execution (without Ralph)**

```bash
/tdd:execute-task-manual user-authentication/1.1
```

**Option C: Direct MCP interaction**

Get task details:
```
Use MCP tool: get_task with arguments:
  task_id: "user-authentication/1.1"
```

Work on the task following TDD, then mark complete:
```
Use MCP tool: complete_task with arguments:
  task_id: "user-authentication/1.1"
  notes: "User model created with full test coverage"
```

### Step 5: Track Progress

Check overall progress:

```
Use MCP tool: get_spec_progress with arguments:
  spec_name: "user-authentication"
```

Output:
```
Spec: user-authentication
Status: In Progress
Tasks: 4/7 complete (57%)

Completed:
  ✅ 1.1 - Create User model
  ✅ 1.2 - Implement password hashing
  ✅ 1.3 - Implement registration endpoint
  ✅ 2.1 - Implement login endpoint

Pending:
  ⏳ 2.2 - Implement JWT token generation
  ⏳ 3.1 - Implement token validation middleware
  ⏳ 3.2 - Implement /auth/me endpoint
```

Or use the plugin command:
```
/tdd:status
```

### MCP Tools Reference

| Tool | Purpose |
|------|---------|
| `init_project` | Initialize .spec-workflow directory |
| `create_steering_doc` | Create product/tech/structure docs |
| `update_steering_doc` | Update existing steering doc |
| `get_steering_docs` | List all steering documents |
| `create_spec` | Create a new feature specification (auto-generates tasks) |
| `list_specs` | List all specs |
| `get_spec` | Get spec content and metadata |
| `list_tasks` | List tasks (filter by spec/status) |
| `get_task` | Get task details |
| `complete_task` | Mark task as complete |
| `get_spec_progress` | Get completion percentage |
| `get_project_status` | Overall project health |

### Example: Complete Workflow Session

```bash
# 1. Initialize project
/tdd:init --mode full

# 2. Open dashboard to visualize
/tdd:dashboard

# 3. Create a spec (via Claude conversation)
"Create a spec for user authentication with registration, login, and token validation"
# Claude uses create_spec MCP tool
# Tasks are auto-generated from the spec

# 4. Execute tasks
/tdd:execute-task user-authentication/1.1
/tdd:execute-task user-authentication/1.2
# ... or batch:
/tdd:batch-execute --spec user-authentication

# 5. Check progress
/tdd:status
```

## How It Works

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     Claude Code                             │
├─────────────────────────────────────────────────────────────┤
│  Plugins:                                                   │
│  ┌─────────────────────┐  ┌─────────────────────┐          │
│  │ tdd-spec-workflow   │  │ ralph-wiggum        │          │
│  │ - Commands          │  │ - /ralph-loop       │          │
│  │ - Rules             │  │ - /cancel-ralph     │          │
│  │ - Hooks             │  │ - Stop hook         │          │
│  │ - Skills            │  │                     │          │
│  └─────────────────────┘  └─────────────────────┘          │
├─────────────────────────────────────────────────────────────┤
│  MCP Server:                                                │
│  ┌─────────────────────────────────────────────┐           │
│  │ spec-workflow-mcp (@pimzino/spec-workflow)  │           │
│  │ - Task management                           │           │
│  │ - Steering documents                        │           │
│  │ - Dashboard (port 5000)                     │           │
│  └─────────────────────────────────────────────┘           │
└─────────────────────────────────────────────────────────────┘
```

### Ralph TDD Flow

```
/tdd:execute-task 1.2
         │
         ▼
┌────────────────────────────────────────┐
│  1. Load task from spec-workflow MCP   │
│  2. Build TDD-enforced Ralph prompt    │
│  3. Start Ralph loop                   │
└────────────────────────────────────────┘
         │
         ▼
┌────────────────────────────────────────┐
│  RALPH LOOP (autonomous iteration)     │
│  ┌──────────────────────────────────┐  │
│  │ Iteration 1: Write test_login.py │  │
│  │ → pytest fails (red)             │  │
│  └──────────────────────────────────┘  │
│  ┌──────────────────────────────────┐  │
│  │ Iteration 2: Write login.py      │  │
│  │ → pytest 2/5 pass                │  │
│  └──────────────────────────────────┘  │
│  ┌──────────────────────────────────┐  │
│  │ Iteration 3: Fix edge cases      │  │
│  │ → ALL PASS, coverage 87%         │  │
│  │ → <promise>TASK_COMPLETE</promise>│  │
│  └──────────────────────────────────┘  │
└────────────────────────────────────────┘
         │
         ▼
┌────────────────────────────────────────┐
│  Task marked complete in dashboard     │
│  Git commit created                    │
└────────────────────────────────────────┘
```

## Overnight Batch Execution

```bash
# Create overnight script
cat << 'EOF' > overnight-tdd.sh
#!/bin/bash
cd /path/to/project
echo "Started: $(date)"
claude -p "/tdd:batch-execute --phase 1 --max-iterations-per-task 30"
echo "Finished: $(date)"
EOF

# Run before bed
chmod +x overnight-tdd.sh
./overnight-tdd.sh
```

Wake up to completed tasks with full test coverage!

## What's Included

### Plugin Dependencies
- **ralph-wiggum** - Must be installed separately

### MCP Server
- **spec-workflow-mcp** - Configured in `.mcp.json`, runs via npx

### Components
- **Commands** - Task execution, batch processing, status checking
- **Rules** - Path-scoped TDD guidance
- **Hooks** - Pre-commit test enforcement
- **Skills** - TDD expertise for Claude
- **Templates** - Steering document templates

## Directory Structure After Init

```
your-project/
├── .mcp.json                    # MCP server configuration
├── src/
│   └── __init__.py
├── e2e/
├── .spec-workflow/
│   ├── steering/
│   │   ├── product.md
│   │   ├── tech.md
│   │   └── structure.md
│   ├── specs/
│   ├── approvals/
│   └── archive/
├── conftest.py
└── pyproject.toml
```

## Troubleshooting

### "MCP server not found"
1. Check Node.js is installed: `node --version`
2. Test MCP server: `npx -y @pimzino/spec-workflow-mcp@latest --help`
3. Verify `.mcp.json` exists in project root
4. Restart Claude Code after adding `.mcp.json`

### "/ralph-loop command not found"
```
/plugin install ralph-wiggum@claude-plugins-official
```

### "Tests not running"
```bash
pip install pytest pytest-cov ruff
```

### Dashboard not opening
The dashboard runs on port 5000. Check if something else is using that port:
```bash
lsof -i :5000
```

## Safety Features

- `--max-iterations` prevents runaway loops
- Git commit after each task (easy rollback)
- Tests must actually pass (verified by running pytest)
- Use `/cancel-ralph` to abort any loop
- Pre-commit hooks block commits with failing tests

## Team Setup

Add to your project's `.claude/settings.json` for auto-install:

```json
{
  "plugins": {
    "autoInstall": [
      "@your-org/tdd-spec-workflow"
    ]
  }
}
```

## License

MIT
