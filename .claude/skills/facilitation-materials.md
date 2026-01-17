# Facilitation Materials Generator

## Skill Metadata
- **Name:** facilitation-materials
- **Trigger:** `/facilitation-materials <topic> for <audience>`
- **Type:** task-generate specialization
- **Output:** Beads WBS + discovery documents

## Purpose

Generate a complete Work Breakdown Structure for creating facilitation/training materials on any topic for a specified audience. Based on proven workflow from OSHA safety materials production.

## Usage

```
/facilitation-materials workplace ergonomics for office workers
/facilitation-materials food safety for restaurant staff
/facilitation-materials cybersecurity basics for non-technical employees
```

## Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `<topic>` | Yes | The subject matter for facilitation materials |
| `<audience>` | Yes | Target learners (demographics, context, constraints) |
| `--source=<path>` | No | Existing materials to analyze for gaps |
| `--compliance=<standard>` | No | Regulatory framework to verify against (OSHA, HIPAA, PCI, etc.) |
| `--tones=<n>` | No | Number of tone variations (default: 3, max: 5) |
| `--skip-visuals` | No | Skip infographic generation phase |

## Critical Path

```
Phase 1: Discovery (blocks all content work)
    ├── Audience Analysis
    ├── Source Material Review (if provided)
    └── Compliance Research (if standard specified)
            │
            ▼
Phase 2: Content Strategy (blocks content development)
    ├── Tone Selection (informed by audience)
    ├── Language Psychology Research ← MOVED HERE
    │   └── Produces: Soft Phrases Guide (anti-patterns + replacements)
    ├── Gap Analysis (informed by source + compliance)
    └── Content Outline + Style Guide
            │
            ▼
Phase 3: Primary Deliverable (written WITH psychology principles)
    └── Facilitator's Guide
            │
            ▼
Phase 4: Verification (blocked by guide completion)
    ├── Language Compliance Scan (verify principles applied)
    └── Regulatory Compliance Verification (if standard specified)
            │
            ▼
Phase 5: Derivatives (blocked by verification)
    ├── Facilitation Script
    ├── Cliff Notes / Quick Reference
    └── Visual Aids (unless --skip-visuals)
```

**Key Insight:** Language psychology informs *how* content is written (Phase 2), not just *what gets fixed* after (Phase 4). The Phase 4 scan verifies compliance with principles, catching any slips—but the heavy lifting is done upfront.

## WBS Template

### Epic Structure

```
Epic: Facilitation Materials - {Topic} for {Audience}
│
├── Feature: Phase 1 - Discovery & Research
│   ├── Task: Analyze target audience characteristics
│   │   OUTPUT: Audience profile (demographics, constraints, learning styles)
│   ├── Task: Research {topic} best practices and requirements
│   │   OUTPUT: Topic knowledge base, key concepts list
│   ├── Task: [If --source] Analyze existing materials for coverage
│   │   OUTPUT: Content inventory, gap analysis
│   └── Task: [If --compliance] Research {standard} requirements
│       OUTPUT: Compliance checklist, verification criteria
│
├── Feature: Phase 2 - Content Strategy & Language Framework
│   ├── Task: Define tone variations for audience
│   │   OUTPUT: {n} tone profiles with rationale
│   ├── Task: Research language psychology principles
│   │   OUTPUT: Anti-pattern guide (negation, dismissal, commands, vague)
│   ├── Task: Create soft phrases guide
│   │   OUTPUT: docs/content/soft-phrases-guide.md (patterns → replacements)
│   ├── Task: Create content outline and structure
│   │   OUTPUT: Section outline, learning objectives per section
│   └── Task: Compile style guide for content writers
│       OUTPUT: Combined tone + language principles for consistent writing
│
├── Feature: Phase 3 - Facilitator's Guide Development
│   ├── Task: Draft introduction and session overview
│   ├── Task: Draft preparation section (materials, setup, timing)
│   ├── Task: Draft core content sections
│   ├── Task: Draft facilitation techniques section
│   ├── Task: Draft handling challenges / Q&A section
│   ├── Task: Create quick reference cards
│   └── Task: Compile complete guide document
│       OUTPUT: facilitators-guide.md
│
├── Feature: Phase 4 - Verification & Compliance
│   ├── Task: Scan guide for language anti-pattern violations
│   │   OUTPUT: Violations report (should be minimal if Phase 2 applied)
│   ├── Task: [If --compliance] Verify all claims against {standard}
│   │   OUTPUT: Verification report with CFR/standard citations
│   ├── Task: Fix any violations or compliance gaps
│   │   OUTPUT: Revised facilitators-guide.md
│   └── Task: Final verification pass
│       OUTPUT: Sign-off confirmation
│
└── Feature: Phase 5 - Derivative Materials
    ├── Task: Generate facilitation script (verbatim delivery guide)
    │   OUTPUT: facilitators-guide-script.md
    ├── Task: Generate cliff notes (condensed quick reference)
    │   OUTPUT: facilitators-guide-cliff-notes.md
    └── Task: [Unless --skip-visuals] Create visual aids
        ├── Define visual style per tone
        ├── Generate infographic prompts
        └── OUTPUT: visual-styles/{tone}/*.png
```

