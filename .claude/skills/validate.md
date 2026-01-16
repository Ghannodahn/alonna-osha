# Content Validation Skill

**Purpose**: Validate written content sections (with or without media) for narrative coherence, evidence integrity, visual integration, and voice consistency.

**When to use**: After completing a draft rewrite, especially when:
- Content has been condensed from longer source material
- Visuals/infographics have been integrated
- Multiple research sources have been synthesized
- Voice/tone has been adjusted

---

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

---

## Validation Framework

### Phase 1: Structural Analysis

#### 1.1 Narrative Arc Assessment
- **Clear hook?** Does the opening establish stakes/problem within 2 paragraphs?
- **Logical progression?** Does each section build on the previous one?
- **Satisfying conclusion?** Does the ending provide actionable takeaways?
- **Section transitions?** Are transitions smooth or jarring?

#### 1.2 Content Organization
- **Hierarchy clear?** Can you skim headers and understand the argument?
- **Balanced sections?** Are any sections disproportionately long/short?
- **Signposting?** Does the reader know where they are in the argument?

### Phase 2: Evidence Integrity

#### 2.1 Data Preservation
Compare draft against source material:
- **Key statistics present?** Are the essential numbers included?
- **Context preserved?** Do numbers have necessary qualifiers (e.g., "at IKEA" vs. "universally")?
- **Attribution intact?** Are vendors/studies properly cited?
- **Confidence levels maintained?** Are caveats preserved (e.g., "unverified in festival settings")?

#### 2.2 Argument Fidelity
- **Core thesis unchanged?** Does condensing alter the fundamental argument?
- **Nuance retained?** Are important distinctions preserved (e.g., "sports ≠ festivals")?
- **Evidence-claim alignment?** Do claims stay within what evidence supports?
- **Gaps acknowledged?** Are missing data/deployments explicitly noted?

### Phase 3: Visual Integration (if applicable)

#### 3.1 Contextual Placement
For each visual:
- **Appears near discussion?** Is the image within 1-2 paragraphs of related text?
- **Referenced in text?** Is there a "See Figure X" or contextual pointer?
- **Caption explains relevance?** Does the caption connect image to narrative?

#### 3.2 Content-Visual Alignment
For each visual:
- **Text discusses what image shows?** Does narrative cover the same topics as visual?
- **Image adds value?** Does visual provide information beyond text, or just repeat?
- **Visual complexity matches text depth?** If text is terse, is image appropriately simple (or vice versa)?
- **Success/failure stories match?** If text says "zero deployments," does image show same?

#### 3.3 Visual Narrative Arc
- **Sequence makes sense?** Do visuals build on each other or feel random?
- **Coverage gaps?** Are major topics discussed but not visualized (or vice versa)?
- **Visual hierarchy?** Is there a "hero" visual or are they all equal weight?

### Phase 4: Voice & Tone Consistency

#### 4.1 Voice Analysis
- **Consistent persona?** Does the voice shift between sections (academic → casual → formal)?
- **Matches target style?** If "conversational," is it conversational throughout?
- **Appropriate for audience?** Is complexity level consistent with intended readers?
- **Jargon handled correctly?** Are technical terms explained or assumed knowledge?

#### 4.2 Tone Patterns
- **Emotional register consistent?** (e.g., skeptical throughout vs. skeptical then enthusiastic)
- **Directness level?** Does the piece maintain assertiveness or waver?
- **Humor/personality?** If present, is it evenly distributed or clustered?

### Phase 5: Reading Experience

#### 5.1 Flow & Readability
- **Paragraph length variation?** Are there short punchy paragraphs mixed with longer ones?
- **Sentence rhythm?** Is there variety in sentence structure?
- **Dense sections broken up?** Are lists, callouts, or visuals used to break walls of text?
- **Skimmable?** Can a reader get value from just headers and bold text?

#### 5.2 Cognitive Load
- **Too much at once?** Are there sections with 5+ concepts in rapid succession?
- **Adequate white space?** (Metaphorical - are there breathing moments?)
- **Clear calls to action?** Does the reader know what to DO with the information?

### Phase 6: Technical Quality

#### 6.1 Accuracy
- **Math checks out?** Do percentages, calculations, and comparisons compute correctly?
- **Internal consistency?** Are numbers/claims consistent across sections?
- **No contradictions?** Does section 3 contradict section 1?

