# Narrative Refinement, Claim Validation, and Source Attribution

## Purpose

Transform academic/bullet-point drafts into publication-ready narrative content with verified claims and proper source attribution. This skill combines three critical processes into a single integrated workflow:

1. **Question Alignment**: Verify content answers its stated question cleanly without sideramps
2. **Narrative Refinement**: Transform verbose or bullet-point content into concise, flowing narrative
3. **Claim Validation**: Systematically verify all factual claims against authoritative sources
4. **Source Attribution**: 🚨 CRITICAL: Add ALL sources at the END OF THE DOCUMENT (NOT sectional placement)

## Validation Priority Structure

**Priority 1: QUESTION ALIGNMENT (PRIMARY)**
- Does the content cleanly and thoroughly answer the question being asked?
- Is the narrative scope appropriate to the question's scope?
- Are there sideramps (tangents) that divert from answering the core question?
- Does every section support answering the question, or explain mechanics unrelated to it?

**Priority 2: DATA ACCURACY & SOURCES (SECONDARY)**
- All factual claims correctly stated and properly sourced
- Identical claims use identical data across all occurrences
- All sources cited in text appear in source catalogs
- No orphan claims (statistics without attribution)

## When to Use This Skill

Use this skill when you have a draft document (typically academic or bullet-point style) that needs to be:
- Transformed from bullets/academic → concise narrative style
- Fact-checked against primary sources
- Enhanced with proper source attribution
- Prepared for publication

**DO use this skill for:**
- Research articles, white papers, analysis documents
- Content with numerous factual claims requiring verification
- Academic drafts that need to become accessible narratives
- Any content destined for publication where accuracy is critical

**DO NOT use this skill for:**
- Simple copy-editing or proofreading (use basic editing instead)
- Creative fiction or opinion pieces (no fact-checking needed)
- Internal notes or working documents not intended for publication

## Core Approach

This skill performs three integrated passes on the content:

### Pass 1: Narrative Transformation
Apply concise narrative style while preserving all information and facts:
- Convert bullet points → flowing prose
- Shorten verbose explanations → direct statements
- Add bold headers for scanability
- Employ second-person address where appropriate ("You're setting up tents for three days")
- Short declarative sentences (15 words average vs. 24+ in academic)
- Cut redundancy without losing substance
- Target 30-40% word reduction while maintaining 100% information

**Example transformation:**
```
BEFORE (Academic, Verbose - 84 words):
The festival industry has actively rejected dynamic pricing despite the
technology's proven success in other live entertainment venues. DICE CEO Phil
Hutcheon clarified the company's actual deployment: "We've never had an artist
approach us for dynamic pricing." While DICE processes 40-41% of ticket sales
through AI-powered *recommendations*...

AFTER (Concise Narrative - 52 words):
The festival industry has rejected dynamic pricing. DICE CEO Phil Hutcheon:
"We've never had an artist approach us for dynamic pricing." DICE processes
40-41% of sales through AI recommendations helping fans discover shows—not
pricing optimization.
```

### Pass 2: Systematic Claim Validation
Verify every numerical claim, statistic, and factual assertion:

1. **Extract all claims** from the draft (statistics, percentages, dates, attributions)
2. **Search for sources** in:
   - Project research files (`docs/research/**/*.sources.md`)
   - Visual source files (`docs/writing/*/visuals/*/*.content.md`)
   - Web search for primary sources (press releases, academic papers, official reports)
3. **Cross-reference** each claim against source material
4. **Categorize findings**:
   - ✅ Verified Exactly (claim matches source)
   - ⚠️ Cannot Verify (claim plausible but no source found)
   - 📊 Discrepancy (claim differs from source)
   - ❌ Incorrect (claim contradicts source)
5. **Create fact-check report** documenting all verifications
6. **Apply corrections** to create new draft with verified claims

**Verification Checklist:**
- [ ] All statistics extracted and sourced
- [ ] All quotes verified (exact wording, speaker, context)
- [ ] All company/organization names correct
- [ ] All dates/years accurate
- [ ] All attributions correct (McKinsey vs. Forrester vs. Constellation Research)
- [ ] All ROI figures match source documents

### Pass 3: Source Attribution

🚨 **CRITICAL REQUIREMENT: ALL SOURCES AT DOCUMENT END ONLY** 🚨

**Placement Rule (ENFORCED):**
- ✅ **CORRECT**: Single consolidated source list at the END of the document (after all content)
- ❌ **WRONG**: Source lists at the end of each section (sectional placement)
- ❌ **WRONG**: Multiple source blocks throughout the document

