# Content Validation Command

## Purpose

Verify that content directly answers its question cleanly and thoroughly, then exhaustively validate all claims, statistics, citations, and sources for factual accuracy, internal consistency, and proper attribution.

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

## Core Approach

You are a meticulous fact-checker and academic reviewer. Analyze the provided content with extreme attention to detail:

**FIRST:** Verify the content answers its stated question without sideramps
**THEN:** Track every claim, statistic, citation, and source reference for accuracy

---

## What to Validate

### 1. Quantitative Claims (Statistics, Metrics, Percentages)

**Track and verify:**
- Numbers, percentages, ranges (e.g., "40-41%", "50%+", "$200,000")
- Dates and time periods (e.g., "2024", "December 2024", "2019-2022")
- Sample sizes and population counts (e.g., "500+ planners", "7,585 of 17,462")
- Financial figures (e.g., "€200,000 fine", "$1.375 billion settlement")
- Performance metrics (e.g., "50% reduction", "13x ROI", "2 seconds entry time")

**Consistency checks:**
- Same claim appears with same exact figure everywhere
- Ranges are consistently stated (not "40-41%" in one place and "~40%" elsewhere)
- Units are consistent (percentages vs decimals, thousands vs millions)

### 2. Qualitative Claims (Facts, Events, Entities)

**Track and verify:**
- Organization/company names (spelling, full vs abbreviated)
- Individual names and titles
- Technology/product names
- Geographic locations
- Event names and dates
- Legal case names and decision numbers

**Consistency checks:**
- Organizations named identically across occurrences (not "FC Copenhagen" and "FC Copenhagen stadium")
- Individual names and titles correct and consistent
- Event names standardized

### 3. Citations and Source Attribution

**Track and verify:**
- Inline citations (parenthetical references to sources)
- Direct quotes (must have source attribution)
- Study/report names and authors
- Legal decisions (case numbers, dates, jurisdictions)
- URL references

**Attribution checks:**
- Every factual claim has a source (either inline or contextual)
- Sources exist in source catalog
- Citations match source catalog entries
- No "orphan claims" (statistics without attribution)

### 4. Source Catalog Completeness

**Track and verify:**
- All cited sources appear in catalog
- All catalog sources are cited at least once in text
- URLs are complete and properly formatted
- Source metadata is accurate (authors, dates, titles)
- Tier classification is appropriate (Tier 1/2/3/4)

---

## Validation Process

### Phase 1: Extraction & Inventory

**Step 1: Extract all quantitative claims**
```
Create a master table:
| Claim | Value | Context | Location(s) | Source |
|-------|-------|---------|-------------|--------|
| DICE ticket sales | 40-41% | AI-powered recommendations | Line 23, Line 156 | TechCrunch 2025 |
| MWC opt-in rate | 43% | Facial recognition | Line 87 | GSMA data |
```

**Step 2: Extract all entity references**
```
Track organizations, people, events:
- FC Copenhagen (Lines: 31, 89, 142)
- Danish DPA (Lines: 30, 45, 67) [Also: "Datatilsynet" - same entity?]
- Mobile World Congress (Lines: 11, 87) [Also: "MWC" - verify consistency]
```

**Step 3: Map all citations**
```
Create citation index:
| Citation | Lines | Source Catalog Entry | Status |
|----------|-------|---------------------|---------|
| (Danish DPA Decision 2024-51-0012) | 31, 45 | ✅ Tier 1 #81 | VERIFIED |
| (GSMA €200K fine) | 87 | ✅ Tier 1 #88 | VERIFIED |
| (Gartner study) | 234 | ❌ NOT IN CATALOG | MISSING |
```

**Step 4: Extract all source URLs**
```
From source catalog, create URL inventory:
- https://gdprhub.eu/index.php?title=Datatilsynet_(Denmark)_-_2024-51-0012
- https://techcrunch.com/2023/05/08/gsma-mwc-aedp-gdpr-dpia-fine/

Check for:
- Dead links (404s)
- Redirect chains
- Duplicate URLs with different formatting
```

