# Test Visual Prompt Density

**Purpose:** Verify that infographic prompts match their intended density tier (Concise/Standard/Detailed) using combined AI agentic analysis and CLI static analysis.

**Usage:**
```
/test-visual-prompt-density <prompt-file> [tier]
```

**Arguments:**
- `<prompt-file>`: Path to prompt.md file (e.g., `docs/writing/.../visuals/name/name.prompt.md`)
- `[tier]`: Optional expected tier (concise|standard|detailed). If omitted, infers from context.

---

## 🚨 CRITICAL: What We're Really Measuring

**Primary Metrics (The Goal):**
1. **Concept Count:** How many distinct ideas/requirements does the infographic present?
2. **Information Hierarchy Depth:** How many levels deep does each concept go?
3. **Complexity = Concept Count × Hierarchy Depth**

**Tier Definitions:**
- **Concise:** Few concepts (5-8), shallow depth (1-2 levels)
  - Example: "DEFAULT OPT-IN" (label only) ✅
  - Too deep: "DEFAULT OPT-IN - biometric on unless disabled" (2 levels, pushing Standard) ⚠️

- **Standard:** EITHER more concepts (10-15) OR deeper detail (3 levels) — **NOT BOTH**
  - Option A: Many concepts at 1-2 levels (breadth)
  - Option B: Few concepts at 3 levels (depth)

- **Detailed:** Many concepts (20-30+) AND deep detail (4+ levels) — **BOTH**

**Proxy Metrics (Indicators, Not Goals):**
- Character count, sections, bullets, CRITICAL flags, AVOID items
- These are **correlation indicators**, not the actual target
- **Focus on concept count and hierarchy depth, not text volume**

---

## Test Process

### Step 1: CLI Static Analysis

Run gemini-generate with `--density` flag to trigger static complexity analysis:

```bash
gemini-generate \
  --content /dev/null \
  --prompt <prompt-file> \
  --output-dir /tmp \
  --name test \
  --density <tier> \
  --variants 1
```

