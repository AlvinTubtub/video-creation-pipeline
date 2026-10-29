---
name: learn
description: >-
  Extract, synthesize, and persist rules, guidelines, preferences, and workflows
  from user corrections, preferences, or successful procedures in the conversation.
  Triggered when the user runs the /learn slash command, or asks to "save this to rules",
  "remember this behavior", "matuto ka mula sa conversation na ito", or codify best practices.
---

# Agent Learning & Behavior Persistence Skill (`/learn`)

This skill allows the agent to self-reflect on the current conversation, extract key learnings, corrections, and user preferences, and codify them into persistent rules or skills so that the agent and future sessions automatically adhere to them without being reminded.

---

## Workflow: 5-Step Learning Procedure

When `/learn` is invoked, execute these steps systematically:

### Step 1: Conversation & Transcript Reflection
1. Review the conversation history and transcript:
   - What corrections did the user make? (e.g., formatting styles, forbidden libraries, layout bounds, text overflow fixes, tone adjustments).
   - What architectural or design decisions were finalized? (e.g., specific framework patterns, folder structures, quality gate requirements).
   - What direct instructions did the user ask to "always" or "never" do? (e.g., "always provide script first", "never use flat emojis").

### Step 2: Classify the Learning Type
Determine the proper Antigravity persistence layer:

| Learning Type | Target Format | Target Destination | When to Choose |
|---|---|---|---|
| **Project-Wide Rule** | Standalone Markdown | `GEMINI.md` or `AGENTS.md` (Project Root) | General rules that apply to every file, prompt, and task across the entire repository. |
| **Domain / Subsystem Rule** | Hierarchical Rule | `.agents/rules/<domain>-rules.md` | Specific to a subsystem (e.g., frontend, database, video production, API security). |
| **Reusable Multi-Step Runbook** | Custom Skill | `.agents/skills/<skill-name>/SKILL.md` | A procedural, repeatable multi-step workflow requiring specific commands, scripts, or validation. |
| **Global User Preference** | Global Rule | `~/.gemini/config/GEMINI.md` | Cross-project user habits (e.g., preferred shell, language style, commit convention). |

### Step 3: Synthesize Enforceable Rules
Formulate the extracted knowledge using these quality standards:
1. **Be Specific & Actionable:** State the exact constraints, file paths, numbers, or regexes rather than vague advice.
   - *Bad:* "Make sure text looks good on mobile."
   - *Good:* "All titles must have `white-space: normal; overflow-wrap: break-word;` with `max-width: 872px` to prevent overflow in 9:16 vertical canvas."
2. **Include Positive & Negative Examples:** Show what to do and what to avoid.
3. **Respect Size Limits:** Keep individual rule files under 24 KB (Antigravity's per-rule limit).
4. **Use Imperative Voice:** Use clear directives ("Must", "Never", "Always", "Do not").

### Step 4: Write & Persist
Write the updated or new rule/skill file:
- If `GEMINI.md` or `AGENTS.md` already exists, append or merge the new rule cleanly under a new section.
- If creating a new rule file in `.agents/rules/`, use a clear filename (e.g., `.agents/rules/api-standards.md`).
- If creating a new skill in `.agents/skills/<name>/`, provide valid YAML frontmatter with `name` and `description`.

### Step 5: Validate & Report
1. Verify that the written file exists and has valid markdown formatting.
2. Provide a clear summary to the user:
   - What specific rules were extracted.
   - Which file was created/updated.
   - How the agent will apply these rules in future prompts.

---

## Best Practices
- **Deduplication:** Check if a similar rule already exists in `GEMINI.md` or `.agents/rules/` before writing to avoid redundant entries.
- **Documentation Integrity:** Preserve all existing rules and comments unless explicitly told to replace or refactor them.
- **Immediate Applicability:** As soon as the rule is written, adopt the new behavior immediately in the current turn.