### Phase 2: Consistency Analysis

**Step 1: Cross-reference identical claims**

For each unique claim, verify all instances use identical values:

```
CLAIM: DICE AI-powered ticket sales percentage
- Line 23: "40-41% of ticket sales" ✅
- Line 156: "40-41% verified" ✅
- Line 234: "nearly 50%" ❌ INCONSISTENT - FLAG FOR CORRECTION

ACTION: Determine authoritative value from source catalog
```

**Step 2: Verify entity name consistency**

```
ENTITY: FC Copenhagen
- Line 31: "FC Copenhagen" ✅
- Line 89: "FC Copenhagen's Parken Stadium" ✅
- Line 142: "Copenhagen FC" ❌ INCONSISTENT - STANDARDIZE

ENTITY: Danish Data Protection Authority
- Line 30: "Danish DPA" ✅
- Line 45: "Datatilsynet" ⚠️ SAME ENTITY, DIFFERENT NAME
- Line 67: "Denmark's data protection authority" ⚠️ DESCRIPTIVE REFERENCE

ACTION: Standardize to "Danish DPA (Datatilsynet)" on first use, "Danish DPA" thereafter
```

**Step 3: Validate numerical consistency**

```
PATTERN CHECK: Ranges and approximations
- "40-41%" vs "~40%" vs "approximately 40%" vs "40-41 percent"
  → STANDARDIZE to: "40-41%" (use exact range with % symbol)

- "€200,000" vs "€200K" vs "200,000 euros"
  → STANDARDIZE to: "€200,000" (use currency symbol, full number)

- "50%+" vs "50% or more" vs "over 50%"
  → STANDARDIZE to: "50%+" (use + symbol for "or more")
```

### Phase 3: Source Verification

**Step 1: Match claims to sources**

For each claim, verify source exists and supports the claim:

```
CLAIM: "Cleveland Browns achieved 50%+ season ticket holder enrollment"
SOURCE CHECK:
- Cited source: Stadium Tech Report (Tier 2 #97)
- URL: https://stadiumtechreport.com/feature/wickets-facial-authentication...
- ✅ VERIFIED: Article states "more than 50% of season ticket holders"

CLAIM: "Mobile World Congress saw 43% opt-in (7,585 of 17,462 attendees)"
SOURCE CHECK:
- Cited source: GSMA (Tier 1 #88)
- URL: https://techcrunch.com/2023/05/08/gsma-mwc-aedp-gdpr-dpia-fine/
- ✅ VERIFIED: TechCrunch article confirms 43% figure
- ⚠️ NOTE: Is this GSMA data or TechCrunch reporting? Clarify attribution
```

**Step 2: Check for orphan claims**

```
ORPHAN CLAIM DETECTION:
Find claims without clear source attribution

❌ Line 234: "Studies show that 67% of users experienced inaccurate personalization"
   → No parenthetical citation, no contextual source
   → SEARCH source catalog for "67%" and "personalization"
   → FOUND: BCG study (Tier 2 #XX) - ADD CITATION

❌ Line 456: "Only 3 universities integrate AI into event management curriculum"
   → No source cited
   → VERIFY: Is this from education-curriculum.research.md?
   → ADD ATTRIBUTION
```

**Step 3: Validate source catalog completeness**

```
FORWARD CHECK (Text → Catalog):
- All cited sources in text appear in catalog? ✅/❌

BACKWARD CHECK (Catalog → Text):
- All catalog sources cited in text? ✅/❌
- If source listed but not cited: Why is it in catalog?

DEAD LINK CHECK:
- Test URLs for 404s, redirects, paywalls
- Flag sources that are inaccessible
```

### Phase 4: Cross-Document Consistency

**For multi-file validation:**

**Step 1: Build global claims database**

```
Scan all provided documents and create unified database:
| Claim | Value | Document 1 | Document 2 | Document 3 | Consistent? |
|-------|-------|------------|------------|------------|-------------|
| DICE sales | 40-41% | transformation/draft.md:L23 | analytics/draft.md:L156 | - | ✅ |
| MWC opt-in | 43% | privacy/draft.md:L87 | analytics/draft.md:L234 | transformation/draft.md:L445 | ✅ |
| Gartner negative exp | 53% | personalization/draft.md:L123 | privacy/draft.md:L289 | - | ⚠️ CHECK |
```

