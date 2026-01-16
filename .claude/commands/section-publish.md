# Section Publishing Workflow (End-to-End)

## Purpose

Complete end-to-end publishing workflow for EventAI curriculum sections: narrative refinement, claim validation, visual regeneration, and release candidate DOCX generation with proper formatting (7" images, justified text).

## When to Use This Skill

Use this skill when you have a draft section ready for publication and need to:
- Refine narrative style and validate all claims
- Regenerate or create missing visuals
- Generate publication-ready DOCX release candidate

**✅ DO use for:**
- Completing a curriculum section (Questions 1-10)
- Publishing revised sections with corrected data
- Creating release candidates for review/distribution

**❌ DO NOT use for:**
- Quick edits or single corrections
- Work-in-progress drafts (use individual skills instead)
- Sections without visual content requirements

## Related Skills
/narrative-refine-validate, /narrative-add-media, /ig-generate, /ig-evaluate, /infographics-bestpractices

## Workflow Overview

```
┌─────────────────────────────────────────────────┐
│ INPUT: Section draft markdown                   │
│ (e.g., analytics.draft6.md)                     │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│ STEP 1: Narrative Refinement + Validation       │
│ - Apply concise narrative style                 │
│ - Verify all quantitative claims                │
│ - Add source attribution                        │
│ → Output: {name}.draftN+1.md                    │
│ → Output: {name}.draftN-FACT-CHECK-REPORT.md    │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│ STEP 2: Visual Content Review                   │
│ - Identify visual references in draft           │
│ - Check if visuals need regeneration            │
│ - Check if new visuals are needed               │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│ STEP 3: Visual Regeneration (if needed)         │
│ - Update .content.md with corrected data        │
│ - Update .prompt.md with improvements           │
│ - Run gemini-generate for new variants          │
│ - Evaluate variants with /ig-evaluate           │
│ - Update draft with winning variant             │
│ → Output: {visual-name}-{N}.png, .webp          │
│ → Output: {name}.draftN+2.md (updated refs)     │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│ STEP 4: Release Candidate Generation            │
│ - Create formatted markdown (7" image specs)    │
│ - Generate DOCX with Pandoc                     │
│ - Apply justified text alignment                │
│ → Output: {name}.rcN.docx                       │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│ OUTPUT: Publication-ready release candidate     │
│ - {name}.draftN+2.md (final narrative)          │
│ - {name}.rcN.docx (formatted DOCX)              │
│ - All visuals regenerated and evaluated         │
│ - All claims validated and sourced              │
└─────────────────────────────────────────────────┘
```

## Command Invocation

```bash
/section-publish docs/writing/{topic}/drafts/{name}.draftN.md
```

**Examples:**
```bash
/section-publish docs/writing/5-analytics/drafts/analytics.draft6.md
/section-publish docs/writing/2-education/drafts/education.draft3.md
```

## Detailed Steps

### Step 1: Narrative Refinement + Validation

**Invoke:** `/narrative-refine-validate`

**Actions:**
1. Load draft markdown
2. Apply concise narrative style:
   - Convert bullets → flowing prose
   - Shorten verbose explanations
   - Add bold headers for scanability
   - Target 30-40% word reduction
3. Extract and verify all claims:
   - Search project research files
   - Search visual .content.md files
   - Web search for unverified claims
4. 🚨 Add source attribution at DOCUMENT END ONLY (not sectional placement)
5. Create fact-check report

**Outputs:**
- `{name}.draftN+1.md` - Refined narrative with sources
- `{name}.draftN-FACT-CHECK-REPORT.md` - Verification details

**Quality Standards:**
- [ ] 90%+ claims verified
- [ ] All critical corrections applied
- [ ] 🚨 Sources at DOCUMENT END ONLY (not sectional placement)
- [ ] 30-40% word reduction achieved
- [ ] NO metadata summary section after sources

### Step 2: Visual Content Review

**Actions:**
1. **Scan draft for image references:**
   ```markdown
   ![Alt text](../visuals/{folder}/{name}-{N}.png)
   ```

2. **For each visual, check:**
   - Does .content.md exist?
   - Does .prompt.md exist?
   - Does the referenced variant exist?
   - Were data corrections made that affect this visual?

3. **Determine regeneration needs:**
   - ✅ **Regenerate:** Data corrections, prompt improvements identified
   - ✅ **Generate new:** Visual referenced but doesn't exist
   - ⏭️ **Skip:** Visual exists and data is correct

**Decision Matrix:**

| Condition | Action |
|-----------|--------|
| Visual referenced, files exist, data correct | Skip regeneration |
| Visual referenced, files exist, data corrected | Regenerate (Step 3) |
| Visual referenced, no .content.md/.prompt.md | Error - create content first |
| New visual needed (narrative gap) | Create content + generate |

### Step 3: Visual Regeneration (if needed)

**For each visual requiring regeneration:**

#### 3a. Update Content Files

**Update .content.md:**
- Apply data corrections from validation report
- Ensure statistics match verified sources
- Update source citations

**Update .prompt.md:**
- Apply learnings from previous evaluations
- Ensure EventAI brand compliance
- Use infographic title as first line (Gemini indexing)
- Specify CONCISE/STANDARD/DETAILED tier

#### 3b. Load Best Practices

```bash
/infographics-bestpractices
```

**Ensures prompts include:**
- Tufte principles (data-ink ratio, graphical integrity)
- EventAI color palette (exact hex codes)
- Festival context (illustrated crowds, stages, wristbands)
- Minimal cruft principle
- Accessibility standards (4.5:1 contrast, non-color-dependent)

#### 3c. Generate Variants

```bash
cd docs/writing/{topic}/visuals/{visual-name}
gemini-generate \
  --content {visual-name}.content.md \
  --prompt {visual-name}.prompt.md \
  --output-dir . \
  --name {visual-name} \
  --variants 3
```

**Generates:**
- `{visual-name}-4.png`, `{visual-name}-5.png`, `{visual-name}-6.png` (if batch 2)
- Auto-converts to WebP (1080p)

#### 3d. Evaluate Variants

```bash
/ig-evaluate docs/writing/{topic}/visuals/{visual-name}/*.webp
```

**Evaluation criteria:**
- EventAI style compliance (color, typography, layout, festival context)
- Best practices adherence (Tufte, white space, accessibility)
- Data accuracy verification
- Comparison matrix for all variants

**Select winner:**
- Highest overall score (target: 90%+)
- If all < 80%, regenerate with improved prompt
- If 80-89%, acceptable for use
- If 90%+, excellent quality

#### 3e. Update Draft References

**Update markdown to reference winning variant:**
```markdown
![Alt text](../visuals/{folder}/{name}-{winning-variant}.png)
```

**Create new draft version:**
- `{name}.draftN+2.md` with updated image references

### Step 4: Release Candidate Generation

#### 4a. Create Formatted Markdown

**Create `{name}.draftN+2-formatted.md`:**

1. **🚨 CRITICAL: Update image references to PNG (NOT webp):**
   ```markdown
   ![Alt text](../visuals/{folder}/{name}.png){width=7in}
   ```
   **Why PNG:** DOCX requires PNG format for high-quality embedding (WebP for web/evaluation only)

2. **Clean source lists:**
   - Remove detailed notes/comments
   - Keep just titles and links
   ```markdown
   **Sources:**
   - [Source Title](URL)
   - [Source Title](URL)
   ```

3. **Preserve all narrative content**

#### 4b. Generate DOCX with Pandoc

```bash
cd docs/writing/{topic}/drafts
pandoc {name}.draftN+2-formatted.md \
  -o {name}.rcN.docx \
  --resource-path=../visuals
```

**Image embedding:**
- 🚨 **PNG format required** (NOT webp - DOCX does not support webp)
- 7" wide (via `{width=7in}` markdown syntax)
- All PNG images embedded automatically
- Checks that DOCX size matches expected (should be ~18-20MB with 4 PNG images)

#### 4c. Apply Justified Text Alignment

**🚨 CRITICAL: Use justify_docx.py utility script (DO NOT DELETE):**

The justify_docx.py script should be kept in the drafts directory for reuse across all sections. If it doesn't exist, create it:

```python
#!/usr/bin/env python3
"""Apply justified text alignment to DOCX file."""

from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH
import sys

def justify_document(filepath):
    """Apply justified alignment to body paragraphs, keep headings left-aligned."""
    doc = Document(filepath)

    modified_count = 0
    for paragraph in doc.paragraphs:
        # Skip headings (keep left-aligned)
        if paragraph.style.name.startswith('Heading'):
            continue

        # Skip blockquotes and other special styles
        if paragraph.style.name in ['Quote', 'Block Text', 'Caption']:
            continue

        # Apply justified alignment to body text
        paragraph.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
        modified_count += 1

    doc.save(filepath)
    print(f"✅ Justified {modified_count} paragraphs in {filepath}")

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python justify_docx.py <file.docx>")
        sys.exit(1)

    justify_document(sys.argv[1])
```

**Usage:**
```bash
cd docs/writing/{topic}/drafts
python3 justify_docx.py {name}.rc1.docx
```

**Result:**
- Body text: Justified (smooth left and right edges)
- Headings: Left-aligned (standard)
- Images: 7" wide, embedded (PNG format)
- File size: ~18-20MB (confirms PNG images embedded)

**⚠️ IMPORTANT: Keep utility scripts for reuse across sections!**
- justify_docx.py should remain in drafts directory
- Other sections will need this same script
- DO NOT delete after use

## Quality Standards

### Narrative Quality
- [ ] 30-40% word reduction from academic style
- [ ] Average sentence length 15-18 words
- [ ] Bold headers for scannable structure
- [ ] Conversational tone maintained
- [ ] Second-person address used appropriately
- [ ] NO information loss (100% facts preserved)

### Validation Quality
- [ ] 90%+ claims verified against primary sources
- [ ] All critical corrections applied
- [ ] Source links functional and relevant
- [ ] Numerical precision maintained
- [ ] Attribution accuracy confirmed

### Visual Quality
- [ ] All visuals regenerated with corrected data
- [ ] EventAI brand compliance (90%+ score)
- [ ] Data accuracy (100% verification)
- [ ] Accessibility standards met (WCAG AA)
- [ ] Festival context integrated (illustrated crowds)

### DOCX Quality
- [ ] Images 7" wide and embedded
- [ ] Body text justified (smooth edges)
- [ ] Headings left-aligned
- [ ] File size ~20MB (confirms embedding)
- [ ] Source links clickable
- [ ] All formatting preserved

## Error Handling

### Common Issues

**1. Validation finds critical data errors:**
```
→ Pause workflow
→ Document errors in fact-check report
→ Update .content.md files with corrections
→ Resume with Step 3 (regeneration)
```

**2. Visual evaluation scores < 80%:**
```
→ Review evaluation report
→ Update .prompt.md with improvements
→ Regenerate (gemini-generate with --batch N+1)
→ Re-evaluate until 80%+ achieved
```

**3. DOCX generation fails:**
```
→ Check Pandoc installation
→ 🚨 VERIFY IMAGES ARE PNG FORMAT (NOT webp)
→ Update draft to reference .png files (NOT .webp)
→ Ensure PNG files exist in visual directories
→ Retry with corrected image references
```

**4. Justified text script fails:**
```
→ Check python-docx installation: pip install python-docx
→ Verify DOCX file exists before processing
→ Manual fallback: Format in Word (Ctrl+A, Ctrl+J)
```

## Integration with Other Skills

### Prerequisites
- `/infographics-bestpractices` - Load before visual generation
- Research files in `docs/research/**/*.sources.md`
- Visual content files in `docs/writing/{topic}/visuals/*/*.content.md`

### Used by This Skill
- `/narrative-refine-validate` - Step 1 (narrative + validation)
- `/infographics-bestpractices` - Step 3b (before generation)
- `/ig-generate` - Step 3c (visual generation)
- `/ig-evaluate` - Step 3d (visual evaluation)

### After This Skill
- `/commit` - Commit all changes to git
- `bd sync` - Sync beads changes
- `git push` - Push to remote

## Example Session

```bash
# User invokes skill
/section-publish docs/writing/5-analytics/drafts/analytics.draft6.md

# Step 1: Narrative refinement + validation
→ Created analytics.draft7.md (refined narrative)
→ Created analytics.draft6-FACT-CHECK-REPORT.md (verification)
→ Found 3 critical data errors, applied corrections

# Step 2: Visual review
→ Found 4 visual references in draft
→ traditional-vs-ai: Data correct, skip regeneration ✓
→ dynamic-pricing: Needs regeneration (data corrected)
→ vendor-questions: Doesn't exist, needs creation
→ success-patterns: Data correct, skip regeneration ✓

# Step 3: Visual regeneration (dynamic-pricing)
→ Updated dynamic-pricing.content.md with corrected ROI figures
→ Updated dynamic-pricing.prompt.md with title-first format
→ Generated dynamic-pricing-4, 5, 6 via gemini-generate
→ Evaluated all 6 variants
→ dynamic-pricing-5 winner: 89/100 score
→ Updated analytics.draft8.md with dynamic-pricing-5 reference

# Step 3: Visual creation (vendor-questions)
→ Created vendor-questions.content.md from narrative
→ Created vendor-questions.prompt.md (CONCISE tier)
→ Generated vendor-questions-1, 2, 3
→ Evaluated variants
→ vendor-questions-2 winner: 91/100 score
→ Updated analytics.draft9.md with vendor-questions-2 reference

# Step 4: Release candidate generation
→ Created analytics.draft9-formatted.md (7" images, clean sources)
→ Generated analytics.rc1.docx via Pandoc (21MB, images embedded)
→ Applied justified text alignment via Python script
→ Final: analytics.rc1.docx ready for publication ✓

# Summary
→ analytics.draft9.md: Final narrative (verified + sourced)
→ analytics.rc1.docx: Publication-ready DOCX (7" images, justified text)
→ 2 visuals regenerated, 1 created, all evaluated 85%+
→ 95% claim verification rate
```

## Performance Notes

**Expected Time:**
- Narrative refinement: 30-45 minutes
- Visual review: 5-10 minutes
- Visual regeneration (per visual): 30-40 minutes
- RC generation: 5-10 minutes
- **Total (typical 4-visual section): 2-3 hours**

**Efficiency Tips:**
- Run validation BEFORE visual work (avoid regenerating with wrong data)
- Evaluate all variants in single /ig-evaluate call (parallel)
- Use --batch parameter for iterative generation (don't regenerate 1-3)
- Keep .content.md and .prompt.md files updated for future use

## Anti-Patterns

❌ **Don't regenerate visuals before validation:**
```
Bad: Regenerate visuals → Discover data errors → Regenerate again
Good: Validate claims → Correct data → Regenerate once
```

❌ **Don't skip evaluation:**
```
Bad: Generate variants → Pick one visually → Use without scoring
Good: Generate variants → Evaluate all → Select highest score
```

❌ **Don't create RC from unvalidated draft:**
```
Bad: draft6 → rc1 (skipping validation)
Good: draft6 → validate → draft7 → rc1
```

❌ **Don't forget to update draft references:**
```
Bad: Generate timeline-6 but draft still references timeline-3
Good: Generate timeline-6 → Update draft → Create rc with timeline-6
```

## File Naming Conventions

**Drafts:**
- `{topic}.draft1.md` through `{topic}.draftN.md`
- Sequential numbering, never skip numbers
- Each refinement creates new draft

**Release Candidates:**
- `{topic}.rc1.docx` through `{topic}.rcN.docx`
- Sequential numbering starting from 1
- Only create RC from validated, final draft

**Reports:**
- `{topic}.draftN-FACT-CHECK-REPORT.md` - Validation report
- `{topic}.draftN-SECTION-REVISIONS.md` - Before/after examples (optional)

**Visuals:**
- `{visual-name}-1.png` through `{visual-name}-N.png` - Generated variants
- `{visual-name}-1.webp` through `{visual-name}-N.webp` - Converted
- `{visual-name}.content.md` - Source data
- `{visual-name}.prompt.md` - Generation instructions
- `VIS-X.X-EVALUATION-REPORT.md` - Evaluation results

## Session Close Protocol

After completing workflow, execute git commit checklist:

```bash
[ ] 1. git status              # Check all changes
[ ] 2. git add <files>         # Stage draft, rc, visuals
[ ] 3. bd sync                 # Commit beads changes
[ ] 4. git commit -m "..."     # Commit all section work
[ ] 5. bd sync                 # Commit any new beads
[ ] 6. git push                # Push to remote
```

**Commit message template:**
```
feat({topic}): Complete Section {N} publication workflow

Narrative refinement + validation:
- Created draft{N+2}.md with {X}% claim verification
- Applied {Y} critical corrections
- Added source attribution (Z sources)

Visual regeneration:
- Regenerated {visual-1} with corrected data
- Created {visual-2} from narrative content
- Evaluated {N} total variants, selected winners

Release candidate:
- {topic}.rc{N}.docx: Publication-ready (7" images, justified text)
- File size: {X}MB ({Y} embedded images)

All claims verified, visuals evaluated 85%+, ready for distribution.
```

---

**Skill Created:** December 31, 2025
**Version:** 1.0
**Maintained By:** EventAI Content Quality System
