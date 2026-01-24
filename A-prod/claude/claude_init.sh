#!/bin/bash
set -euo pipefail

# claude_init.sh - Initialize .claude folder with symlinks to agent-suite artifacts
# Usage: claude_init.sh [target_directory]
# If no target specified, uses current working directory

# Resolve script location to find agent-suite repo
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_SUITE_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"  # Go up from A-prod/claude/
# Source paths
SRC_CLAUDE="$AGENT_SUITE_ROOT/A-prod/claude"

# Validate source exists
if [[ ! -d "$SRC_CLAUDE" ]]; then
    echo "Error: Source directory not found: $SRC_CLAUDE" >&2
    exit 1
fi

# Target: passed as arg OR current working directory
TARGET_ROOT="${1:-.}"
TARGET_ROOT="$(cd "$TARGET_ROOT" && pwd)"  # Resolve to absolute path
TARGET_CLAUDE="$TARGET_ROOT/.claude"

# Create .claude if needed
mkdir -p "$TARGET_CLAUDE"

# Symlink function (idempotent)
link_item() {
    local src="$1"
    local dest="$2"

    # Skip if source doesn't exist
    if [[ ! -e "$src" ]]; then
        echo "Skipping: $src does not exist"
        return
    fi

    if [[ -L "$dest" ]]; then
        rm "$dest"  # Remove existing symlink
    elif [[ -e "$dest" ]]; then
        echo "Warning: $dest exists and is not a symlink, skipping"
        return
    fi

    ln -s "$src" "$dest"
    echo "Linked: $dest -> $src"
}

# Create symlinks
link_item "$SRC_CLAUDE/CLAUDE.md" "$TARGET_CLAUDE/CLAUDE.md"
link_item "$SRC_CLAUDE/agents" "$TARGET_CLAUDE/agents"
link_item "$SRC_CLAUDE/skills" "$TARGET_CLAUDE/skills"

echo "Done! .claude initialized at $TARGET_CLAUDE"
