# Search Strategies Guide

Effective patterns and approaches for finding code in any codebase.

## General Search Philosophy

Before searching, take time to ultrathink about:
- Common naming conventions in the target codebase
- Language-specific directory structures
- Related terms and synonyms
- Multiple file extensions and naming patterns

## Tool Selection

### Use Grep When
- Searching for keywords in file contents
- Finding function/class/variable names
- Locating specific strings or patterns
- Searching with regex patterns

### Use Glob When
- Finding files by name patterns
- Locating files by extension
- Discovering directory structures
- Working with wildcards

### Use LS When
- Exploring directory contents
- Understanding file organization
- Counting files in directories
- Checking for specific file existence

### Use Read When
- Analyzing specific file contents
- Tracing implementation details
- Understanding code flow
- Extracting code examples

## Language-Specific Patterns

### JavaScript/TypeScript

**Common directories:**
- `src/`, `lib/`, `dist/`, `build/`
- `components/`, `pages/`, `api/`, `routes/`
- `utils/`, `helpers/`, `services/`
- `__tests__/`, `test/`, `spec/`

**File patterns:**
- Implementation: `*.js`, `*.ts`, `*.jsx`, `*.tsx`
- Tests: `*.test.js`, `*.spec.ts`, `*.test.tsx`
- Types: `*.d.ts`, `types.ts`, `*.types.ts`
- Config: `*.config.js`, `.eslintrc`, `tsconfig.json`

**Common naming:**
- `*Controller`, `*Service`, `*Handler`
- `*Provider`, `*Context`, `*Hook`
- `use*` (React hooks)
- `*Middleware`, `*Guard`, `*Filter`

### Python

**Common directories:**
- `src/`, `lib/`, `pkg/`
- Module names matching features
- `tests/`, `test/`
- `scripts/`, `utils/`

**File patterns:**
- Implementation: `*.py`
- Tests: `test_*.py`, `*_test.py`
- Config: `*.ini`, `*.yaml`, `*.toml`, `setup.py`

**Common naming:**
- `*_service.py`, `*_handler.py`, `*_controller.py`
- `*_model.py`, `*_schema.py`
- `*_utils.py`, `*_helpers.py`
- `__init__.py`, `__main__.py`

### Go

**Common directories:**
- `pkg/`, `internal/`, `cmd/`
- `api/`, `service/`, `handler/`
- Feature-specific subdirectories

**File patterns:**
- Implementation: `*.go`
- Tests: `*_test.go`
- Config: `*.yaml`, `*.toml`, `*.json`

**Common naming:**
- `*_service.go`, `*_handler.go`
- `*_repository.go`, `*_store.go`
- `client.go`, `server.go`
- `main.go`

## Common Code Patterns

### Business Logic
Search for:
- `*service*`, `*handler*`, `*controller*`
- `*manager*`, `*processor*`, `*worker*`
- `*logic*`, `*business*`

### Data Access
Search for:
- `*repository*`, `*store*`, `*dao*`
- `*model*`, `*entity*`, `*schema*`
- `*query*`, `*database*`, `*db*`

### API/Routes
Search for:
- `*route*`, `*router*`, `*endpoint*`
- `*api*`, `*controller*`, `*handler*`
- `server*`, `app*`

### Testing
Search for:
- `*test*`, `*spec*`, `*mock*`
- `__tests__/`, `test/`, `spec/`
- `fixtures/`, `factories/`

### Configuration
Search for:
- `*config*`, `*settings*`, `*env*`
- `*.config.*`, `*rc`, `*.yml`, `*.yaml`
- `.env*`, `*settings*`

### Type Definitions
Search for:
- `*.d.ts`, `*types*`, `*interfaces*`
- `*schema*`, `*dto*`, `*model*`

### Documentation
Search for:
- `README*`, `CONTRIBUTING*`, `*.md`
- `docs/`, `documentation/`
- Inline comments and docstrings

## Search Sequences

### Finding a Feature

1. **Broad keyword search** - Grep for feature name
2. **Refine by location** - Check language-specific directories
3. **Find related files** - Glob for similar names
4. **Identify tests** - Look for test files
5. **Check configuration** - Find config related to feature

### Understanding Implementation

1. **Find entry points** - Search for public APIs, routes, main functions
2. **Read entry point** - Understand the surface area
3. **Trace dependencies** - Follow imports/requires
4. **Map data flow** - Track transformations
5. **Check error handling** - Find error paths

### Discovering Patterns

1. **Find one example** - Locate a working implementation
2. **Search for similar** - Grep for pattern indicators
3. **Read variations** - Understand different approaches
4. **Find tests** - See how patterns are tested
5. **Note utilities** - Identify shared helpers

## Multi-Pass Search Strategy

### Pass 1: Locate (WHERE)
- Find all files related to the topic
- Use Grep for keywords, Glob for patterns
- Don't read file contents yet
- Organize by purpose (impl, test, config, docs)

### Pass 2: Analyze (HOW)
- Read the most relevant files
- Trace code paths
- Document implementation details
- Note patterns and conventions

### Pass 3: Contextualize (WHAT)
- Find similar implementations
- Extract reusable patterns
- Show working examples
- Note variations

## Search Pattern Examples

### Find API Endpoints
```
Grep: "router\.", "app\.get", "app\.post", "@route", "@api"
Glob: "*route*.js", "*api*.py", "*handler*.go"
```

### Find Database Queries
```
Grep: "SELECT", "INSERT", "UPDATE", "findMany", "query\("
Glob: "*repository*", "*store*", "*dao*", "*query*"
```

### Find Authentication
```
Grep: "auth", "login", "authenticate", "jwt", "token"
Glob: "*auth*", "*login*", "*session*"
```

### Find Error Handling
```
Grep: "try", "catch", "error", "throw", "panic", "except"
Look for: Error classes, error middleware, logging
```

## Efficiency Tips

1. **Start broad, narrow down** - Begin with general searches, refine based on results
2. **Use multiple terms** - Search for synonyms and related concepts
3. **Check standard locations first** - Follow language conventions
4. **Look for patterns** - Notice naming conventions, apply them
5. **Don't skip tests** - Tests often reveal usage patterns
6. **Check imports** - Dependencies tell you about connections
7. **Use context** - File location often indicates purpose

## What NOT to Do

- Don't assume directory structure without checking
- Don't search only for exact names - use wildcards
- Don't ignore test files - they show usage
- Don't skip configuration - it reveals behavior
- Don't forget documentation - it provides context
- Don't search file contents if you just need locations
- Don't read files if you just need to list them

## Remember

You're creating a map of the codebase. Be thorough, be systematic, and document what you find exactly as it exists.
