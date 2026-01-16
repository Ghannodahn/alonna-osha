# Section Creation Workflow (From Scratch to RC)

## Purpose

Complete end-to-end section authoring workflow: research → narrative drafting → validation → visual creation → release candidate. Uses Beads for WBS tracking, ensuring easy pickup without context loss. **Data accuracy is the absolute priority.**

## When to Use This Skill

Use this skill when starting a NEW curriculum section from scratch (Questions 1-10).

**✅ DO use for:**
- Creating a new section from research and initial Q&A
- Complete section authoring workflow
- Sections requiring Beads WBS for multi-session work

**❌ DO NOT use for:**
- Revising existing drafts (use `/section-publish` instead)
- Quick edits or corrections
- Sections without visual requirements

## Related Skills 
/textbook-bestpractices, /infographics-bestpractices, /narrative-refine-validate, /validate, /section-publish

## Critical Success Factors

### 🔴 MOST IMPORTANT: Data Accuracy
- Every statistic verified against primary sources
- No hallucinated numbers or unverified claims
- All quantitative statements traceable to authoritative research
- `/validate` command MUST be run on every draft
- Fact-check reports documented in files

### Beads WBS Tracking
- Create detailed work breakdown structure at START
- Track all tasks, subtasks, and dependencies
- Enable easy pickup without context overhead
- Document progress in Beads, not just conversation

### Narrative Quality
- 🚨 **QUESTION-FOCUSED**: Every section must directly answer its stated question
- Clean, consistent voice for university students
- Supplement narrative with visuals (not replace)
- Follow textbook best practices
- 30-40% conciseness vs academic style
- **No sideramps**: All content must serve answering the core question

### Visual Excellence
- 3-5 well-spaced infographics (landscape, concise)
- Consistent design language across section
- EventAI brand compliance
- Tufte principles (minimal cruft, high data-ink ratio)

## Required Skills Preload

**🔴 CRITICAL: Load these skills FIRST before any work:**

```markdown
/textbook-bestpractices       # Academic writing for university students
/infographics-bestpractices   # Tufte principles, EventAI brand, visual design
/narrative-refine-validate    # Claim validation, source attribution
/validate                     # Comprehensive fact-checking
```

**Why preload?** These skills contain essential context that informs ALL decisions throughout the workflow. Loading them upfront avoids context thrashing and ensures consistency.

## Workflow Overview

```
┌──────────────────────────────────────────────────┐
│ INPUT: Section number + research files           │
│ (e.g., Section 2 + question + research/*.md)     │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 0: Beads WBS Creation                       │
│ - Create epic for section                        │
│ - Break down into tasks (research, draft, valid) │
│ - Track dependencies (draft → validate → visual) │
│ → Output: Beads WBS with 10-15 trackable tasks   │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 1: Archive Existing Visuals                 │
│ - Move docs/writing/{topic}/visuals/* → archive/ │
│ - Clean slate for new visual generation          │
│ → Output: Archived old visuals                   │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 2: Research & Context Review                │
│ - Read research/*.sources.md files               │
│ - Read initial question + answer                 │
│ - Identify key themes, statistics, arguments     │
│ → Output: Research synthesis notes               │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 3: Initial Draft Creation                   │
│ - Apply /textbook-bestpractices principles       │
│ - Write for university students                  │
│ - Conversational tone, bold headers, examples    │
│ - Include ALL statistics from research           │
│ → Output: {topic}.draft1.md                      │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 4: Validation & Refinement Loop             │
│ - Run /validate on draft1                        │
│ - Create fact-check report                       │
│ - Apply corrections → draft2                     │
│ - Review against success criteria                │
│ - Iterate until 90%+ accuracy                    │
│ → Output: {topic}.draftN.md (validated)          │
│ → Output: {topic}.draftN-FACT-CHECK-REPORT.md    │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 5: Visual Content Planning                  │
│ - Identify 3-5 infographic opportunities         │
│ - Create visual folders + .content.md/.prompt.md │
│ - Apply /infographics-bestpractices              │
│ - Ensure landscape, concise, consistent style    │
│ → Output: Visual folders with content/prompts    │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 6: Visual Generation & Evaluation           │
│ - Run gemini-generate for each visual (3 vars)   │
│ - Convert PNG → WebP via todd-image-convert      │
│ - Evaluate all variants via /ig-evaluate         │
│ - Select winners (90%+ score target)             │
│ → Output: Infographics (evaluated + selected)    │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 7: Final Integration                        │
│ - Insert visual references in narrative          │
│ - Add figure captions and alt text               │
│ - Add source lists at section ends               │
│ → Output: {topic}.draftN+1.md (final)            │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ STEP 8: Release Candidate Generation             │
│ - Create formatted markdown (7" images)          │
│ - Generate DOCX via Pandoc                       │
│ - Apply justified text via Python script         │
│ → Output: {topic}.rc1.docx                       │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│ OUTPUT: Complete section ready for publication   │
│ - {topic}.draftN+1.md (final validated narrative)│
│ - {topic}.rc1.docx (formatted DOCX)              │
│ - 3-5 infographics (evaluated, consistent style) │
│ - Beads WBS tracking all progress                │
└──────────────────────────────────────────────────┘
```