**Step 2: Flag cross-document inconsistencies**

```
INCONSISTENCY DETECTED:
- transformation/draft.md:L234: "nearly 50% of ticket sales via AI"
- analytics/draft.md:L156: "40-41% of ticket sales (verified)"

RESOLUTION:
- Check transformation-attendee.research.md for authoritative value
- Correction needed: transformation/draft.md should use "40-41%"
- UPDATE: Line 234 in transformation/draft.md
```

**Step 3: Verify source catalog deduplication**

```
CHECK: Are sources duplicated across document source catalogs?
- transformation/draft.md sources
- analytics/draft.md sources
- privacy/draft.md sources

DEDUPLICATE:
- Same URL appearing in multiple catalogs with different formatting
- Consolidate or ensure identical formatting
```

---

## Validation Report Format

### Executive Summary

```markdown
# Validation Report: [Document Name]

**Validation Date:** [Date]
**Validator:** Claude Sonnet 4.5
**Document(s):** [List of files]

## Overall Status
- ✅ **PASS** - All claims verified, sources accurate, consistency maintained
- ⚠️ **PASS WITH WARNINGS** - Minor inconsistencies found, recommendations provided
- ❌ **FAIL** - Critical errors found, corrections required before publication

## Summary Statistics
- **Quantitative claims tracked:** 127
- **Qualitative claims tracked:** 89
- **Citations verified:** 156
- **Sources in catalog:** 134
- **Inconsistencies found:** 8
- **Orphan claims found:** 3
- **Dead links found:** 2
```

### Detailed Findings

#### 1. Inconsistencies (CRITICAL)

```markdown
## Inconsistency #1: DICE AI Sales Percentage

**Issue:** Same claim stated with different values across document

**Occurrences:**
- Line 23: "40-41% of ticket sales" ✅ CORRECT
- Line 234: "nearly 50% of ticket sales" ❌ INCORRECT
- Line 445: "40-41% verified" ✅ CORRECT

**Source verification:**
- Authoritative source: transformation-attendee.research.md
- TechCrunch 2025 reporting confirms: 40-41%
- DICE partners page confirms: 40-41%

**Correction required:**
Line 234: Change "nearly 50%" → "40-41%"

**Priority:** 🔴 CRITICAL - Factual error
```

#### 2. Missing Citations (HIGH PRIORITY)

```markdown
## Missing Citation #1: BCG Personalization Study

**Issue:** Orphan claim without source attribution

**Occurrence:**
- Line 234: "67% of users experienced inaccurate personalization"

**Source verification:**
- Located in source catalog: BCG Consumer Sentiment Study (Tier 2)
- URL: [verified accessible]

**Correction required:**
Add inline citation: "67% of users experienced inaccurate personalization (BCG Consumer Sentiment Study, 2023)"

**Priority:** 🟡 HIGH - Claim needs attribution
```

#### 3. Entity Name Inconsistencies (MEDIUM PRIORITY)

```markdown
## Entity Inconsistency #1: FC Copenhagen

**Issue:** Organization name varies across document

**Occurrences:**
- Line 31: "FC Copenhagen" ✅ STANDARD
- Line 89: "FC Copenhagen's Parken Stadium" ✅ ACCEPTABLE
- Line 142: "Copenhagen FC" ❌ INCONSISTENT

**Recommendation:**
Standardize to "FC Copenhagen" (official name)

**Priority:** 🟠 MEDIUM - Consistency improvement
```

#### 4. Source Catalog Issues (LOW PRIORITY)

```markdown
## Source Catalog #1: Dead Link Detected

**Issue:** URL returns 404

**Occurrence:**
- Source catalog entry #45
- URL: https://example.com/article/defunct-page
- Cited in: Lines 234, 456, 678

**Recommendation:**
- Find archived version (Wayback Machine)
- Or replace with updated URL
- Or remove citation if source unrecoverable

**Priority:** 🟢 LOW - Source accessibility
```

