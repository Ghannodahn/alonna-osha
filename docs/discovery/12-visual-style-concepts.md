# Visual Style Concepts for Each Conversation Style

## Overview

This document provides detailed visual specifications for each of the five conversation styles. Each style receives:
- A core visual metaphor
- Typography specifications
- Color palette
- Layout principles
- Icon/graphic style
- Sample component treatments

---

## Style 1: Straight Talk

### Core Visual Metaphor
**The Engineer's Clipboard** - Industrial precision, technical documentation, no-nonsense clarity

### Design Philosophy
Straight Talk is about efficiency and respect for the reader's time. The visual system should feel like professional safety documentation - clean, scannable, and authoritative without being bureaucratic. Think technical manual meets field guide.

### Typography

| Element | Specification | Rationale |
|---------|---------------|-----------|
| **Headlines** | Impact or similar compressed bold sans | Maximum clarity, industrial feel |
| **Body** | Arial, Helvetica, or similar neutral sans | Clean readability, no personality distraction |
| **Emphasis** | Bold weight, not italic | Direct, unambiguous |
| **Numbers/Lists** | Tabular numerals, monospace optional | Precision, alignment |

**Font stack suggestion:** `"Impact", "Arial Black", "Helvetica Neue Bold", sans-serif`

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Primary text** | Black | `#1A1A1A` | Body copy, headers |
| **Background** | Off-white | `#FAFAFA` | Page/card background |
| **Accent** | Safety Yellow | `#FFD100` | Critical callouts, dividers |
| **Secondary accent** | Industrial Gray | `#4A4A4A` | Supporting elements |
| **Alert** | ANSI Red | `#C41E3A` | Danger callouts only |

**Contrast ratios:** All text minimum 7:1 against background (AAA compliance)

### Layout Principles

```
┌─────────────────────────────────────┐
│ ██████ TOPIC                        │  ← Bold header bar
├─────────────────────────────────────┤
│                                     │
│  Key Point: Single clear statement  │  ← Prominent key message
│                                     │
│  • Action item one                  │  ← Bulleted, not numbered
│  • Action item two                  │     (unless sequence matters)
│  • Action item three                │
│                                     │
│  ─────────────────────────────────  │  ← Divider
│                                     │
│  [Additional detail if needed]      │  ← Secondary info below fold
│                                     │
└─────────────────────────────────────┘
```