#### 6.2 Formatting
- **Links valid?** Do all image paths work?
- **Markdown correct?** Are lists, headers, emphasis properly formatted?
- **Figure numbering sequential?** Figure 1, 2, 3... not 1, 3, 2, 4?

---

## Validation Execution

**CRITICAL SEQUENCE**:
- **FIRST**: Verify the content answers its stated question cleanly without sideramps (Priority 1)
- **THEN**: Validate data accuracy, sources, and attribution (Priority 2)

Content that fails question alignment should be flagged immediately, even if data is accurate. Technically correct content that doesn't answer its question is a validation failure.

---

### Step 0: Gather All Source Materials
**CRITICAL**: Don't validate against just one file. Find ALL related materials:

1. **Check the section directory** for:
   - Previous draft versions (draft.1, draft.md, etc.)
   - Research files (*.research.md, *-notes.md)
   - Content files for visuals (visuals/*/*.content.md)
   - Evaluation reports (*-EVALUATION-REPORT.md, *.eval.md)
   - README files that may index content

2. **Look in parent directories** for:
   - Section-level research documents
   - Shared data/statistics files
   - Source interview transcripts or Q&A files

3. **Search for related content** by:
   - Grepping for key vendor names mentioned in draft
   - Finding files that mention the same statistics
   - Locating any "Question X" files if this answers a specific question

4. **Create a source inventory**:
   ```
   Sources for validation:
   - [draft.1](path): Original long-form content
   - [visual.content.md](path): Supporting research for Figure X
   - [section-research.md](path): Initial Q&A and data gathering
   - [vendor-case-studies.md](path): Evidence base
   ```

### Step 1: Initial Read-Through
Read the full draft WITHOUT referencing source material. Note:
- Where you got confused
- Where you wanted more detail
- Where you wanted less detail
- Where images felt out of place
- Where you lost the thread

### Step 2: Source Material Comparison
Read ALL source materials, then draft. For each section, check:
- [ ] Key statistics preserved (compare against ALL sources, not just one)
- [ ] Important caveats retained (check visual content files too)
- [ ] Core argument intact (verify against original research/Q&A)
- [ ] Evidence gaps still acknowledged (cross-reference evaluation reports)

### Step 3: Visual Audit
For each visual:
1. Read the section where it appears
2. Look at the visual
3. Ask: "Does this image make the section clearer or just prettier?"
4. Check: Is there text discussion of what the image shows?
5. Note: Are there topics with visuals but no text (or vice versa)?

### Step 4: Voice Consistency Check
Read three random paragraphs:
- Beginning
- Middle
- End

Do they sound like they were written by the same person on the same day?

### Step 5: Actionability Assessment
At the end, can the reader answer:
- What's the main point?
- What should I do differently?
- What questions should I ask vendors?
- What can I trust vs. what requires validation?

---

## Output Format

### Validation Report Structure

```markdown
# Content Validation Report: [Section Name]

**Evaluated**: [Date]
**Evaluator**: [Name]
**Draft Version**: [draft.2, draft.3, etc.]
**Word Count**: [Current vs. Source]

---

## Executive Summary

**Overall Assessment**: [READY | MINOR REVISIONS | MAJOR REVISIONS]

**Strengths**: [2-3 bullets]
**Issues**: [2-3 bullets]
**Recommended Changes**: [Priority list]

---

## Detailed Findings

### ✅ What Works

#### Narrative Structure
[Specific praise]

#### Evidence Integrity
[What's well-preserved]

#### Visual Integration
[What images work well]

#### Voice & Tone
[What's consistent and effective]

---

### ⚠️ Issues Found

#### Structural Issues
- **Issue**: [Description]
  - **Location**: [Section/paragraph]
  - **Impact**: [HIGH/MEDIUM/LOW]
  - **Fix**: [Specific recommendation]

#### Evidence Gaps
- **Issue**: [Missing stat, unclear caveat, etc.]
  - **Location**: [Section]
  - **Impact**: [HIGH/MEDIUM/LOW]
  - **Fix**: [Add X from source material]

#### Visual Misalignment
- **Issue**: [Image appears before discussion, visual shows content not in text, etc.]
  - **Location**: [Figure X near line Y]
  - **Impact**: [HIGH/MEDIUM/LOW]
  - **Fix**: [Move image, add text reference, revise caption]

#### Voice Inconsistencies
- **Issue**: [Tone shift, jargon introduced without explanation, etc.]
  - **Location**: [Section]
  - **Impact**: [MEDIUM/LOW]
  - **Fix**: [Rewrite with consistent voice]

---

## Recommended Changes for Next Draft

### Priority 1: Critical (Affects Understanding)
1. [Change 1]
2. [Change 2]

### Priority 2: Important (Improves Clarity)
1. [Change 1]
2. [Change 2]

### Priority 3: Polish (Enhances Experience)
1. [Change 1]
2. [Change 2]

---

## Metrics

| Criterion | Score | Notes |
|-----------|-------|-------|
| Narrative Arc | [0-10] | [Brief comment] |
| Evidence Integrity | [0-10] | |
| Visual Integration | [0-10] | |
| Voice Consistency | [0-10] | |
| Readability | [0-10] | |
| Actionability | [0-10] | |
| **TOTAL** | **[0-60]** | **[/60 = X%]** |

**Pass Threshold**: 80% (48/60)

---

## Next Steps

- [ ] Address Priority 1 issues
- [ ] Create draft.[X+1] with changes
- [ ] Re-validate after changes
- [ ] [Other specific actions]
```

---

## Common Issues & Fixes

### Issue: "Image appears but isn't discussed in text"
**Fix Options**:
1. Add 1-2 sentences referencing the visual
2. Move image to section where it IS discussed
3. Remove image if it's redundant
4. Add caption that makes connection explicit

### Issue: "Text is terse but visual is complex/detailed"
**Fix Options**:
1. Expand text to cover visual's full content
2. Simplify visual to match terse text
3. Move detailed visual to appendix
4. Add callout box with visual-specific details

### Issue: "Success story has no visual, failure stories have visuals"
**Fix Options**:
1. Create visual for success story
2. Remove failure visuals (if text-only is sufficient)
3. Use comparative visual (success vs. failure in one image)
4. Acknowledge in text: "No visual needed - the evidence speaks for itself"

### Issue: "Statistics from source missing in draft"
**Fix Options**:
1. Add critical stats back (even if increasing word count)
2. Put stats in visual instead of text
3. Create callout box for key numbers
4. Link to source material for full data

### Issue: "Voice shifts from conversational to academic"
**Fix Options**:
1. Rewrite academic sections in conversational voice
2. Separate sections by voice (intro conversational, deep-dive academic, conclusion conversational)
3. Use transitions that acknowledge shift ("Let's get technical for a moment...")
4. Add personality to academic sections (examples, analogies, direct address)

### Issue: "No clear call to action"
**Fix Options**:
1. Add "What This Means for You" section
2. End with bulleted action items
3. Include "Questions to Ask Vendors" framework
4. Provide decision matrix or checklist

---

## Usage Examples

### Example 1: Validating a terse rewrite
```
User: "I rewrote the analytics section to be 50% shorter. Validate it."
Assistant:
1. Reads draft.2 fully
2. Compares to draft.1 source
3. Checks: Are key stats preserved? Is core argument intact?
4. Notes: Missing 3 important caveats, one section too terse
5. Creates validation report with specific fixes
6. Produces draft.3 with fixes applied
```

### Example 2: Validating visual integration
```
User: "I added 4 infographics to the draft. Do they make sense in context?"
Assistant:
1. For each image: reads surrounding text
2. Checks: Is image discussed? Does caption connect to narrative?
3. Notes: Figure 2 perfect, Figure 4 shows content not in text
4. Creates report: "Figure 4 appears at bottom but shows 15 use cases, text only discusses 4"
5. Recommends: Add sentence acknowledging broader scope OR remove extra use cases from visual
```

### Example 3: Voice consistency check
```
User: "Does this sound like my voice throughout?"
Assistant:
1. Samples paragraphs from beginning, middle, end
2. Checks: Consistent tone? Similar sentence patterns? Same level of directness?
3. Notes: Section 3 shifts to academic, loses conversational edge
4. Creates report with specific voice inconsistencies
5. Offers rewrite of Section 3 in consistent voice
```

---

## Validation Checklist (Quick Reference)

Use this for rapid validation:

### Content
- [ ] Opening hook within 2 paragraphs
- [ ] Each section builds logically on previous
- [ ] Headers tell the story when skimmed
- [ ] Conclusion provides actionable takeaways
- [ ] Key statistics from source material preserved
- [ ] Important caveats retained
- [ ] No contradictions between sections

### Visuals (if applicable)
- [ ] Each image appears near related discussion (within 1-2 paragraphs)
- [ ] Captions explain relevance to narrative
- [ ] Text discusses what images show
- [ ] No major topics visualized but not discussed (or vice versa)
- [ ] Figure numbers sequential
- [ ] Image paths valid

### Voice & Tone
- [ ] Consistent persona throughout
- [ ] Matches target style (conversational, academic, etc.)
- [ ] Appropriate for intended audience
- [ ] No unexplained jargon
- [ ] Emotional register consistent

### Reading Experience
- [ ] Paragraph length varies (not all same length)
- [ ] Sentence rhythm varied
- [ ] Dense sections broken with lists/callouts/visuals
- [ ] Can be skimmed for value
- [ ] No sections with 5+ concepts rapid-fire
- [ ] Clear what reader should DO with information

### Technical
- [ ] Math/calculations correct
- [ ] Numbers consistent across sections
- [ ] All links/paths work
- [ ] Markdown formatted correctly
- [ ] No formatting errors

---

## Integration with Writing Workflow

### When to Validate

**Always validate**:
- After major rewrites (50%+ reduction or expansion)
- After integrating visuals
- Before marking draft as "final"
- When combining multiple source documents

**Consider validating**:
- After voice/tone adjustments
- When user asks "does this make sense?"
- When draft will be shared externally
- When multiple authors contributed

**Skip validation** (use judgment):
- Minor typo fixes
- Small additions (1-2 paragraphs)
- Formatting-only changes
- When you're still in early ideation (draft.0, draft.1)

---

## Skill Invocation

**Command**: `/validate` or "Validate this section"

**Required Context**:
- Current draft file path
- Section directory (skill will search for all related materials)
- Target audience/voice description
- Any visuals integrated

**Skill will automatically**:
- Find previous draft versions in same directory
- Locate visual content files (visuals/*/*.content.md)
- Search for related research documents
- Check README.md files for content indexes
- Identify evaluation reports for visuals