## Command Invocation

```bash
/section-create {topic-number} {topic-name}
```

**Examples:**
```bash
/section-create 2 education
/section-create 5 analytics
```

## Detailed Steps

### Step 0: Beads WBS Creation

**🔴 CRITICAL: Do this FIRST before any content work**

#### Create Epic

```bash
bd create --title="Section {N}: {Topic Name} - Complete authoring" \
  --type=epic \
  --priority=2 \
  --description="Complete section creation from research to RC: research review, draft creation, validation, visual generation, RC publication.

Success criteria:
- 90%+ data accuracy (fact-check report)
- 3-5 landscape infographics (90%+ evaluation scores)
- Clean narrative voice for university students
- Release candidate DOCX ready for distribution

Core principle: Data accuracy is MOST IMPORTANT."
```

#### Break Down into Tasks

**Use parallel subagents to create all tasks efficiently:**

```bash
# Research & Setup (P2)
bd create --title="Archive existing visuals to archive/ folder" --type=task --priority=2
bd create --title="Review research files + initial Q&A" --type=task --priority=2
bd create --title="Synthesize research themes and statistics" --type=task --priority=2

# Drafting (P2)
bd create --title="Create draft1 using textbook best practices" --type=task --priority=2
bd create --title="Review draft1 against success criteria" --type=task --priority=2

# Validation (P1 - CRITICAL)
bd create --title="Run /validate on draft1, create fact-check report" --type=task --priority=1
bd create --title="Apply corrections from validation → draft2" --type=task --priority=1
bd create --title="Re-validate draft2, ensure 90%+ accuracy" --type=task --priority=1

# Visual Planning (P2)
bd create --title="Identify 3-5 infographic opportunities" --type=task --priority=2
bd create --title="Create visual content.md files (data + sources)" --type=task --priority=2
bd create --title="Create visual prompt.md files (EventAI brand)" --type=task --priority=2

# Visual Generation (P2)
bd create --title="Generate infographic variants via gemini-generate" --type=task --priority=2
bd create --title="Convert PNG → WebP via todd-image-convert" --type=task --priority=2
bd create --title="Evaluate all variants via /ig-evaluate" --type=task --priority=2
bd create --title="Select winners (90%+ scores)" --type=task --priority=2

# Integration (P2)
bd create --title="Insert visual references + captions in draft" --type=task --priority=2
bd create --title="Add source attribution lists" --type=task --priority=2
bd create --title="Final draft review (voice, accuracy, flow)" --type=task --priority=2

# Publication (P2)
bd create --title="Generate rc1.docx with formatted images" --type=task --priority=2
bd create --title="Apply justified text alignment" --type=task --priority=2
bd create --title="Verify DOCX quality (size, images, formatting)" --type=task --priority=2
```

#### Add Dependencies