### Consistency Matrix

```markdown
## Cross-Reference Table: Key Claims

| Claim | Authoritative Value | All Occurrences | Status |
|-------|-------------------|-----------------|--------|
| DICE AI sales | 40-41% | L23✅, L234❌, L445✅ | ⚠️ 1 correction needed |
| MWC opt-in rate | 43% (7,585/17,462) | L87✅, L234✅, L445✅ | ✅ Consistent |
| Cleveland Browns enrollment | 50%+ season tickets | L45✅, L89✅ | ✅ Consistent |
| Danish DPA decision date | December 2024 | L31✅, L67✅, L234✅ | ✅ Consistent |
| GDPR fine amounts | €200,000 | L87✅, L123❌ (missing €), L456✅ | ⚠️ 1 formatting fix |

## Entity Consistency Table

| Entity | Standard Name | Occurrences | Inconsistencies |
|--------|--------------|-------------|----------------|
| FC Copenhagen | FC Copenhagen | L31, L89, L142 | L142: "Copenhagen FC" ❌ |
| Danish DPA | Danish DPA (Datatilsynet) | L30, L45, L67 | L67: "Denmark's DPA" (acceptable descriptive) |
| Mobile World Congress | Mobile World Congress | L11, L87 | L87: "MWC" (acceptable abbreviation) |

## Source Verification Table

| Source | Tier | Cited in Text | In Catalog | URL Status | Status |
|--------|------|--------------|------------|------------|--------|
| Danish DPA Decision 2024-51-0012 | 1 | L31, L45 | ✅ Entry #81 | ✅ Accessible | ✅ VERIFIED |
| GSMA MWC Fine | 1 | L87 | ✅ Entry #88 | ✅ Accessible | ✅ VERIFIED |
| Cleveland Browns/Wicket | 2 | L45, L89, L123 | ✅ Entry #97 | ✅ Accessible | ✅ VERIFIED |
| BCG Personalization | 2 | L234 ❌ | ✅ Entry #102 | ✅ Accessible | ⚠️ CITATION MISSING |
```

---

## Recommendations & Action Items

```markdown
## Critical Corrections (Must Fix Before Publication)

1. **Line 234:** Change "nearly 50%" → "40-41%" (DICE sales)
2. **Line 234:** Add citation for 67% BCG claim
3. **Line 123:** Add € symbol to "200,000 fine"

## High Priority Improvements (Recommended)

4. **Line 142:** Change "Copenhagen FC" → "FC Copenhagen"
5. **Line 456:** Add attribution for "3 universities" claim
6. **Source Catalog Entry #45:** Find replacement URL or archive link

## Optional Enhancements (Nice to Have)

7. **Cross-document:** Ensure transformation/draft.md and analytics/draft.md use identical phrasing for shared claims
8. **Source catalog:** Add access dates for all URLs
9. **Abbreviations:** Create abbreviation index for first-use definitions (MWC, GDPR, DPIA, etc.)
```

---

## Validation Checklist

Use this checklist to ensure comprehensive validation:

### Quantitative Claims
- [ ] All statistics extracted and indexed
- [ ] Cross-referenced across all occurrences
- [ ] Verified against source catalog
- [ ] Ranges/approximations standardized (40-41% not ~40%)
- [ ] Units consistent (% vs percent, K vs 000, € vs EUR)

### Qualitative Claims
- [ ] All entity names extracted
- [ ] Spelling and capitalization standardized
- [ ] Abbreviations defined on first use
- [ ] Legal case names verified (format, docket numbers)
- [ ] Event names and dates confirmed

### Citations & Attribution
- [ ] Every factual claim has a source
- [ ] All inline citations match catalog entries
- [ ] No orphan claims (statistics without sources)
- [ ] Direct quotes attributed correctly
- [ ] Paraphrased claims have contextual attribution

