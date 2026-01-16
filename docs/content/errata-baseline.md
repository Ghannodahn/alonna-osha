# BBTW Safety Manual Errata Baseline

**Version:** 1.1
**Created:** 2026-01-16
**Updated:** 2026-01-16
**Source:** Manual content analysis + gap analysis + priority matrix

This document establishes the initial set of errata items that supplement the Building Beyond The Walls safety manual. Each erratum addresses a gap, clarification, or expansion identified in the content analysis.

## Content Status Summary

| Status | Count | Items |
|--------|-------|-------|
| **drafted** | 8 | ERR-GAP-001, 002, 003, 004, 005, 006, 008 + discovery docs integrated |
| **proposed** | 12 | Remaining P1/P2/P3 items |

Drafted content files are in `docs/content/errata/`.

---

## Quick Reference: Errata by Priority

| Priority | Count | Topics |
|----------|-------|--------|
| **P0 Critical** | 5 | Electrical, Fall Protection, Emergency, Struck-By, Heat |
| **P1 High** | 7 | Manual Handling, PPE, JHA, Ladder, Roles, Incidents, First Aid |
| **P2 Medium** | 8 | Hand Tools, Power Tools, Caught-In, Cords, Communication, Silica, Housekeeping, Scaffold |
| **P3 Low** | 6 | Tone/format improvements |

---

## P0: Critical Priority Errata

### ERR-GAP-001: Electrical Safety

```yaml
id: ERR-GAP-001
category: GAP
priority: P0
affects_section: MANUAL:power-tool-safety
insert_after: Page 11
title: Electrical Safety Essentials
problem: |
  Zero coverage of electrical hazards beyond "check cords for damage."
  Electrocution is OSHA Focus Four hazard (8% of construction fatalities).
  Volunteers encounter extension cords, power tools, temporary power daily.
solution: |
  New section covering: GFCI requirements, water + electricity hazards,
  overhead powerline awareness, extension cord load limits, what to do
  if you encounter exposed wiring.
primary_tone: straight-talk
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-001.md
osha_reference: 29 CFR 1926.400-449
```

---

### ERR-GAP-002: Fall Protection Beyond Ladders

```yaml
id: ERR-GAP-002
category: GAP
priority: P0
affects_section: MANUAL:ladder-safety
insert_after: Page 12
title: Fall Protection - The 6-Foot Rule and Beyond
problem: |
  Manual covers ladders but ignores broader fall protection:
  - 6-foot rule (OSHA requires fall protection at 6+ feet)
  - Scaffold safety basics
  - Edge/opening hazards (floor holes, roof edges)
  - Guardrail requirements
  Falls are #1 cause of construction fatalities (39%).
solution: |
  New section on fall protection beyond ladders. Focus on
  hazard recognition and when to NOT proceed without proper protection.
primary_tone: been-there
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-002.md
osha_reference: 29 CFR 1926.501-503
```

---

### ERR-GAP-003: Emergency Response Procedures

```yaml
id: ERR-GAP-003
category: GAP
priority: P0
affects_section: MANUAL:safety-philosophy
insert_after: Page 13 (new final section)
title: Emergency Response - Know Before You Need It
problem: |
  Current guidance: "notify the instructor and site coordinator immediately."
  Missing: exit locations, assembly points, emergency numbers, chain of command,
  what constitutes an emergency, evacuation signals.
solution: |
  New section with site-specific template for:
  - Who is the safety contact (name, location)
  - Emergency numbers posted
  - Assembly point
  - Evacuation signal
  - When to call 911 vs. handle on-site
primary_tone: quick-hits
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-003.md
```

---

### ERR-GAP-004: Struck-By / Working Above and Below Others

```yaml
id: ERR-GAP-004
category: GAP
priority: P0
affects_section: MANUAL:personal-safety
insert_after: Page 10
title: Working Above and Below Others
problem: |
  No mention of falling object risks:
  - Hard hat zones (when/where required)
  - Working above/below others coordination
  - Tool securing at height
  - Drop zone establishment
  Struck-by hazards cause approximately 10% of construction deaths (2023 BLS data).
solution: |
  Integrate discovery document 09-working-above-below.md content.
  Core messages: drop zones, communication before action, tool securing,
  hard hat requirements in active zones.
content_ready: docs/discovery/09-working-above-below.md
primary_tone: straight-talk
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-004.md
osha_reference: 29 CFR 1926.451(h), 1926.502(j)
```

