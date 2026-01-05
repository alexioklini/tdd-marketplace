# Contributing to TDD Spec Workflow

Thank you for your interest in contributing! This document provides guidelines for contributing to the TDD Spec Workflow plugin.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/tdd-spec-workflow.git`
3. Create a branch: `git checkout -b feature/your-feature-name`

## Development Setup

```bash
# Install the plugin locally for testing
claude plugin add ./tdd-spec-workflow

# Install Ralph Wiggum for full testing
/plugin install ralph-wiggum@claude-plugins-official

# Test your changes
/tdd:init --mode full
```

## Project Structure

```
tdd-spec-workflow/
├── .claude-plugin/
│   └── plugin.json       # Plugin manifest
├── commands/             # Slash commands
│   ├── init.md
│   ├── execute-task.md
│   ├── execute-task-manual.md
│   └── ...
├── rules/                # Path-scoped rules
│   ├── implementation.md
│   ├── tests.md
│   └── ...
├── skills/               # TDD expertise
│   └── tdd/SKILL.md
├── hooks/                # Git hooks
├── templates/            # Steering doc templates
├── assets/               # Marketplace assets
├── CLAUDE.md            # Project instructions
├── README.md            # Documentation
├── MARKETPLACE.md       # Marketplace listing
├── marketplace.json     # Marketplace metadata
└── .mcp.json            # MCP server config
```

## How to Contribute

### Adding a New Language

1. **Update init.md** - Add language to the tech stack question and create a recommendations section:
   ```markdown
   #### [Language] Projects
   
   **Recommendations:**
   | Test Type | Recommended | Alternatives |
   |-----------|-------------|--------------|
   | Unit | [tool] | [alternatives] |
   ...
   
   **Ask user:**
   > "For your [Language] project, I recommend..."
   ```

2. **Update SKILL.md** - Add language-specific test patterns:
   ```markdown
   ### [Language] ([Framework])
   
   **Test Structure:**
   ```[language]
   // Example test code
   ```
   
   **Commands:**
   - Run: `[command]`
   - Coverage: `[command]`
   ```

3. **Update rules/implementation.md** - Add file patterns:
   ```markdown
   paths:
     - "**/*.[ext]"
     - "!**/*Test.[ext]"
   ```

4. **Update rules/tests.md** - Add test file patterns and examples

5. **Update README.md** - Add to supported languages table

### Adding a New Architecture

1. **Update init.md** - Add to architecture question and recommendations section
2. **Update SKILL.md** - Add architecture-specific testing patterns if needed

### Improving Commands

1. Edit the relevant `.md` file in `commands/`
2. Test the command thoroughly
3. Update documentation if behavior changes

### Bug Fixes

1. Describe the bug in your PR
2. Include steps to reproduce
3. Explain your fix

## Code Style

### Markdown Commands

- Use clear, numbered steps
- Include code blocks with language hints
- Add "Ask user:" sections for interactive prompts
- Use tables for structured information

### Rules

- Keep rules focused on one concern
- Use path patterns that are inclusive but not overly broad
- Include examples

### Skills

- Use Arrange-Act-Assert pattern in examples
- Include commands for running tests
- Keep language-specific sections self-contained

## Testing Your Changes

Before submitting a PR:

1. **Test all init modes:**
   ```bash
   /tdd:init --mode full
   /tdd:init --mode steering
   /tdd:init --mode entries
   ```

2. **Test task execution:**
   ```bash
   /tdd:execute-task test-task-1
   /tdd:execute-task-manual test-task-1
   ```

3. **Verify documentation is accurate**

4. **Check for typos and formatting**

## Pull Request Process

1. Update README.md if adding features
2. Update CHANGELOG in marketplace.json
3. Ensure all tests pass
4. Request review from maintainers

## Reporting Issues

When reporting issues, please include:

- Plugin version
- Claude Code version
- Steps to reproduce
- Expected vs actual behavior
- Relevant error messages

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
