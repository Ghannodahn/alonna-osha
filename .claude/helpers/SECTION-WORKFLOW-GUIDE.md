# Section Workflow Command Guide

This guide explains how to load and execute section-* skills with the appropriate context.

## Quick Reference

### Auto-Detect Workflow (Recommended)

```bash
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/
```

This will:
1. Analyze the section's current state
2. Recommend the appropriate workflow
3. Preload required skills
4. Show the command to run

### Manual Workflow Selection

**Create new section from scratch:**
```bash
./.claude/helpers/section-workflow.sh create 2 education
```

**Revise existing section:**
```bash
./.claude/helpers/section-workflow.sh revise docs/writing/2-education/
```

**Publish final draft:**
```bash
./.claude/helpers/section-workflow.sh publish docs/writing/2-education/drafts/education.draft7.md
```

**Check section status:**
```bash
./.claude/helpers/section-workflow.sh status docs/writing/2-education/
```

## Claude Code Usage

When working in Claude Code, you can use these commands directly:

### 1. Check what workflow to use

```
Run: ./.claude/helpers/section-workflow.sh auto docs/writing/2-education/
```

Claude will analyze the section and tell you which skill to invoke.

### 2. Execute the recommended skill

Based on the auto-detect output, run one of:

```
/section-create 2 education
/section-revise docs/writing/2-education/
/section-publish docs/writing/2-education/drafts/education.draft7.md
```

## Workflow Decision Tree

```
Do you have a section directory?
├─ No → Use: /section-create <num> <topic>
└─ Yes
   └─ Do you have drafts?
      ├─ No → Use: /section-create <num> <topic>
      └─ Yes
         └─ Do you have visuals?
            ├─ No → Continue: /section-create <num> <topic>
            └─ Yes
               └─ What do you need?
                  ├─ Update narrative + regenerate → /section-revise <path>
                  └─ Final polish + RC → /section-publish <draft-path>
```

## Skill Prerequisites

All section-* skills require these to be preloaded:

```
/textbook-bestpractices       # Academic writing standards
/infographics-bestpractices   # Visual design standards
/narrative-refine-validate    # Claim validation
/validate                     # Fact-checking
```

The helper script reminds you to load these, but you must actually invoke them in Claude Code.

## Example Session

```bash
# 1. Check status of Section 2
./.claude/helpers/section-workflow.sh status docs/writing/2-education/

# Output:
# Drafts: 7
#   Latest: education.draft7.md
# Release Candidates: 2
#   Latest: education.rc2.docx
# Visuals: 4 folders
#   - timeline: 6 variants
#   - barriers: 3 variants
#   - success-patterns: 6 variants
#   - traditional-vs-ai: 3 variants
# Fact-check reports: 3
# 💡 Recommendation: /section-revise for updates or /section-publish for final RC

# 2. Auto-detect workflow
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/

# Output:
# 🎨 Drafts and visuals exist - Ready for revision or publishing
# Latest draft: education.draft7.md
#
# Choose workflow:
#   1. Revision (update narrative + regenerate visuals):
#      /section-revise docs/writing/2-education/
#
#   2. Publishing (final polish + RC generation):
#      /section-publish docs/writing/2-education/drafts/education.draft7.md
#
# 📚 Preloading required skills...
# /textbook-bestpractices
# /infographics-bestpractices
# /narrative-refine-validate
# /validate

# 3. In Claude Code, first load skills:
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate

# 4. Then run the chosen workflow:
/section-revise docs/writing/2-education/
```

## Command Details

### `auto <section-path>`

**Purpose:** Analyze section and recommend workflow

**Output:**
- Section status summary
- Recommended workflow
- Exact command to run
- Skills to preload

**Example:**
```bash
./.claude/helpers/section-workflow.sh auto docs/writing/5-analytics/
```

### `create <section-num> <topic-name>`

**Purpose:** Set up for creating new section from scratch

**Output:**
- Preload skill reminders
- `/section-create` command to run
- Workflow overview

**Example:**
```bash
./.claude/helpers/section-workflow.sh create 3 revenue
```

### `revise <section-path>`

**Purpose:** Set up for revising existing section

**Output:**
- Latest draft identification
- Preload skill reminders
- `/section-revise` command to run
- Workflow overview

**Example:**
```bash
./.claude/helpers/section-workflow.sh revise docs/writing/2-education/
```

### `publish <draft-path>`

**Purpose:** Set up for publishing final draft

**Output:**
- Draft confirmation
- Preload skill reminders
- `/section-publish` command to run
- Workflow overview

**Example:**
```bash
./.claude/helpers/section-workflow.sh publish docs/writing/2-education/drafts/education.draft7.md
```

### `status <section-path>`

**Purpose:** Show detailed section status

**Output:**
- Draft count and latest
- RC count and latest
- Visual count and variants
- Fact-check report count
- Workflow recommendation

**Example:**
```bash
./.claude/helpers/section-workflow.sh status docs/writing/2-education/
```

## Shell Alias (Optional)

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
alias section-workflow='~/Documents/CodeProjects/eventai/.claude/helpers/section-workflow.sh'
```

Then use as:
```bash
section-workflow auto docs/writing/2-education/
section-workflow status docs/writing/2-education/
```

## Integration with Beads

The helper script shows you which commands to run, but doesn't create Beads tasks itself. Each skill (/section-create, /section-revise, /section-publish) creates its own Beads WBS for tracking.

After running a skill, check beads:
```bash
bd list --status=open          # See open tasks
bd ready                       # See tasks ready to work
bd stats                       # Project statistics
```

## Troubleshooting

**"Section not found"**
- Ensure the path is correct
- Check if directory exists: `ls docs/writing/`

**"No drafts found"**
- Use `/section-create` to start fresh
- Or manually create draft and then use `/section-revise`

**Skills not loading**
- Skills must be invoked manually in Claude Code
- The script only shows you which ones to load
- Copy/paste the skill names into Claude Code

## Best Practices

1. **Always run `status` or `auto` first** to understand section state
2. **Preload all required skills** before running section-* workflows
3. **Use `/section-create` only for new sections** - don't restart existing work
4. **Use `/section-revise` for updates** when you have existing drafts + visuals
5. **Use `/section-publish` for final polish** when draft is mostly ready
6. **Check Beads** after each workflow to track progress

## Related Documentation

- [section-create.md](../.claude/skills/section-create.md) - Full workflow from scratch
- [section-revise.md](../.claude/skills/section-revise.md) - Revision workflow
- [section-publish.md](../.claude/skills/section-publish.md) - Publishing workflow
- [Beads workflow context](./.beads/) - Task tracking system

---

**Created:** December 31, 2025
**Maintained by:** EventAI Content Quality System