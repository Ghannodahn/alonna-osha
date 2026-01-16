# Narrative Media Integration

## Purpose

Systematically add visual content (infographics, diagrams, data visualizations) to narrative sections following EventAI visual standards. This skill creates proper folder structures, generates content/prompt files, and ensures CONCISE tier infographics with consistent branding.

## When to Use This Skill

Use this skill when you need to enhance narrative content with visual elements:

**✅ DO use this skill for:**
- Adding infographics to support narrative sections
- Creating visual breaks in long-form content (every 500-1000 words)
- Illustrating complex concepts or comparisons
- Visualizing data and statistics mentioned in text
- Creating quick-reference decision frameworks or checklists

**❌ DO NOT use this skill for:**
- Simple image insertions without structured generation workflow
- Photography or illustrations (different domain)
- Decorative images that don't add information
- Web UI mockups or interface designs

## Core Approach

This skill creates a complete visual content workflow:

1. **Identify visual opportunities** in narrative text
2. **Create folder structure** for visual content
3. **Write .content.md** with source material and statistics
4. **Write .prompt.md** with generation instructions (CONCISE tier default)
5. **Apply infographics best practices** (Tufte, EventAI brand, festival context)
6. **Generate reference** for narrative insertion

---

## Workflow Steps

### Step 1: Identify Visual Opportunities

**Scan narrative for sections that would benefit from visuals:**

**Strong candidates:**
- **Comparisons:** "Traditional vs AI," "Stadium vs Festival," "Before vs After"
- **Statistics:** Multiple data points or percentages
- **Frameworks:** Decision trees, evaluation criteria, process flows
- **Timelines:** Historical progression or adoption curves
- **Lists:** 5+ critical questions, key features, deployment stages

**Visual placement pattern:**
- Every 500-1000 words of narrative text
- After major conceptual sections
- Before/after critical decision points
- To break up dense analytical content

**Output:**
- Identify 3-5 visual opportunities per 3,000-word section
- Note which narrative paragraphs each visual will support

### Step 2: Create Folder Structure

**For each identified visual:**

```bash
# Standard structure
docs/writing/{topic}/visuals/{visual-name}/
├── {visual-name}.content.md     # Source material for generation
├── {visual-name}.prompt.md      # ImaGen generation instructions
├── {visual-name}-1.png          # Generated variants (from ImaGen)
├── {visual-name}-1.webp         # Converted to webp (1080p)
├── {visual-name}-2.png
├── {visual-name}-2.webp
├── {visual-name}-3.png
└── {visual-name}-3.webp
```

**Naming convention:**
- Folder name: Descriptive hyphenated (e.g., `traditional-vs-ai-concise`)
- Files: Match folder name exactly
- Variants: Numbered 1-3 (from ImaGen generation)

**Example:**
```bash
docs/writing/5-analytics/visuals/vendor-questions/
├── vendor-questions.content.md
├── vendor-questions.prompt.md
├── vendor-questions-1.webp
├── vendor-questions-2.webp
└── vendor-questions-3.webp
```

### Step 3: Write .content.md File

**Purpose:** Source material for ImaGen to generate the infographic

**Template:**
```markdown
# {Visual Title}: {Subtitle}

## Source Document for ImaGen Infographic Generation
**Visual ID**: VIS-{section}.{number}
**Type**: {Comparison/Timeline/Framework/etc.}
**Topic**: {Section name}
**Density Tier**: CONCISE

---

## Core Message

{1-2 paragraph summary of the visual's main point}

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
- Stat A: Value
- Stat B: Value

**Category 2:**
- Stat C: Value
- Stat D: Value

---

**Sources:**
- [Source Name](URL) (context)
- [Source Name](URL)
```

**Content guidelines:**
- Extract statistics from narrative text
- Provide context for each data point
- Include only information needed for visual (not full narrative)
- Cite sources at bottom
- Target 500-1500 words (enough context for AI generation)

### Step 4: Write .prompt.md File

**Purpose:** ImaGen generation instructions applying infographics best practices

