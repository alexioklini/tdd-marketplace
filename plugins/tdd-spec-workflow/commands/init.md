---
name: init
description: Initialize TDD spec-workflow for a project. Asks about tech stack and recommends testing tools. Supports three modes - full init, create steering, or add entries only.
arguments:
  - name: mode
    description: "Init mode: 'full' (new repo), 'steering' (create steering docs), or 'entries' (add to existing). Default: auto-detect"
    required: false
---

# Initialize TDD Spec Workflow

Initialize TDD spec-workflow with different modes based on project state.

## Mode Detection

First, detect the current project state to determine mode:

```bash
# Check what exists
HAS_CLAUDE_MD=$([ -f "CLAUDE.md" ] && echo "yes" || echo "no")
HAS_STEERING=$([ -d ".spec-workflow/steering" ] && echo "yes" || echo "no")
HAS_MCP_JSON=$([ -f ".mcp.json" ] && echo "yes" || echo "no")

echo "CLAUDE.md exists: $HAS_CLAUDE_MD"
echo "Steering docs exist: $HAS_STEERING"
echo ".mcp.json exists: $HAS_MCP_JSON"
```

**Auto-detect mode:**
- If no CLAUDE.md AND no steering → **Mode 1: Full Init**
- If CLAUDE.md exists but no steering → **Mode 2: Create Steering**
- If both exist → **Mode 3: Add Entries Only**

**Or user can specify:** `--mode full`, `--mode steering`, or `--mode entries`

---

## Mode 1: Full Init (New Repository)

Use when: Starting a brand new project with no existing configuration.

### Step 1.1: Install Dependencies

**Install Ralph Wiggum plugin (optional, for autonomous mode):**
```
/plugin install ralph-wiggum@claude-plugins-official
```

**Verify Node.js for MCP server:**
```bash
node --version  # Must be >= 18.0.0
```

### Step 1.2: Create .mcp.json

```bash
cat > .mcp.json << 'EOF'
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
EOF
```

### Step 1.3: Ask About Project & Tech Stack

**Ask the user:**

> "Tell me about your project:
> 
> 1. **Project name and purpose?**
> 
> 2. **What programming language/framework?**
>    - Python (FastAPI, Django, Flask)
>    - JavaScript/TypeScript (Node.js, React, Next.js, Vue)
>    - Go
>    - Rust
>    - Java/Kotlin (Spring Boot)
>    - Swift (iOS, macOS, Server-side)
>    - C# (.NET, Unity, Xamarin)
>    - Xojo (Desktop, Web, iOS)
>    - Other
> 
> 3. **What's your architecture?**
>    - Monolith
>    - Microservices
>    - Serverless
>    - CLI tool
>    - Library/SDK
>    - Frontend SPA
>    - Full-stack
>    - Mobile app (iOS/Android)
>    - Desktop app
>    - Game
> 
> 4. **Any existing testing setup?**"

### Step 1.4: Recommend Testing Tools & Ask User to Confirm

Based on the user's tech stack and architecture, recommend appropriate testing tools and **ask the user to confirm or customize**:

---

#### Python Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | pytest | unittest |
| **Integration** | pytest + httpx | pytest-asyncio, testcontainers |
| **E2E** | Claude for Chrome | Playwright, Selenium |

**Ask user:**
> "For your Python project, I recommend:
> - **Unit tests:** pytest
> - **Integration tests:** pytest + httpx
> - **E2E tests:** Claude for Chrome
> 
> Do you want to use these tools, or would you prefer alternatives?
> (e.g., 'Use Playwright for E2E instead' or 'I already use unittest')"

---

#### JavaScript/TypeScript Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | Vitest | Jest |
| **Integration** | Vitest + supertest | Jest + supertest, MSW |
| **E2E** | Claude for Chrome | Playwright, Cypress |

