---
name: python-conventions
description: Comprehensive Python coding standards and style conventions for maintaining consistent, high-quality code
---

# Python Conventions

## Imports

- Use absolute imports from root, not relative imports.

## Decorators

- Allow `@property` for getters but avoid `@property` setters and `@cached_property`
- Use `@dataclass` for data-holding classes

## Control Flow

- **Use ternary expressions** for simple if/else variable assignments: `value = x if condition else y`
- **Use `if _optional is not None:`** over `if _optional:` for checking optional values

## Assertions

- Assertion messages should be actionable: showing actual input values and precondition failure
