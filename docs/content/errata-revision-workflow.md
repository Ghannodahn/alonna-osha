# Errata Revision Workflow

## Overview

This document defines the process for developing, reviewing, and publishing errata items that supplement the BBTW safety manual.

---

## Status Lifecycle

```
proposed → drafted → reviewed → approved → published
    ↑         |          |          |
    |         v          v          |
    +---- rejected ←-----+          |
    |                               |
    +-------- revised ←-------------+
```

| Status | Description | Owner |
|--------|-------------|-------|
| **proposed** | Erratum identified; problem/solution defined | Anyone |
| **drafted** | Content written in target tone and format | Content author |
| **reviewed** | Technical accuracy and tone reviewed | Reviewer |
| **approved** | Ready for publication | Approver |
| **published** | Distributed to volunteers | Project lead |
| **rejected** | Not proceeding (with reason) | Reviewer |
| **revised** | Approved but needs update | Content author |

---

## Phase 1: Proposal

### Who Can Propose
Anyone can propose an erratum:
- Project team members
- Site supervisors identifying gaps
- Volunteers with safety concerns

### Proposal Requirements

Minimum fields for a proposal:
```yaml
id: ERR-{category}-{sequence}
category: GAP | CLR | UPD | EDG | DPD
priority: P0 | P1 | P2 | P3
affects_section: MANUAL:{section-tag}
title: "Short descriptive title"
problem: "What's missing or unclear"
solution: "What the errata will provide"
```

### Adding to Baseline

1. Add erratum record to `docs/content/errata-baseline.md`
2. Set status: `proposed`
3. Set created date

---

## Phase 2: Drafting

### Drafting Guidelines

1. **Read the problem statement** - Understand what gap you're filling
2. **Review the tone selection** - Use the designated `primary_tone`
3. **Keep peer-to-peer** - No lecturing, no compliance-speak
4. **Be specific and actionable** - Every piece ends with clear guidance
5. **Include the "why"** - Connect rules to consequences
6. **Match manual style** - Use formatting from errata-schema.md

### Content Structure

For insert-sheet format:
```markdown
# [Title]

## The Problem
[Brief statement of what's missing]

## [Core Content]
[Guidance in appropriate tone]

## Quick Reference
[Bullet summary for recall]

---
*Supplements Building Beyond the Walls Manual, Page [X]*
```

For qr-card format:
```markdown
# [Title] - Quick Reference

[3-5 bullet points max]

[QR code linking to expanded content]
```

### File Location

Draft content goes in:
```
docs/content/errata/ERR-{category}-{sequence}.md
```

### Updating Status

1. Create content file in errata/ directory
2. Update baseline record: `status: drafted`
3. Add `content_file` reference
4. Update `updated` date

---

## Phase 3: Review

### Review Checklist

| Criterion | Check |
|-----------|-------|
| **Accuracy** | Does the guidance align with OSHA standards? |
| **Completeness** | Does it fully address the stated problem? |
| **Tone** | Is it peer-to-peer, not compliance-speak? |
| **Actionable** | Does it end with clear "do this" guidance? |
| **Memorable** | Can a volunteer recall this on the jobsite? |
| **Integration** | Does it reference manual sections appropriately? |
| **Format** | Does it match the target format (insert-sheet, qr-card, etc.)? |

### Review Outcomes

| Outcome | Action |
|---------|--------|
| **Approved** | Move to `status: approved` |
| **Minor revisions** | Return to author with specific feedback |
| **Major revisions** | Return to `status: proposed` for re-scoping |
| **Rejected** | Set `status: rejected` with reason |

### Review Documentation

Add review notes to erratum record:
```yaml
review_date: YYYY-MM-DD
reviewer: [name]
review_notes: "[feedback or approval note]"
```

---

## Phase 4: Approval

### Approval Authority

| Priority | Approver |
|----------|----------|
| P0 Critical | Project lead + safety subject matter expert |
| P1 High | Project lead |
| P2 Medium | Content coordinator |
| P3 Low | Content coordinator |

### Approval Checklist

- [ ] Review checklist completed
- [ ] All feedback addressed
- [ ] Format matches publication target
- [ ] OSHA references verified (where applicable)
- [ ] Integration point confirmed with manual

---

## Phase 5: Publication

### Publication Formats

| Format | Production Steps |
|--------|------------------|
| **Insert sheet** | Layout in manual style → Print → Insert into binders |
| **QR card** | Generate QR code → Design card → Print pocket size |
| **Companion section** | Compile multiple errata → Design booklet → Print |
| **Infographic** | Design visual → Review → Print poster/handout |

### Publication Record

Update erratum:
```yaml
status: published
published_date: YYYY-MM-DD
publication_format: [actual format used]
distribution: "[where/how distributed]"
```

### Distribution Tracking

Maintain list of:
- Which sites have received updated materials
- Which volunteer cohorts have been trained on new content
- When refresher training is due

---

## Phase 6: Revision

### When to Revise

- OSHA standard changes
- Feedback from field use
- Incidents suggesting inadequate guidance
- Annual review cycle

### Revision Process

1. Update `status: revised`
2. Create new version of content file (keep original for history)
3. Document changes in `revision_notes`
4. Re-enter review process

---

## Quick Reference: Status Commands

Using beads workflow:

```bash
# Propose new erratum
bd create --title="ERR-GAP-XXX: [title]" --type=task

# Track drafting
bd update [id] --status=in_progress --notes="Drafting content"

# Submit for review
bd update [id] --notes="REVIEW: [reviewer name]"

# Mark approved
bd update [id] --notes="APPROVED by [name] on [date]"

# Close as published
bd close [id] --reason="Published [date], format: [format]"
```

---

## Metrics and Reporting

### Track per erratum:
- Days from proposed to published
- Review cycles required
- Revision frequency

### Track overall:
- Errata completion rate by priority
- Outstanding P0/P1 items
- Publication coverage across sites

---

## Templates

### Erratum Proposal Template

```yaml
erratum:
  id: ERR-[CAT]-[NUM]
  category: [GAP|CLR|UPD|EDG|DPD]
  priority: [P0|P1|P2|P3]
  affects_section: MANUAL:[section]
  insert_after: "Page [X]"
  title: "[title]"
  problem: |
    [What's missing or unclear - 2-3 sentences]
  solution: |
    [What the errata will provide - 2-3 sentences]
  primary_tone: [been-there|straight-talk|quick-hits]
  format: [insert-sheet|qr-card|companion-section|infographic]
  status: proposed
  created: [YYYY-MM-DD]
```

### Review Feedback Template

```markdown
## Review: ERR-[ID]
**Reviewer:** [name]
**Date:** [YYYY-MM-DD]

### Accuracy
- [ ] OSHA-aligned
- [ ] Technically correct
- Notes:

### Tone
- [ ] Peer-to-peer
- [ ] No compliance-speak
- Notes:

### Actionable
- [ ] Clear guidance
- [ ] Memorable
- Notes:

### Decision
[ ] Approved
[ ] Minor revisions needed: [list]
[ ] Major revisions needed: [explanation]
[ ] Rejected: [reason]
```

---

## Related Documents

- [Errata Schema](errata-schema.md) - Record format
- [Errata Baseline](errata-baseline.md) - Current errata inventory
- [Tone Selection Decision](../findings/tone-selection-decision.md) - Tone guidance