```bash
# Drafting depends on research
bd dep add {draft1-task-id} {research-review-task-id}

# Validation depends on drafting
bd dep add {validate-draft1-task-id} {draft1-task-id}

# Visual planning depends on validated draft
bd dep add {identify-visuals-task-id} {validate-draft2-task-id}

# Visual generation depends on content/prompt creation
bd dep add {generate-variants-task-id} {create-prompts-task-id}

# Integration depends on visual selection
bd dep add {insert-visuals-task-id} {select-winners-task-id}

# RC depends on final draft
bd dep add {generate-rc-task-id} {final-review-task-id}
```

**Why Beads WBS?**
- Enables multi-session work (pick up where you left off)
- No context overhead ("What was I doing?")
- Clear dependencies prevent out-of-order work
- Progress tracking shows completion status
- Easy handoff between sessions or team members

### Step 1: Archive Existing Visuals

**Purpose:** Clean slate for new visual generation, preserve old work

```bash
# Check if visuals directory exists
if [ -d "docs/writing/{topic}/visuals" ]; then
  # Create archive directory if it doesn't exist
  mkdir -p docs/writing/{topic}/visuals/archive

  # Move all existing visual folders to archive (except archive itself)
  for dir in docs/writing/{topic}/visuals/*/; do
    dirname=$(basename "$dir")
    if [ "$dirname" != "archive" ]; then
      mv "$dir" docs/writing/{topic}/visuals/archive/
    fi
  done

  echo "✓ Archived existing visuals to archive/ folder"
else
  echo "✓ No existing visuals to archive (new section)"
fi
```

**Update Beads:**
```bash
bd close {archive-visuals-task-id} --reason="Archived old visuals to archive/ folder"
```

### Step 2: Research & Context Review

**Actions:**

1. **Read research files:**
   ```bash
   docs/research/{topic}/*.sources.md
   docs/research/general/*.sources.md
   ```

2. **Read initial question + answer:**
   ```bash
   docs/writing/{topic}/README.md  # Or wherever initial Q&A is stored
   ```

3. **Synthesize key information:**
   - Main themes and arguments
   - Critical statistics (with sources)
   - Case studies and examples
   - Gaps requiring additional research

**Output: Research synthesis document**
```markdown
# Research Synthesis: Section {N} - {Topic}

## Key Themes
1. Theme 1
2. Theme 2
3. Theme 3

## Critical Statistics (with sources)
- Stat 1: X% [Source: McKinsey 2025]
- Stat 2: $Y million [Source: Forrester 2024]
- Stat 3: Z documented cases [Source: Event Industry News 2025]

## Case Studies
- Example 1: [Details + source]
- Example 2: [Details + source]

## Gaps Requiring Research
- [ ] Need source for claim about X
- [ ] Verify statistic about Y
- [ ] Find documented case study for Z

**Next step:** Create draft1 incorporating this research
```

**Update Beads:**
```bash
bd close {research-review-task-id} --reason="Synthesized research themes and statistics"
```

### Step 3: Initial Draft Creation

**🔴 PRELOAD REQUIRED:** `/textbook-bestpractices`

**Principles to apply:**

1. **University student audience:**
   - Conversational tone, not overly academic
   - "You're entering an industry where..."
   - Real-world examples and implications

2. **Textbook best practices:**
   - Learning objectives at top
   - Bold headers for scanability
   - Examples and case studies
   - Source attribution throughout

3. **Narrative structure:**
   ```markdown
   # Question {N}: {Title}

   > **{Original question}**

   **Context**: {Why this matters}

   ---

   # {Main Title}

   **Learning Objectives:**
   - Objective 1
   - Objective 2
   - Objective 3

   ---

   {Introduction - hook + thesis}

   ## Section 1: {Theme 1}

   {Content with statistics, examples, sources}

   **Sources:**
   - [Source 1](URL)
   - [Source 2](URL)

   ## Section 2: {Theme 2}

   {Content...}

   ---

   **Sources:** {All sources for full document}
   ```

4. **Include ALL research statistics:**
   - Every number from synthesis document
   - Proper attribution (inline or section-end)
   - No unsupported claims

**Quality checks before moving to validation:**
- [ ] Learning objectives clearly stated
- [ ] Conversational tone throughout
- [ ] All statistics included with sources
- [ ] Bold headers for major sections
- [ ] Examples and case studies integrated
- [ ] Addresses original question fully

