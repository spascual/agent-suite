I want you to refactor codebase-exploration.md file to follow progressive disclosure principles by reviewing and aggregating the .md files referenced in @codebase-exploration-skill-guide.md into a single markdown file.

Follow these steps:

1. **Find contradictions**: Identify any instructions that conflict with each other. For each contradiction, ask me which version I want to keep.

2. **Identify the essentials**: Extract only what belongs in the root SKILLS.md:

- One-sentence project description

- Anything truly relevant to every single task

1. **Group the rest**: Organize remaining instructions into logical categories (e.g., Python conventions, testing patterns, API design, Git workflow). For each group, create a separate markdown file.

2. **Create the file structure**: Output:

- A minimal root SKILLS.md with markdown links to the separate files

- Each separate file with its relevant instructions, and .YAML headers

- A suggested docs/ folder structure

5. **Flag for deletion**: Identify any instructions that are:

- Redundant (the agent already knows this)

- Too vague to be actionable

- Overly obvious (like "write clean code")