### Source Catalog
- [ ] All text citations appear in catalog
- [ ] All catalog sources cited at least once
- [ ] URLs tested for accessibility
- [ ] Dead links flagged with alternatives
- [ ] Tier classifications appropriate
- [ ] Source metadata accurate (authors, dates, titles)

### Cross-Document Consistency
- [ ] Shared claims use identical values across files
- [ ] Entity names standardized across documents
- [ ] Source catalogs deduplicated or harmonized
- [ ] Abbreviations defined consistently

### Quality Assurance
- [ ] Validation report generated
- [ ] Critical errors flagged for immediate correction
- [ ] Recommendations prioritized (critical/high/medium/low)
- [ ] Action items clearly documented

---

## Usage Instructions

### For Single Document

```bash
# Validate a single draft
validate docs/research/transformation/draft.md

# Output: Validation report with findings and corrections
```

### For Multiple Documents (Cross-Document Validation)

```bash
# Validate all research drafts for consistency
validate docs/research/transformation/draft.md docs/research/analytics/draft.md docs/research/privacy/draft.md

# Output: Cross-document consistency report
```

### For Research + Sources Pair

```bash
# Validate draft against its research file
validate docs/research/transformation/draft.md docs/research/transformation/transformation-attendee.research.md

# Ensures all research findings properly integrated and cited
```

---

## Special Validation Cases

### Legal Citations

**Format requirements:**
- Case names: *Italicized* or **bold**
- Docket numbers: Exact format from court
- Dates: Consistent format (Month DD, YYYY or YYYY-MM-DD)
- Jurisdiction: Clearly identified

**Example:**
```
✅ CORRECT: Danish DPA Decision 2024-51-0012 (December 2024)
❌ INCORRECT: Danish DPA decision (2024)
```

### Financial Figures

**Consistency requirements:**
- Currency symbols: € not EUR, $ not USD
- Thousands separator: $1,000,000 or $1M (not $1000000)
- Decimals: Consistent precision (€200,000.00 or €200,000)

**Example:**
```
✅ CORRECT: €200,000 fine
✅ CORRECT: $1.375 billion settlement
❌ INCORRECT: 200000 euro fine
❌ INCORRECT: $1,375,000,000 settlement
```

### Percentages and Rates

**Format standardization:**
- Use % symbol, not "percent" in data-dense text
- Ranges use hyphen: 40-41% (not 40%-41% or 40 to 41%)
- "Or more" uses +: 50%+ (not 50% or more, >50%)
- Approximations use ~: ~40% (not approximately 40%)

**Example:**
```
✅ CORRECT: 40-41% of ticket sales
✅ CORRECT: 50%+ enrollment rate
✅ CORRECT: ~40% opt-in
❌ INCORRECT: 40-41 percent
❌ INCORRECT: 50% or higher
❌ INCORRECT: approximately 40%
```

### Organization Names

**Consistency rules:**
- Use official name on first mention
- Acceptable to use common abbreviation after definition
- Don't invent abbreviations not used by organization

**Example:**
```
✅ CORRECT: "Danish Data Protection Authority (Datatilsynet)" → "Danish DPA" thereafter
✅ CORRECT: "Mobile World Congress" → "MWC" thereafter
❌ INCORRECT: "Copenhagen Football Club" when official name is "FC Copenhagen"
❌ INCORRECT: "AEPD Spain" when "Spain's AEPD" or "Spanish AEPD" is standard
```

---

## Common Validation Patterns

### Pattern 1: Orphan Statistics

**Problem:** Statistics appear without attribution

**Detection:**
```
Line 234: "Studies show 67% of users experienced negative personalization"
         ↑ Which studies? No citation provided
```

**Resolution:**
```
1. Search source catalog for "67%" and "personalization"
2. If found: Add inline citation
3. If not found: Flag as missing source - author must provide
```

### Pattern 2: Inconsistent Repeated Claims

**Problem:** Same claim stated differently across document

**Detection:**
```
Line 45:  "40-41% of DICE ticket sales from AI recommendations"
Line 234: "nearly 50% of tickets sold via AI"
Line 456: "approximately 40% of sales"
```

