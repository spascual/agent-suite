# Modern Stack for AI-assisted coding

- IDE: Zed (over Cursor > PyCharm > VSCode)
  - Inline Auto-Complete: Zed Agent (> Github Copilot)
  - Inline Chat: Opus 4.5 (via Github Copilot)
  - Agentic Pannel: Claude Code tab (> OpenCode > Zed Agent)
    - Workflows
  - CLI: Claude Code / OpenCode (> Amp > Codex)
  - Git Commit Messages: Zed Agent (> Github Copilot)

* Terminal:
  - tmux: for terminal panel management, and persistance of OpenCode/Claude sessions
  - oh-my-zsh: check out plugins – git, github cli, docker, docker-compose

* Python
  - Project Manager: uv
  - Language Server: Ruff, Ty
  - Python Environment: .venv
  - Environment/Config: .env -> config.py

* CLI Tools: for agent use during local development
  - `rg` (ripgrep): Fast grep searches for code navigation
  - `gh` CLI: GitHub Actions logs, issues, API
  - `pixi run`: Environment-aware Python execution
  - `markdownlint`: Validation
  - `uvx` commands: Package execution
    ** Include Local Norms in AGENTS.md **

### Thought Leaders on Agentic Coding

- https://www.anaconda.com/blog/challenging-claude-code-coding-competition