---

### ERR-GAP-005: Heat Illness Prevention

```yaml
id: ERR-GAP-005
category: GAP
priority: P0
affects_section: MANUAL:personal-safety
insert_after: Page 10
title: Heat Safety - Water, Rest, Shade
problem: |
  Zero coverage of heat-related hazards.
  50-70% of outdoor heat fatalities occur in first few days of exposure -
  exactly the profile of new volunteers.
  OSHA enforcement priority.
solution: |
  New section on:
  - Water/rest/shade requirements
  - Heat acclimatization for new workers
  - Signs of heat exhaustion vs. heat stroke
  - What to do when someone shows symptoms
primary_tone: been-there
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-005.md
osha_reference: General Duty Clause; Heat NEP
```

---

## P1: High Priority Errata

### ERR-GAP-006: Manual Handling / The Golden Rule

```yaml
id: ERR-GAP-006
category: DPD
priority: P1
affects_section: MANUAL:personal-safety
insert_after: Page 10 (after "lift with legs")
title: The Golden Rule of Manual Handling
problem: |
  Current guidance: "Always lift with your legs, not your back" (one sentence).
  Missing: weight guidance, team lifts, path planning, permission to ask for help.
  MSDs are a leading cause of construction injuries, with nearly half of workers reporting symptoms.
solution: |
  Integrate discovery document 07-manual-handling-golden-rule.md.
  Core message: "If it feels too heavy, it is." Permission to ask for help.
content_ready: docs/discovery/07-manual-handling-golden-rule.md
primary_tone: been-there
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-006.md
```

---

### ERR-CLR-007: PPE - When, Why, and How

```yaml
id: ERR-CLR-007
category: CLR
priority: P1
affects_section: MANUAL:ppe
insert_after: Page 9
title: PPE Selection Guide - What to Wear When
problem: |
  PPE list shows 9 items with no guidance on when each is required.
  Creates confusion (wear all 9 always?) and compliance fatigue.
solution: |
  Restructure into:
  - Always required (baseline)
  - Task-specific (when doing X, add Y)
  - Available as needed (optional based on comfort/conditions)
  Add inspection and fit guidance.
primary_tone: quick-hits
format: qr-card
status: proposed
osha_reference: 29 CFR 1926.95 (PPE fit requirement)
```

---

### ERR-GAP-008: Job Hazard Analysis Thinking

```yaml
id: ERR-GAP-008
category: GAP
priority: P1
affects_section: MANUAL:safety-philosophy
insert_after: Page 9 (before safety rules)
title: The 3-Question Check - Think Before You Start
problem: |
  No pre-task hazard assessment guidance.
  Most injuries happen when workers don't anticipate hazards.
solution: |
  Integrate discovery document 08-job-hazard-analysis.md.
  Core framework: What could go wrong? What would happen? How do I prevent it?
content_ready: docs/discovery/08-job-hazard-analysis.md
primary_tone: been-there
format: insert-sheet
status: drafted
content_file: errata/ERR-GAP-008.md
```

---

### ERR-DPD-009: Ladder Safety Expansion

```yaml
id: ERR-DPD-009
category: DPD
priority: P1
affects_section: MANUAL:ladder-safety
insert_after: Page 12
title: Ladder Safety - The Complete Picture
problem: |
  Good foundation exists but missing:
  - 4-to-1 ratio rule (1 foot out for every 4 feet up)
  - 3-foot extension above landing for roof access
  - Weight rating selection
  - Setup on uneven ground (leg levelers, plywood bases)
  - Carrying materials while climbing (use rope/bucket)
solution: |
  Expand existing ladder section with missing OSHA elements.
  Add practical guidance for common volunteer situations.
primary_tone: been-there
format: insert-sheet
status: proposed
osha_reference: 29 CFR 1926.1053
```

---

### ERR-CLR-010: Role Clarity - Who is the "Instructor"?