**Resolution:**
```
1. Identify authoritative source
2. Determine exact value from source
3. Standardize all occurrences to authoritative value
4. FLAG all deviations for correction
```

### Pattern 3: Formatting Inconsistency

**Problem:** Same data formatted differently

**Detection:**
```
Line 45:  "€200,000 fine"
Line 123: "200000 euro fine"
Line 234: "EUR 200K fine"
```

**Resolution:**
```
Standardize to: "€200,000 fine" (currency symbol, comma separators)
```

### Pattern 4: Source Catalog Mismatch

**Problem:** Citation in text doesn't match catalog entry

**Detection:**
```
TEXT: "According to the Danish DPA decision (2024-51-0012)..."
CATALOG: Entry #81 - "Datatilsynet Denmark Decision 2024-51-0012"
         ↑ Match confirmed ✅

TEXT: "GSMA study showed 43% opt-in..."
CATALOG: [No entry for GSMA study]
         ↑ Missing source ❌
```

**Resolution:**
```
1. Verify source exists
2. If missing from catalog: Add entry
3. If misnamed: Standardize text to match catalog
```

---

## Quality Standards

### Validation is COMPLETE when:

✅ **100% of quantitative claims verified**
- Every statistic traced to source
- All occurrences consistent
- Formatting standardized

✅ **100% of citations matched to sources**
- Every claim has attribution
- All sources in catalog
- No orphan claims

✅ **Entity names standardized**
- Organizations named consistently
- Abbreviations defined on first use
- Legal case names properly formatted

✅ **Cross-document consistency verified**
- Shared claims use identical values
- No conflicting data across files

✅ **Source catalog complete**
- All cited sources included
- URLs tested and accessible
- Tier classifications appropriate

### Validation is INCOMPLETE if:

❌ Any statistics lack source attribution
❌ Same claim stated with different values
❌ Citations reference non-existent catalog entries
❌ Dead links without alternatives provided
❌ Entity names inconsistently capitalized/spelled
❌ Cross-document contradictions unresolved

---

## Anti-Patterns (What NOT to Do)

❌ **Don't accept "approximately" as substitute for exact figures:**
```
Bad: "approximately 40%" when source says "40-41%"
Good: Use exact figure from source: "40-41%"
```

❌ **Don't ignore minor inconsistencies:**
```
Bad: "€200,000" and "200000 euros" are close enough
Good: Standardize to single format across document
```

❌ **Don't skip source verification for "common knowledge":**
```
Bad: "Everyone knows GDPR fines can be up to €20M" [no citation]
Good: "GDPR Article 83(5): fines up to €20M or 4% global turnover"
```

❌ **Don't assume entity names without verification:**
```
Bad: "Copenhagen FC" seems like it could be right
Good: Verify official name is "FC Copenhagen"
```

---

## Automation Support

### For automated validation (future enhancement):

**Regex patterns for claim extraction:**
```regex
# Percentages
\d+(?:\.\d+)?%[\+\-]?|\d+-\d+%|~\d+%

# Currency amounts
[€$£¥]\s?\d+(?:,\d{3})*(?:\.\d{2})?(?:\s?[KMB](?:illion)?)?

# Dates
(?:January|February|...|December)\s+\d{1,2},?\s+\d{4}|\d{4}-\d{2}-\d{2}

# Legal case numbers
\d{4}-\d{2,}-\d{4,}|EXP\d+
```

**Citation pattern matching:**
```regex
# Parenthetical citations
\([^)]*\d{4}[^)]*\)

# Source catalog references
https?://[^\s]+
```

---

## Final Notes

**Philosophy:** Trust but verify - every claim, every source, every citation.

**Rigor over speed:** Thorough validation may take hours for a comprehensive document. This is time well spent to ensure academic integrity.

**When in doubt, flag it:** If you cannot definitively verify a claim, mark it for author review rather than making assumptions.

**Document everything:** The validation report should be so detailed that anyone can trace your verification process and reproduce your findings.

---

**Command maintained by:** Research Team
**Last updated:** December 28, 2025
**Version:** 1.0