**Ask user:**
> "For your JavaScript/TypeScript project, I recommend:
> - **Unit tests:** Vitest
> - **Integration tests:** Vitest + supertest
> - **E2E tests:** Claude for Chrome
> 
> Do you want to use these tools, or would you prefer alternatives?
> (e.g., 'Use Jest instead of Vitest' or 'Use Cypress for E2E')"

---

#### Go Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | go test | testify |
| **Integration** | go test + httptest | testcontainers-go |
| **E2E** | Claude for Chrome | chromedp, rod |

**Ask user:**
> "For your Go project, I recommend:
> - **Unit tests:** go test (standard library)
> - **Integration tests:** go test + httptest
> - **E2E tests:** Claude for Chrome
> 
> Do you want to use these tools, or would you prefer alternatives?"

---

#### Rust Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | cargo test | - |
| **Integration** | cargo test (tests/) | - |
| **E2E** | Claude for Chrome | fantoccini, thirtyfour |

**Ask user:**
> "For your Rust project, I recommend:
> - **Unit tests:** cargo test (built-in)
> - **Integration tests:** cargo test with tests/ directory
> - **E2E tests:** Claude for Chrome
> 
> Do you want to use these tools, or would you prefer alternatives?"

---

#### Java/Kotlin Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | JUnit 5 | TestNG |
| **Integration** | JUnit 5 + Testcontainers | Spring Boot Test |
| **E2E** | Claude for Chrome | Selenium |

**Ask user:**
> "For your Java/Kotlin project, I recommend:
> - **Unit tests:** JUnit 5
> - **Integration tests:** JUnit 5 + Testcontainers
> - **E2E tests:** Claude for Chrome
> 
> Do you want to use these tools, or would you prefer alternatives?"

---

#### Swift Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | XCTest | Quick/Nimble |
| **Integration** | XCTest + URLProtocol mocking | OHHTTPStubs |
| **E2E (iOS)** | XCUITest | Claude for Chrome (web), Appium |
| **E2E (macOS)** | XCUITest | Claude for Chrome (web views) |

**Ask user:**
> "For your Swift project, I recommend:
> - **Unit tests:** XCTest (built-in)
> - **Integration tests:** XCTest with URLProtocol mocking
> - **E2E tests:** XCUITest for native UI, Claude for Chrome for web
> 
> Is this an iOS app, macOS app, or server-side Swift?
> Do you want to use Quick/Nimble for BDD-style tests?"

**Commands:**
- Unit: `swift test` or Xcode Test Navigator
- Integration: `swift test --filter Integration`
- E2E: Run via Xcode (XCUITest)
- Coverage: `swift test --enable-code-coverage`
- Lint: `swiftlint`

---

#### C# / .NET Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | xUnit | NUnit, MSTest |
| **Integration** | xUnit + WebApplicationFactory | TestServer |
| **E2E (Web)** | Claude for Chrome | Playwright, Selenium |
| **E2E (Desktop)** | WinAppDriver | Appium |
| **E2E (Unity)** | Unity Test Framework | - |

**Ask user:**
> "For your C#/.NET project, I recommend:
> - **Unit tests:** xUnit
> - **Integration tests:** xUnit + WebApplicationFactory
> - **E2E tests:** Claude for Chrome (web) or WinAppDriver (desktop)
> 
> What type of .NET project is this?
> - ASP.NET Core Web API
> - Blazor
> - WPF/WinForms Desktop
> - MAUI Mobile
> - Unity Game
> - Console/Library
> 
> Do you want to use NUnit or MSTest instead of xUnit?"

**Commands:**
- Unit: `dotnet test`
- Integration: `dotnet test --filter Category=Integration`
- E2E: `dotnet test --filter Category=E2E`
- Coverage: `dotnet test --collect:"XPlat Code Coverage"`
- Lint: `dotnet format --verify-no-changes`

---

#### Xojo Projects

**Recommendations:**

