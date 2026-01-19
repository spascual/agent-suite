---
name: python-style-guide
description: Comprehensive Python coding standards and style conventions for maintaining consistent, high-quality code across uv-managed Python projects
---

You are writing Python code following strict style and architectural standards. Your code must adhere to the guidelines below.

## CRITICAL: MAINTAIN CONSISTENCY

- **DO NOT change failing/skipped tests** without prompting an external review with a detailed explanation
- **DO NOT use relative imports** - Always use absolute imports from project root
- **DO NOT skip assertion messages** - Every assertion must include a clear failure message
- **DO NOT use @property setters** – 

## Core Style Principles

### Python Code Style

**Imports and Module Structure**
- **Use absolute imports** from root only, not relative imports
- **Organize imports** following standard conventions (stdlib, third-party, local)

**Code Patterns**
- **Use cached @property decorators** for computed attributes
- **Use @dataclass** for data containers
- **Avoid @property setters** - Prefer immutability and explicit methods

**Conditional Expressions**
- **Use ternary expressions** for simple if/else variable assignments
  - Example: `value = x if condition else y`

**Dictionary Operations**
- **Use `if x in _dict:`** over `if _dict.get(x) is not None:` for checking dictionary key existence
- Prefer direct membership testing for clarity

**Optional Value Checking**
- **Use `if _optional is not None:`** over `if _optional:` for checking optional values
- Explicit None checks prevent falsy value bugs (0, empty strings, etc.)

**Assertion Messages**
- **Write clear assertion messages** showing both precondition failure and actual value
- Format: `assert condition, f"Expected {expected}, got {actual}"`
- Include context about what failed and why

### Docstrings

**Function and Variable Naming**
- **Name functions/methods/variables** with strong preconditions that reflect their purpose
- Names should communicate constraints and expectations

**Documentation Style**
- **Write concise docstrings** applying token economy principles
- **Reflect responsibilities** clearly and concisely
- Avoid verbose explanations when the code is self-documenting
- Focus on why, not what (when the what is obvious)

### Testing Standards

**Test Framework**
- **Use pytest**, not unittest
- **Run tests** with `pytest -q` for quiet output

**Test Structure**
- **Write functional test definitions** over OOP test classes
- **Prefer functional tests** over unit tests
- **Test key behaviors and edge cases** following MECE (Mutually Exclusive, Collectively Exhaustive)

**Test Organization**
- **Prioritize more and shorter test files** (<10 files, <200 lines each)
- **Focus tests on specific functionality** rather than creating monolithic test suites
- Each test file should cover a distinct feature or module

**Test Techniques**
- **Use pytest fixtures** for test setup and dependency injection
- **Use parameterization** for testing multiple input scenarios
- **Use mocking** for external dependencies and side effects
- Build a comprehensive and concise test suite

## Architecture Decisions

**Design Principles**
- **Apply SRP** (Single Responsibility Principle) - Each module/class/function has one reason to change
- **Apply Encapsulation** - Hide implementation details from consumers

**Error Handling**
- **FAIL FAST** - Detect and report errors as early as possible
- **Prioritize caller validation** for internal methods
- **Use assertions** for public APIs/methods to validate preconditions
- Validate inputs at boundaries, trust internal code

## Project Configuration

**Environment**
- Projects are **uv-managed Python projects**
- Follow uv conventions for dependency management and project structure
