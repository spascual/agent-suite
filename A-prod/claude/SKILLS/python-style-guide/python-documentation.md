---
name: python-documentation
description: Python documentation sourcing and writing standards to ensure concise documentation and avoid adding confusion or ambiguity to the agent context
---

# Documentation Standards

## Naming

- Name functions/classes/variables with clear preconditions and descriptive names, avoiding single letter names or bigram abbreviations.

## Docstrings

- Only if function/class/variable behavior unclear from just name, write one-sentence docstrings (no input/output) otherwise no docstrings

## Type Annotations

- Use type annotations for function parameters and return types. If a function does not return a value, omit the return type annotation instead of using `-> None`

## Reference Tools

- For up-to-date specific python library syntax, snippets or docs, use context7 MCP