| Test Type | Recommended | Alternatives |
|-----------|-------------|--------------|
| **Unit** | XojoUnit | Custom test framework |
| **Integration** | XojoUnit + mock objects | - |
| **E2E (Desktop)** | Manual + screenshots | AutoIt (Windows) |
| **E2E (Web)** | Claude for Chrome | Selenium |

**Ask user:**
> "For your Xojo project, I recommend:
> - **Unit tests:** XojoUnit framework
> - **Integration tests:** XojoUnit with mock objects
> - **E2E tests:** Claude for Chrome (for web apps) or manual testing with screenshots (desktop)
> 
> What platform are you targeting?
> - Desktop (macOS/Windows/Linux)
> - Web
> - iOS
> 
> Note: Xojo has more limited testing tooling compared to other languages.
> Would you like me to help set up XojoUnit?"

**Commands:**
- Unit: Run via Xojo IDE (XojoUnit)
- Integration: Run via Xojo IDE
- E2E (Web): Claude for Chrome
- E2E (Desktop): Manual or scripted automation
- Lint: (No standard linter - use IDE warnings)

---

#### Other Languages / Custom Setup

If the user selects "Other" or uses a language not in the predefined list:

**Ask user:**
> "I don't have predefined recommendations for [language], but I can help you set up TDD!
> 
> Please tell me:
> 
> 1. **What unit testing framework do you use (or want to use)?**
>    Examples: built-in test module, third-party framework, custom
> 
> 2. **What integration testing approach?**
>    Examples: same framework as unit, separate tool, API testing tool
> 
> 3. **What E2E testing approach?**
>    - Claude for Chrome (web apps)
>    - Platform-specific UI automation
>    - Manual testing with documented cases
>    - Other tool (Selenium, Appium, etc.)
> 
> 4. **What are the test commands?**
>    - Run unit tests: [command]
>    - Run with coverage: [command]
>    - Run lint: [command]
> 
> 5. **What's the test file naming convention?**
>    Examples: test_*.ext, *_test.ext, *.test.ext, *Test.ext"

**Based on user's answers, create custom configuration:**

```markdown
## Testing Strategy (Custom - [Language])

| Test Type | Tool | Directory | Command |
|-----------|------|-----------|---------|
| Unit | [user specified] | [user specified] | [user specified] |
| Integration | [user specified] | [user specified] | [user specified] |
| E2E | [user specified] | e2e/ | [user specified] |

## Test Naming Convention
- Pattern: [user specified]
- Example: [user specified]
```

**Generic TDD principles still apply:**
- Write test FIRST (Red phase)
- Write minimal code to pass (Green phase)
- Refactor while keeping tests green
- Coverage target: 80% (adjust if needed)

**If user doesn't know what tools to use:**
> "No problem! Here are some questions to help me suggest options:
> 
> 1. Is this a compiled or interpreted language?
> 2. Does it have a built-in testing module?
> 3. Is there a popular testing framework in the ecosystem?
> 4. Do you have any existing tests I can look at?
> 
> I can also search for '[language] testing framework' to find recommendations."

---

#### Architecture-Specific Recommendations

Based on the architecture, provide additional recommendations:

**Microservices:**
> "For microservices, I also recommend:
> - **Contract testing:** Pact (for service-to-service contracts)
> - **Testcontainers:** For spinning up dependencies in integration tests
> - E2E tests should cover user flows across services
> 
> Do you want to add contract testing to your setup?"

**Serverless:**
> "For serverless, I also recommend:
> - **Local emulators:** localstack (AWS), serverless-offline
> - Mock cloud services in unit tests (moto for AWS)
> - E2E against deployed staging environment
> 
> Which cloud provider are you using? (AWS/GCP/Azure)"

**Frontend SPA:**
> "For your frontend SPA, I recommend:
> - **Component tests:** Testing Library (@testing-library/react, etc.)
> - **API mocking:** MSW (Mock Service Worker)
> - **Visual testing:** Storybook (optional)
> 
> Do you want to include component tests alongside unit tests?"

