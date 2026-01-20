# Search Strategies Guide

Effective patterns and approaches for finding code in any codebase.

## General Search Philosophy

Before searching, take time to ultrathink about:
- Common naming conventions in the target codebase
- Language-specific directory structures
- Related terms and synonyms
- Multiple file extensions and naming patterns


## Language Conventions

**Python**: `src/lib/pkg/`, `test_*.py`, `*_service.py`, `*_model.py`, `__init__.py`
**Go**: `pkg/internal/cmd/`, `*_test.go`, `*_handler.go`, `main.go`
**JS/TS**: `src/lib/components/`, `*.test.js`, `*.spec.ts`, `index.ts`

## Common Patterns

| Category | Search Terms |
|----------|-------------|
| **Business Logic** | `*service*`, `*handler*`, `*controller*`, `*processor*`, `*worker*` |
| **Data Access** | `*repository*`, `*store*`, `*dao*`, `*model*`, `*schema*`, `*query*` |
| **API/Routes** | `*route*`, `*api*`, `*endpoint*`, `server*`, `app*` |
| **Testing** | `*test*`, `*spec*`, `*mock*`, `__tests__/`, `fixtures/` |
| **Config** | `*config*`, `*settings*`, `*.yml`, `.env*`, `*rc` |
| **Types** | `*.d.ts`, `*types*`, `*interfaces*`, `*dto*` |
| **Docs** | `README*`, `*.md`, `docs/` |

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

## Quick Search Patterns

**API Endpoints**: Grep `router\.|app\.get|@route`, Glob `*route*|*api*|*handler*`
**Database**: Grep `SELECT|INSERT|findMany`, Glob `*repository*|*store*|*query*`
**Auth**: Grep `auth|login|jwt|token`, Glob `*auth*|*login*|*session*`
**Errors**: Grep `try|catch|throw|except`, look for error classes/middleware