```yaml
id: ERR-CLR-010
category: CLR
priority: P1
affects_section: MANUAL:general
title: Know Your Safety Contacts
problem: |
  Multiple references to "notify the instructor" without defining who this is.
  Volunteers may not know who the "instructor" is or where to find them.
solution: |
  Define roles clearly:
  - Site Lead / Supervisor (on-site authority)
  - Safety Contact (first person to notify of hazards)
  - Project Manager (escalation point)
  Add to orientation: "Your safety contact today is [NAME], wearing [identifier]."
primary_tone: quick-hits
format: insert-sheet (template)
status: proposed
```

---

### ERR-GAP-011: Incident Reporting Guidance

```yaml
id: ERR-GAP-011
category: GAP
priority: P1
affects_section: MANUAL:safety-philosophy
insert_after: Page 9
title: What to Report and Why It Matters
problem: |
  No guidance on what to report or when.
  Missing: near-miss reporting, minor injury reporting, why reporting matters.
solution: |
  New section covering:
  - What counts as reportable (injuries, near-misses, hazards)
  - Who to tell
  - Why reporting prevents future incidents
  - No-blame culture for honest reporting
primary_tone: straight-talk
format: insert-sheet
status: proposed
```

---

### ERR-DPD-012: First Aid Specifics

```yaml
id: ERR-DPD-012
category: DPD
priority: P1
affects_section: MANUAL:personal-safety
title: First Aid - Location, Contents, and When to Escalate
problem: |
  Current: "First aid kits will be located on the site or in the storage trailer."
  Missing: where exactly, what's inside, when to use vs. escalate to 911.
solution: |
  New guidance:
  - First aid kit must be identified at start of each day
  - Common contents overview
  - "Use first aid for..." vs. "Call 911 for..."
  - Bloodborne pathogen awareness (gloves for any blood)
primary_tone: quick-hits
format: qr-card
status: proposed
```

---

## P2: Medium Priority Errata

### ERR-DPD-013: Hand Tool Safety Specifics

```yaml
id: ERR-DPD-013
category: DPD
priority: P2
affects_section: MANUAL:hand-tool-safety
title: Hand Tool Safety - Beyond the Basics
problem: |
  Current guidance: 2 vague sentences.
  Missing: blade direction, securing workpiece, tool inspection criteria.
solution: Expand with specific guidance for common hand tools.
primary_tone: straight-talk
format: insert-sheet
status: proposed
```

---

### ERR-DPD-014: Power Tool Training Guidance

```yaml
id: ERR-DPD-014
category: DPD
priority: P2
affects_section: MANUAL:power-tool-safety
title: Power Tool Authorization and Training
problem: |
  "NOT allowed on walking sites" but what about other sites?
  No specific training requirements or authorization process.
solution: |
  Clarify training requirements, authorization process, specific tool guidance.
primary_tone: straight-talk
format: insert-sheet
status: proposed
```

---

### ERR-GAP-015: Caught-In/Between Hazards

```yaml
id: ERR-GAP-015
category: GAP
priority: P2
affects_section: MANUAL:personal-safety
title: Pinch Points and Crushing Hazards
problem: |
  No coverage of entanglement or crushing risks.
  Focus Four hazard (6% of fatalities).
solution: |
  New section on:
  - Loose clothing/hair around rotating equipment
  - Pinch points on tools and materials
  - Awareness during material handling
primary_tone: straight-talk
format: insert-sheet
status: proposed
osha_reference: 29 CFR 1926.650-652
```

---

### ERR-CLR-016: Extension Cord Safety Clarification

```yaml
id: ERR-CLR-016
category: CLR
priority: P2
affects_section: MANUAL:power-tool-safety
title: Extension Cord Do's and Don'ts
problem: |
  Current text: "Be sure to unsecure extension cords properly" - confusing typo.
  Missing: strain relief, routing, load limits, daisy-chaining prohibition.
solution: Rewrite with clear guidance on cord management.
primary_tone: quick-hits
format: insert-sheet
status: proposed
```

---

### ERR-GAP-017: Communication Protocols