**CLI checks (Proxy Metrics):**
- Character count vs. tier range (correlation indicator, not goal)
- Section count (## headers)
- Bullet point count
- CRITICAL flag count (🚨 or "CRITICAL" text)
- AVOID list length (❌ items)

**Expected Ranges (Correlation Indicators):**

| Tier | Chars | Sections | Bullets | CRITICAL | AVOID |
|------|-------|----------|---------|----------|-------|
| Concise | 2000-3000 | 3-4 | 8-12 | 0-1 | 0-3 |
| Standard | 4000-6000 | 4-6 | 15-25 | 1-2 | 5-7 |
| Detailed | 7000-10000 | 6-10 | 30-50 | 2-4 | 10-15 |

**Note:** These are correlation indicators. The real test is whether the prompt introduces the appropriate number of **concepts** and **detail level** for the tier.

---

### Step 2: AI Agentic Analysis

Read the prompt file and perform **semantic analysis** focusing on concept count and hierarchy depth:

**Analyze for Concise tier:**

*Primary Analysis:*
- **Concept count:** 5-8 distinct ideas/requirements
- **Hierarchy depth:** 1-2 levels per concept (label, maybe brief descriptor)
- **Complexity:** Low (few concepts × shallow depth)
- **Example:** "DEFAULT OPT-IN" (label only) = 1 level ✅
- **Too deep:** "DEFAULT OPT-IN - biometric on unless disabled" = 2 levels, pushing Standard ⚠️

*Checklist (Supporting Indicators):*
- ✅ Essential requirements only (no exhaustive specifications)
- ✅ Labels without extensive explanatory text
- ✅ Minimal AVOID list or none
- ❌ No multi-level explanations (label + descriptor + detail)
- ❌ No comprehensive style guide embedded
- ❌ No redundant "NOT X" specifications

**Analyze for Standard tier:**

*Primary Analysis:*
- **Concept count:** EITHER 10-15 (breadth) OR 5-8 (depth) — NOT BOTH
- **Hierarchy depth:** EITHER 1-2 levels (if many concepts) OR 3 levels (if few concepts) — NOT BOTH
- **Complexity:** Medium (expand ONE dimension: breadth OR depth)
- **Option A (Breadth):** Many concepts (10-15) at shallow depth (1-2 levels)
- **Option B (Depth):** Few concepts (5-8) at medium depth (3 levels: label + descriptor + detail)

*Checklist (Supporting Indicators):*
- ✅ Selective detail where needed (not exhaustive)
- ✅ Focused AVOID list (5-7 top items)
- ❌ NOT both many concepts AND deep detail (that's Detailed tier)
- ❌ NOT minimal like Concise

**Analyze for Detailed tier:**

*Primary Analysis:*
- **Concept count:** 20-30+ distinct ideas/requirements
- **Hierarchy depth:** 4+ levels per concept (label + descriptor + detail + examples/reasoning)
- **Complexity:** High (many concepts × deep detail = BOTH dimensions)
- **Example:** Multi-level explanations with examples, edge cases, and reasoning

*Checklist (Supporting Indicators):*
- ✅ Comprehensive specification (both breadth AND depth)
- ✅ Detailed examples with line-by-line specs
- ✅ Extensive AVOID list with reasoning
- ✅ Multiple CRITICAL sections if needed
- ✅ Annotation and labeling guidelines

---

## Scoring

### Pass Criteria

**CLI Static Analysis:**
- All metrics within expected ranges for tier ✅

**AI Agentic Analysis:**
- Prompt philosophy matches tier ✅
- Content density appropriate ✅
- No tier-inappropriate elements ✅

**Overall:** Both CLI and AI analysis must pass for prompt to be tier-compliant.

---

## Example Test Run

```bash
# Test consent-spectrum prompt (Concise tier)
/test-visual-prompt-density docs/writing/4-privacy/visuals/consent-spectrum/consent-spectrum.prompt.md concise
```

**Expected Output:**

```
📊 Testing: consent-spectrum.prompt.md (Concise tier)

🔧 CLI Static Analysis:
  Characters: 1847
  Sections: 3
  Bullets: 11
  CRITICAL flags: 0
  AVOID items: 0
  ✅ All metrics within Concise tier range

🤖 AI Agentic Analysis:
  ✅ Essential requirements only (no exhaustive specs)
  ✅ Trusts AI (no over-specification)
  ✅ Simple data points (11 bullets for 12 examples - appropriate)
  ✅ Simple structure (2 sentences)
  ✅ No detailed AVOID list
  ✅ No embedded style guide
  ✅ Philosophy matches Concise tier

✅ PASS: Prompt matches Concise tier expectations
```

---

## Failure Example

**Problem:** Standard tier prompt flagged as Concise

```bash
/test-visual-prompt-density some-prompt.md concise
```

**Output:**

```
📊 Testing: some-prompt.prompt.md (Concise tier)

🔧 CLI Static Analysis:
  Characters: 5234
  Sections: 6
  Bullets: 28
  CRITICAL flags: 3
  AVOID items: 12
  ⚠️  Complexity Warnings (5):
    ⚠️  Prompt too verbose: 5234 chars (expected 2000-3000 for concise)
    ⚠️  Section count mismatch: 6 sections (expected 3-4 for concise)
    ⚠️  Bullet count mismatch: 28 bullets (expected 8-12 for concise)
    ⚠️  Too many CRITICAL flags: 3 (expected 0-1 for concise)
    ⚠️  AVOID list too long: 12 items (expected 0-3 for concise)

🤖 AI Agentic Analysis:
  ❌ Exhaustive specifications present (multiple CRITICAL sections)
  ❌ Over-specified (redundant "NOT X" statements)
  ❌ Detailed AVOID list (should be minimal for Concise)
  ❌ Embedded style guide (should be external)
  ⚠️  Prompt appears to be Standard tier, not Concise

❌ FAIL: Prompt does NOT match Concise tier
  Recommendation: Simplify to match Concise template or use Standard tier instead
```

---

## Implementation

When /test-visual-prompt-density is invoked:

1. **Read prompt file** from provided path
2. **Determine tier:**
   - Use provided tier argument if given
   - Otherwise infer from filename/location context
3. **Run CLI analysis:**
   - Execute gemini-generate with --density flag
   - Parse output for complexity metrics and warnings
4. **Run AI analysis:**
   - Read prompt content
   - Check for tier-inappropriate elements
   - Verify philosophy matches tier
5. **Report results:**
   - Show both CLI and AI findings
   - Overall pass/fail
   - Recommendations if failed

---

## Integration with Workflow

### Use Cases

**1. After creating new prompt:**
```bash
# Create prompt
vim docs/writing/.../visuals/name/name.prompt.md

# Test tier compliance
/test-visual-prompt-density docs/writing/.../visuals/name/name.prompt.md concise
```

**2. Before regeneration:**
```bash
# Updated prompt with accessibility fixes
# Test to ensure not over-specified
/test-visual-prompt-density docs/writing/4-privacy/visuals/consent-spectrum/consent-spectrum.prompt.md concise
```

**3. Audit existing prompts:**
```bash
# Check all prompts in directory
for f in docs/writing/*/visuals/*/prompt.md; do
  /test-visual-prompt-density $f
done
```

---

## Success Metrics

**Prompt is tier-compliant when:**
- ✅ CLI metrics all within tier ranges
- ✅ AI analysis finds no tier mismatches
- ✅ Philosophy matches tier intent
- ✅ Content density appropriate

**Prompt needs revision when:**
- ❌ 2+ CLI metrics outside tier ranges
- ❌ AI finds tier-inappropriate elements
- ❌ Over-specified for declared tier
- ❌ Under-specified for declared tier

---

*Command created: January 1, 2026*
*Purpose: Ensure prompt complexity matches visual density tier*
*Method: Combined CLI static analysis + AI semantic analysis*
