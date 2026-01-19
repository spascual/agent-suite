# Interceptors for AI Coding Agents

> Dummy executables that teach AI agents to use modern Python tooling

## Overview

**Interceptors** are dummy shell scripts that intercept problematic commands (like `pip` or system `python`) and redirect AI coding agents toward modern tooling like **uv**. Created by Armin Ronacher (Flask creator), this pattern works universally with:

- Claude Code
- Cursor
- GitHub Copilot
- Any terminal-based AI assistant

## How It Works

```
Agent: "pip install requests"
         │
         ▼
    PATH lookup finds ~/.local/bin/pip (interceptor)
         │
         ▼
    Interceptor prints: "Use 'uv add requests' instead"
         │
         ▼
    Agent learns and uses correct command
```

The key insight: AI agents read terminal output and adapt. By providing clear, immediate feedback, interceptors train agents toward better patterns.

## vs Claude Code Hooks

| Feature | Interceptors | Claude Code Hooks |
|---------|--------------|-------------------|
| Scope | Universal (any AI tool) | Claude Code only |
| Setup | PATH manipulation | settings.json |
| Customization | Shell scripts | Python/any language |
| Transformation | Error messages only | Can modify commands |
| Project isolation | Via direnv | Built-in matchers |

**Use interceptors** when you want universal coverage across all AI tools.
**Use hooks** when you need advanced features like command transformation.

## Installation

### Quick Setup (Global)

```bash
# Create interceptor directory
mkdir -p ~/.local/bin/interceptors

# Create pip interceptor
cat > ~/.local/bin/interceptors/pip << 'EOF'
#!/bin/bash
echo "Error: Use 'uv add <package>' instead of pip install"
echo "       Use 'uv pip <command>' for other pip commands"
exit 1
EOF
chmod +x ~/.local/bin/interceptors/pip

# Create python interceptor
cat > ~/.local/bin/interceptors/python << 'EOF'
#!/bin/bash
echo "Error: Use 'uv run python <script>' instead"
echo "       This ensures the correct virtual environment is used"
exit 1
EOF
chmod +x ~/.local/bin/interceptors/python

# Create python3 interceptor (symlink)
ln -s python ~/.local/bin/interceptors/python3

# Add to PATH (in ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.local/bin/interceptors:$PATH"
```

### Project-Scoped Setup (Recommended)

Using **direnv** for per-project interceptors:

```bash
# Install direnv if needed
brew install direnv  # macOS
# or: sudo apt install direnv  # Ubuntu

# In your project directory
mkdir -p .interceptors

# Create .envrc
cat > .envrc << 'EOF'
export PATH="$PWD/.interceptors:$PATH"
EOF

# Allow direnv
direnv allow

# Create project-specific interceptors
cat > .interceptors/pip << 'EOF'
#!/bin/bash
echo "Error: This project uses uv. Use 'uv add <package>' instead."
exit 1
EOF
chmod +x .interceptors/pip
```

## Interceptor Examples

### Basic pip Interceptor

```bash
#!/bin/bash
# ~/.local/bin/interceptors/pip
echo "======================================"
echo "  pip is not available in this project"
echo "======================================"
echo ""
echo "This project uses uv for package management."
echo ""
echo "Instead of:"
echo "  pip install <package>"
echo ""
echo "Use:"
echo "  uv add <package>     # Add a dependency"
echo "  uv sync             # Install all dependencies"
echo "  uv pip <command>    # Run pip via uv"
echo ""
exit 1
```

### Helpful python Interceptor

```bash
#!/bin/bash
# ~/.local/bin/interceptors/python
echo "======================================"
echo "  Use 'uv run' for Python scripts"
echo "======================================"
echo ""
echo "Instead of:"
echo "  python script.py"
echo ""
echo "Use:"
echo "  uv run python script.py"
echo ""
echo "This ensures the virtual environment is activated"
echo "and all dependencies are available."
echo ""
exit 1
```

### pytest Interceptor

```bash
#!/bin/bash
# ~/.local/bin/interceptors/pytest
echo "Run pytest through uv:"
echo "  uv run pytest $@"
exit 1
```

## Advanced Patterns

### Smart Interceptor with Suggestions

```bash
#!/bin/bash
# Intercepts pip and suggests the uv equivalent
case "$1" in
  install)
    shift
    echo "Use: uv add $@"
    ;;
  uninstall)
    shift
    echo "Use: uv remove $@"
    ;;
  freeze)
    echo "Use: uv pip freeze"
    ;;
  list)
    echo "Use: uv pip list"
    ;;
  *)
    echo "Use: uv pip $@"
    ;;
esac
exit 1
```

### Logging Interceptor

```bash
#!/bin/bash
# Log interception attempts for debugging
LOG_FILE="${HOME}/.local/var/log/interceptor.log"
mkdir -p "$(dirname "$LOG_FILE")"
echo "$(date -Iseconds) pip $@" >> "$LOG_FILE"
echo "Error: Use 'uv add' instead of pip install"
exit 1
```

### Auto-Transform Interceptor (Dangerous)

```bash
#!/bin/bash
# Actually runs the uv equivalent (use with caution)
case "$1" in
  install)
    shift
    exec uv add "$@"
    ;;
  *)
    exec uv pip "$@"
    ;;
esac
```

## Integration with CLAUDE.md

Combine interceptors with project documentation:

```markdown
# CLAUDE.md

## Package Management

This project uses **uv** for all Python operations:

- `uv add <package>` - Add a dependency
- `uv sync` - Install all dependencies
- `uv run <command>` - Run a command in the virtual environment

**Do not use pip or python directly** - interceptors will block these commands.
```

## Best Practices

1. **Keep messages short**: Agents process output; be concise
2. **Always exit 1**: Non-zero exit signals the command failed
3. **Use direnv for isolation**: Don't pollute global PATH
4. **Combine with CLAUDE.md**: Document expectations
5. **Log attempts**: Track how often interception occurs

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Interceptor not triggering | Check `which pip` shows interceptor path |
| Wrong PATH order | Interceptor dir must be first in PATH |
| direnv not loading | Run `direnv allow` in project dir |
| Need real pip | Use `uv pip` or full path `/usr/bin/pip` |

## Philosophy

From Armin Ronacher's [agentic coding recommendations](https://lucumr.pocoo.org/2025/6/12/agentic-coding/):

> "Agents work best with fast, clear feedback loops. Direct error messages train agents better than complex configurations."

Interceptors embody this philosophy:
- **Fast**: Immediate feedback, no network calls
- **Clear**: Explicit error messages with alternatives
- **Universal**: Works with any tool that reads terminal output

## Resources

- [Original Article](https://pydevtools.com/blog/interceptors/)
- [Armin Ronacher's Agentic Coding](https://lucumr.pocoo.org/2025/6/12/agentic-coding/)
- [direnv Documentation](https://direnv.net/)
- [uv Documentation](https://github.com/astral-sh/uv)
