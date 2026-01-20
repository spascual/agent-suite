Sources: 
- [AI Hero Dev](https://www.aihero.dev/a-complete-guide-to-agents-md)
- Eric Ma's blog
# AGENTS.md / CLAUDE.md Setup

Follows Eric Ma's approach for setting up project-level AGENTS.md files

Key insight: Instead of using Tree-sitter AST parsing or LSP tools, Eric relies on the agent's natural language understanding of a manually-curated (but agent-assisted) code map.

# Considerations

1.  **File size** – overly long AGENTS.md / CLAUDE.md files are a common failure mode: 
	 * Confusing to follow for the agents – Less tokens available for task-specific instructions
	 * Hard to maintain, and 
	 * Token overhead in every request 
	 
	 In practice, `CLAUDE.md` files can grow fast: - Agent does something you don't like > Add a rule to prevent it > Repeat over months > `CLAUDE.md` becomes a nested ball of crap
    >
        Frontier thinking LLMs can follow ~ 150-200 instructions with reasonable consistency.
    >
2.  **LLM prompt placement** – AGENTS.md / CLAUDE.md files live just below the system prompt, and above the conversation history.
    - On every request the LLM sees: system_prompt > AGENTS.md > conversation_history
    - When you also place `AGENTS.md` files in subdirectories, and they merge with the project root level  
    
3.  **Auto-generated** `CLAUDE.md` files prioritize comprehensiveness over restraint (rules obeying)
    - Flood the file with things "useful for most scenarios"
    * Better if progressively disclosed (ie: SKILLS)

4. **Stale Documentation Poisons Context** – AI agents, read documentation on every request -> stale information actively _poisons_ the context.
	- Documenting file system structure `CLAUDE.md` is specially dangerous
	Agents should own *just-in-time documentation* during planning
---

# Global/Project Norms

More than specific instructions, AGENTS.md / CLAUDE.md files act as a configuration layer between the agent's base instructions and your actual codebase.

---

**Minimum Setup**

Limit instructions in the AGENTS.md / CLAUDE.md to a handful, leaving the "instruction-budget" high. And 

For example: 
1. **One-sentence project description** – Give context about why agents are working in this repository, anchoring every decision they make from there.

> 	This is a React component library for accessible data visualization.

2. **Package manager** – prevent the agent to default to pip/python -m/npm 

> 	 This project uses pnpm workspaces.

3.  **Build/typecheck commands** (if non-standard)

And that's it! Any additional info goes to live in 

---

**Progressive disclosure**

Behave like a "behavior" router giving pointers under context. Give the agent only what it needs right now, and point it to other resources when needed.

> 	For Python conventions, see docs/PYTHON.md

Just a conversational reference, a light touch. Avoid burning "instructional budget" in  AGENTS.md / CLAUDE.md with "always," (or all-caps forcing)

**Nested Discoverable Resource Tree**

Even link to external sources

```Python 
docs/
├── PYTHON.md
│   └── references PYTEST.md
├── PYTEST.md
│   └── references specific test runners
└── COMMIT.md
    └── references GIT commands
```

---

# SubDomains

**Personal scope**: Your commit style preferences, coding patterns you prefer
**Project scope**: What the project does, which package manager you use, your architecture decisions

> Plan -> Execute -> Test -> Commit

### Python

- Manage Python projects with uv package manager

### Git

- When creating branches, prefix them with matt/ to indicate they came from me.

### Plans

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved
  questions to answer, if any.
