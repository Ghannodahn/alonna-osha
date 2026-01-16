# OSHA Safety Claim Verification Command

## Purpose

Exhaustively verify that all safety claims, statistics, and guidance in a document are:
1. **Not contradicted** by official OSHA regulations, standards, and guidance
2. **Properly supported** by authoritative OSHA sources where applicable
3. **Accurately stated** with correct figures, thresholds, and requirements

## Verification Priority Structure

**Priority 1: CONTRADICTION CHECK (CRITICAL)**
- Does any claim directly contradict OSHA regulations or official guidance?
- Are safety thresholds, height requirements, or PPE standards misstated?
- Do any recommendations violate OSHA compliance requirements?

**Priority 2: ACCURACY VERIFICATION (HIGH)**
- Are statistics and figures accurately stated per OSHA/BLS/NIOSH data?
- Are regulatory thresholds (heights, weights, exposure limits) correct?
- Are citation numbers (CFR references) accurate?

**Priority 3: SOURCE SUPPORT (MEDIUM)**
- Which claims have direct OSHA regulatory support?
- Which claims are supported by OSHA guidance (non-regulatory)?
- Which claims lack any OSHA backing and need alternative sources?

---

## Core Approach

You are a rigorous OSHA compliance auditor. For each claim in the document:

1. **Extract** the specific safety claim or statistic
2. **Search** official OSHA sources for verification
3. **Compare** the claim against authoritative data
4. **Classify** as Verified / Contradicted / Unsupported / Partially Accurate

---

## Authoritative Source Hierarchy

### Tier 1: Binding OSHA Regulations (Highest Authority)
- **29 CFR 1910** - General Industry Standards
- **29 CFR 1926** - Construction Industry Standards
- **29 CFR 1915** - Shipyard Employment
- **29 CFR 1917/1918** - Marine Terminals / Longshoring

**URL Pattern:** `https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.XX`

### Tier 2: Official OSHA Guidance & Fact Sheets
- OSHA Safety and Health Topics pages
- OSHA Fact Sheets and Quick Cards
- OSHA Letters of Interpretation

**URL Pattern:** `https://www.osha.gov/[topic]`

### Tier 3: NIOSH & BLS Statistical Data
- Bureau of Labor Statistics (BLS) - Injury/fatality statistics
- NIOSH research publications
- Census of Fatal Occupational Injuries (CFOI)

**URL Patterns:**
- `https://www.bls.gov/iif/`
- `https://www.cdc.gov/niosh/`

### Tier 4: Industry Consensus Standards
- ANSI standards referenced by OSHA
- NFPA standards
- Manufacturer specifications

---

## Verification Process

### Phase 1: Claim Extraction

**Step 1: Identify all safety-related claims**

Extract and categorize:

| Category | Example Claims |
|----------|---------------|
| **Height thresholds** | "Falls from 6 feet require protection" |
| **Statistics** | "Falls are the leading cause of death in construction" |
| **PPE requirements** | "Hard hats required in all construction zones" |
| **Training requirements** | "Workers must be trained before using scaffolds" |
| **Exposure limits** | "Noise exposure limit is 90 dBA" |
| **Equipment standards** | "Guardrails must be 42 inches high" |
| **Procedure claims** | "Lockout/tagout required for maintenance" |

**Step 2: Create claims inventory**

```
| # | Claim | Category | Location | OSHA Ref (if cited) |
|---|-------|----------|----------|---------------------|
| 1 | "Most falls happen at 10ft or less" | Statistic | Line 23 | None |
| 2 | "Fall protection required at 6 feet" | Threshold | Line 45 | 1926.501 |
| 3 | "Hard hats prevent 85% of head injuries" | Statistic | Line 67 | None |
```

### Phase 2: OSHA Source Verification

**For each claim, search these sources in order:**

1. **OSHA Regulations (29 CFR)**
   - Search: `site:osha.gov/laws-regs [claim keywords]`
   - Check specific standard numbers if cited

2. **OSHA Topic Pages**
   - Search: `site:osha.gov [topic]`
   - Example: `site:osha.gov fall protection`

3. **BLS Injury Statistics**
   - Search: `site:bls.gov [statistic keywords]`
   - Check Census of Fatal Occupational Injuries

4. **NIOSH Publications**
   - Search: `site:cdc.gov/niosh [topic]`

**Step 3: Document findings for each claim**