**Output:** `docs/writing/{topic}/drafts/{topic}.draft1.md`

**Update Beads:**
```bash
bd close {draft1-task-id} --reason="Created draft1 with research synthesis"
bd update {validate-draft1-task-id} --status=in_progress
```

### Step 4: Validation & Refinement Loop

**🔴 MOST CRITICAL STEP: Data accuracy verification**

#### 4a. Run Validation

```bash
/validate docs/writing/{topic}/drafts/{topic}.draft1.md
```

**This command will:**
1. Extract ALL quantitative claims
2. Search for sources in research files
3. Cross-reference against authoritative sources
4. Create comprehensive fact-check report
5. Flag errors, discrepancies, unverified claims

**Output:** `{topic}.draft1-FACT-CHECK-REPORT.md`

#### 4b. Review Report

**Categorize findings:**

```markdown
## Validation Results Summary

**CRITICAL ERRORS (must fix):**
- [ ] Statistic X contradicts source (says Y, should be Z)
- [ ] Attribution wrong (McKinsey vs Forrester)
- [ ] Numerical error (calculation mistake)

**HIGH PRIORITY (strongly recommend):**
- [ ] Claim ABC lacks source
- [ ] Statistic DEF cannot verify (no source found)

**MEDIUM/LOW PRIORITY:**
- [ ] Optional clarifications
- [ ] Nice-to-have additional sources
```

#### 4c. Apply Corrections

**For each critical/high-priority issue:**
1. Update draft with correct data
2. Add proper source attribution
3. Remove or revise unverifiable claims

**Create draft2:**
```bash
cp {topic}.draft1.md {topic}.draft2.md
# Apply all corrections in draft2
```

**Document changes:**
```markdown
# draft1 → draft2 Corrections

1. Fixed: McKinsey stat from 42% to "majority show no impact"
2. Added source: Legion WFM ROI figure ($13.35M not $7.44M)
3. Removed: Unverifiable claim about X
4. Revised: Vague language about Y to specific Z%
```

#### 4d. Re-validate

**Run validation again:**
```bash
/validate docs/writing/{topic}/drafts/{topic}.draft2.md
```

**Target: 90%+ accuracy**

If < 90%, repeat corrections → draft3 → validate again

**Update Beads:**
```bash
bd close {validate-draft1-task-id} --reason="Created fact-check report, found X critical errors"
bd close {apply-corrections-task-id} --reason="Applied corrections → draft2, 95% accuracy achieved"
```

### Step 5: Visual Content Planning

**🔴 PRELOAD REQUIRED:** `/infographics-bestpractices`

#### 5a. Identify Infographic Opportunities

**Scan narrative for visual candidates:**

**Strong candidates:**
- Comparisons ("Traditional vs AI," "Stadium vs Festival")
- Statistics (multiple data points, percentages)
- Frameworks (decision trees, evaluation criteria)
- Timelines (historical progression, adoption curves)
- Lists (5+ critical questions, barriers, success patterns)

**Target:** 3-5 visuals per section

**Spacing:** Every 500-1000 words of narrative

**Example opportunities:**
```markdown
## Visual Opportunities (Section 2 - Education)

1. **traditional-vs-ai-education** (Comparison)
   - Location: After intro, ~500 words in
   - Type: Split comparison (Before/After 2025-2035)
   - Tier: CONCISE (40%+ white space)

2. **academic-integration-barriers** (Framework)
   - Location: Barriers section, ~1500 words in
   - Type: 5-barrier breakdown
   - Tier: CONCISE

3. **adoption-timeline** (Timeline)
   - Location: Three phases section, ~2000 words in
   - Type: Dual-line progression 2025-2035
   - Tier: STANDARD (30% white space)

4. **success-patterns** (Framework)
   - Location: What works section, ~2500 words in
   - Type: 4-pattern framework
   - Tier: CONCISE

Total: 4 infographics (well-spaced, consistent CONCISE/STANDARD tier)
```

#### 5b. Create Visual Folders + Content Files

**For each identified visual:**

