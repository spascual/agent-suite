---
name: codebase-snapshot
description: Documents codebase structure and implementation without evaluation or recommendations.
---

# Codebase Exploration Skill

Documents codebase structure and implementation without evaluation or recommendations, using orchestrator + parallel sub-agents

## Architecture

**3-Layer Pattern:** Orchestrator (Opus) spawns parallel specialized sub-agents (Sonnet)

- **codebase-locator** - Finds WHERE files and components live
- **codebase-analyzer** - Documents HOW code works
- **codebase-pattern-finder** - Shows WHAT patterns exist

## Core Principle

**Documentarians, not critics.** Describe what exists without suggesting improvements.

## Workflow

See [orchestrator.md](./orchestrator.md) for complete workflow.

## Sub-Agents

- [codebase-locator](./agents/codebase-locator.md) - File location specialist
- [codebase-analyzer](./agents/codebase-analyzer.md) - Implementation analysis specialist
- [codebase-pattern-finder](./agents/codebase-pattern-finder.md) - Pattern discovery specialist

## Guides

- [Search Strategies](./guides/search-strategies.md) - Effective search patterns
- [Critical Rules](./guides/critical-rules.md) - Documentarian principles

## Templates

- [research-document.md](./templates/research-document.md) - Complete research document template
- [file-locations.md](./templates/file-locations.md) - File location template
- [implementation-analysis.md](./templates/implementation-analysis.md) - Implementation analysis template
- [pattern-examples.md](./templates/pattern-examples.md) - Pattern examples template
- [conventions.md](./templates/conventions.md) - Formatting conventions