```
CLAIM #1: "Most falls happen at 10ft or less"
-------------------------------------------------
CATEGORY: Statistic (fall heights)

OSHA REGULATION CHECK:
- No OSHA regulation makes this specific claim
- 1926.501(b)(1): Fall protection required at 6 feet (construction)
- 1910.28(b)(1): Fall protection required at 4 feet (general industry)

BLS/NIOSH DATA CHECK:
- BLS CFOI 2011: 25% of FATAL falls occur at 10 feet or less
- CDC MMWR: 50% of non-fatal ladder falls occur at 6-10 feet
- NIOSH: 90% of non-fatal ladder falls occur below 16 feet

VERDICT: PARTIALLY ACCURATE / NEEDS CLARIFICATION
- Claim is TRUE for non-fatal falls
- Claim is MISLEADING for fatal falls (only 25%)
- Recommend: Specify "non-fatal" or cite specific statistic

CORRECTION NEEDED: Yes
SUGGESTED REVISION: "Most non-fatal fall injuries occur at heights
under 16 feet, with 6-10 feet being the most common range for
ladder falls (CDC MMWR, 2014)"
```

### Phase 3: Regulatory Threshold Verification

**Critical thresholds to verify:**

| Requirement | Construction (1926) | General Industry (1910) |
|-------------|--------------------|-----------------------|
| Fall protection height | 6 feet | 4 feet |
| Guardrail height | 42" (+/- 3") | 42" (+/- 3") |
| Midrail height | 21" | 21" |
| Toeboard height | 3.5" minimum | 4" minimum |
| Scaffold platform width | 18" minimum | Varies |
| Ladder angle | 75.5 degrees | 75.5 degrees |

**For each threshold claim in document:**
```
CLAIM: "Guardrails must be 39-45 inches high"
OSHA STANDARD: 1926.502(b)(1) - "42 inches, plus or minus 3 inches"
CALCULATION: 42 +/- 3 = 39 to 45 inches
VERDICT: VERIFIED
```

### Phase 4: Statistical Claim Verification

**Common statistics to verify against BLS/NIOSH:**

| Claim Type | Verification Source |
|------------|-------------------|
| "Leading cause of death" | BLS CFOI annual reports |
| "X% of injuries from Y" | BLS Survey of Occupational Injuries |
| "X workers die per year" | BLS CFOI data |
| "Most common injury type" | BLS SOII data |

**Verification template:**

```
CLAIM: "Falls are the #1 cause of death in construction"
SOURCE CHECK: BLS Census of Fatal Occupational Injuries
YEAR OF DATA: [Specify year - statistics change annually]
ACTUAL DATA:
- 2022: Falls = 395 of 1,056 construction deaths (37.4%)
- Confirmed as leading cause for construction
VERDICT: VERIFIED (with year-specific data)
RECOMMENDATION: Add year citation for accuracy
```

---

## Verification Report Format

### Executive Summary

```markdown
# OSHA Verification Report: [Document Name]

**Verification Date:** [Date]
**Auditor:** Claude
**Document:** [File path]

## Overall Compliance Status

- Total claims analyzed: XX
- Verified with OSHA support: XX
- Partially accurate (needs revision): XX
- Contradicts OSHA guidance: XX
- Unsupported (no OSHA source): XX

## Risk Assessment

If any claims are marked as contradicting OSHA guidance, the document
should NOT be published until corrections are made.
```

### Detailed Findings

#### Category 1: OSHA Contradictions (CRITICAL - Must Fix)

```markdown
## CONTRADICTION #1

**Claim (Line XX):** "[Exact quote from document]"

**OSHA Standard:** 29 CFR 1926.XXX

**What OSHA Actually Says:** "[Quote from regulation]"

**Why This Contradicts:** [Explanation]

**Risk Level:** CRITICAL - Could result in:
- Non-compliance with OSHA standards
- Potential citations if followed
- Worker safety risk

**Required Correction:** [Specific fix needed]
```

#### Category 2: Accuracy Issues (HIGH - Should Fix)

```markdown
## ACCURACY ISSUE #1

**Claim (Line XX):** "Most falls happen at 10 feet or less"

**Verification Sources:**
- BLS CFOI 2011: 25% of fatal falls at 10ft or less
- CDC MMWR 2014: 50% of non-fatal ladder falls at 6-10ft

**Issue:** Claim conflates fatal and non-fatal statistics

**Accuracy Assessment:** PARTIALLY TRUE
- True for non-fatal ladder injuries
- Misleading for fatal falls (only 25%)

**Recommended Revision:**
"One in four fatal workplace falls occurs at 10 feet or less.
For non-fatal ladder injuries, falls from 6-10 feet are most
common, accounting for 50% of emergency department visits."

**Sources to cite:**
- BLS CFOI: https://www.bls.gov/iif/oshcfoi1.htm
- CDC MMWR: https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6316a2.htm
```

#### Category 3: Unsupported Claims (MEDIUM - Add Sources)

