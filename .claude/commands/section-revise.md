# Section Revision Workflow (Existing Content)

## Purpose

Revise existing section content: archive old visuals, update narrative, regenerate infographics using existing .content.md files, create release candidate. Uses Beads for WBS tracking. **Data accuracy is the absolute priority.**

## When to Use This Skill

Use this skill when you have EXISTING section content that needs revision:
- Existing draft(s) need updating
- Old visuals need regeneration
- Data corrections required
- Narrative needs refinement

**✅ DO use for:**
- Revising sections with existing drafts + visuals
- Updating content after data corrections
- Regenerating infographics with improved prompts
- Creating new RC from revised content

**❌ DO NOT use for:**
- Creating new sections from scratch (use `/section-create`)
- Final polish only (use `/section-publish`)
- Quick edits without visual work

## Related Skills
/section-create, /section-publish, /textbook-bestpractices, /infographics-bestpractices, /validate

## How This Differs from Other Skills

| Skill | Starting Point | Use Case |
|-------|---------------|----------|
| `/section-create` | Research + Q&A (from scratch) | New section authoring |
| `/section-revise` | Existing drafts + visuals | Revision + regeneration |
| `/section-publish` | Final draft (polish only) | RC generation |

**Key difference:** `/section-revise` reuses existing .content.md files and considers latest draft, but archives old visuals and regenerates.

## Required Skills Preload

**🔴 CRITICAL: Load these skills FIRST:**

```markdown
/textbook-bestpractices       # Academic writing
/infographics-bestpractices   # Visual design
/narrative-refine-validate    # Claim validation
/validate                     # Fact-checking
```

## Workflow Overview

```
┌──────────────────────────────────────────────────┐
│ INPUT: Existing section with drafts + visuals    │
│ (e.g., docs/writing/2-education/...)            │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 0: Beads WBS Creation                       │
│ - Create epic for revision                       │
│ - Track archive, validate, regenerate, RC        │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 1: Archive Existing Visuals                 │
│ - Move visual folders → archive/                 │
│ - Preserve .content.md and .prompt.md files      │
│ - Copy preserved files back to new folders       │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 2: Review Latest Draft                      │
│ - Identify highest draft number                  │
│ - Review against success criteria                │
│ - Determine revision needs                       │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 3: Validate & Refine (if needed)            │
│ - Run /validate on latest draft                  │
│ - Create fact-check report                       │
│ - Apply corrections → draftN+1                   │
│ - Iterate until 90%+ accuracy                    │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 4: Update Visual Content Files              │
│ - Review existing .content.md files              │
│ - Apply data corrections from validation         │
│ - Update .prompt.md with improvements            │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 5: Regenerate Visuals                       │
│ - Generate new variants via gemini-generate      │
│ - Evaluate all variants                          │
│ - Select winners (90%+ target)                   │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 6: Update Draft References                  │
│ - Update image references to new variants        │
│ - Verify captions match new visuals              │
│ - Create draftN+2 (final)                        │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 7: Generate Release Candidate               │
│ - Create formatted markdown (7" images)          │
│ - Generate DOCX via Pandoc                       │
│ - Apply justified text alignment                 │
│ → Output: {topic}.rcN.docx                       │
└──────────────────────────────────────────────────┘
```

## Command Invocation

```bash
/section-revise docs/writing/{topic}/
```

**Examples:**
```bash
/section-revise docs/writing/2-education/
/section-revise docs/writing/5-analytics/
```

## Detailed Steps

### Step 0: Beads WBS Creation

**Create epic for revision:**

```bash
bd create --title="Section {N}: {Topic} - Revision + regeneration" \
  --type=epic \
  --priority=2 \
  --description="Revise existing section: archive old visuals, validate draft, regenerate infographics, create RC.

Starting state:
- Existing draft{N}.md (review + validate)
- Existing visuals (archive + regenerate)
- Existing .content.md/.prompt.md (reuse + update)

Success criteria:
- 90%+ data accuracy
- Regenerated visuals (90%+ scores)
- Release candidate ready

Core principle: Data accuracy MOST IMPORTANT"
```

