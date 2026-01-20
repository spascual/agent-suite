# Refactoring Principles

## Design Patterns

- Apply SRP (Single Responsibility Principle) and Encapsulation ("hide implementation details")

## Validation Strategy

- For internal methods, prioritize caller validation
- For publicly exposed methods, raise assertions
- For public APIs, try/except returning error codes, and thoughtfullerror messages
