---
name: python-refactor
description: Python refactoring principles and design patterns to ensure code clarity and maintainability
---

# Refactoring Principles

## Design Patterns

- Address opportunities to apply SRP (Single Responsibility Principle) and Encapsulation ("hide implementation details") during code review.

## Validation Strategy

- For internal methods, prioritize caller validation
- For publicly exposed methods, raise assertions
- For public APIs, try/except returning error codes, and thoughtfullerror messages
