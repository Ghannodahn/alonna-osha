# Infographic Commit Message Template

**Purpose:** Auto-generated commit message when infographic evaluation reaches 90%+ approval threshold

---

## Template Usage

When an infographic variant reaches 90%+ evaluation score, generate `COMMIT_MSG.md` in the visual directory using this template:

```markdown
# Commit Message: {VISUAL_ID} {VISUAL_TITLE}

## Ready for Commit ✅

**Visual Approved:** Variant #{VARIANT_NUM} ({SCORE}/100)
**File:** `{FILENAME}`
**Status:** Publication-ready

---

## Suggested Commit Message

\```
feat(visuals): Add {VISUAL_ID} {VISUAL_TITLE} ({SCORE}%)

Visual: {FULL_TITLE}
Score: {SCORE}/100 ({TIER} - exceeds 90% publication threshold)
File: {FILENAME}
Batch: #{BATCH_NUM}, Variant #{VARIANT_NUM}

Key Features:
- {KEY_FEATURE_1}
- {KEY_FEATURE_2}
- {KEY_FEATURE_3}
- {KEY_FEATURE_4}
- {KEY_FEATURE_5}

Evaluation Details:
- EventAI Style Compliance: {STYLE_SCORE}/10
- Best Practices (Tufte): {PRACTICES_SCORE}/10
- Data Accuracy: {DATA_SCORE}/10
- Accessibility: {ACCESSIBILITY_SCORE}/10

Generated: {GENERATION_METHOD}
Iterations: {NUM_BATCHES} batches ({TOTAL_VARIANTS} variants total)
Time to approval: ~{TIME_MINUTES} minutes

Files added:
- {VISUAL_FILE_PATH}
- {EVAL_FILE_PATH}
{ADDITIONAL_FILES}

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
\```

---

## Git Commands

\```bash
# Stage approved visual and evaluation reports
git add {VISUAL_FILE_PATH}
git add {EVAL_FILE_PATH}
{ADDITIONAL_GIT_ADDS}

# Commit with message
git commit -F {COMMIT_MSG_PATH}

# Or copy-paste the commit message above
\```

---

## Optional: Clean Up Rejected Variants

\```bash
# Remove non-approved variants (optional - keep for reference or delete)
{REJECTED_VARIANTS_LIST}

# Recommendation: Keep #{APPROVED_VARIANT} (primary){BACKUP_VARIANT_NOTE}
\```

---

*Commit message generated: {GENERATION_DATE}*
*Variant approved: {FILENAME} ({SCORE}/100)*
```

---

## Variable Definitions

| Variable | Description | Example |
|----------|-------------|---------|
| `{VISUAL_ID}` | Visual identifier | `VIS-5.1` |
| `{VISUAL_TITLE}` | Short title | `Traditional vs AI Analytics` |
| `{FULL_TITLE}` | Complete title | `Traditional vs. AI-Powered Analytics Comparison` |
| `{VARIANT_NUM}` | Approved variant number | `5` |
| `{SCORE}` | Evaluation score (90-100) | `91` |
| `{TIER}` | Quality tier | `Excellent` or `Outstanding` |
| `{FILENAME}` | WebP filename | `traditional-vs-ai-5.webp` |
| `{BATCH_NUM}` | Batch number | `2` |
| `{KEY_FEATURE_N}` | Top 5 distinguishing features | `Outstanding festival context (crowd silhouette)` |
| `{STYLE_SCORE}` | EventAI style compliance score | `9.5` |
| `{PRACTICES_SCORE}` | Best practices score | `9` |
| `{DATA_SCORE}` | Data accuracy score | `10` |
| `{ACCESSIBILITY_SCORE}` | Accessibility score | `9` |
| `{GENERATION_METHOD}` | Tool used | `Gemini (Nano Banana) via browser automation` |
| `{NUM_BATCHES}` | Number of batches generated | `2` |
| `{TOTAL_VARIANTS}` | Total variants evaluated | `6` |
| `{TIME_MINUTES}` | Time to reach 90%+ | `36` |
| `{VISUAL_FILE_PATH}` | Path to approved webp | `docs/writing/5-analytics/visuals/traditional-vs-ai/traditional-vs-ai-5.webp` |
| `{EVAL_FILE_PATH}` | Path to evaluation report | `docs/writing/5-analytics/visuals/traditional-vs-ai/traditional-vs-ai.eval.md` |
| `{ADDITIONAL_FILES}` | Other files to commit | `- docs/writing/.../traditional-vs-ai-batch2.eval.md` |
| `{COMMIT_MSG_PATH}` | Path to this commit message | `docs/writing/.../COMMIT_MSG.md` |
| `{REJECTED_VARIANTS_LIST}` | List of rejected variants with scores | See example below |
| `{BACKUP_VARIANT_NOTE}` | Note about backup if applicable | `, delete #1-4` |
| `{GENERATION_DATE}` | ISO date | `December 30, 2025` |

---

## Rejected Variants List Format

```bash
# Batch #1 (none met 90%):
# - visual-name-1.webp (78%)
# - visual-name-2.webp (88%)
# - visual-name-3.webp (80%)

# Batch #2 (keep approved, optional cleanup):
# - visual-name-4.webp (87%) - below threshold
# - visual-name-5.webp (91%) ← KEEP (approved)
# - visual-name-6.webp (90%) ← KEEP (approved, backup)
```

---

## Automation Integration

### When to Generate

**Trigger:** Any variant reaches ≥90% evaluation score

**Location:** Same directory as visual files

**Filename:** `COMMIT_MSG.md`

### Evaluation Workflow Update

```python
# Pseudocode for /ig-evaluate skill integration
if best_variant_score >= 90:
    generate_commit_message(
        template_path=".claude/templates/infographic-commit-message.md",
        output_path=f"{visual_directory}/COMMIT_MSG.md",
        variables={...}
    )
    print(f"✅ Commit message generated: {output_path}")
    print("Ready to commit with: git commit -F {output_path}")
```

---

*Template created: December 30, 2025*
*Purpose: Automate commit message generation for approved infographics*