```markdown
## UNSUPPORTED CLAIM #1

**Claim (Line XX):** "[Quote]"

**OSHA Search Results:** No direct OSHA regulation or guidance found

**Alternative Sources Found:**
- [Industry source, if any]
- [Academic source, if any]

**Recommendation:**
- If claim is accurate: Add non-OSHA source citation
- If claim cannot be verified: Remove or revise
- Mark as "Industry best practice" rather than OSHA requirement
```

---

## Common OSHA Verification Patterns

### Pattern 1: Height Threshold Claims

**What to check:**
- Is the height correct for the specific industry?
- Construction (1926) vs General Industry (1910) distinction clear?
- Are exceptions mentioned where applicable?

**Example verification:**
```
CLAIM: "Fall protection is required at 6 feet"
CHECK: Is this for construction or general industry?
- Construction: YES, 6 feet per 1926.501(b)(1)
- General industry: NO, 4 feet per 1910.28(b)(1)
VERDICT: ACCURATE ONLY IF CONSTRUCTION CONTEXT IS CLEAR
```

### Pattern 2: "Leading Cause" Statistics

**What to check:**
- Is the year specified?
- Is the industry specified?
- Does BLS CFOI data support the claim?

**Example verification:**
```
CLAIM: "Falls are the leading cause of construction deaths"
CHECK: BLS CFOI data
2022 DATA:
- Falls: 395 deaths (37.4%)
- Struck by: 277 deaths (26.2%)
- Electrocution: 74 deaths (7.0%)
VERDICT: VERIFIED - Falls are #1 in construction
```

### Pattern 3: PPE Requirement Claims

**What to check:**
- Is PPE actually "required" by OSHA or just recommended?
- Is the specific standard cited?
- Are there industry-specific variations?

**Example verification:**
```
CLAIM: "Hard hats are required on all construction sites"
CHECK: 1926.100(a)
ACTUAL: "Employees working in areas where there is a possible
danger of head injury from impact, or from falling or flying
objects... shall be protected by protective helmets"
VERDICT: PARTIALLY ACCURATE
- Required WHERE there is danger, not universally
- Recommend: Add "where overhead hazards exist"
```

### Pattern 4: Training Requirement Claims

**What to check:**
- Is training specifically required by OSHA?
- What are the frequency requirements?
- Is documentation required?

**Example verification:**
```
CLAIM: "Workers must be trained annually on fall protection"
CHECK: 1926.503(a) and (c)
ACTUAL: Training required before exposure; retraining when:
- Changes in workplace render previous training obsolete
- Changes in fall protection systems
- Employee demonstrates lack of knowledge
VERDICT: CONTRADICTED
- No annual requirement specified
- Retraining is competency-based, not calendar-based
```

---

## Verification Checklist

### Before Publishing Any Safety Document:

- [ ] All regulatory threshold claims verified against current CFR
- [ ] Statistics cross-referenced with BLS/NIOSH data
- [ ] Year specified for any time-sensitive statistics
- [ ] Industry context (construction vs general industry) clear
- [ ] No claims contradict OSHA regulations
- [ ] Unsupported claims marked as "best practice" not "required"
- [ ] CFR citations accurate and complete
- [ ] Sources provided for all statistical claims

### Red Flags to Watch For:

- [ ] Claims using "always" or "never" (OSHA often has exceptions)
- [ ] Height thresholds without industry specification
- [ ] Statistics without year or source
- [ ] "OSHA requires..." without CFR citation
- [ ] Claims about training frequency not matching actual standards
- [ ] PPE claims suggesting universal requirements

---

## Key OSHA References

### Fall Protection
- **1926.501** - Duty to have fall protection (Construction)
- **1926.502** - Fall protection criteria and practices
- **1926.503** - Training requirements
- **1910.28** - Duty to have fall protection (General Industry)
- **1910.29** - Fall protection systems criteria

### Statistics Sources
- **BLS CFOI:** https://www.bls.gov/iif/oshcfoi1.htm
- **BLS SOII:** https://www.bls.gov/iif/soii-data.htm
- **NIOSH:** https://www.cdc.gov/niosh/
- **OSHA Fatality Reports:** https://www.osha.gov/fatalities

### Quick Reference URLs
- **OSHA Regulations:** https://www.osha.gov/laws-regs/regulations/standardnumber
- **OSHA Topics:** https://www.osha.gov/topics
- **OSHA Fact Sheets:** https://www.osha.gov/publications

---

## Usage

```bash
# Verify a single document
/verify-osha docs/safety-training/fall-protection-guide.md

# Verify multiple related documents
/verify-osha docs/safety-training/*.md
```

---

**Command maintained by:** Safety Content Team
**Last updated:** January 2026
**Version:** 1.0