## Execution Instructions

### Step 1: Parse Arguments

Extract from user prompt:
- `topic` - Subject matter
- `audience` - Target learners
- `source_path` - Optional existing materials
- `compliance_standard` - Optional regulatory framework
- `tone_count` - Number of variations (default 3)
- `skip_visuals` - Boolean flag

### Step 2: Create Discovery Epic

```bash
bd create --title="Epic: Facilitation Materials - {topic} for {audience}" \
  --type=epic --priority=1 \
  --description="Create comprehensive facilitation materials for training {audience} on {topic}. Includes facilitator's guide, script, cliff notes, and visual aids." \
  --silent
```

### Step 3: Create Phase Features

Create features in order, establishing blocking dependencies:

```bash
# Phase 1 - Discovery (no blockers)
bd create --title="Feature: Phase 1 - Discovery & Research" ...

# Phase 2 - Content Strategy + Language Psychology (blocked by Phase 1)
bd create --title="Feature: Phase 2 - Content Strategy & Language Framework" ...
bd dep add {phase2_id} {phase1_id}

# Phase 3 - Guide Development (blocked by Phase 2)
bd create --title="Feature: Phase 3 - Facilitator's Guide Development" ...
bd dep add {phase3_id} {phase2_id}

# Phase 4 - Verification (blocked by Phase 3)
bd create --title="Feature: Phase 4 - Verification & Compliance" ...
bd dep add {phase4_id} {phase3_id}

# Phase 5 - Derivatives (blocked by Phase 4)
bd create --title="Feature: Phase 5 - Derivative Materials" ...
bd dep add {phase5_id} {phase4_id}
```

### Step 4: Create Tasks per Phase

Create tasks under each feature. Key task descriptions:

**Audience Analysis Task:**
```
Analyze {audience} characteristics:
- Demographics and background knowledge
- Learning style distribution (visual, auditory, kinesthetic, reading)
- Environmental constraints (time, attention, distractions)
- Motivation factors (compliance, personal safety, career)
- Potential resistance points

OUTPUT: docs/discovery/audience-analysis.md
```

**Tone Selection Task:**
```
Define {n} tone variations appropriate for {audience}:
- Direct/Authoritative - for rule-followers
- Peer/Narrative - for social learners
- Collaborative - for analytical thinkers
- Impact-Focused - for outcome-motivated
- Quick Reference - for time-constrained

Select {n} most appropriate for this audience with rationale.

OUTPUT: docs/discovery/tone-selection.md
```

**Language Psychology Research Task (Phase 2):**
```
Research and document language anti-patterns that undermine safety messaging:

1. NEGATION - "Don't do X" triggers thinking about X
   Psychology: Brain processes concept before negation
   Pattern: don't, never, avoid, stop, no
   Alternative: Positive framing of desired behavior

2. FEAR DISMISSAL - "Don't worry" dismisses valid concerns
   Psychology: Invalidates emotion, triggers reactance
   Pattern: don't worry, it's fine, no big deal, relax
   Alternative: Acknowledge concern, then redirect to action

3. COMMAND LANGUAGE - "You must" triggers reactance
   Psychology: Perceived threat to autonomy
   Pattern: must, always, have to, required, mandatory
   Alternative: Collaborative framing, explain the "why"

4. VAGUE/ABSTRACT - "Be careful" provides no actionable guidance
   Psychology: No mental model to follow
   Pattern: be careful, pay attention, stay safe, use caution
   Alternative: Specific observable actions

OUTPUT: docs/content/soft-phrases-guide.md
- Each anti-pattern with psychology explanation
- Searchable pattern list for writers
- Replacement phrase alternatives
- Examples in context
```