**Create tasks:**

```bash
# Archive & Setup (P2)
bd create --title="Archive old visuals to archive/ folder" --type=task --priority=2
bd create --title="Copy .content.md and .prompt.md back" --type=task --priority=2
bd create --title="Review latest draft, identify revision needs" --type=task --priority=2

# Validation (P1)
bd create --title="Run /validate on latest draft" --type=task --priority=1
bd create --title="Apply corrections → draftN+1" --type=task --priority=1

# Visual Update (P2)
bd create --title="Update .content.md with corrected data" --type=task --priority=2
bd create --title="Update .prompt.md with improvements" --type=task --priority=2

# Regeneration (P2)
bd create --title="Generate new variants via gemini-generate" --type=task --priority=2
bd create --title="Evaluate all variants" --type=task --priority=2
bd create --title="Select winners (90%+ scores)" --type=task --priority=2

# Integration (P2)
bd create --title="Update draft image references to new variants" --type=task --priority=2
bd create --title="Final review → draftN+2" --type=task --priority=2

# Publication (P2)
bd create --title="Generate rcN.docx" --type=task --priority=2
```

### Step 1: Archive Existing Visuals

**🔴 CRITICAL: Preserve .content.md and .prompt.md files**

```bash
#!/bin/bash

TOPIC_DIR="docs/writing/{topic}"
VISUAL_DIR="${TOPIC_DIR}/visuals"
ARCHIVE_DIR="${VISUAL_DIR}/archive"

# Create archive directory
mkdir -p "${ARCHIVE_DIR}"

# For each visual folder (except archive)
for visual_folder in "${VISUAL_DIR}"/*/; do
  folder_name=$(basename "$visual_folder")

  # Skip archive folder
  if [ "$folder_name" = "archive" ]; then
    continue
  fi

  echo "Processing: $folder_name"

  # Copy .content.md and .prompt.md to temp location
  if [ -f "${visual_folder}/${folder_name}.content.md" ]; then
    cp "${visual_folder}/${folder_name}.content.md" "/tmp/${folder_name}.content.md"
  fi

  if [ -f "${visual_folder}/${folder_name}.prompt.md" ]; then
    cp "${visual_folder}/${folder_name}.prompt.md" "/tmp/${folder_name}.prompt.md"
  fi

  # Move entire folder to archive
  mv "$visual_folder" "${ARCHIVE_DIR}/"

  # Recreate folder
  mkdir -p "$visual_folder"

  # Copy back preserved files
  if [ -f "/tmp/${folder_name}.content.md" ]; then
    mv "/tmp/${folder_name}.content.md" "${visual_folder}/${folder_name}.content.md"
  fi

  if [ -f "/tmp/${folder_name}.prompt.md" ]; then
    mv "/tmp/${folder_name}.prompt.md" "${visual_folder}/${folder_name}.prompt.md"
  fi

  echo "✓ Archived $folder_name, preserved content/prompt files"
done

echo "✓ All visuals archived to archive/ folder"
echo "✓ .content.md and .prompt.md files preserved in new folders"
```

**Result:**
```
docs/writing/{topic}/visuals/
├── archive/
│   ├── timeline/           # Old folder with all files
│   ├── barriers/
│   └── success-patterns/
├── timeline/               # New empty folder
│   ├── timeline.content.md # Preserved
│   └── timeline.prompt.md  # Preserved
├── barriers/
│   ├── barriers.content.md
│   └── barriers.prompt.md
└── success-patterns/
    ├── success-patterns.content.md
    └── success-patterns.prompt.md
```

**Update Beads:**
```bash
bd close {archive-task-id} --reason="Archived old visuals, preserved content/prompt files"
```

### Step 2: Review Latest Draft

