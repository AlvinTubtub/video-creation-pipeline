# How to Install and Use the `/learn` Skill

You can install this skill either in a **single repository** (project-level) or **globally** across all your repositories on this machine.

---

## Option A: Install in a Specific Repository (Project-Level)

Use this option if you want the skill committed to git and shared with your team or repository.

1. Navigate to your project repository root:
   ```bash
   cd /path/to/your/project
   ```

2. Create the skills folder:
   ```bash
   mkdir -p .agents/skills/learn
   ```

3. Extract the contents of this zip file into `.agents/skills/learn/`:
   ```bash
   unzip learn-skill.zip -d .agents/skills/
   ```

4. Verify that `.agents/skills/learn/SKILL.md` exists. That's it!
   The `/learn` command is now active for this repository.

---

## Option B: Install Globally Across All Repositories

Use this option if you want `/learn` to be available everywhere on your machine without repeating the setup per repo.

1. Create your user plugins directory:
   ```bash
   mkdir -p ~/.gemini/config/plugins/general-skills/skills/learn
   ```

2. Extract this skill into that directory:
   ```bash
   unzip learn-skill.zip -d ~/.gemini/config/plugins/general-skills/skills/
   ```

3. Restart Antigravity or open a new conversation. The `/learn` skill is now active globally across all your projects!

---

## How to Trigger the Skill

Once installed, you can invoke the learning workflow at any time:
- Type `/learn` directly in the chat input.
- Or say in natural language:
  - *"I-save mo ito sa ating persistent rules."*
  - *"Learn from this setup and save it for future tasks."*
  - *"Remember this bugfix in GEMINI.md."*
