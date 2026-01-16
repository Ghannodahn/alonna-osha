# BBTW Safety Manual Errata Schema

## Overview

This schema defines how errata items are structured, categorized, and linked to the existing manual. Each erratum supplements specific manual sections without replacing them.

---

## Errata Categories

From PROJECT_GOAL.md:

| Category | Code | Description | Example |
|----------|------|-------------|---------|
| **Gaps** | `GAP` | Topics not covered at all | JHA, working above/below others |
| **Clarifications** | `CLR` | Ambiguous guidance made specific | When exactly is a mask required? |
| **Updates** | `UPD` | Changed standards or best practices | Current OSHA regulation changes |
| **Edge Cases** | `EDG` | "What about when..." scenarios | Ladder on soft ground |
| **Deep Dives** | `DPD` | Expanded coverage of high-risk topics | Extended ladder safety |

---

## Erratum Record Schema

```yaml
erratum:
  id: "ERR-{category}-{sequence}"  # e.g., ERR-GAP-001

  # Classification
  category: GAP | CLR | UPD | EDG | DPD
  priority: P0 | P1 | P2 | P3  # 0=critical safety, 3=nice-to-have

  # Manual Linkage
  affects_section: "MANUAL:{section-tag}"  # From manual-content-inventory.md
  insert_after: "Page X" | "Section Y"     # Suggested placement

  # Content
  title: "Short descriptive title"
  problem: "What's missing or unclear"
  solution: "What the errata will provide"

  # Tone & Format
  primary_tone: been-there | straight-talk | quick-hits
  format: insert-sheet | qr-card | companion-section | infographic

  # Status Tracking
  status: proposed | drafted | reviewed | approved | published
  created: YYYY-MM-DD
  updated: YYYY-MM-DD

  # Content (when drafted)
  content_file: "errata/{id}.md"  # Link to full content
```

---

## Section Tags Reference

For `affects_section` field:

| Tag | Manual Section | Pages |
|-----|----------------|-------|
| `MANUAL:intro` | Welcome, Program Overview | 1 |
| `MANUAL:tool-lists` | Necessary Tools | 2 |
| `MANUAL:tool-restrictions` | Nail gun/powder nailer prohibitions | 3 |
| `MANUAL:cutting-tools` | Manual & power cutting tools | 3-4 |
| `MANUAL:table-saw-warning` | Table saw instructor requirement | 4 |
| `MANUAL:shaping-drilling` | Shaping, drills, holding tools | 5 |
| `MANUAL:fastening` | Turning and fastening tools | 6 |
| `MANUAL:instructor-guide` | Class suggestions, activities | 7-8 |
| `MANUAL:ppe` | PPE list and images | 9 |
| `MANUAL:safety-philosophy` | "Importance of Safety" statement | 9 |
| `MANUAL:personal-safety` | Personal safety rules | 10 |
| `MANUAL:hand-tool-safety` | Hand tool safety rules | 10 |
| `MANUAL:power-tool-safety` | Power tool safety rules | 10-11 |
| `MANUAL:ladder-safety` | Ladder safety rules | 12 |
| `MANUAL:maintenance-safety` | Housekeeping rules | 12 |
| `MANUAL:summary` | Disclaimer and closing | 13 |
| `MANUAL:general` | Applies broadly | All |

---

## Priority Definitions

| Priority | Criteria | Response |
|----------|----------|----------|
| **P0** | Life-threatening gap, no current guidance | Immediate development |
| **P1** | Significant safety gap, brief current guidance | High priority |
| **P2** | Helpful clarification, existing guidance partial | Standard priority |
| **P3** | Enhancement, current guidance adequate | Backlog |

---

## Format Options

| Format | Use Case | Distribution |
|--------|----------|--------------|
| **Insert Sheet** | Multi-paragraph content | Physical insert in binder |
| **QR Card** | Quick reference with digital expansion | Pocket card |
| **Companion Section** | Major topic addition | Booklet supplement |
| **Infographic** | Visual safety reminder | Poster or handout |

---

## Tone Selection

Based on PROJECT_GOAL.md tone decisions:

| Context | Primary Tone | Rationale |
|---------|--------------|-----------|
| New safety topics | Been There | Builds trust through story |
| Quick reminders | Quick Hits | Jobsite-friendly brevity |
| Refresher content | Straight Talk | Efficient for experienced |

---

## Example Errata Records

### Example 1: Gap - Job Hazard Analysis

```yaml
erratum:
  id: ERR-GAP-001
  category: GAP
  priority: P1
  affects_section: MANUAL:safety-philosophy
  insert_after: "Page 9"
  title: "Job Hazard Analysis (JHA)"
  problem: "Manual has no guidance on assessing hazards before starting work"
  solution: "Provide simple JHA checklist volunteers can use"
  primary_tone: been-there
  format: insert-sheet
  status: proposed
  created: 2026-01-16
```

### Example 2: Clarification - PPE Selection

```yaml
erratum:
  id: ERR-CLR-001
  category: CLR
  priority: P2
  affects_section: MANUAL:ppe
  insert_after: "Page 9"
  title: "When to Wear What PPE"
  problem: "PPE listed but no guidance on which activities require which items"
  solution: "Activity-to-PPE mapping table"
  primary_tone: quick-hits
  format: qr-card
  status: proposed
  created: 2026-01-16
```

### Example 3: Edge Case - Ladder on Soft Ground

```yaml
erratum:
  id: ERR-EDG-001
  category: EDG
  priority: P2
  affects_section: MANUAL:ladder-safety
  insert_after: "Page 12"
  title: "Ladder Setup on Soft or Uneven Ground"
  problem: "Manual says 'don't place on uneven surface' but not what to do instead"
  solution: "Guidance on leg levelers, plywood bases, when to NOT use ladder"
  primary_tone: been-there
  format: insert-sheet
  status: proposed
  created: 2026-01-16
```

---

## File Organization

```
docs/
  content/
    errata-schema.md          # This file
    errata-baseline.md        # All proposed errata
    errata/
      ERR-GAP-001.md          # Individual errata content
      ERR-CLR-001.md
      ...
```

---

## Revision Workflow Integration

See [errata-revision-workflow.md](errata-revision-workflow.md) for:
- Status transitions
- Review process
- Publication checklist
