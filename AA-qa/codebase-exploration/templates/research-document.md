# Research Document Template

Use this template for complete research documents produced by the orchestrator.

## Template

```markdown
---
date: [ISO format with timezone]
researcher: [Researcher name from git config]
git_commit: [Current commit hash]
branch: [Current branch name]
repository: [Repository name]
topic: "[User's Question/Topic]"
tags: [research, codebase, relevant-component-names]
status: complete
last_updated: [YYYY-MM-DD]
last_updated_by: [Researcher name]
---

# Research: [User's Question/Topic]

**Date**: [Current date and time with timezone]
**Researcher**: [Researcher name]
**Git Commit**: [Current commit hash]
**Branch**: [Current branch name]
**Repository**: [Repository name]

## Research Question

[Original user query]

## Summary

[High-level documentation of what was found, answering the user's question by describing what exists]

## Detailed Findings

### [Component/Area 1]
- Description of what exists (`file.ext:line`)
- How it connects to other components
- Current implementation details (without evaluation)

### [Component/Area 2]
...

## Code References

- `path/to/file.py:123` - Description of what's there
- `another/file.ts:45-67` - Description of the code block

## Architecture Documentation

[Current patterns, conventions, and design implementations found in the codebase]

## Open Questions

[Any areas that need further investigation]
```

## YAML Frontmatter Fields

```yaml
---
date: 2026-01-20T15:30:00-0800
researcher: Jane Developer
git_commit: a1b2c3d4e5f6
branch: main
repository: owner/repo
topic: "Authentication Flow"
tags: [research, codebase, auth, api]
status: complete
last_updated: 2026-01-20
last_updated_by: Jane Developer
# Optional for follow-ups:
# last_updated_note: "Added follow-up research for error handling"
---
```

**Conventions**: See [conventions.md](./conventions.md)