**Identify highest draft number:**

```bash
cd docs/writing/{topic}/drafts
ls -1 {topic}.draft*.md | sort -V | tail -1
# Example output: analytics.draft7.md
```

**Review against success criteria:**

```markdown
## Latest Draft Review: {topic}.draft7.md

**Strengths:**
- ✓ Clear narrative voice
- ✓ Bold headers for scanability
- ✓ Most statistics sourced

**Issues to address:**
- ⚠️ 3 unsourced claims (need validation)
- ⚠️ Potential data error in Section 2 (McKinsey stat)
- ⚠️ Visual references point to old variants (need updating)

**Revision strategy:**
1. Run /validate to identify data errors
2. Apply corrections → draft8
3. Update .content.md with corrected data
4. Regenerate visuals
5. Update references → draft9
6. Generate RC
```

**Update Beads:**
```bash
bd close {review-draft-task-id} --reason="Reviewed draft7, identified 3 issues requiring validation"
```

### Step 3: Validate & Refine

**Same as `/section-create` Step 4:**

1. Run `/validate` on latest draft
2. Review fact-check report
3. Apply corrections → draftN+1
4. Re-validate until 90%+ accuracy

**Key difference:** Starting from existing draft, not creating from scratch

**Update Beads:**
```bash
bd close {validate-task-id} --reason="Validated draft7, found 3 errors"
bd close {apply-corrections-task-id} --reason="Applied corrections → draft8, 94% accuracy"
```

### Step 4: Update Visual Content Files

**For each visual:**

1. **Update .content.md with corrected data**
2. **Validate/regenerate .prompt.md using /ig-generate-prompt**
3. **Run CLI validation to verify tier compliance**

**4.1: Update Content Files**

```bash
# Example: timeline.content.md
# Apply data corrections from validation report
```

**Before (incorrect):**
```markdown
## Key Statistics

**Adoption Rates:**
- 2025 Baseline: 47% major, 45% small  # ❌ INCORRECT
```

**After (corrected):**
```markdown
## Key Statistics

**Adoption Rates:**
- 2025 Baseline: 50-55% major, ~5% small  # ✓ CORRECTED
```

**4.2: Validate or Regenerate Prompts with Text Pattern Enforcement**

**🔴 CRITICAL: Check existing prompt for text pattern violations:**

```bash
# Validate existing prompt
gemini-generate --validate-prompt {visual-name}.prompt.md --density concise

# Example output:
# ❌ INVALID: CONCISE TIER
# ⚠️  Text Pattern Issues:
#   ❌ Drilldown pattern: 'Mandatory facial recognition - no alternatives' (should be label only)
#   ❌ Too many words: 'Bundled consent - accept all or entry denied' (8 words, max 5)
```

**If text pattern violations found, regenerate prompt:**

```bash
# Option A: Use /ig-generate-prompt to create tier-appropriate prompt
/ig-generate-prompt consent-spectrum concise --output={visual-name}.prompt.md

# Option B: Manual fix following tier guidelines:
# - Concise: 3-5 words MAX per bullet, NO drilldown pattern (topic - detail)
# - Standard: 10-15 words MAX, one level of detail allowed
# - Detailed: Multi-level explanations expected
```

**Example fix (Concise tier):**

**Before (WRONG - drilldown pattern):**
```markdown
## Data Points

**Coercive (Left, Red):**
- Mandatory facial recognition - no alternatives
- Bundled consent - accept all or entry denied
- Pre-checked boxes - silence assumed as consent
- Hidden in terms - paragraph 43 of 50-page doc
```

**After (CORRECT - labels only, 3-5 words):**
```markdown
## Data Points

**Coercive (Left, Red):**
- Mandatory facial recognition
- Bundled consent
- Pre-checked boxes
- Hidden in terms
```