```bash
mkdir -p docs/writing/{topic}/visuals/{visual-name}
```

**Create .content.md:**

```markdown
# {Visual Title}: {Subtitle}

## Source Document for ImaGen Infographic Generation
**Visual ID**: VIS-{section}.{number}
**Type**: {Comparison/Timeline/Framework}
**Topic**: {Section name}
**Density Tier**: CONCISE  # or STANDARD

---

## Core Message

{1-2 paragraph summary of visual's main point}

---

## Key Content

{Structured content organized by visual sections}

### Section 1: {Name}
{Content with statistics}

### Section 2: {Name}
{Content with statistics}

---

## Statistics for Visual

{Extracted numbers formatted for easy reading}

**Category 1:**
- Stat A: Value [Source: X]
- Stat B: Value [Source: Y]

---

**Sources:**
- [Source Name](URL)
- [Source Name](URL)
```

**Create .prompt.md:**

```markdown
# {Infographic Title}

Create a {CONCISE/STANDARD}-tier infographic showing {core concept}.

## Title

{Exact title text}

## Subtitle

*{Exact subtitle text}*

## Layout Structure

```
[ASCII art layout sketch]
```

## EventAI Color Palette

- Deep purple: #6B46C1 (primary headers)
- Electric coral: #FF6B6B (key statistics)
- Sky blue: #4299E1 (data elements)
- Slate gray: #2D3748 (body text)
- White: #FFFFFF (background)

## Typography

- Title: Inter Bold, 28-32pt
- Statistics: Inter Bold, 40-56pt
- Body: Source Sans Pro Regular, 14-16pt

## Visual Elements

⚠️ CRITICAL FESTIVAL CONTEXT:
- **Illustrated festival crowd visible in background**
- Diverse festival-goers in casual clothing
- Festival wristbands, stages, tents visible
- Make crowd VISIBLE and ILLUSTRATED

## {CONCISE/STANDARD} Density Requirements

⚠️ CRITICAL WHITE SPACE:
- Target {40%+ for CONCISE / 30%+ for STANDARD} white space
- Generous padding ({value}px)
- {value}px margins

❌ DO NOT ADD:
- Decorative borders
- Gradient backgrounds
- Multiple icons per section

✅ KEEP IT {MINIMAL for CONCISE / BALANCED for STANDARD}

## Target Scan Time

{15-30s for CONCISE / 30-60s for STANDARD}

## Accessibility

- 4.5:1 minimum contrast (WCAG AA)
- Information not color-dependent
- 14-16pt minimum text

## Aspect Ratio

⚠️ **LANDSCAPE orientation REQUIRED**
- 16:9 or similar landscape
- Recommended: 2048 x 1536
```

**Update Beads:**
```bash
bd close {identify-visuals-task-id} --reason="Identified 4 visual opportunities"
bd close {create-content-files-task-id} --reason="Created content.md for all 4 visuals"
bd close {create-prompt-files-task-id} --reason="Created prompt.md for all 4 visuals"
```

### Step 6: Visual Generation & Evaluation

#### 6a. Generate Variants

**For each visual:**

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
- `{visual-name}-1.png`, `{visual-name}-2.png`, `{visual-name}-3.png`
- Auto-converts to WebP (1080p)

**If using manual conversion:**
```bash
todd-image-convert *.png --resolution 1080p --output-format webp
```

#### 6b. Evaluate Variants

**Load best practices first:**
```bash
/infographics-bestpractices
```

**Evaluate all visuals:**
```bash
/ig-evaluate docs/writing/{topic}/visuals/*/*.webp
```

**This creates evaluation reports scoring:**
- EventAI style compliance (color, typography, layout)
- Best practices adherence (Tufte, white space, accessibility)
- Data accuracy verification
- Festival context integration

**Target: 90%+ scores**

#### 6c. Select Winners

**For each visual, select highest-scoring variant:**

```markdown
## Visual Winners

1. traditional-vs-ai-education-2.webp: 92/100 ✓
2. academic-integration-barriers-3.webp: 89/100 ✓
3. adoption-timeline-6.webp: 91/100 ✓
4. success-patterns-2.webp: 90/100 ✓

All variants meet 90%+ threshold, ready for integration.
```