```yaml
id: ERR-GAP-017
category: GAP
priority: P2
affects_section: MANUAL:personal-safety
title: Jobsite Communication - Calls That Keep You Safe
problem: |
  No standardized safety communication.
  Missing: "Heads up" / "Below!" calls, "Coming through" when carrying.
solution: |
  Add standard calls and when to use them.
  Covered partially in Working Above/Below (ERR-GAP-004).
primary_tone: quick-hits
format: qr-card
status: proposed
```

---

### ERR-GAP-018: Silica and Dust Hazards

```yaml
id: ERR-GAP-018
category: GAP
priority: P2
affects_section: MANUAL:ppe
title: Dust Hazards Beyond Treated Lumber
problem: |
  Only mentions dust mask for cutting treated lumber.
  Missing: concrete/masonry cutting silica, respirator selection, wet cutting.
solution: |
  Expand dust protection guidance to cover:
  - When dust masks are sufficient
  - When respirators are needed
  - Wet cutting as control measure
primary_tone: straight-talk
format: insert-sheet
status: proposed
osha_reference: 29 CFR 1926.1153 (Silica Standard)
```

---

### ERR-DPD-019: Housekeeping Standards

```yaml
id: ERR-DPD-019
category: DPD
priority: P2
affects_section: MANUAL:maintenance-safety
title: Housekeeping - Keep It Clean, Keep It Safe
problem: |
  Maintenance Safety section exists but is incomplete.
  Missing: stacking materials, nail removal, clear paths.
solution: Expand with specific housekeeping standards.
primary_tone: quick-hits
format: insert-sheet
status: proposed
```

---

### ERR-GAP-020: Scaffold Safety Basics

```yaml
id: ERR-GAP-020
category: GAP
priority: P2
affects_section: MANUAL:ladder-safety
title: Scaffold Awareness (If Used on Your Site)
problem: |
  Not mentioned at all. High severity but low frequency in volunteer work.
solution: |
  Basic awareness section:
  - Inspection before use
  - Load limits
  - Access requirements (not climbing cross-braces)
  - When to NOT use without proper setup
primary_tone: straight-talk
format: insert-sheet
status: proposed
osha_reference: 29 CFR 1926.450-454
```

---

## P3: Low Priority Errata (Tone/Format)

### ERR-CLR-021 through ERR-CLR-026

These address tone and format issues identified in the gap analysis:

| ID | Issue | Fix |
|----|-------|-----|
| ERR-CLR-021 | Passive voice throughout | Rewrite in active voice during integration |
| ERR-CLR-022 | Compliance-first language | Reframe as peer-to-peer in all new content |
| ERR-CLR-023 | ALL CAPS lecturing | Remove ALL CAPS; use bold for emphasis |
| ERR-CLR-024 | Missing "why" explanations | Add rationale to all rules |
| ERR-CLR-025 | Information overload structure | Prioritize and group in new content |
| ERR-CLR-026 | Clothing requirements ambiguity | Clarify fit vs. coverage |

**Status**: Address during P0-P2 content development, not as standalone items.

---

## Content Readiness Summary

| Status | Count | Items |
|--------|-------|-------|
| **Ready to integrate** | 3 | Manual Handling (006), JHA (008), Working Above-Below (004) |
| **Framework exists** | 2 | Ladder Safety (009), PPE (007) |
| **Needs creation** | 8 | Electrical (001), Fall Protection (002), Emergency (003), Heat (005), Roles (010), Incidents (011), First Aid (012), Communication (017) |
| **Needs expansion** | 5 | Hand Tools (013), Power Tools (014), Caught-In (015), Cord Safety (016), Silica (018) |

---

## Next Steps

1. **Immediate**: Create content for P0 items (Electrical, Fall Protection, Emergency, Heat) - these require new writing
2. **Integration**: Convert discovery docs to errata format for items 004, 006, 008
3. **Template**: Create insert-sheet template matching manual formatting style
4. **Review**: Establish review process for draft errata before publication

---

## Related Documents

- [Manual Content Inventory](manual-content-inventory.md) - What's in the manual
- [Manual Safety Requirements](manual-safety-requirements.md) - Extracted rules
- [Errata Schema](errata-schema.md) - Record format definition
- [Safety Section Gaps](../findings/safety-section-gaps.md) - Detailed gap analysis
- [Errata Priority Matrix](../findings/errata-priority-matrix.md) - Scoring methodology
