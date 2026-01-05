---
name: verify-setup
description: Verify that all TDD Spec Workflow dependencies are installed and configured correctly.
---

# Verify TDD Spec Workflow Setup

Check that all required dependencies are installed and configured.

## Step 1: Check Node.js (Required for MCP Server)

```bash
node --version
```

**Required:** Node.js 18.0.0 or higher

If not installed:
- macOS: `brew install node`
- Ubuntu: `sudo apt install nodejs`
- Windows: Download from https://nodejs.org/

## Step 2: Check Ralph Wiggum Plugin (Optional)

Run `/help` and look for `/ralph-loop` command.

**Only needed for autonomous mode** (`/tdd:execute-task`, `/tdd:batch-execute`).

If you want autonomous mode and it's NOT available, install it:
```
/plugin install ralph-wiggum@claude-plugins-official
```

**Not required** for manual mode (`/tdd:execute-task-manual`).

## Step 3: Check spec-workflow-mcp Server

The MCP server should be configured in the plugin's `.mcp.json`. 

Test if it can start:
```bash
npx -y @pimzino/spec-workflow-mcp@latest --help
```

If this fails, the MCP server may not be available or there's a network issue.

## Step 4: Verify MCP Configuration

Check if `.mcp.json` exists in project root (may be merged from plugin):
```bash
cat .mcp.json 2>/dev/null || echo "No .mcp.json in project root"
```

If the plugin's MCP config isn't being loaded, manually create `.mcp.json` in your project root:
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

## Step 5: Check Python Dependencies

```bash
python --version
pip show pytest pytest-cov ruff
```

If missing:
```bash
pip install pytest pytest-cov ruff
```

## Step 6: Test MCP Server Connection

Try calling a spec-workflow MCP tool:
```
Use the spec-workflow MCP server to call: get_project_status
```

If this fails with "server not found", the MCP configuration isn't loaded.

## Summary Report

After running all checks, report:

```
TDD Spec Workflow Setup Verification
====================================

Required:
✅ / ❌ Node.js: [version or "NOT INSTALLED"]
✅ / ❌ spec-workflow-mcp: [available or "NOT AVAILABLE"]
✅ / ❌ MCP Config: [loaded or "MANUAL SETUP REQUIRED"]
✅ / ❌ Python: [version]
✅ / ❌ pytest: [installed or "NOT INSTALLED - run pip install pytest"]
✅ / ❌ pytest-cov: [installed or "NOT INSTALLED - run pip install pytest-cov"]
✅ / ❌ ruff: [installed or "NOT INSTALLED - run pip install ruff"]

Optional (for autonomous mode):
✅ / ⏭️ Ralph Wiggum: [installed or "NOT INSTALLED (optional - needed for /tdd:execute-task)"]

Execution Modes Available:
  ✅ /tdd:execute-task-manual  (always available)
  ✅ / ❌ /tdd:execute-task     (requires Ralph)
  ✅ / ❌ /tdd:batch-execute    (requires Ralph)

[If required pass]: Ready to use! Run /tdd:init to set up your project.
[If required fail]: Fix the required issues above, then run /tdd:verify-setup again.
```
