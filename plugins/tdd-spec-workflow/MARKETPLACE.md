# TDD Spec Workflow

> Test-Driven Development with spec-workflow-mcp and Ralph Wiggum autonomous loops

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/your-org/tdd-spec-workflow)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/claude--code-%3E%3D1.0.0-purple.svg)](https://claude.ai)

---

## Overview

TDD Spec Workflow brings professional Test-Driven Development to Claude Code with autonomous task execution. Write specs, generate tasks, and let Ralph Wiggum iterate until all tests pass—even while you sleep.

### ✨ Key Features

- **🔄 Autonomous TDD** - Ralph Wiggum loops until tests pass (Red → Green → Refactor)
- **🌐 Multi-Language** - Python, JS/TS, Go, Rust, Java, Kotlin, Swift, C#, Xojo, and custom
- **📋 Spec-Driven** - Create specs, generate tasks, track progress
- **📊 Real-Time Dashboard** - Visual progress tracking on port 5000
- **🌙 Overnight Execution** - Batch execute tasks while you sleep
- **🎯 Interactive Setup** - Recommends testing tools based on your stack

---

## Quick Start

```bash
# 1. Install the plugin
claude plugin add tdd-spec-workflow

# 2. Install Ralph Wiggum (optional, for autonomous mode)
/plugin install ralph-wiggum@claude-plugins-official

# 3. Initialize your project
/tdd:init
```

---

## How It Works

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. STEERING    │ ──▶ │  2. SPECS       │ ──▶ │  3. TASKS       │
│  (Context)      │     │  (Features)     │     │  (Work Items)   │
└─────────────────┘     └─────────────────┘     └─────────────────┘
        │                       │                       │
        ▼                       ▼                       ▼
  Product vision          Feature specs           Ralph executes
  Tech decisions          Acceptance criteria     TDD automatically
  Testing strategy        Auto-generated tasks    Tests pass ✓
```

### The Ralph Loop

```
/tdd:execute-task 1.2
         │
         ▼
┌────────────────────────────────────────┐
│  ITERATION 1: Write test_login.py      │
│  → pytest fails (RED)                  │
└────────────────────────────────────────┘
         │
         ▼
┌────────────────────────────────────────┐
│  ITERATION 2: Write login.py           │
│  → 2/5 tests pass                      │
└────────────────────────────────────────┘
         │
         ▼
┌────────────────────────────────────────┐
│  ITERATION 3: Fix edge cases           │
│  → ALL PASS, coverage 87% (GREEN)      │
│  → Task complete! ✓                    │
└────────────────────────────────────────┘
```

---

## Commands

| Command | Description |
|---------|-------------|
| `/tdd:init` | Initialize project (asks about your stack) |
| `/tdd:execute-task <id>` | Execute task autonomously (Ralph) |
| `/tdd:execute-task-manual <id>` | Execute interactively (no Ralph) |
| `/tdd:batch-execute` | Execute multiple tasks overnight |
| `/tdd:dashboard` | Open visual dashboard |
| `/tdd:status` | Check coverage and compliance |

---

## Supported Languages

| Language | Unit Testing | Status |
|----------|--------------|--------|
| Python | pytest, unittest | ✅ Full Support |
| JavaScript | Vitest, Jest | ✅ Full Support |
| TypeScript | Vitest, Jest | ✅ Full Support |
| Go | go test, testify | ✅ Full Support |
| Rust | cargo test | ✅ Full Support |
| Java | JUnit 5, TestNG | ✅ Full Support |
| Kotlin | JUnit 5, Kotest | ✅ Full Support |
| Swift | XCTest | ✅ Full Support |
| C# | xUnit, NUnit | ✅ Full Support |
| Xojo | XojoUnit | ✅ Full Support |
| **Other** | Your choice | ✅ Interactive Setup |

---

## Init Modes

| Mode | Command | Use Case |
|------|---------|----------|
| **Full** | `/tdd:init --mode full` | New repository |
| **Steering** | `/tdd:init --mode steering` | Add spec-workflow to existing project |
| **Entries** | `/tdd:init --mode entries` | Add TDD to existing spec-workflow project |

---

## Requirements

| Requirement | Version | Purpose |
|-------------|---------|---------|
| Node.js | >= 18.0.0 | Runs spec-workflow-mcp server |
| Ralph Wiggum | (optional) | Autonomous execution |

---

## Screenshots

### Dashboard
![Dashboard](assets/screenshots/dashboard.png)

### Ralph Loop
![Ralph Loop](assets/screenshots/ralph-loop.png)

### Init Wizard
![Init Wizard](assets/screenshots/init-wizard.png)

---

## Why TDD Spec Workflow?

### Before
```
❌ Write code first, tests later (or never)
❌ Manual task tracking in docs
❌ Inconsistent coverage
❌ Context switching between coding and testing
```

### After
```
✅ Tests first, always (enforced)
✅ Automatic task generation from specs
✅ Coverage >= 80% guaranteed
✅ Autonomous execution—set it and forget it
```

---

## Pricing

**Free** and open source under MIT license.

---

## Support

- 📖 [Documentation](https://github.com/your-org/tdd-spec-workflow#readme)
- 🐛 [Report Issues](https://github.com/your-org/tdd-spec-workflow/issues)
- 💬 [Discussions](https://github.com/your-org/tdd-spec-workflow/discussions)
- 💌 [Email Support](mailto:support@example.com)

---

## Changelog

### v2.0.0 (2026-01-05)
- 🆕 Ralph Wiggum integration for autonomous TDD
- 🆕 Multi-language support (10+ languages)
- 🆕 Custom language support
- 🆕 Three init modes
- 🆕 Interactive testing tool recommendations
- 🆕 Architecture-specific recommendations
- 🆕 Manual execution mode (no Ralph required)
- 🆕 Overnight batch execution

### v1.0.0 (2026-01-04)
- Initial release with Python/pytest support

---

## License

MIT © Your Team