**Why this matters:** The `[topic - detail]` pattern signals NotebookLM to add explanatory text on the infographic, which:
- Creates visual clutter (drilldown text)
- Reduces white space (AI adds paragraphs)
- Inflates tier (Concise → Standard)

**Concise tier philosophy:** Trust the AI. "Mandatory facial recognition" is enough - the AI understands the context. Don't hand-hold with explanations.

**4.3: CLI Validation (Required)**

```bash
# Validate updated prompt
gemini-generate --validate-prompt {visual-name}.prompt.md --density concise

# Expected output:
# ✅ VALID: CONCISE TIER
# Concepts: 12 (expected: 5-16)
# Depth: 1 levels (expected: 1-2)
# Complexity: 12
# No text pattern issues
```

**Update Beads:**
```bash
bd close {update-content-task-id} --reason="Updated .content.md with corrected data"
bd close {validate-prompt-task-id} --reason="Validated .prompt.md - fixed text patterns"
bd close {update-prompt-task-id} --reason="Updated .prompt.md - Concise tier compliant"
```

### Step 5: Regenerate Visuals

**Same as `/section-create` Step 6:**

```bash
cd docs/writing/{topic}/visuals/{visual-name}

gemini-generate \
  --content {visual-name}.content.md \
  --prompt {visual-name}.prompt.md \
  --output-dir . \
  --name {visual-name} \
  --variants 3
```

**Note:** Since old visuals are archived, new generation starts at variant 1 (not batch 2)

**Evaluate:**
```bash
/ig-evaluate docs/writing/{topic}/visuals/*/*.webp
```

**Select winners (90%+ target)**

**Update Beads:**
```bash
bd close {regenerate-task-id} --reason="Regenerated all visuals with corrected data"
bd close {evaluate-task-id} --reason="Evaluated variants, scores 89-93%"
bd close {select-winners-task-id} --reason="Selected 4 winners, all 90%+"
```

### Step 6: Update Draft References

**Update image references in draft:**

**Before (old references):**
```markdown
![Timeline](../visuals/timeline/timeline-3.png)
```

**After (new references):**
```markdown
![Timeline](../visuals/timeline/timeline-2.png)
```

**Verify captions match new visuals:**
```markdown
*Figure 2: AI Adoption Timeline (2025-2035) - Dual-line progression showing major festivals reaching 95%+ adoption by 2035 while small festivals lag at 70-75%. Three phases: Foundation Building (2025-2028), Mainstream Integration (2028-2032), and Adaptive Ecosystems (2032-2035). Reality check: 80% of organizations report no significant ROI despite massive investment increases.*
```

**Create final draft:**
```bash
cp {topic}.draft8.md {topic}.draft9.md
# Update all image references in draft9
```

**Update Beads:**
```bash
bd close {update-references-task-id} --reason="Updated all image references to new variants"
bd close {final-review-task-id} --reason="Final review complete → draft9"
```

### Step 7: Generate Release Candidate

**Same as `/section-publish` Step 4:**

