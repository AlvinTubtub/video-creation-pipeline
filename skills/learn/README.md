# Antigravity `/learn` Skill Package

This package provides the complete, standalone `/learn` skill for Google Antigravity and Gemini Code Assist.

It teaches the AI agent how to extract lessons, user corrections, coding styles, and architectural decisions from active chat sessions and permanently persist them into your repository rules (`GEMINI.md`, `AGENTS.md`, or `.agents/rules/*.md`) or custom skills (`.agents/skills/`).

---

## Quick Installation

### Option 1: One-Click Script
Inside the unzipped `learn/` folder:
```bash
# To install in your current repository:
./scripts/install.sh

# Or to install in another repository:
./scripts/install.sh /path/to/other-repo

# Or to install globally across all repositories on your Mac:
./scripts/install.sh --global
```

### Option 2: Manual Copy
Copy the `learn/` folder into your target repository at:
`.agents/skills/learn/`

Ensure the path is:
`<your-repo>/.agents/skills/learn/SKILL.md`

---

## How to Use
Once installed, open Antigravity in that repository and:
- Type `/learn` in the chat.
- Or say: *"Learn from this conversation and save the rules."*
- Or say: *"I-save mo ito sa ating rules."*

The agent will automatically analyze the transcript, extract your guidelines, and update `GEMINI.md` or `.agents/rules/` accordingly!
