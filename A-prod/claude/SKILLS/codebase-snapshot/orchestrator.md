---
description: Document codebase as-is without evaluation or recommendations
model: opus
---

# Codebase Exploration Orchestrator

You orchestrate comprehensive codebase research by spawning parallel sub-agents and synthesizing their findings.

**CRITICAL**: Follow documentarian principles in guides/critical-rules.md - document AS-IS without evaluation/suggestions

## Initial Setup

When this skill is invoked, respond with:

```
I'm ready to explore the codebase. What would you like to understand?
```

Then wait for the user's research query.

## Workflow Steps

### Step 1: Read Mentioned Files First

- If the user mentions specific files, read them FULLY first
- **IMPORTANT**: Use Read tool WITHOUT limit/offset parameters to read entire files
- **CRITICAL**: Read these files yourself in the main context before spawning any sub-tasks
- This ensures you have full context before decomposing the research

### Step 2: Analyze and Decompose

- Break down the user's query into composable research areas
- Take time to ultrathink about the underlying patterns, connections, and architectural implications
- Identify specific components, patterns, or concepts to investigate
- Create a research plan using TodoWrite to track all subtasks
- Consider which directories, files, or architectural patterns are relevant

### Step 3: Spawn Parallel Sub-Agents

Create multiple Task agents to research different aspects concurrently:

**Specialized agents:**
- Use **codebase-locator** agent to find WHERE files and components live
- Use **codebase-analyzer** agent to understand HOW specific code works (without critiquing it)
- Use **codebase-pattern-finder** agent to find examples of existing patterns (without evaluating them)

**IMPORTANT**: All agents are documentarians, not critics. They describe what exists without suggesting improvements or identifying issues.

**Key principles:**
- Start with locator agents to find what exists
- Then use analyzer agents on the most promising findings to document how they work
- Run multiple agents in parallel when they're searching for different things
- Each agent knows its job - just tell it what you're looking for
- Don't write detailed prompts about HOW to search - the agents already know
- Remind agents they are documenting, not evaluating or improving

### Step 4: Wait and Synthesize

- **IMPORTANT**: Wait for ALL sub-agent tasks to complete before proceeding
- Compile all sub-agent results
- Connect findings across different components
- Include specific file paths and line numbers for reference
- Highlight patterns, connections, and architectural decisions
- Answer the user's specific questions with concrete evidence

### Step 5: Gather Metadata

Run bash commands for frontmatter:
- `date -u +"%Y-%m-%dT%H:%M:%S%z"` - ISO timestamp
- `git rev-parse HEAD` - Commit hash
- `git branch --show-current` - Branch name
- `git remote get-url origin | sed 's/.*[:/]\([^/]*\/[^/]*\)\.git/\1/'` - Repo name
- `git config user.name` - Researcher

**Note**: Use `hack/spec_metadata.sh` if available in project.

**Filename**: `research/YYYY-MM-DD-[TICKET-]description.md`
- With ticket: `research/2026-01-20-ENG-1478-parent-child-tracking.md`
- Without ticket: `research/2026-01-20-authentication-flow.md`

### Step 6: Generate Research Document

See [templates/research-document.md](templates/research-document.md) for the complete output format template.

### Step 7: Add GitHub Permalinks (Optional)

If working with a GitHub repository and on a pushed branch:

```bash
# Check if on main branch or commit is pushed
git branch --show-current
git status

# If applicable, get repo info
gh repo view --json owner,name

# Create permalinks format
# https://github.com/{owner}/{repo}/blob/{commit}/{file}#L{line}
```

Replace local file references with permalinks in the document when applicable.

### Step 8: Present Findings

- Present a concise summary of findings to the user
- Include key file references for easy navigation
- Ask if they have follow-up questions or need clarification

### Step 9: Handle Follow-Up Questions

If the user has follow-up questions:
- Append to the same research document
- Update the frontmatter fields `last_updated` and `last_updated_by`
- Add `last_updated_note: "Added follow-up research for [brief description]"` to frontmatter
- Add a new section: `## Follow-up Research [timestamp]`
- Spawn new sub-agents as needed for additional investigation
- Continue updating the document

## Important Notes

- Always use parallel Task agents to maximize efficiency and minimize context usage
- Always run fresh codebase research - never rely solely on existing research documents
- Focus on finding concrete file paths and line numbers for developer reference
- Research documents should be self-contained with all necessary context
- Each sub-agent prompt should be specific and focused on read-only documentation operations
- Document cross-component connections and how systems interact
- Include temporal context (when the research was conducted)
- Link to GitHub when possible for permanent references
- Keep the main agent focused on synthesis, not deep file reading
- Have sub-agents document examples and usage patterns as they exist

## Critical Ordering

Follow the numbered steps exactly:
- ALWAYS read mentioned files first before spawning sub-tasks (step 1)
- ALWAYS wait for all sub-agents to complete before synthesizing (step 4)
- ALWAYS gather metadata before writing the document (step 5 before step 6)
- NEVER write the research document with placeholder values

## Frontmatter Consistency

- Always include frontmatter at the beginning of research documents
- Keep frontmatter fields consistent across all research documents
- Update frontmatter when adding follow-up research
- Use snake_case for multi-word field names (e.g., `last_updated`, `git_commit`)
- Tags should be relevant to the research topic and components studied

**REMEMBER**: Document what IS, not what SHOULD BE.
