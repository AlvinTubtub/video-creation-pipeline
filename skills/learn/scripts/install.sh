#!/bin/bash
# ==============================================================================
# Installer for the Antigravity /learn Skill
# Usage:
#   ./install.sh                  # Installs to current repo (.agents/skills/learn)
#   ./install.sh /path/to/repo    # Installs to specific repo
#   ./install.sh --global         # Installs globally to ~/.gemini/config/
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_ARG="${1:-.}"

if [ "$TARGET_ARG" == "--global" ]; then
    DEST_DIR="$HOME/.gemini/config/plugins/general-skills/skills/learn"
    echo "Installing /learn skill GLOBALLY to $DEST_DIR..."
    mkdir -p "$DEST_DIR"
    cp -r "$SCRIPT_DIR/"* "$DEST_DIR/"
    echo "✅ /learn skill successfully installed globally!"
    echo "It will now be available across all your repositories."
else
    REPO_ROOT="$(cd "$TARGET_ARG" && pwd)"
    DEST_DIR="$REPO_ROOT/.agents/skills/learn"
    echo "Installing /learn skill to repository: $REPO_ROOT..."
    mkdir -p "$DEST_DIR"
    cp -r "$SCRIPT_DIR/"* "$DEST_DIR/"
    echo "✅ /learn skill successfully installed to $DEST_DIR!"
    echo "Commit .agents/skills/learn to git to share with your team."
fi