1. Create formatted markdown (7" images)
2. Generate DOCX via Pandoc
3. Apply justified text alignment

**Determine RC number:**
```bash
cd docs/writing/{topic}/drafts
ls -1 {topic}.rc*.docx | sort -V | tail -1
# If rc2.docx exists, next is rc3.docx
```

**Output:** `{topic}.rc3.docx` (or next available number)

**Update Beads:**
```bash
bd close {generate-rc-task-id} --reason="Created rc3.docx with regenerated visuals"
bd close {section-revision-epic-id} --reason="Section revision complete: draft9 + rc3 + 4 regenerated infographics"
```

## Quality Standards

### Data Accuracy (MOST CRITICAL)
- [ ] 90%+ claims verified via /validate
- [ ] All data corrections applied to .content.md files
- [ ] Regenerated visuals contain correct data
- [ ] Fact-check report documents changes

### Visual Regeneration
- [ ] Old visuals archived to archive/ folder
- [ ] .content.md and .prompt.md files preserved
- [ ] New variants generated with corrected data
- [ ] 90%+ evaluation scores achieved
- [ ] Draft references updated to new variants

### Beads Tracking
- [ ] Epic created for revision
- [ ] All tasks tracked with dependencies
- [ ] Progress clear without conversation context
- [ ] Completion notes document outcomes

### Publication Readiness
- [ ] Final draft validated (90%+ accuracy)
- [ ] Release candidate DOCX generated
- [ ] Correct RC number (no overwriting)
- [ ] Visuals embedded and formatted

## Example Session

```bash
# User invokes revision
/section-revise docs/writing/2-education/

# PRELOAD SKILLS
→ Loading required skills...
✓ All skills loaded

# Step 0: Beads WBS
→ Created epic: eventai-2-education-revision
→ Created 13 tasks with dependencies
✓ WBS ready

# Step 1: Archive visuals
→ Found 4 existing visual folders
→ Archived to archive/ folder
→ Preserved 4 .content.md files
→ Preserved 4 .prompt.md files
✓ Clean slate for regeneration

# Step 2: Review latest draft
→ Identified: education.draft7.md (latest)
→ Review: Good narrative, 3 issues found
✓ Ready for validation

# Step 3: Validation
→ Running /validate on draft7...
→ Found 3 critical errors
→ Applied corrections → draft8
→ Re-validated: 94% accuracy ✓

# Step 4: Update visual files
→ Updated timeline.content.md (corrected baseline)
→ Updated barriers.content.md (corrected ROI figures)
→ Updated all .prompt.md files (title-first format)
✓ Visual content ready for regeneration

# Step 5: Regenerate visuals
→ Generated 3 variants each (12 total)
→ Converted to WebP
→ Evaluated all variants
→ Scores: 90%, 91%, 92%, 93%
→ Selected 4 winners ✓

# Step 6: Update references
→ Updated draft8 image references to new variants
→ Verified all captions accurate
→ Created draft9 (final) ✓

# Step 7: RC generation
→ Created education.rc3.docx (21MB)
→ Applied justified text
✓ RC3 ready

# Beads closure
→ Closed all 13 tasks
→ Closed epic: eventai-2-education-revision
✓ Revision complete

# Summary
→ education.draft9.md: Validated narrative (94% accuracy)
→ education.rc3.docx: Publication-ready
→ 4 infographics: Regenerated with corrected data (90%+ scores)
→ Old visuals: Archived to archive/ folder
```

## Anti-Patterns

❌ **Don't delete old visuals:**
```
Bad: rm -rf visuals/* (lose all old work)
Good: mv visuals/* visuals/archive/ (preserve history)
```

❌ **Don't lose .content.md files:**
```
Bad: Archive entire folder including content/prompt files
Good: Preserve content/prompt, archive only generated images
```

❌ **Don't overwrite RCs:**
```
Bad: Always generate rc1.docx (overwrites previous)
Good: Check highest RC number, increment (rc3.docx)
```

❌ **Don't skip validation before regeneration:**
```
Bad: Regenerate visuals with old (incorrect) data
Good: Validate → Correct → Update .content.md → Regenerate
```

## Integration with Other Skills

### Compared to Other Skills

**Use `/section-create` when:**
- Starting completely from scratch
- No existing drafts or visuals
- Need full research synthesis

**Use `/section-revise` when:**
- Existing drafts need updating
- Visuals need regeneration
- Data corrections required
- Reuse existing .content.md files

**Use `/section-publish` when:**
- Final draft already validated
- No visual regeneration needed
- Just polish + RC generation

### Workflow Selection Guide

```
Do you have existing content?
├─ No → /section-create
└─ Yes
   └─ Do visuals need regeneration?
      ├─ Yes → /section-revise
      └─ No → /section-publish
```

---

**Skill Created:** December 31, 2025
**Version:** 1.0
**Maintained By:** EventAI Content Quality System