**Format:**
```markdown
[All narrative content...]

---

**Sources:**

- [Descriptive Title](https://url.com) (optional context)
- [Study Name - Organization](https://url.com) (key finding noted)
- [Report Title](https://url.com) | [Secondary Source](https://url.com)
[All 10-15 sources listed here in alphabetical or citation order]
```

**Why Document-End Only:**
- Professional academic publication standard
- Cleaner reading flow (no interruptions)
- Easier source management (single authoritative list)
- Consistent with textbook/research article format

**Example Structure:**
```markdown
# Question Title

[2,000 words of narrative content...]

[Figure 1, Figure 2, Figure 3...]

## The Bottom Line

[Conclusion paragraph...]

---

**Sources:**

- [Long, D., & Magerko, B. (2020)...](URL)
- [UNESCO AI Competency Framework...](URL)
- [15 total sources listed alphabetically]
```

## Workflow Steps

### Step 1: Initial File Discovery
```bash
# User provides draft file path or you search for recent drafts
# Example: docs/writing/5-analytics/drafts/analytics.draft6.md
```

**Actions:**
1. Read the draft file
2. Identify draft number (e.g., draft6)
3. Check for associated files:
   - .sources.md files in research directories
   - .content.md files in visual directories
   - Previous draft versions for comparison
   - EDITORIAL-ANALYSIS or FACT-CHECK-REPORT files

### Step 2: Narrative Transformation Pass

**Goal**: Convert to concise narrative while preserving all facts

**Techniques:**
- **Short sentences**: 15-word average (vs. 24+ academic)
- **Bold headers**: Scannable structure
- **Cut redundancy**: "Despite the technology's proven success in other live entertainment venues" → [delete, context established]
- **Direct statements**: "This discovery algorithm has nothing to do with pricing optimization" → "not pricing optimization"
- **Active voice**: "The system was deployed" → "Crowd Connected deployed"
- **Second person**: "You're setting up tents for three days"
- **Parallel structure**: "Stadiums are permanent. Festivals are temporary."

**Output:**
- Create `[filename].draftN+1.md` (e.g., draft6 → draft7)
- Include metadata note: "Narrative transformation applied"

### Step 3: Claim Extraction & Verification

**Search Strategy:**
```
1. Check project research files first:
   - docs/research/analytics/*.sources.md
   - docs/research/[topic]/*.sources.md

2. Check visual source files:
   - docs/writing/[topic]/visuals/*/*.content.md

3. Web search for unverified claims:
   - Company press releases
   - Academic papers (NCBI, ScienceDirect)
   - Industry reports (Forrester, McKinsey, Gartner)
   - News interviews (Variety, IQ Magazine, etc.)
```

**For each claim:**
```markdown
| Claim | Source Found | Status | Action |
|-------|--------------|--------|--------|
| "91% UK fans oppose dynamic pricing" | Music Fans' Voice survey via MusicRadar | ✅ Verified | Keep as-is |
| "Legion WFM $7.44M benefits" | Forrester TEI shows $13.35M | 📊 Discrepancy | Correct to $13.35M |
| "Real Madrid 29% revenue increase" | Playbook Sports report | ✅ Verified | Keep as-is |
| "PRIMA model for medical staffing" | NCBI PMC article | ⚠️ Found but revise | Change to "traditional risk-based" |
```

**Output:**
- Create `[filename].draftN-FACT-CHECK-REPORT.md`
- Document all verifications with source links
- Categorize by priority (Critical/High/Medium/Low)
- Provide correction recommendations

### Step 4: Apply Corrections

**For each issue found:**

**Critical Issues (must fix before publication):**
- Incorrect attributions (McKinsey vs. Constellation Research)
- Numerical discrepancies (wrong ROI figures)
- Unverifiable peer-reviewed claims (PRIMA model)

**High Priority (strongly recommend):**
- Year discrepancies (2022 vs. 2024)
- Sports venue metrics without sources
- Specific figures that cannot be verified

**Medium/Low Priority (nice to have):**
- General statements that could use sources
- Optional clarifications

**Output:**
- Update draft with all corrections
- Note which corrections were applied in metadata section

### Step 5: Add Source Attribution

🚨 **ENFORCED: ALL SOURCES AT DOCUMENT END ONLY** 🚨

**CORRECT Placement:**