**Template:**
```markdown
# Infographic Generation Prompt: {Title}

Create a CONCISE visual showing {core concept}.

## Title

{Exact title text}

## Layout Structure

{Visual organization description}

```
[ASCII art layout sketch]
```

## Visual Structure

### {Section Name}

**Element:** Description
**Text:** Exact wording
**Style:** Visual treatment

## EventAI Color Palette

- Deep purple: #6B46C1 (primary headers, dividers)
- Electric coral: #FF6B6B (key statistics, emphasis)
- Sky blue: #4299E1 (data elements, supporting)
- Slate gray: #2D3748 (body text, callouts)
- Light gray: #E2E8F0 (subtle borders)
- White: #FFFFFF (background)

## Typography

- Title: Inter Bold, 28-32pt
- Section headers: Inter Bold, 18-20pt
- Statistics: Inter Bold, 40-56pt
- Body text: Source Sans Pro Regular, 14-16pt

## Visual Elements

⚠️ CRITICAL FESTIVAL CONTEXT:
- **Illustrated festival crowd visible in background**
- Draw diverse festival-goers in casual clothing
- Show festival wristbands, stages, tents
- Make crowd VISIBLE and ILLUSTRATED (not subtle silhouettes)

Other elements:
- {List specific icons, charts, or visual metaphors}

## CONCISE Density Requirements

⚠️ CRITICAL WHITE SPACE:
- Target 40%+ white space
- Generous padding ({value}px)
- {value}px margins
- {value}px spacing between elements

❌ DO NOT ADD:
- Decorative boxes or gradients
- Multiple icons per section
- Sub-bullets or explanatory paragraphs
- Complex diagrams

✅ KEEP IT MINIMAL:
- {Number} key elements only
- Clean layout format
- Maximum scanability
- 15-30 second comprehension

## Target Scan Time

15-30 seconds to understand core message

## Accessibility

- Text contrast minimum 4.5:1 (WCAG AA)
- Information not color-dependent (icons + text + color)
- Minimum 14-16pt body text

## Festival Context Integration

⚠️ REQUIRED - DO NOT SKIP:
- **Illustrated festival crowd in background**
- Diverse people in casual festival clothing
- Festival wristbands visible on attendees
- Festival stage, tents, or outdoor venue structures
- Make crowd VISIBLE and clearly festival-themed

❌ NEVER INCLUDE:
- Generic business people in suits
- Corporate office settings
- Robot/AI clichés
- Stadium seating (festivals use open fields/tents)
```

