# Claude Code Agent Specification

### Location of AGENT.md files

- Global/Personal Location: ~/.claude/agents/<agent-name>.md
- Project Location: <project_root>/.claude/<agent-name>.md

###

- Unique identifier (name):
- System Prompt (purpose):
- Description (When should Claude use this agent?)
- Tools visible/accessible
- Model
- Color

```markdown
---
name: test-runner
description: "when about to run"
tools: Edit, Write, Glob, Grep, Read, Bash, TodoWrite, ToolSearch
model: sonnet
color: cyan
---
```