**If any < 80%, regenerate with improved prompts**

**Update Beads:**
```bash
bd close {generate-variants-task-id} --reason="Generated 3 variants each for 4 visuals"
bd close {evaluate-variants-task-id} --reason="Evaluated all 12 variants, scores 89-92%"
bd close {select-winners-task-id} --reason="Selected 4 winners, all 90%+"
```

### Step 7: Final Integration

#### 7a. Insert Visual References

**In narrative markdown:**

```markdown
{Paragraph introducing concept}

![{Descriptive alt text}](../visuals/{folder}/{visual-name}-{variant}.png)

*Figure {N}: {Caption describing what visual shows and why it matters}*

**Sources:**
- [Source 1](URL)
- [Source 2](URL)

{Next paragraph discussing visual}
```

**Alt text guidelines:**
- Describe visual structure and key findings
- Enable screen reader comprehension

**Caption guidelines:**
- 1-2 sentences max
- Explain significance to narrative

#### 7b. Add Source Attribution

**At end of each major section:**

```markdown
**Sources:**
- [Source Title](URL)
- [Source Title](URL)
```

**Clean format (no detailed notes):**
- Just titles and links
- 3-6 sources per section
- All sources clickable (markdown links)

#### 7c. Final Review

**Success criteria checklist:**

- [ ] **Voice:** Conversational, appropriate for university students
- [ ] **Cleanliness:** No redundancy, clear structure, scannable
- [ ] **Impact:** Compelling narrative with strong examples
- [ ] **Accuracy:** 90%+ verified claims (fact-check report)
- [ ] **Visuals:** 3-5 landscape infographics, well-spaced, consistent style
- [ ] **Sources:** Complete attribution throughout

**Create final draft:**
```bash
cp {topic}.draft{N}.md {topic}.draft{N+1}.md
# Apply all integration changes in draft{N+1}
```

**Update Beads:**
```bash
bd close {insert-visuals-task-id} --reason="Inserted 4 visual references with captions"
bd close {add-sources-task-id} --reason="Added source lists at section ends"
bd close {final-review-task-id} --reason="Final review complete, all criteria met"
```

### Step 8: Release Candidate Generation

**Same as `/section-publish` Step 4:**

