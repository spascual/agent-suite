- uv-managed Python Project

# Python Style

- Use absolute imports from root, not relative imports.
- Use @property with a pythonic `if not hasattr(self) > return loaded`and 
- @dataclass. Avoid @property setters, and @cached_property decorators
- Write clear assertion messages showing precondition failure and actual value of inputs.
- Use ternary expressions for simple if/else variable assignment. Avoid stacked
- Use `if x in _dict:` over `if _dict.get(x) is not None:` for checking dictionary keys.
- Use `if _optional is not None:` over `if _optional:` for checking optional values.

# Docstrings

- Name functions/methods/variables with strong preconditions.
- Write concise docstrings, applying token economy principles.
- Docstrings should reflect responsibilities clearly and concisely.

# Tests

- DO NOT change a failing/skipped test without prompting an external review with a detailed explanation.
- Use pytest, not unittest. ALWAYS run pytest first with `pytest -q`.
- Write functional test definitions over OOP tests and over unit testing.
- Test key behaviors and edge cases, following MECE (Mutually Exclusive, Collectively Exhaustive)
- Prioritize more and shorter test files (<10 files <200 lines each>)– focused on specific functionality – over less but longer test files.
- Use pytest fixtures, parameterization, and mocking for comprehensive, and concise test suite.

# ARCHITECTURE DECISIONS

- Apply SRP (Single Responsibility Principle) and Encapsulation ("hide implementation details")
- FAIL FAST: Prioritize caller validation for internal methods. For public APIs/methods, use assertions