```markdown
# Question Title

[All 2,000 words of narrative content...]

[Figure 1: ...]
*Figure caption...*

[Figure 2: ...]
*Figure caption...*

## The Bottom Line

[Final conclusion paragraph...]

---

**Sources:**

- [Long, D., & Magerko, B. (2020). What is AI Literacy?](https://doi.org/...)
- [UNESCO AI Competency Framework (2024)](https://unesdoc.unesco.org/...)
- [University of Surrey Module Catalog](https://www.surrey.ac.uk/...)
- [All 10-15 sources listed in alphabetical or citation order]
```

**Requirements:**
- ✅ **Single consolidated list** at document end (after all content, figures, and conclusion)
- ✅ **Markdown link format** for all sources (clickable)
- ✅ **Brief context** in parentheses when helpful
- ❌ **NEVER** multiple source blocks (sectional placement forbidden)
- ❌ **NEVER** source lists interspersed throughout narrative

**Output:**
- Final draft with ALL sources at document end only
- Clean, professional publication-ready format
- No metadata summary section after sources

## Output Files

This skill generates multiple files:

### 1. [filename].draftN+1.md
The refined narrative with corrections and sources
```markdown
# Title

[Concise narrative content with verified claims...]

**Sources:**
- [Source links...]

[Next section...]
```

### 2. [filename].draftN-FACT-CHECK-REPORT.md
Comprehensive verification documentation
```markdown
# Fact-Check Report: [filename]

## Executive Summary
- Overall Accuracy: X% verified
- Critical Issues: N found
- Corrections Applied: list

## Detailed Verification Results
[Section-by-section verification with source links]

## Recommendations
[Tiered by priority]
```

### 3. [filename].draftN-SECTION-REVISIONS.md (optional)
Before/after examples showing narrative improvements
```markdown
# Section Revisions: [filename]

## Section 4: Before/After

### Original (478 words)
[Verbose academic version...]

### Revised (298 words, 38% reduction)
[Concise narrative version...]

### What Changed
- Tone shifts
- Conciseness improvements
- Structure improvements
```

## Quality Standards

### Narrative Quality
- [ ] 30-40% word count reduction from academic style
- [ ] Average sentence length 15-18 words (not 24+)
- [ ] Bold headers create scannable structure
- [ ] Conversational tone maintained throughout
- [ ] Second-person address used appropriately
- [ ] Parallel structure in comparisons
- [ ] NO information loss (100% facts preserved)

### Verification Quality
- [ ] 90%+ claims verified against primary sources
- [ ] All critical corrections identified and applied
- [ ] Source links functional and relevant
- [ ] Attribution accuracy (correct organization/study)
- [ ] Numerical precision (exact figures, not rounded estimates)

### Source Attribution Quality
- [ ] Sources added at end of each major section
- [ ] 3-6 sources per section (not overwhelming)
- [ ] Markdown link format (clickable)
- [ ] Descriptive titles (not just URLs)
- [ ] Optional context in parentheses when helpful
- [ ] NO orphaned claims (every major claim has source)

## Example Session

### User Request:
```
/narrative-refine-validate docs/writing/5-analytics/drafts/analytics.draft6.md
```

### Agent Actions:

**Step 1: Read draft6, identify structure**
- 2,850 words, conversational tone
- 20 major factual claims identified
- 6 major sections (Crowd Flow, Dynamic Pricing, Staffing, Food Waste, Small Festivals, Vendor Evaluation)

