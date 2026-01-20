---
name: python-testing
description: Effective Python testing to prevent regressions and ensure reliability
---

# Testing Patterns

## Test Framework

- Use pytest, not unittest. ALWAYS run pytest first with `pytest -q`

## Test Safety

- DO NOT change a failing/skipped test without prompting an external review with a detailed explanation

## Test Structure

- Write functional test definitions over OOP tests
- Test key behaviors and edge cases, following MECE (Mutually Exclusive, Collectively Exhaustive)
- Organize tests in a module-based hierarchy: `tests/unit/`, `tests/integration/`, `tests/e2e/`, `tests/performance/` that mirrors the source code structure
- Prefer many short, focused test files (<200 lines, <10 files per module) over fewer long test files
- Keep each test file focused on the behavior of a specific component or cohesive unit

## Test Implementation

- Use pytest **fixtures** to share setup/teardown logic and test dependencies across multiple tests
- Use **parameterization** to test multiple input/output scenarios with a single test function
- Use **mocking** to isolate units under test from external dependencies (APIs, Redis/Postgres DBs, file systems) and control test conditions