**CLI Tool:**
> "For CLI tools, I recommend:
> - **Unit tests:** Test individual functions/modules
> - **Integration tests:** Test command execution with fixtures
> - **Snapshot testing:** For validating command output
> 
> Do you want to use snapshot testing for output validation?"

**Library/SDK:**
> "For libraries/SDKs, I recommend:
> - **Unit tests:** Focus on public API surface
> - **Property-based testing:** Hypothesis (Python) / fast-check (JS)
> - **Example app:** As E2E to verify real-world usage
> 
> Do you want to include property-based testing?"

**Mobile App (iOS/Android):**
> "For mobile apps, I recommend:
> - **Unit tests:** XCTest (iOS) / JUnit (Android)
> - **Integration tests:** Test with mock network layer
> - **E2E tests:** XCUITest (iOS) / Espresso (Android)
> - **Screenshot tests:** For UI regression
> 
> Which platforms are you targeting? (iOS only / Android only / Both)
> Do you want to set up screenshot testing for UI regression?"

**Desktop App:**
> "For desktop apps, I recommend:
> - **Unit tests:** Language-appropriate framework
> - **Integration tests:** Test with mock services
> - **E2E tests:** Platform-specific UI automation
>   - macOS: XCUITest
>   - Windows: WinAppDriver, AutoIt
>   - Linux: Dogtail, LDTP
>   - Cross-platform: Appium
> 
> Which platform(s) are you targeting?
> Claude for Chrome can test any embedded web views."

**Game (Unity/Unreal/Custom):**
> "For games, I recommend:
> - **Unit tests:** Test game logic separately from engine
> - **Integration tests:** Test systems in isolation
> - **E2E tests:** Playtest automation or recorded sessions
> - For Unity: Unity Test Framework (Edit Mode + Play Mode)
> - For Unreal: Automation System
> 
> Which engine are you using? (Unity / Unreal / Custom / Xojo)
> Do you want to separate game logic into testable modules?"

---

### Step 1.5: Confirm Final Tool Selection

**Summarize and confirm:**
> "Based on your choices, here's your testing setup:
> 
> | Test Type | Tool | Directory | Command |
> |-----------|------|-----------|---------|
> | Unit | [selected] | [dir] | [cmd] |
> | Integration | [selected] | [dir] | [cmd] |
> | E2E | [selected] | e2e/ | [cmd] |
> 
> Coverage threshold: 80% (default)
> 
> Does this look correct? (yes/no/adjust)"

---

### Step 1.6: Create Configuration Files

Based on confirmed selections, create appropriate configuration:

**Python (pytest):**
```toml
# pyproject.toml
[tool.pytest.ini_options]
testpaths = ["src", "tests"]
python_files = ["test_*.py", "*_test.py"]
addopts = "-v --tb=short"

[tool.coverage.run]
source = ["src"]
fail_under = 80
```

**JavaScript/TypeScript (Vitest):**
```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    coverage: {
      provider: 'v8',
      thresholds: { lines: 80 }
    }
  }
})
```

**Go:**
```makefile
# Makefile
test:
	go test ./...
test-coverage:
	go test -cover ./...
test-integration:
	go test -tags=integration ./...
lint:
	golangci-lint run
```

**Rust:**
```toml
# Cargo.toml (add to existing)
[dev-dependencies]
# Add test dependencies based on selection
```

---

### Step 1.7: Create CLAUDE.md

**Create CLAUDE.md with user's answers + TDD entries:**

