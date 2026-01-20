# Formatting Conventions

Shared formatting rules and standards for all codebase exploration output.

## File Reference Format

Always use this format for file references:

- **Single line**: `path/to/file.ext:123`
- **Line range**: `path/to/file.ext:45-67`
- **With description**: `path/to/file.ext:123` - What's there

## Markdown Link Format

When creating links to code references:

```markdown
[`file.ext:line`](https://github.com/owner/repo/blob/commit/file.ext#Lline)
```

## General Conventions

- Use snake_case for multi-word YAML field names
- Always include file:line references in findings
- Use backticks for inline code and file paths
- Use code blocks with language specifiers for examples
- Group related findings under clear headings
- Include temporal context (dates, commits, branches)
- Link to GitHub permalinks when available