**Language Verification Scan Task (Phase 4):**
```
Scan completed facilitator's guide against soft-phrases-guide.md:

For each anti-pattern category, grep for trigger phrases and report:
- Line number and context
- Suggested replacement from guide
- Severity (blocking vs. advisory)

This should find MINIMAL violations if Phase 2 guide was followed.
If >10 violations found, indicates process breakdown.

OUTPUT: docs/findings/language-compliance-scan.md
```

### Step 5: Output WBS Tree

After all `bd` commands, output summary:

```
Created WBS:
├── {epic_id} (epic): Facilitation Materials - {topic} for {audience}
│   ├── {p1_id} (feature): Phase 1 - Discovery & Research
│   │   └── {n} tasks
│   ├── {p2_id} (feature): Phase 2 - Content Framework
│   │   └── {n} tasks (blocked by Phase 1)
│   ├── {p3_id} (feature): Phase 3 - Facilitator's Guide Development
│   │   └── {n} tasks (blocked by Phase 2)
│   ├── {p4_id} (feature): Phase 4 - Quality & Refinement
│   │   └── {n} tasks (blocked by Phase 3)
│   └── {p5_id} (feature): Phase 5 - Derivative Materials
│       └── {n} tasks (blocked by Phase 4)

Critical Path: P1 → P2 → P3 → P4 → P5

Ready to work: {first_discovery_task_id}
```

## Output Directory Structure

```
docs/
├── discovery/
│   ├── audience-analysis.md
│   ├── topic-research.md
│   ├── tone-selection.md
│   ├── source-gap-analysis.md (if --source)
│   └── compliance-requirements.md (if --compliance)
├── content/
│   ├── facilitators-guide.md (PRIMARY)
│   ├── facilitators-guide-script.md
│   ├── facilitators-guide-cliff-notes.md
│   └── tone-{n}-{name}.md (per tone variation)
├── findings/
│   ├── language-audit.md
│   └── compliance-verification.md (if --compliance)
└── visual-styles/ (unless --skip-visuals)
    └── {tone-name}/
        ├── style.prompt.md
        └── *.png
```

## Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails | Better Approach |
|--------------|--------------|-----------------|
| Skipping audience analysis | Content misses the mark | Always start with who |
| Writing content before compliance research | Costly rewrites | Research first, write once |
| Single tone for diverse audience | Loses portion of learners | Multiple tones, same content |
| Language psychology as afterthought | Rewrites entire guide | Psychology guides writing upfront |
| Derivatives before primary is stable | Rework cascade | Freeze guide before derivatives |

### The "Fix It Later" Trap

**Wrong:** Write guide → Audit for language issues → Rewrite 40% of content

**Right:** Research psychology → Create soft phrases guide → Write guide correctly → Verify (minimal fixes)

The OSHA project discovered this the hard way—language psychology research (Epic alonna-osha-19d) happened after the facilitator's guide was drafted (Epic alonna-osha-kw2), requiring a separate revision epic (alonna-osha-mfn). Moving psychology research to Phase 2 prevents this rework.

## Example Invocations

**Basic:**
```
/facilitation-materials ladder safety for construction volunteers
```

**With compliance:**
```
/facilitation-materials hazardous materials handling for warehouse workers --compliance=OSHA
```

**With existing materials:**
```
/facilitation-materials customer service for retail staff --source=docs/existing-manual/
```

**Minimal (no visuals, fewer tones):**
```
/facilitation-materials data privacy for all employees --compliance=GDPR --tones=2 --skip-visuals
```

## Related Skills

- `/task-generate` - Generic WBS generation
- `/section-create` - Create individual content sections
- `/verify-osha` - OSHA-specific compliance verification
- `/ig-generate` - Infographic generation