**Grid:** 12-column for flexibility, content in center 8 columns
**Margins:** Generous (minimum 1" print, 24px screen)
**Whitespace:** 1.5x line height, paragraph spacing = line height

### Icon/Graphic Style

| Characteristic | Treatment |
|----------------|-----------|
| Style | Geometric, minimal, single-weight lines |
| Color | Monochrome or 2-color max |
| Detail level | Low - recognizable at small sizes |
| Borders | Optional thin stroke |

**Sample icons:**
- Hard hat: Simple dome shape, no shading
- Ladder: Two vertical lines with rungs, minimal detail
- Hand: Simplified 5-finger silhouette

### Component Treatments

**Callout Box:**
```
┌────────────────────────────────────┐
│ ▌ KEY POINT                        │
│ ▌ [Message in bold]                │
└────────────────────────────────────┘
```
Yellow left border, gray background

**Action List:**
```
DO THIS:
■ First action
■ Second action
■ Third action
```
Filled squares, no decorative bullets

**Warning:**
```
⚠ [Warning text in caps, red accent]
```
Minimal, inline with content

---

## Style 2: Been There (Experiential)

### Core Visual Metaphor
**The Field Notebook** - Worn paper, handwritten wisdom, trusted mentor's notes

### Design Philosophy
Been There is about human connection through shared experience. The visual system should feel like wisdom passed down - personal, warm, authentic. Think well-used field guide with margin notes and dog-eared pages.

### Typography

| Element | Specification | Rationale |
|---------|---------------|-----------|
| **Headlines** | Rounded sans-serif (Nunito, Varela Round) | Approachable, warm |
| **Body** | Georgia, Merriweather, or readable serif | Traditional, storytelling feel |
| **Anecdotes** | Slightly different weight or style | Distinguish personal stories |
| **Emphasis** | Italic for voice, bold for facts | Natural emphasis variation |

**Font stack suggestion:** `"Nunito", "Georgia", "Merriweather", serif`

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Primary text** | Dark Brown | `#3D2B1F` | Body copy, warmth |
| **Background** | Cream/Aged Paper | `#F5F0E8` | Page background |
| **Accent** | Workworn Orange | `#CC7722` | Callouts, emphasis |
| **Secondary** | Sage Green | `#8B9A6B` | Success states, tips |
| **Highlight** | Faded Yellow | `#F7E7A2` | Highlighted passages |

**Texture:** Subtle paper grain texture optional at 5-10% opacity

### Layout Principles

```
┌─────────────────────────────────────┐
│                                     │
│   Here's something I learned...     │  ← Conversational opening
│                                     │
│   ┌─────────────────────────────┐   │
│   │ 📝 "First time I..."        │   │  ← Story callout (inset)
│   │                             │   │
│   │ [Personal anecdote]         │   │
│   └─────────────────────────────┘   │
│                                     │
│   What I took from that:            │  ← Transition
│                                     │
│   → Lesson one                      │  ← Arrow bullets suggest
│   → Lesson two                      │     journey/direction
│   → Lesson three                    │
│                                     │
└─────────────────────────────────────┘
```

**Grid:** Looser, more organic flow
**Margins:** Comfortable but not rigid
**Whitespace:** Natural paragraph rhythm, breathing room

### Icon/Graphic Style

| Characteristic | Treatment |
|----------------|-----------|
| Style | Hand-drawn, sketch-like, imperfect lines |
| Color | Limited earth tones, watercolor feel optional |
| Detail level | Medium - suggest rather than specify |
| Borders | Rough edges, not geometric |

**Sample icons:**
- Hard hat: Sketched outline, slight wobble to lines
- Ladder: Perspective drawing, as if quickly sketched
- Hand: More anatomical, suggests real hands

### Component Treatments

**Story Callout:**
```
┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
  📝 From the field...

  "First time I picked up a saw,
   nobody told me about kickback."

  [Story continues...]
└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
```
Dashed border, slightly inset, notebook feel

**Lesson List:**
```
What this taught me:
→ Always check before you cut
→ Never assume you know
→ Ask the veteran
```
Arrow bullets suggesting journey

**Wisdom Block:**
```
╭───────────────────────────────────╮
│  💡 Here's the thing:             │
│                                   │
│  [Key insight in conversational   │
│   language]                       │
╰───────────────────────────────────╯
```
Rounded corners, warm background

---

## Style 3: Let's Figure This Out (Collaborative)

### Core Visual Metaphor
**The Whiteboard Session** - Markers, diagrams, thinking out loud together

### Design Philosophy
Let's Figure This Out is about collaborative discovery. The visual system should feel like a productive meeting or training session - diagrammatic, exploratory, with the energy of working through something together. Think whiteboard in the break room.

### Typography

| Element | Specification | Rationale |
|---------|---------------|-----------|
| **Headlines** | Marker-style (Permanent Marker, Caveat Bold) | Whiteboard authentic |
| **Body** | Clean sans-serif (Open Sans, Lato) | Readable, friendly |
| **Questions** | Distinct color or weight | Emphasize inquiry |
| **Answers** | Different from questions | Show resolution |

**Font stack suggestion:** `"Permanent Marker", "Caveat", "Open Sans", sans-serif`

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Primary text** | Marker Blue | `#2C5282` | Main content |
| **Background** | Whiteboard White | `#FFFFFF` | Clean backdrop |
| **Question color** | Marker Green | `#38A169` | Questions, "let's think about..." |
| **Answer color** | Marker Blue | `#3182CE` | Conclusions, "so..." |
| **Emphasis** | Marker Red | `#E53E3E` | Key points, warnings |
| **Secondary** | Marker Black | `#2D3748` | Supporting text |

**Texture:** Slight whiteboard sheen optional, not distracting

### Layout Principles

```
┌─────────────────────────────────────┐
│                                     │
│  ? What's the deal with ladders?    │  ← Question header
│                                     │
│     ┌───────────────────────────┐   │
│     │       [Diagram]           │   │  ← Central diagram/visual
│     │                           │   │
│     │   A ──→ B ──→ C          │   │  ← Process flow
│     │                           │   │
│     └───────────────────────────┘   │
│            ↓                        │
│  So here's the logic:               │  ← Resolution
│                                     │
│  ✓ Point one (makes sense?)         │  ← Checkmarks for
│  ✓ Point two                        │     "we figured it out"
│  ✓ Point three                      │
│                                     │
└─────────────────────────────────────┘
```

**Grid:** Flexible, diagram-centric
**Margins:** Adequate for annotations
**Whitespace:** Space for arrows, connections

### Icon/Graphic Style

| Characteristic | Treatment |
|----------------|-----------|
| Style | Diagram elements, flowchart nodes, process arrows |
| Color | Marker palette (3-4 colors) |
| Detail level | Schematic - functional over decorative |
| Borders | Hand-drawn boxes, circles |

**Sample icons:**
- Hard hat: Simple shape in a diagram node
- Ladder: Schematic side view with annotation points
- Process: Arrows, decision diamonds, connection lines

### Component Treatments

**Question Block:**
```
┌────────────────────────────────────┐
│ ? Okay, so... why does this matter?│
└────────────────────────────────────┘
```
Green accent, question mark prominent

**Diagram:**
```
┌───────────────────────────────────────────┐
│                                           │
│   [SITUATION] ──→ [RISK] ──→ [SOLUTION]   │
│       │              │            │       │
│       └──────────────┴────────────┘       │
│                 ↓                         │
│           [OUTCOME]                       │
│                                           │
└───────────────────────────────────────────┘
```
Flowchart style, marker colors

**Resolution:**
```
✓ Makes sense? Here's the takeaway:
  [Clear conclusion]
```
Checkmark signals collaborative agreement

---

## Style 4: Real Consequences (Stakes-Aware)

### Core Visual Metaphor
**The Incident Report** - Documentary evidence, real stakes, lessons learned

### Design Philosophy
Real Consequences is about honest communication of stakes without fear-mongering. The visual system should feel factual, documented, and serious - like a safety review or lessons-learned report. The gravity should come from truth, not manipulation.

### Typography

| Element | Specification | Rationale |
|---------|---------------|-----------|
| **Headlines** | Heavy sans-serif (Roboto Bold, Source Sans Bold) | Weight conveys gravity |
| **Body** | Clean sans-serif | Readable, serious |
| **Statistics** | Condensed, tabular | Data-forward |
| **Quotes/Cases** | Distinct block treatment | Documented evidence |

**Font stack suggestion:** `"Roboto", "Source Sans Pro", "Arial", sans-serif`

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Primary text** | Near Black | `#1A202C` | Body copy |
| **Background** | Clinical White | `#FFFFFF` | Clean, documented |
| **Alert** | ANSI Orange | `#DD6B20` | Warning-level content |
| **Danger** | ANSI Red | `#C53030` | Danger-level content |
| **Evidence** | Steel Blue | `#4A5568` | Case studies, statistics |
| **Success** | Safe Green | `#276749` | Correct behavior |

**Tone:** Restrained - not everything is red. Color earns attention.

### Layout Principles

```
┌─────────────────────────────────────┐
│                                     │
│  FALLS FROM LADDERS                 │  ← Factual header
│                                     │
│  ┌─────────────────────────────┐    │
│  │  STATISTIC                  │    │  ← Evidence block
│  │  ████████████████ 43%      │    │
│  │  Falls are the #1 cause of  │    │
│  │  construction fatalities    │    │
│  └─────────────────────────────┘    │
│                                     │
│  Why this happens:                  │  ← Cause analysis
│  • Rushing (most common)            │
│  • Overreaching                     │
│  • No spotter                       │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  ✓ How to prevent this:             │  ← Solution (green accent)
│    [Prevention steps]               │
│                                     │
└─────────────────────────────────────┘
```

**Grid:** Documentary style, evidence-centric
**Margins:** Clinical, professional
**Whitespace:** Deliberate pacing, weight between sections

### Icon/Graphic Style

| Characteristic | Treatment |
|----------------|-----------|
| Style | Documentary, realistic silhouettes, data visualization |
| Color | Muted base with strategic warning colors |
| Detail level | Enough for recognition, not graphic |
| Borders | Clean, professional |

**Sample icons:**
- Hard hat: Realistic silhouette
- Injury indicator: Abstract (not graphic), red accent
- Statistics: Bar charts, percentages, comparative visuals

### Component Treatments

**Statistic Block:**
```
┌─────────────────────────────────────┐
│                                     │
│   43%                               │
│   ═══════════════════════════════   │
│   Falls are the leading cause of    │
│   construction deaths               │
│                                     │
└─────────────────────────────────────┘
```
Large number, evidence bar, source attribution

**Case Study:**
```
╔═════════════════════════════════════╗
║  📋 WHAT HAPPENED                   ║
║                                     ║
║  [Factual, anonymized account]      ║
║                                     ║
║  OUTCOME: [Consequence]             ║
║                                     ║
║  LESSON: [Prevention]               ║
╚═════════════════════════════════════╝
```
Double-line border, documentary feel

**Prevention Callout:**
```
┌ ✓ ──────────────────────────────────┐
│  HOW TO PREVENT THIS:               │
│                                     │
│  [Clear prevention steps]           │
│                                     │
└─────────────────────────────────────┘
```
Green accent on prevention (positive outcome emphasis)

---

## Style 5: Quick Hits (Time-Respectful)

### Core Visual Metaphor
**The Pocket Card** - Laminated reference, maximum density, instant utility

### Design Philosophy
Quick Hits respects that workers have limited time and need information now. The visual system should be scannable in seconds, work at pocket-card size, and function as point-of-use reference. Think laminated cards that survive a day on the jobsite.

### Typography

| Element | Specification | Rationale |
|---------|---------------|-----------|
| **Headlines** | Condensed bold (Oswald, Barlow Condensed) | Maximum info density |
| **Body** | Condensed sans-serif | Space efficient |
| **Lists** | Minimal styling, tight leading | Scannable |
| **Numbers** | Prominent, tabular | Quick reference |

**Font stack suggestion:** `"Oswald", "Barlow Condensed", "Arial Narrow", sans-serif`

### Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| **Primary text** | Black | `#000000` | Maximum contrast |
| **Background** | White | `#FFFFFF` | Clean |
| **Accent** | Safety Yellow | `#FFD100` | Critical highlights |
| **Border** | Black | `#000000` | Card frames |
| **Secondary** | Medium Gray | `#666666` | Supporting text |

**Principle:** 2-3 colors maximum. Works in single-color printing.

### Layout Principles

```
┌─────────────────────────────────────┐
│ ▌LADDERS                    30 sec │  ← Topic + time commitment
├─────────────────────────────────────┤
│                                     │
│ □ Spotter holds base               │  ← Checkbox format
│ □ 3 points of contact              │
│ □ Belt buckle between rails        │
│ □ Top step = handhold only         │
│                                     │
├─────────────────────────────────────┤
│ Unsure? → ASK                       │  ← Escape valve
└─────────────────────────────────────┘
```

**Grid:** Maximum density, minimal margins
**Margins:** Tight (0.25" print, 8px screen)
**Whitespace:** Minimal but functional

### Icon/Graphic Style

| Characteristic | Treatment |
|----------------|-----------|
| Style | Pictogram, universal symbols, maximum simplicity |
| Color | Monochrome or 2-color |
| Detail level | Absolute minimum for recognition |
| Borders | Heavy, clean, card-like |

**Sample icons:**
- Hard hat: ISO-style pictogram
- Checkbox: Simple square
- Arrow: Heavy, directional

### Component Treatments

**Pocket Card Frame:**
```
┌────────────────────────────────────┐
│        TOPIC TITLE                 │
├────────────────────────────────────┤
│ □ Item one                         │
│ □ Item two                         │
│ □ Item three                       │
├────────────────────────────────────┤
│ If unsure: ASK                     │
└────────────────────────────────────┘
```
Heavy border, card feel

**Table Format:**
```
┌─────────────┬──────────────────────┐
│ ALWAYS      │ WHEN                 │
├─────────────┼──────────────────────┤
│ Hard hat    │ Active work areas    │
│ Glasses     │ Cutting, drilling    │
│ Gloves      │ Rough materials      │
└─────────────┴──────────────────────┘
```
Efficient table, no decoration

**Reference Strip:**
```
PPE: gear→hazard | LADDERS: 3pt,spot | LIFTING: too heavy?=help
```
Maximum compression for belt/hardhat sticker format

---

## Style Comparison Summary

| Attribute | Straight Talk | Been There | Let's Figure | Real Consequences | Quick Hits |
|-----------|--------------|------------|--------------|-------------------|------------|
| **Metaphor** | Engineer's Clipboard | Field Notebook | Whiteboard | Incident Report | Pocket Card |
| **Tone** | Efficient | Warm | Exploratory | Serious | Ultra-compact |
| **Typography** | Bold sans | Rounded/serif | Marker + sans | Heavy sans | Condensed |
| **Color count** | 3-4 | 4-5 | 4 (markers) | 4-5 | 2-3 |
| **Layout** | Grid | Organic | Diagram-centric | Documentary | Dense |
| **Icons** | Minimal | Sketched | Schematic | Documentary | Pictogram |
| **Best format** | Handbook | Handbook | Training | Training/handbook | Cards/signs |

---

## Next Steps

1. Create sample visualizations showing each style applied to the same content (ladder safety)
2. Test distinctiveness - can viewers identify which style is which?
3. Test appropriateness - does each style feel right for its voice?
4. Gather feedback and refine specifications
