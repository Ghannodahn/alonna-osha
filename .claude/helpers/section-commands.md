# Section Workflow Quick Commands

Use these commands in Claude Code to execute section workflows.

## Step 1: Check Section Status

```bash
./.claude/helpers/section-workflow.sh auto docs/writing/<section-dir>/
```

**Example:**
```bash
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/
```

This tells you which workflow to use.

---

## Step 2: Preload Required Skills

**CRITICAL:** Load these skills FIRST before any section work:

```
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate
```

Copy all four lines and send them in a single message to Claude Code.

---

## Step 3: Execute Appropriate Workflow

Based on Step 1 recommendation:

### For New Sections (no drafts)

```
/section-create <section-number> <topic-name>
```

**Example:**
```
/section-create 2 education
```

### For Revisions (existing drafts + visuals)

```
/section-revise docs/writing/<section-dir>/
```

**Example:**
```
/section-revise docs/writing/2-education/
```

### For Publishing (final polish)

```
/section-publish docs/writing/<section-dir>/drafts/<draft-file>.md
```

**Example:**
```
/section-publish docs/writing/2-education/drafts/education.draft7.md
```

---

## Complete Example Session

**1. Check what to do:**
```bash
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/
```

**2. Preload skills (copy all at once):**
```
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate
```

**3. Run recommended workflow:**
```
/section-revise docs/writing/2-education/
```

Done!

---

## Common Scenarios

### "I have research files, need to create Section 2"

```bash
# Check
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/

# Preload
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate

# Execute
/section-create 2 education
```

### "I have draft7, need to update data and regenerate visuals"

```bash
# Check
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/

# Preload
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate

# Execute
/section-revise docs/writing/2-education/
```

### "I have final draft, just need RC"

```bash
# Check
./.claude/helpers/section-workflow.sh auto docs/writing/2-education/

# Preload
/textbook-bestpractices
/infographics-bestpractices
/narrative-refine-validate
/validate

# Execute
/section-publish docs/writing/2-education/drafts/education.draft7.md
```

---

## Tips

- ✅ **Always use `auto`** to check status first
- ✅ **Always preload skills** before workflows
- ✅ **Use exact paths** from `auto` command output
- ❌ Don't skip the preload step
- ❌ Don't mix workflows (pick one based on context)

---

**Quick Reference Card:**

```
1. ./.claude/helpers/section-workflow.sh auto <path>
2. /textbook-bestpractices + /infographics-bestpractices + /narrative-refine-validate + /validate
3. /section-create OR /section-revise OR /section-publish
```