```markdown
# [Project Name]

[Project description from user]

## Tech Stack
[From user input]

## Testing Strategy

| Test Type | Tool | Directory | Command |
|-----------|------|-----------|---------|
| Unit | [recommended] | src/ or tests/unit/ | [command] |
| Integration | [recommended] | tests/integration/ | [command] |
| E2E | Claude for Chrome | e2e/ | [command] |

## Commands
- `[test command]` - Run unit tests
- `[coverage command]` - Run with coverage
- `[lint command]` - Lint code
- `[e2e command]` - Run E2E tests

## TDD Spec Workflow

This project uses Test-Driven Development with spec-workflow-mcp and Ralph Wiggum.

### Quick Commands
| Command | Description |
|---------|-------------|
| `/tdd:execute-task <id>` | Execute task with Ralph loop |
| `/tdd:execute-task-manual <id>` | Interactive TDD (no Ralph) |
| `/tdd:batch-execute` | Execute multiple tasks overnight |
| `/tdd:dashboard` | Open workflow dashboard |

### TDD Workflow
1. Get task from dashboard: `/tdd:dashboard`
2. Execute with Ralph: `/tdd:execute-task <id>`
3. Ralph iterates until tests pass (Red → Green → Refactor)
4. Task auto-marked complete

### Completion Criteria
- All tests pass (unit + integration)
- Coverage >= 80%
- No lint errors
- E2E tests pass (where applicable)

## Project Structure
[From user input or default based on language]
```

### Step 1.8: Create Steering Documents

**Ask the user about the project:**
> "Now let's create your steering documents. Tell me:
> 1. **Product**: What problem does this solve? Who are the users? Main goals?
> 2. **Tech**: Any architectural decisions beyond the stack?
> 3. **Structure**: How is the code organized?"

**Create steering documents with TDD testing strategy included in tech.md:**

`.spec-workflow/steering/tech.md`:
```markdown
# Technical Decisions

## Stack
[From user input]

## Testing Strategy

### Test Types

| Type | Purpose | Tool | Location |
|------|---------|------|----------|
| **Unit** | Test individual functions/classes in isolation | [tool] | [location] |
| **Integration** | Test component interactions, API endpoints, DB | [tool] | [location] |
| **E2E** | Test full user flows through UI | Claude for Chrome | e2e/ |

### When to Write Each Type

**Unit Tests:**
- Pure functions and business logic
- Data transformations
- Utility functions
- Individual class methods

**Integration Tests:**
- API endpoints
- Database operations
- External service interactions
- Multi-component workflows

**E2E Tests (Claude for Chrome):**
- Critical user journeys
- Authentication flows
- Checkout/payment flows
- Cross-page workflows

### Coverage Requirements
- Unit: >= 80%
- Integration: Critical paths covered
- E2E: Happy paths for key features

## Development Methodology

We practice strict Test-Driven Development (TDD):

1. **Red** - Write a failing test first
2. **Green** - Write minimal code to pass
3. **Refactor** - Clean up while tests pass

## Task Execution

Tasks are executed using Ralph Wiggum autonomous loops:
- `/tdd:execute-task <id>` starts a Ralph loop
- Loop continues until all tests pass and coverage >= 80%
- Or use `/tdd:execute-task-manual <id>` for interactive mode
```

### Step 1.9: Create Directory Structure

Create directories based on the testing strategy:

```bash
mkdir -p src tests/unit tests/integration e2e
```

Or language-specific:

**Python:**
```
src/
├── module/
│   ├── __init__.py
│   ├── feature.py
│   └── test_feature.py  # Co-located unit tests
tests/
├── integration/
│   └── test_api.py
e2e/
└── test_user_flows.py
```

**JavaScript/TypeScript:**
```
src/
├── module/
│   ├── feature.ts
│   └── feature.test.ts  # Co-located unit tests
tests/
├── integration/
│   └── api.test.ts
e2e/
└── user-flows.test.ts
```

### Step 1.10: Report Complete