**Step 2: Search for sources**
- Check docs/research/analytics/analytics-festival-2.sources.md
- Check docs/writing/5-analytics/visuals/*/.*content.md
- Web search for unverified claims

**Step 3: Verification findings**
- 13/20 claims verified exactly ✅
- 4/20 cannot verify ⚠️
- 2/20 discrepancies found 📊
- 1/20 incorrect attribution ❌

**Step 4: Apply corrections**
- Fix: Legion WFM $7.44M → $13.35M
- Fix: McKinsey 42% → "majority of organizations see no tangible enterprise-level EBIT impact"
- Fix: PRIMA model → "traditional risk-based models"
- Fix: Coachella 2022 → 2024

**Step 5: Add sources**
- Section 1 (Crowd Flow): 4 sources added
- Section 3.1 (Dynamic Pricing): 3 sources added
- Section 3.2 (Staffing): 4 sources added
- Section 3.3 (Food Waste): 4 sources added
- Section 5 (Small Festivals): 1 source added
- Bottom Line: 1 source added (McKinsey)

**Step 6: Output**
- Created analytics.draft7.md (corrected + sourced)
- Created analytics.draft6-FACT-CHECK-REPORT.md (verification details)
- Report: 90% accuracy (up from 85%), publication-ready

### Final Output Message:
```
## Draft7 Created with All Corrections ✅

Applied narrative refinement + fact-checking + source attribution:

### Changes Applied:
1. ✅ Legion WFM: $7.44M → $13.35M
2. ✅ McKinsey language: Updated to actual State of AI findings
3. ✅ PRIMA model → traditional risk-based models
4. ✅ Coachella year: 2022 → 2024
5. ✅ Sports metrics: All sourced to Playbook Sports report
6. ✅ Source lists: Added to end of each major section (6 locations)

### Verification Results:
- 17/20 major claims verified (85% → 90%+ accuracy)
- 4 critical corrections applied
- All major claims now have source attribution
- Publication-ready ✅

### Files Generated:
- [analytics.draft7.md](path) - Final corrected draft with sources
- [analytics.draft6-FACT-CHECK-REPORT.md](path) - Comprehensive verification
```

## Special Cases

### When Sources Are in Project Files
If sources exist in `docs/research/**/*.sources.md`, use those FIRST:
```markdown
**Sources:**
- [Study Name](URL) (from research/analytics/analytics-festival-2.sources.md, line 88)
```

### When Multiple Sources Exist for Same Claim
Use pipe separator to show primary | secondary:
```markdown
**Sources:**
- [Roskilde Festival IBM Partnership](primary-url) | [Medium Coverage](secondary-url)
```

### When Claim Cannot Be Verified
Document in fact-check report but DO NOT add unverified source:
```markdown
⚠️ **Tomorrowland 50,000+ transactions daily** - CANNOT VERIFY
Found: Tomorrowland uses RFID cashless payments
Could NOT find: Specific transaction volume figure
Recommendation: Either find source or revise to generic "large-scale transaction processing"
```

### When Visual Content Needs Updating
If corrections affect visual content (infographics), note in report:
```markdown
## Visual Updates Required

**legion-roi-2.png needs regeneration:**
- Source file: docs/writing/5-analytics/visuals/legion-roi/legion-roi.content.md
- Issue: Shows incorrect $7.44M figure (should be $13.35M)
- Lines to update: 166, 175
- Action: Update content.md, then regenerate via gemini-generate
```

## Integration with Other Skills

### Before This Skill:
- `/ig-generate` - Generate infographics (may contain claims to verify)
- `/ig-evaluate` - Evaluate infographic quality (may catch data errors)

### After This Skill:
- `/commit` - Commit the refined, verified draft
- `/validate` - Final validation before publication (if additional validation needed)

### Complementary Skills:
- `/optimize-tokens` - If draft becomes too verbose, optimize before publishing
- `/textbook-bestpractices` - If content is educational, apply textbook principles
- `/infographics-bestpractices` - If visuals need regeneration after fact-check

## Anti-Patterns (What NOT to Do)

❌ **Don't skip verification for "obvious" claims**
```
Bad: "Everyone knows McKinsey published that 42% figure"
Good: Search for McKinsey State of AI report, verify exact figure and language
```

❌ **Don't accept vendor claims at face value**
```
Bad: Vendor whitepaper says 78% yield improvement → use as-is
Good: Check if independent audit (Forrester, Gartner) confirms the figure
```

❌ **Don't over-source or under-source**
```
Too many: Source list after every paragraph (overwhelming)
Too few: One source list at very end of 3,000-word document (hard to verify)
Just right: Source list at end of each major section (5-8 total for long document)
```

❌ **Don't lose information during narrative tightening**
```
Bad: "Roskilde had high opt-in" (lost the 74% figure)
Good: "Roskilde achieved a 74% opt-in rate" (preserved the data)
```

❌ **Don't change meaning to fit sources**
```
Bad: Source says "60-70% range" → claim "65% exactly" (false precision)
Good: Source says "60-70% range" → claim "60-70%" OR "67.5% (midpoint of reported range)"
```

## Performance Notes

**Expected Time:**
- 2,000-word draft: 20-30 minutes
- 3,000-word draft: 30-45 minutes
- 5,000-word draft: 45-60 minutes

**Time Breakdown:**
- Narrative transformation: 20% of time
- Claim verification: 60% of time (most intensive)
- Source attribution: 10% of time
- Report generation: 10% of time

**Efficiency Tips:**
- Search project .sources.md files BEFORE web searching
- Use parallel web searches for multiple claims
- Group similar claims (all sports venue metrics → one Playbook Sports source)
- Don't re-verify claims across multiple drafts (trust earlier fact-checks)

---

**Skill Created:** December 30, 2025
**Version:** 1.0
**Maintained By:** EventAI Content Quality System
**Related Skills:** /ig-evaluate, /validate, /commit, /optimize-tokens
