# Modern Stack for AI-assisted coding

- IDE: Zed (over Cursor > PyCharm > VSCode)
  - Inline Auto-Complete: Zed Agent (> Github Copilot)
  - Inline Chat: Opus 4.5 (via Github Copilot)
  - Agentic Pannel: Claude Code tab (> OpenCode > Zed Agent)
    - Workflows
  - CLI: Claude Code / OpenCode (> Amp > Codex)
  - Git Commit Messages: Zed Agent (> Github Copilot)
  - Code Review: Claude Review (or Cursor BugBot)
  - Code Debugging: Cursor Debug with GPT5.2 High

* IDE/Terminal Panel Layout
  - Left Panel: File Explorer
  - Middle Panel: Current File
  - Right Panel: AI Agent open in Terminal or AI Panel

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

* MCPs
  - (Frontend) Supabase, Firebase
  - External docs Context7

* Snippets
  - Whispr Flow: Examples cal link, work email

### Thought Leaders on Agentic Coding

- https://www.anaconda.com/blog/challenging-claude-code-coding-competition
* Packages: 
	https://github.com/StrongTheDev/logstash-for-zed
	https://github.com/mirageN1349/browser-tools-context-server
### Agentic Development Cycle

> Plan (design / review iterative loop) -> Execute -> Test -> Commit

### Use cases

- Integrations (of external packages)
-
