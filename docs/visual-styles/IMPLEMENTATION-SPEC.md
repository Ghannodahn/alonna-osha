# Visual Style System - Implementation Specification

## Status: Ready for Image Generation

**Date:** January 2026
**Epic:** alonna-osha-d85

---

## Deliverables Complete

### Discovery Phase (Complete)
- [x] Visual style analysis for all 5 conversation styles
- [x] Safety-themed design principles research
- [x] Detailed visual style concepts and specifications
- [x] ASCII sample visualizations
- [x] Selection and implementation plan

### Implementation Phase (In Progress)
- [x] Style prompt files (5 files)
- [x] Ladder safety content files (5 files)
- [x] Implementation guide (README.md)
- [ ] Generated sample images (requires Gemini sign-in)

---

## Visual Style Specifications Summary

### 1. Straight Talk - "The Engineer's Clipboard"

| Attribute | Specification |
|-----------|---------------|
| Colors | Black #1A1A1A, Off-white #FAFAFA, Yellow #FFD100 |
| Typography | Impact/bold sans, clean hierarchy |
| Layout | Grid-based, 30%+ whitespace |
| Icons | Geometric, minimal, single-weight |
| Key element | Bold header bar, filled square bullets |

### 2. Been There - "The Field Notebook"

| Attribute | Specification |
|-----------|---------------|
| Colors | Brown #3D2B1F, Cream #F5F0E8, Orange #CC7722, Sage #8B9A6B |
| Typography | Nunito/rounded, Georgia/serif body |
| Layout | Organic flow, story callouts |
| Icons | Hand-drawn, sketch-like |
| Key element | Dashed story boxes, arrow bullets |

### 3. Let's Figure This Out - "The Whiteboard Session"

| Attribute | Specification |
|-----------|---------------|
| Colors | Blue #2C5282, White #FFFFFF, Green #38A169, Red #E53E3E |
| Typography | Marker-style headers, Open Sans body |
| Layout | Diagram-centric, flowcharts |
| Icons | Schematic, process arrows |
| Key element | Question headers (?), checkmark resolutions (✓) |

### 4. Real Consequences - "The Incident Report"

| Attribute | Specification |
|-----------|---------------|
| Colors | Black #1A202C, White #FFFFFF, Orange #DD6B20, Green #276749 |
| Typography | Heavy sans (Roboto Bold), tabular numbers |
| Layout | Documentary, evidence-first |
| Icons | Realistic silhouettes, data visualization |
| Key element | Large statistics, cause→consequence chains |

### 5. Quick Hits - "The Pocket Card"

| Attribute | Specification |
|-----------|---------------|
| Colors | Black #000000, White #FFFFFF, Yellow #FFD100 |
| Typography | Condensed (Oswald), maximum density |
| Layout | Card frame, checkbox lists |
| Icons | Pictogram, ISO-style |
| Key element | Heavy border, time indicator, "Unsure?→ASK" |

---

## Icon Library Integration

### Selected Libraries (per user)
- **react-icons**: https://react-icons.github.io/react-icons/
- **lucide-icons**: https://lucide.dev/icons/

### Style-to-Library Mapping

| Style | Recommended Library | Icon Sets |
|-------|---------------------|-----------|
| Straight Talk | Lucide | Default (clean lines) |
| Been There | React Icons | Feather Icons |
| Let's Figure | Lucide | Arrows, shapes, diagram elements |
| Real Consequences | React Icons | Material Design |
| Quick Hits | Lucide | Bold variants |

### Common Safety Icons Needed

| Icon | Use Cases | Recommended |
|------|-----------|-------------|
| Hard hat | PPE, general safety | `hard-hat` (Lucide) |
| Ladder | Ladder safety | `ladder` (custom or Material) |
| Warning triangle | Danger/caution | `alert-triangle` (Lucide) |
| Checkmark | Completed/correct | `check` (Lucide) |
| Person/user | Human figure | `user` (Lucide) |
| Hand | Stop/warning | `hand` (Lucide) |
| Eye | Watch/awareness | `eye` (Lucide) |

---

## Image Generation Workflow

### Step 1: Prepare Combined Prompt

For each style, combine:

```markdown
[Contents of style.prompt.md]

---
CONTENT TO VISUALIZE:
---

[Contents of [topic].content.md]

---
Generate a safety infographic following the style specifications above.
Create a LANDSCAPE (16:9) aspect ratio image.
VARIANT #1: Generate unique visual approach.
```

### Step 2: Generate via Gemini

1. Navigate to gemini.google.com
2. Sign in to Google account
3. Paste combined prompt
4. Wait for image generation
5. Download result

### Step 3: Evaluate & Iterate

- Generate 3 variants per style
- Evaluate against style checklist
- Iterate with refined prompts if needed
- Target: 90%+ style match

### Step 4: Save & Organize

```
docs/visual-styles/[style]/images/
  ladder-safety-1.png
  ladder-safety-2.png
  ladder-safety-3.png
```

---

## File Inventory

### Discovery Documents
```
docs/discovery/
  10-visual-style-analysis.md
  11-safety-visual-design-principles.md
  12-visual-style-concepts.md
  13-sample-visualizations.md
  14-visual-style-selection-and-implementation.md
```

### Implementation Assets
```
docs/visual-styles/
  README.md
  IMPLEMENTATION-SPEC.md (this file)
  straight-talk/
    style.prompt.md
    ladder-safety.content.md
  been-there/
    style.prompt.md
    ladder-safety.content.md
  lets-figure/
    style.prompt.md
    ladder-safety.content.md
  real-consequences/
    style.prompt.md
    ladder-safety.content.md
  quick-hits/
    style.prompt.md
    ladder-safety.content.md
```

---

## Quality Criteria

### Style Authenticity

For each generated image, verify:

- [ ] Colors match exact hex codes
- [ ] Typography feels appropriate to style
- [ ] Layout follows style's structure
- [ ] Key visual elements are present
- [ ] Distinctiveness (could identify style without label)

### Safety Effectiveness

- [ ] Critical information is prominent
- [ ] Action items are clear
- [ ] Scannable in 5-10 seconds
- [ ] Construction context is recognizable
- [ ] ANSI safety colors used appropriately

### Production Readiness

- [ ] Resolution is sufficient (300 DPI for print)
- [ ] Works in grayscale if needed
- [ ] File size is reasonable
- [ ] Format is appropriate (PNG, PDF)

---

## Next Steps

1. **Generate Images** - Run Gemini generation for all 5 styles (requires sign-in)
2. **Evaluate Results** - Score against style checklist
3. **Iterate** - Refine prompts for any styles <90%
4. **Select Winners** - Choose best variant per style
5. **Create Templates** - Build production templates from winners
6. **Document** - Update with final assets and learnings

---

## Dependencies

- Google account with Gemini access
- Browser (Chrome recommended)
- Image editing software (optional, for refinement)

---

## Related Issues

- **Epic**: alonna-osha-d85 (Visual Style System)
- **Discovery**: alonna-osha-d85.1 (Complete)
- **Implementation**: alonna-osha-d85.2 (In Progress)
