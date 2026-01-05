# TDD Spec Workflow Marketplace

A Claude Code plugin marketplace for Test-Driven Development.

## Installation

```bash
# 1. Add this marketplace to Claude Code
/plugin marketplace add your-org/tdd-marketplace

# 2. Install the TDD plugin
/plugin install tdd-spec-workflow@your-org/tdd-marketplace

# 3. (Optional) Install Ralph Wiggum for autonomous mode
/plugin install ralph-wiggum@claude-plugins-official

# 4. Initialize your project
/tdd:init
```

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **tdd-spec-workflow** | TDD with spec-workflow-mcp and Ralph Wiggum autonomous loops |

## Plugin: tdd-spec-workflow

### Features
- 🔄 Autonomous TDD with Ralph Wiggum loops
- 🌐 Multi-language support (Python, JS/TS, Go, Rust, Java, Swift, C#, Xojo, custom)
- 📋 Spec-driven development workflow
- 📊 Real-time dashboard on port 5000
- 🌙 Overnight batch execution

### Commands
| Command | Description |
|---------|-------------|
| `/tdd:init` | Initialize project (asks about your stack) |
| `/tdd:execute-task <id>` | Execute task autonomously (Ralph) |
| `/tdd:execute-task-manual <id>` | Execute interactively (no Ralph) |
| `/tdd:batch-execute` | Execute multiple tasks overnight |
| `/tdd:dashboard` | Open visual dashboard |
| `/tdd:status` | Check coverage and compliance |

## Publishing Your Own Marketplace

To create your own marketplace:

1. Fork this repository
2. Add your plugins to `plugins/`
3. Update `.claude-plugin/marketplace.json`
4. Push to GitHub
5. Users add with: `/plugin marketplace add your-username/your-repo`

## License

MIT