1. Create formatted markdown (7" image specs)
2. Generate DOCX with Pandoc
3. Apply justified text via Python script

**Output:** `{topic}.rc1.docx`

**Update Beads:**
```bash
bd close {generate-rc-task-id} --reason="Created rc1.docx (20MB, 4 images, justified text)"
bd close {verify-docx-task-id} --reason="Verified DOCX quality"

# Close epic
bd close {section-epic-id} --reason="Section {N} complete: draft{N+1} + rc1 + 4 infographics (90%+ scores)"
```

## Quality Standards

### Data Accuracy (MOST CRITICAL)
- [ ] 90%+ claims verified via /validate
- [ ] Fact-check report documents all verifications
- [ ] All critical errors corrected
- [ ] No hallucinated statistics or unsupported claims

### Beads WBS Tracking
- [ ] Epic created with success criteria
- [ ] 10-15 tasks created with dependencies
- [ ] All tasks closed with completion notes
- [ ] Progress trackable without conversation context

### Narrative Quality
- [ ] Learning objectives stated
- [ ] Conversational tone for university students
- [ ] Bold headers for scanability
- [ ] Examples and case studies integrated
- [ ] 30-40% conciseness vs academic style

### Visual Quality
- [ ] 3-5 infographics (landscape, concise/standard tier)
- [ ] Consistent design language (EventAI brand)
- [ ] 90%+ evaluation scores
- [ ] Well-spaced (every 500-1000 words)
- [ ] Supplement narrative (not replace)

### Publication Readiness
- [ ] Release candidate DOCX generated
- [ ] 7" images embedded (attempt)
- [ ] Justified text applied
- [ ] File size ~20MB (confirms embedding)

## Example Session

```bash
# User invokes skill
/section-create 2 education

# PRELOAD SKILLS FIRST
→ Loading /textbook-bestpractices...
→ Loading /infographics-bestpractices...
→ Loading /narrative-refine-validate...
→ Loading /validate...
✓ All required skills loaded

# Step 0: Beads WBS
→ Created epic: eventai-2-education-complete
→ Created 18 tasks with dependencies
→ WBS ready for tracking

# Step 1: Archive visuals
→ Archived 3 old visual folders to archive/
✓ Clean slate for new generation

# Step 2: Research review
→ Read education.sources.md (12 sources)
→ Read initial Q&A from README.md
→ Synthesized 4 key themes, 15 statistics
✓ Research synthesis complete

# Step 3: Draft creation
→ Created education.draft1.md (3,200 words)
→ Included all 15 statistics with sources
→ Applied textbook best practices
✓ Draft1 ready for validation

# Step 4: Validation loop
→ Running /validate on draft1...
→ Found 3 critical errors, 2 high-priority issues
→ Created education.draft1-FACT-CHECK-REPORT.md
→ Applied corrections → draft2
→ Re-validated draft2: 94% accuracy ✓

# Step 5: Visual planning
→ Identified 4 infographic opportunities
→ Created content.md for all 4 visuals
→ Created prompt.md for all 4 visuals
✓ Visual content ready for generation

# Step 6: Visual generation
→ Generated 3 variants each (12 total PNGs)
→ Converted to WebP (1080p)
→ Evaluated all 12 variants
→ Scores: 89%, 90%, 91%, 92%
→ Selected 4 winners (all 90%+) ✓

# Step 7: Integration
→ Inserted 4 visual references + captions
→ Added source attribution lists
→ Final review: All criteria met ✓
→ Created education.draft3.md (final)

# Step 8: RC generation
→ Created education.rc1.docx (21MB)
→ Applied justified text alignment
✓ Release candidate ready

# Beads closure
→ Closed all 18 tasks
→ Closed epic: eventai-2-education-complete
✓ Section 2 complete

# Summary
→ education.draft3.md: Final validated narrative (94% accuracy)
→ education.rc1.docx: Publication-ready DOCX
→ 4 infographics: All 90%+ scores, landscape, consistent style
→ Beads WBS: Complete tracking, easy pickup
```

## Anti-Patterns

❌ **Don't skip Beads WBS creation:**
```
Bad: Start drafting immediately, lose track of progress
Good: Create epic + tasks first, track every step
```

❌ **Don't skip validation loop:**
```
Bad: Trust your memory, assume statistics are correct
Good: Run /validate, fix errors, re-validate until 90%+
```

❌ **Don't create visuals before validated draft:**
```
Bad: Generate infographics → Discover data errors → Regenerate
Good: Validate draft → Correct data → Generate once
```

❌ **Don't use portrait orientation or DETAILED tier by default:**
```
Bad: Portrait infographics, dense explanatory text
Good: Landscape CONCISE/STANDARD, 40-30% white space
```

❌ **Don't forget to archive old visuals:**
```
Bad: Mix old and new visuals, confusion about which is current
Good: Archive old → Clean slate → New generation
```

## Session Close Protocol

```bash
[ ] 1. git status              # Check all changes
[ ] 2. git add docs/writing/{topic}/
[ ] 3. bd sync                 # Commit beads changes
[ ] 4. git commit -m "feat({topic}): Complete Section {N} authoring"
[ ] 5. bd sync                 # Commit any new beads
[ ] 6. git push                # Push to remote
```

**Commit message template:**
```
feat({topic}): Complete Section {N} - {Topic Name}

Complete section authoring workflow:
- Research synthesis: {X} themes, {Y} statistics
- Drafts 1-{N}: Iterative refinement + validation
- Validation: {Z}% accuracy achieved
- Visuals: {N} infographics (all 90%+ scores)
- RC: {topic}.rc1.docx ready for publication

Beads WBS: {epic-id} with {N} tasks tracked
All claims verified, visuals evaluated, ready for distribution.
```

---

**Skill Created:** December 31, 2025
**Version:** 1.0
**Maintained By:** EventAI Content Quality System
