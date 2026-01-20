# Output Format Guide

This guide provides structured templates for documenting codebase exploration findings.

## Research Document Template

Use this template for complete research documents:

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

## File Location Template

Use this for codebase-locator agent output:

```markdown
## File Locations for [Feature/Topic]

### Implementation Files
- `src/services/feature.js` - Main service logic
- `src/handlers/feature-handler.js` - Request handling
- `src/models/feature.js` - Data models

### Test Files
- `src/services/__tests__/feature.test.js` - Service tests
- `e2e/feature.spec.js` - End-to-end tests

### Configuration
- `config/feature.json` - Feature-specific config
- `.featurerc` - Runtime configuration

### Type Definitions
- `types/feature.d.ts` - TypeScript definitions

### Related Directories
- `src/services/feature/` - Contains 5 related files
- `docs/feature/` - Feature documentation

### Entry Points
- `src/index.js` - Imports feature module at line 23
- `api/routes.js` - Registers feature routes
```

## Implementation Analysis Template

Use this for codebase-analyzer agent output:

```markdown
## Analysis: [Feature/Component Name]

### Overview
[2-3 sentence summary of how it works]

### Entry Points
- `api/routes.js:45` - POST /webhooks endpoint
- `handlers/webhook.js:12` - handleWebhook() function

### Core Implementation

#### 1. Request Validation (`handlers/webhook.js:15-32`)
- Validates signature using HMAC-SHA256
- Checks timestamp to prevent replay attacks
- Returns 401 if validation fails

#### 2. Data Processing (`services/webhook-processor.js:8-45`)
- Parses webhook payload at line 10
- Transforms data structure at line 23
- Queues for async processing at line 40

### Data Flow
1. Request arrives at `api/routes.js:45`
2. Routed to `handlers/webhook.js:12`
3. Validation at `handlers/webhook.js:15-32`
4. Processing at `services/webhook-processor.js:8`
5. Storage at `stores/webhook-store.js:55`

### Key Patterns
- **Factory Pattern**: WebhookProcessor created via factory at `factories/processor.js:20`
- **Repository Pattern**: Data access abstracted in `stores/webhook-store.js`
- **Middleware Chain**: Validation middleware at `middleware/auth.js:30`

### Configuration
- Webhook secret from `config/webhooks.js:5`
- Retry settings at `config/webhooks.js:12-18`
- Feature flags checked at `utils/features.js:23`

### Error Handling
- Validation errors return 401 (`handlers/webhook.js:28`)
- Processing errors trigger retry (`services/webhook-processor.js:52`)
- Failed webhooks logged to `logs/webhook-errors.log`
```

## Pattern Examples Template

Use this for codebase-pattern-finder agent output:

```markdown
## Pattern Examples: [Pattern Type]

### Pattern 1: [Descriptive Name]

**Found in**: `src/api/users.js:45-67`
**Used for**: User listing with pagination

```[language]
[Complete working code example]
```

**Key aspects**:
- Aspect 1
- Aspect 2
- Aspect 3

### Pattern 2: [Alternative Approach]

**Found in**: `src/api/products.js:89-120`
**Used for**: Alternative implementation

```[language]
[Complete working code example]
```

**Key aspects**:
- Aspect 1
- Aspect 2
- Aspect 3

### Testing Patterns

**Found in**: `tests/feature.test.js:15-45`

```[language]
[Test code example]
```

### Pattern Usage in Codebase

- **Pattern 1**: Found in [locations]
- **Pattern 2**: Found in [locations]

### Related Utilities

- `path/to/utility.js:12` - Description
- `path/to/helper.js:34` - Description
```

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

## YAML Frontmatter Fields

Required fields for research documents:

```yaml
---
date: 2026-01-20T15:30:00-0800          # ISO format with timezone
researcher: Jane Developer                # From git config user.name
git_commit: a1b2c3d4e5f6                 # Current commit hash
branch: main                             # Current branch
repository: owner/repo                   # Repository identifier
topic: "Authentication Flow"             # Research topic
tags: [research, codebase, auth, api]   # Relevant tags
status: complete                         # complete, in-progress, draft
last_updated: 2026-01-20                # YYYY-MM-DD
last_updated_by: Jane Developer          # Who last updated
---
```

Optional fields for follow-up research:

```yaml
last_updated_note: "Added follow-up research for error handling"
```

## Conventions

- Use snake_case for multi-word YAML field names
- Always include file:line references in findings
- Use backticks for inline code and file paths
- Use code blocks with language specifiers for examples
- Group related findings under clear headings
- Include temporal context (dates, commits, branches)
- Link to GitHub permalinks when available
