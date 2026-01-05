---
name: dashboard
description: Open the spec-workflow dashboard in browser
---

Open the spec-workflow dashboard:

1. Check if dashboard is running:
   ```bash
   curl -s http://localhost:5000/health 2>/dev/null || echo "not running"
   ```

2. If not running, the MCP server should auto-start it. If issues persist:
   ```bash
   # Check if spec-workflow-mcp is configured
   cat .mcp.json 2>/dev/null || echo "No .mcp.json found"
   ```

3. Open dashboard in browser:
   - macOS: `open http://localhost:5000`
   - Linux: `xdg-open http://localhost:5000`
   - Windows: `start http://localhost:5000`

4. Report the dashboard URL: http://localhost:5000

5. Remind user of dashboard features:
   - View project phases and progress
   - See all specs and tasks
   - Track task completion
   - View steering documents
   - Approve/reject deliverables
