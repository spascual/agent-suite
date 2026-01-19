# Claude Code Hooks for uv

> Teach Claude Code to use modern Python tooling automatically

## Overview

Claude Code hooks are customizable scripts that intercept and guide Claude's behavior to ensure it uses **uv** (Astral's ultra-fast Python package manager) instead of legacy commands like `pip` or raw `python`. This is critical for agentic applications because:

- **Speed**: uv is 10-100x faster than pip, reducing agent iteration cycles dramatically
- **Consistency**: Prevents agents from creating environment drift by using wrong commands
- **Reproducibility**: Maintains lockfile integrity via `uv.lock`
- **Transparency**: Guides agents without polluting system prompts

## Hook Types

| Hook Type | When It Runs | Use Case |
|-----------|--------------|----------|
| **PreToolUse** | Before tool execution | Block/modify problematic commands |
| **PostToolUse** | After tool execution | Validate results, auto-commit, log |
| **Notification** | On keyword detection | Gentle reminders about patterns |

## Installation

### 1. Create hooks directory

```bash
mkdir -p ~/.claude/hooks
```

### 2. Create the uv enforcement hook

Save as `~/.claude/hooks/enforce-uv.py`:

```python
#!/usr/bin/env python3
"""PreToolUse hook to enforce uv usage in Python projects."""
import json
import sys
import re

def main():
    event = json.load(sys.stdin)
    tool_name = event.get("tool_name", "")
    tool_input = event.get("tool_input", {})

    if tool_name != "Bash":
        return allow()

    command = tool_input.get("command", "")

    # Patterns to intercept
    patterns = {
        r"^pip\s+install": "Use 'uv add <package>' instead of 'pip install'",
        r"^pip3\s+install": "Use 'uv add <package>' instead of 'pip3 install'",
        r"^python\s+-m\s+pip": "Use 'uv add <package>' instead of 'python -m pip'",
        r"^python\s+\S+\.py": "Use 'uv run python <script>' instead",
        r"^python3\s+\S+\.py": "Use 'uv run python <script>' instead",
        r"^pytest": "Use 'uv run pytest' instead",
        r"^pip\s+install\s+-r": "Use 'uv sync' to install from pyproject.toml",
    }

    for pattern, message in patterns.items():
        if re.search(pattern, command):
            return block(message)

    return allow()

def allow():
    print(json.dumps({"decision": "allow"}))

def block(reason):
    print(json.dumps({
        "decision": "block",
        "reason": f"[uv hook] {reason}"
    }))

if __name__ == "__main__":
    main()
```

### 3. Configure Claude Code settings

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "command": "python ~/.claude/hooks/enforce-uv.py"
      }
    ]
  }
}
```

## Command Translation Reference

| Legacy Command | uv Equivalent | Hook Action |
|----------------|---------------|-------------|
| `pip install package` | `uv add package` | Block with guidance |
| `pip install -r requirements.txt` | `uv sync` | Block with guidance |
| `python script.py` | `uv run python script.py` | Block with guidance |
| `pytest` | `uv run pytest` | Block with guidance |
| `python -m venv .venv` | `uv venv` (80x faster) | Block with guidance |
| `pip install -e .` | `uv pip install -e .` | Allow (compatible) |

## Advanced Patterns

### Tool Input Modification (v2.0.10+)

Transform commands transparently instead of blocking:

```python
def transform_command(command):
    """Transform legacy commands to uv equivalents."""
    transformations = [
        (r"^pip install (.+)", r"uv add \1"),
        (r"^python (\S+\.py)", r"uv run python \1"),
        (r"^pytest(.*)$", r"uv run pytest\1"),
    ]

    for pattern, replacement in transformations:
        if re.match(pattern, command):
            return re.sub(pattern, replacement, command)
    return command

# In your hook:
transformed = transform_command(command)
if transformed != command:
    print(json.dumps({
        "decision": "allow",
        "tool_input": {"command": transformed}
    }))
```

### PostToolUse Validation

Auto-commit after successful operations:

```python
#!/usr/bin/env python3
"""PostToolUse hook for auto-commit after file changes."""
import json
import sys
import subprocess

def main():
    event = json.load(sys.stdin)
    tool_name = event.get("tool_name", "")

    if tool_name in ["Write", "Edit"]:
        # Stage and commit changes
        subprocess.run(["git", "add", "-A"], capture_output=True)
        subprocess.run([
            "git", "commit", "-m",
            f"auto: {tool_name} by Claude Code"
        ], capture_output=True)

    print(json.dumps({"continue": True}))

if __name__ == "__main__":
    main()
```

## Agentic Use Cases

### 1. Multi-Agent Environment Isolation

```python
# Ensure each agent gets isolated uv environment
def ensure_agent_environment(agent_id):
    env_path = f".venv-{agent_id}"
    if not os.path.exists(env_path):
        subprocess.run(["uv", "venv", env_path])
    return env_path
```

### 2. Cost-Aware Dependency Management

```python
# Log package install times for optimization
def log_install_time(package, duration):
    with open(".claude/metrics.jsonl", "a") as f:
        f.write(json.dumps({
            "event": "package_install",
            "package": package,
            "duration_ms": duration,
            "timestamp": datetime.utcnow().isoformat()
        }) + "\n")
```

### 3. Security Sandboxing

```python
# Rewrite file paths to sandbox directory
def sandbox_path(original_path):
    if original_path.startswith("/"):
        return f"/sandbox{original_path}"
    return original_path
```

## Best Practices

1. **Start simple**: Begin with blocking patterns, then evolve to transformations
2. **Set timeouts**: Configure hook timeouts to avoid hanging (default: 60s)
3. **Log everything**: Use PostToolUse hooks for observability
4. **Team conventions**: Share hooks via `.claude/hooks/` in your repo
5. **Test hooks locally**: Run manually with sample JSON input before deploying

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Hook not triggering | Check `matcher` field matches tool name exactly |
| Hook timeout | Increase timeout in settings or optimize hook script |
| JSON parse error | Ensure hook outputs valid JSON to stdout |
| Permission denied | Make hook script executable: `chmod +x hook.py` |

## Resources

- [Claude Code Hooks Reference](https://docs.anthropic.com/claude-code/hooks)
- [uv Documentation](https://github.com/astral-sh/uv)
- [Original Article](https://pydevtools.com/blog/claude-code-hooks-for-uv/)
