# Antigravity Customization Architecture Reference

Understanding how Antigravity discovers and prioritizes rules and skills ensures your learned behaviors persist seamlessly across sessions.

---

## 1. Discovery Locations & Hierarchy

Antigravity traverses directories starting from your current working directory (CWD) up to the repository root:

1. **Workspace Scope (Project-Specific):**
   - `.agents/rules/*.md` — Specialized rules discovered hierarchically.
   - `.agents/skills/<name>/SKILL.md` — Custom project skills with slash command integration.
   - `GEMINI.md` or `AGENTS.md` (at repo root) — Project-wide root rules (always loaded).

2. **Global Scope (Machine-Wide across all projects):**
   - `~/.gemini/config/`
   - `~/.gemini/config/plugins/`
   - Global rules apply to every project opened on your machine.

---

## 2. Loading Priority (Highest to Lowest)

When rules or skills have overlapping instructions, Antigravity resolves them in this order:

1. **Workspace Project Root** (`.agents/` or `GEMINI.md` in current repo).
2. **Declared Configurations** (`skills.json` / `plugins.json`).
3. **Global Discovery** (`~/.gemini/config/`).
4. **Built-in System Customizations** (Default system skills).

---

## 3. Size Limits & Context Budgets

To keep the agent fast and avoid context window bloat:

- **Per-File Limit:** 24 KB (24,000 bytes) max per rule file.
- **Rules Budget:** 20,000 tokens aggregate for always-on rules.
- **Skill Progressive Disclosure:** Only the `name` and `description` from the YAML frontmatter of a skill are loaded initially. The full `SKILL.md` content is loaded only when activated on-demand.
