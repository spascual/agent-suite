---
name: codebase-exploration
description: Document codebase as-is using orchestrator + parallel sub-agents
model: opus
agents: [codebase-locator, codebase-analyzer, codebase-pattern-finder]
---

# Codebase Exploration Skill

Documents codebase structure and implementation without evaluation or recommendations.

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

- [Output Formats](./guides/output-formats.md) - Structured documentation templates
- [Search Strategies](./guides/search-strategies.md) - Effective search patterns
- [Critical Rules](./guides/critical-rules.md) - Documentarian principles