**Output**:
- Validation report (markdown format)
- Priority-ordered fix list
- Optional: draft.[X+1] with fixes applied (if user requests)

---

## Advanced Validation Scenarios

### Multi-Source Synthesis
When draft synthesizes 3+ research sources:
1. Create evidence matrix: which claims come from which sources
2. Check: Are conflicting findings acknowledged?
3. Verify: Is each source properly attributed?
4. Ensure: No source's key finding is omitted

### Rewrite with Tone Shift
When draft intentionally changes voice from source:
1. Identify target voice characteristics
2. Sample throughout draft: does it maintain target?
3. Check: Are technical concepts correctly simplified (or complexified)?
4. Verify: Tone shift doesn't alter claims (casual ≠ imprecise)

### Visual-First Draft
When visuals created before text:
1. Audit each visual for content
2. Check: Does text cover ALL visual content?
3. Identify: Content in visuals but not text
4. Ensure: Text provides context visuals can't (e.g., "why this matters")

---

## Validation Anti-Patterns (What NOT to Do)

❌ **Don't**: Validate only for typos/grammar
✅ **Do**: Validate for narrative coherence, evidence integrity, visual alignment

❌ **Don't**: Compare draft to source word-by-word
✅ **Do**: Check if key points and evidence are preserved

❌ **Don't**: Require text to duplicate visual content
✅ **Do**: Ensure text provides context and visual adds detail

❌ **Don't**: Force every section to same length
✅ **Do**: Allow length to match importance/complexity

❌ **Don't**: Remove all personality for "professionalism"
✅ **Do**: Maintain consistent voice appropriate to audience

---

## Success Criteria

A validated draft should:
1. **Make sense** to a cold reader (no prior context needed)
2. **Preserve integrity** of source evidence
3. **Flow naturally** from section to section
4. **Integrate visuals** contextually (not decoratively)
5. **Maintain voice** throughout
6. **Provide value** when skimmed AND when read deeply
7. **Enable action** (reader knows what to do next)

**Validation passes when**: Draft scores ≥80% (48/60) on validation metrics

---

*Validation Skill v1.0*
*Created: December 30, 2025*
*For: EventAI content + media validation*