```
✅ TDD Spec Workflow Initialized!
==================================

Tech Stack: [detected/selected]
Testing Tools:
  ✅ Unit: [tool]
  ✅ Integration: [tool]
  ✅ E2E: Claude for Chrome

Created:
  ✅ .mcp.json (spec-workflow-mcp server)
  ✅ CLAUDE.md (with TDD workflow + testing strategy)
  ✅ .spec-workflow/steering/ (product, tech, structure)
  ✅ Test configuration ([config file])
  ✅ Directory structure

Commands:
  [unit test command]
  [integration test command]
  [e2e test command]
  [coverage command]

Next Steps:
  1. Review and customize steering docs
  2. Create first spec: /tdd:dashboard
  3. Execute tasks: /tdd:execute-task <id>
```

---

## Mode 2: Create Steering (Moving from pure Claude Code)

Use when: Project has CLAUDE.md but no steering documents. Transitioning to spec-driven, test-driven, Ralph-based development.

### Step 2.1: Detect Existing Tech Stack

Analyze existing files to detect tech stack:
- `package.json` → JavaScript/TypeScript
- `pyproject.toml` / `requirements.txt` → Python
- `go.mod` → Go
- `Cargo.toml` → Rust
- `pom.xml` / `build.gradle` → Java/Kotlin

### Step 2.2: Ask About Testing Preferences

**Ask the user:**
> "I detected you're using [language/framework].
> 
> Current testing setup:
> [detected or 'none detected']
> 
> Recommended testing tools for [architecture]:
> - Unit: [recommendation]
> - Integration: [recommendation]
> - E2E: Claude for Chrome
> 
> Do you want to use these recommendations, or specify different tools?"

### Step 2.3: Create Steering Documents

Create steering documents including the testing strategy (same as Mode 1, Step 1.6).

### Step 2.4: Update CLAUDE.md

**Append TDD section to existing CLAUDE.md** (don't overwrite!):

Include the testing strategy table and TDD workflow.

### Step 2.5: Report Complete

```
✅ Steering Documents Created!
==============================

Testing Strategy:
  Unit: [tool] → [command]
  Integration: [tool] → [command]
  E2E: Claude for Chrome → [command]

Created:
  ✅ .spec-workflow/steering/ (product, tech, structure)
  ✅ .mcp.json (if missing)

Updated:
  ✅ CLAUDE.md (added TDD workflow + testing strategy)
```

---

## Mode 3: Add Entries Only (Moving from spec-driven to full TDD)

Use when: Project has CLAUDE.md and steering documents, just need TDD entries.

### Step 3.1: Detect Tech Stack & Existing Tests

Analyze project to understand:
- What language/framework
- What testing tools already in use
- What test directories exist

### Step 3.2: Add TDD Testing Strategy

**Append to `.spec-workflow/steering/tech.md`:**

```markdown

## Testing Strategy (TDD)

[Include testing strategy table based on detected tools]

## Task Execution

Tasks executed via Ralph Wiggum autonomous loops or manual mode.
```

### Step 3.3: Add TDD Section to CLAUDE.md

**Append TDD workflow section if missing.**

### Step 3.4: Report Complete

```
✅ TDD Entries Added!
=====================

Detected Testing Tools:
  Unit: [detected]
  Integration: [detected]
  E2E: [detected or 'recommend Claude for Chrome']

Updated:
  ✅ CLAUDE.md (TDD workflow section)
  ✅ .spec-workflow/steering/tech.md (testing strategy)

Ready to use:
  /tdd:dashboard      - Open dashboard
  /tdd:execute-task   - Execute task with Ralph
```

---

## Summary: Mode Selection

| Mode | When to Use | Creates | Updates |
|------|-------------|---------|---------|
| **full** | New empty repo | CLAUDE.md, steering/, .mcp.json, test config | - |
| **steering** | Has CLAUDE.md, no steering | steering/, .mcp.json | CLAUDE.md |
| **entries** | Has both | test config (if missing) | CLAUDE.md, tech.md, .mcp.json |

**Command examples:**
```bash
/tdd:init                  # Auto-detect mode
/tdd:init --mode full      # Force full init
/tdd:init --mode steering  # Force steering creation
/tdd:init --mode entries   # Only add TDD entries
```
