# Claude Code Instruction Setup

### Claude.md

- Global Location: ~/.claude/CLAUDE.md
- Project Location: <project_root>/.claude/CLAUDE.md

### SKILLS

Requires skill "pre-registration" on CLAUDE Desktop app.
Reduced token overhead by progressive skill disclosure.

1. Name main skill file – with refs to other files – `SKILL.md`
2. Zip nested skill folder
3. Upload .zip file in CLAUDE Desktop app under Settings > Capabilities > Skills
4. Ensure skill is activated in the Desktop app
5. Download skill as `<skill_name>.skill` file 
6. Move .skill under `~/.claude/skills/`
7. Unzip .skill via `unzip python-style-guide.skill`
8. Verify installation at project-level: claude `> /skills`

---

- Global Location:
  - ~/.claude/skills/<skill> for single file
  - ~/.claude/skills/<skill_name>/SKILL.md for multi-file
- Project Location: <project_root>/.claude/skills/<skill_name>.md