**Prompt guidelines:**
- **Default to CONCISE tier** (40%+ white space, 15-30 second scan)
- Specify exact EventAI color hex codes
- Include CRITICAL FESTIVAL CONTEXT section
- Emphasize minimal cruft (Tufte's data-ink ratio)
- Provide ASCII layout sketch for clarity
- List exactly what to include AND what to avoid

### Step 5: Apply Infographics Best Practices

**Load best practices before prompt writing:**
```bash
/infographics-bestpractices
```

**Ensure prompt includes:**

✅ **Tufte Principles:**
- High data-ink ratio (minimal decoration)
- Graphical integrity (proportions match data)
- Graphical excellence (rewards attention)
- Clear labeling

✅ **EventAI Brand:**
- Exact color palette (purple, coral, blue, white)
- Festival context (crowds, stages, wristbands)
- Professional + whimsy balance (80% credible, 20% playful)
- No generic business/tech imagery

✅ **CONCISE Tier (default):**
- 40%+ white space
- 15-30 second comprehension
- Headline stats only, minimal explanatory text
- Maximum visual clarity

✅ **Minimal Cruft:**
- No decorative borders
- No unnecessary gradients or shadows
- Every pixel serves information
- Functional beauty only

✅ **Accessibility:**
- 4.5:1 minimum contrast (WCAG AA)
- Non-color-dependent information
- Icon + text + color (not color alone)
- 14-16pt minimum text size

✅ **Festival Context (CRITICAL):**
- **Illustrated festival crowd visible in background**
- Diverse people in casual clothing
- Festival wristbands, stages, tents
- NOT corporate offices, suits, or generic tech imagery

### Step 6: Insert Visual Reference in Narrative

**After generating and approving visual:**

**Markdown insertion format:**
```markdown
{Narrative paragraph leading to visual}

![{Descriptive Alt Text}](../visuals/{folder-name}/{visual-name}-{variant}.webp)
*Figure {N}: {Caption describing what the visual shows and why it matters}*

**Sources:**
- [Source 1](URL) (context)
- [Source 2](URL)

{Next narrative paragraph}
```

**Alt text guidelines:**
- Describe visual structure and key findings
- NOT just title repetition
- Enable screen reader comprehension

**Caption guidelines:**
- 1-2 sentences max
- Describe what visual shows
- Explain why it matters to narrative

**Placement rules:**
- Insert after paragraph that introduces concept
- Before detailed discussion of visual content
- Add source block immediately after figure

---

## Quality Standards

### Visual Content Quality

✅ **Content.md completeness:**
- [ ] Core message clearly stated (1-2 paragraphs)
- [ ] All statistics extracted and formatted
- [ ] Source citations included
- [ ] Sufficient context for AI generation (500-1500 words)

✅ **Prompt.md quality:**
- [ ] CONCISE tier specified (40%+ white space)
- [ ] EventAI color palette with exact hex codes
- [ ] CRITICAL FESTIVAL CONTEXT section included
- [ ] Explicit "DO NOT ADD" list (prevents cruft)
- [ ] ASCII layout sketch provided
- [ ] Typography specifications clear
- [ ] Accessibility requirements stated

✅ **Infographics best practices applied:**
- [ ] Tufte principles embedded (data-ink ratio, graphical integrity)
- [ ] Minimal cruft emphasized
- [ ] Professional + whimsy balance articulated
- [ ] Festival context required (illustrated crowds, stages)
- [ ] Accessibility standards specified (4.5:1 contrast, non-color-dependent)

✅ **Narrative integration:**
- [ ] Visual placement strategic (every 500-1000 words)
- [ ] Alt text descriptive (screen reader friendly)
- [ ] Caption explains visual significance
- [ ] Source block follows figure
- [ ] Markdown link format correct

---

## Example Session

### User Request:
```
Add visual content to support Section 2 (AI Promises) in analytics.draft7.md
```

### Agent Actions:

**Step 1: Identify visual opportunity**
- Section 2 discusses traditional vs AI analytics promises
- Contains multiple statistics (±20% → ±5-8% accuracy, 14% → <2% waste)
- Comparison structure = strong visual candidate
- Target: CONCISE tier (quick comprehension of promise vs reality)

**Step 2: Create folder structure**
```bash
mkdir -p docs/writing/5-analytics/visuals/traditional-vs-ai-concise
```

**Step 3: Write content.md**
```markdown
# Traditional vs AI-Powered Analytics: The Promise

## Source Document for ImaGen Infographic Generation
**Visual ID**: VIS-5.2
**Type**: Comparison (Split Visual)
**Topic**: Analytics (AI Promises)
**Density Tier**: CONCISE

## Core Message

Traditional festival analytics relies on spreadsheets and historical data
with ±20% forecast accuracy and 14% inventory waste. AI vendors promise
real-time data integration with ±5-8% accuracy, <2% stockout rates, and
6-18x ROI. But zero festivals have deployed these systems as of 2025.

## The Three Key Promises

### 1. Forecast Accuracy
**Traditional:** ±20% error rate, 4-8 weeks advance planning
**AI Promise:** ±5-8% error rate, real-time hourly adjustments
**Gap:** 60-75% accuracy improvement

### 2. Decision Speed
**Traditional:** Days to adjust, phone calls + spreadsheets
**AI Promise:** Minutes to implement, automated alerts
**Gap:** 1000x+ speed improvement

### 3. Waste Reduction
**Traditional:** 14% excess inventory
**AI Promise:** <2% waste, dynamic reordering
**Gap:** 85% waste reduction

**Sources:**
- [Ticket Fairy AI Forecasting](URL)
- [Legion WFM Forrester Study](URL)
- [Winnow Food Waste AI](URL)
```

**Step 4: Write prompt.md**
```markdown
# Infographic Generation Prompt: Traditional vs AI Analytics Promise

Create a CONCISE split-comparison infographic showing traditional festival
analytics vs AI promises across three key dimensions.

## Title
Traditional vs AI-Powered Analytics: The Promise

## Layout Structure
Split vertical design with clear left-right division:

**LEFT SIDE: TRADITIONAL** (muted browns/grays)
**RIGHT SIDE: AI PROMISE** (vibrant EventAI colors)
**VERTICAL DIVIDER:** Deep purple (#6B46C1)

## Three Comparison Rows
[Details for each row with exact statistics]

## EventAI Color Palette
- Deep purple: #6B46C1 (vertical divider)
- Electric coral: #FF6B6B (improvement stats)
- Sky blue: #4299E1 (AI-side elements)
- Slate gray: #2D3748 (body text)
- White: #FFFFFF (background)

## Visual Elements

⚠️ CRITICAL FESTIVAL CONTEXT:
- **Illustrated festival crowd visible in background**
- Diverse festival-goers in casual clothing
- Festival wristbands visible
- Festival stage elements or structures
- Make crowd VISIBLE and ILLUSTRATED

## CONCISE Density Requirements

⚠️ CRITICAL WHITE SPACE:
- Target 40%+ white space
- Generous padding (24-32px)
- 48-64px margins

❌ DO NOT ADD:
- Decorative boxes around rows
- Multiple icons per section
- Gradient backgrounds

✅ KEEP IT MINIMAL:
- Three comparison rows
- One improvement stat per row
- Clean split design
```

**Step 5: Insert in narrative**
```markdown
The outcome metrics: Traditional analytics delivers ±20% forecast accuracy
with 14% inventory waste. AI vendors promise ±5-8% accuracy with <2%
stockout rates, 10-15% margin improvement, and 6-18x annual ROI.

![Traditional vs AI-Powered Analytics Comparison](../visuals/traditional-vs-ai-concise/traditional-vs-ai-concise-4.webp)
*Figure 2: Traditional vs AI-Powered Analytics - Split comparison showing
forecast accuracy (±20% → ±5-8%), decision speed (days → minutes), and waste
reduction (14% → <2%) promises, with bottom reality check: zero documented
festival deployments (2025).*

**Sources:**
- [Ticket Fairy - AI Forecasting](URL)
- [Legion WFM Forrester Study](URL)

That's the promise. But for dynamic pricing, staffing optimization, and
food waste reduction—there are zero documented festival deployments.
```

---

## Integration with Other Skills

### Before This Skill:
- `/narrative-refine-validate` - Ensure narrative is publication-ready before adding visuals
- `/infographics-bestpractices` - Load design principles before prompt writing

### After This Skill:
- `/ig-generate` - Generate infographics using created content/prompt files
- `/ig-evaluate` - Evaluate generated visuals for quality
- `/commit` - Commit completed visual content

### Complementary Skills:
- `/validate` - Verify statistics in .content.md files
- `/optimize-tokens` - If content.md becomes too verbose

---

## Anti-Patterns (What NOT to Do)

❌ **Don't create visuals without clear narrative support**
```
Bad: "Let's make an infographic about festivals"
Good: "Section 3.1 discusses dynamic pricing rejection - create visual showing
      4 rejection indicators (91% fan opposition, 0 artist requests, regulatory
      risk, 0 deployments)"
```

❌ **Don't default to STANDARD or DETAILED tier**
```
Bad: "Create a detailed infographic with comprehensive annotations"
Good: "Create a CONCISE infographic (40%+ white space, 15-30 second scan)"
```

❌ **Don't forget festival context**
```
Bad: Prompt shows generic business people in suits
Good: Prompt requires illustrated festival crowd in casual clothing with wristbands
```

❌ **Don't skip source citations**
```
Bad: .content.md with statistics but no sources
Good: .content.md with complete source list at bottom
```

❌ **Don't over-describe in prompts**
```
Bad: 5-page prompt with every possible detail
Good: 1-2 page prompt with clear structure, exact requirements, ASCII sketch
```

❌ **Don't violate minimal cruft principle**
```
Bad: "Add decorative borders, gradient backgrounds, ornamental shapes"
Good: "NO decorative boxes, gradients, or ornamental elements - functional beauty only"
```

---

## Performance Notes

**Expected Time:**
- Identify opportunities: 10 minutes per 3,000-word section
- Create folder structure: 2 minutes
- Write .content.md: 15-20 minutes
- Write .prompt.md: 20-30 minutes
- Insert narrative reference: 5 minutes
- **Total per visual:** 50-70 minutes

**Efficiency Tips:**
- Load `/infographics-bestpractices` BEFORE writing prompts
- Use existing .content.md files as templates
- Reuse prompt structure for similar visual types
- Extract statistics directly from narrative (already verified)
- Create 3-5 visuals per session for efficiency

---

## Related Commands

- **`/infographics-bestpractices`** - Load Tufte principles and EventAI brand standards
- **`/ig-generate`** - Generate infographics using created content/prompt files
- **`/ig-evaluate`** - Evaluate generated visuals against best practices
- **`/narrative-refine-validate`** - Refine narrative before adding visuals
- **`/validate`** - Verify statistical accuracy

**Typical workflow:**
```bash
/narrative-refine-validate analytics.draft6.md  # Refine narrative first
/infographics-bestpractices                      # Load design principles
/narrative-add-media analytics.draft7.md         # Identify + create visual content
# → Creates .content.md and .prompt.md files
/ig-generate VIS-5.2                             # Generate infographic
# → ImaGen generation, convert to webp
/ig-evaluate *.webp                              # Evaluate quality
```

---

## Final Philosophy

**Visual Purpose:** Every infographic must add information, not just decoration. If text alone suffices, skip the visual.

**CONCISE Default:** Unless user explicitly requests DETAILED tier, always target CONCISE (40%+ white space, 15-30 second scan). Festival organizers are busy - respect their time.

**Festival Context Non-Negotiable:** Generic business imagery or corporate clichés betray lack of industry understanding. Illustrated festival crowds, stages, and wristbands signal authenticity.

**Source Rigor:** Visual statistics must trace to authoritative sources just like narrative claims. No exceptions.

**Minimal Cruft Mantra:** If it doesn't help understanding, it hurts understanding. Tufte's data-ink ratio applies to every pixel.

---

**Command maintained by:** EventAI Content Generation System
**Version:** 1.0
**Created:** December 30, 2025
**Related Skills:** /ig-generate, /ig-evaluate, /infographics-bestpractices, /narrative-refine-validate
