# Visual Style System - Implementation Guide

## Overview

This directory contains the complete visual style specifications for the five OSHA safety conversation styles. Each style has:

1. **style.prompt.md** - AI image generation prompt with exact visual specifications
2. **ladder-safety.content.md** - Sample content formatted for that style

## The Five Styles

| Directory | Style Name | Visual Metaphor | Primary Use |
|-----------|------------|-----------------|-------------|
| `straight-talk/` | Straight Talk | Engineer's Clipboard | Handbook reference |
| `been-there/` | Been There | Field Notebook | Training materials |
| `lets-figure/` | Let's Figure This Out | Whiteboard Session | Group learning |
| `real-consequences/` | Real Consequences | Incident Report | High-risk topics |
| `quick-hits/` | Quick Hits | Pocket Card | Point-of-use reference |

## File Structure

```
visual-styles/
├── README.md (this file)
├── straight-talk/
│   ├── style.prompt.md       # Visual specifications
│   ├── ladder-safety.content.md  # Sample content
│   └── images/               # Generated images (to be created)
├── been-there/
│   ├── style.prompt.md
│   ├── ladder-safety.content.md
│   └── images/
├── lets-figure/
│   ├── style.prompt.md
│   ├── ladder-safety.content.md
│   └── images/
├── real-consequences/
│   ├── style.prompt.md
│   ├── ladder-safety.content.md
│   └── images/
└── quick-hits/
    ├── style.prompt.md
    ├── ladder-safety.content.md
    └── images/
```

## Generating Images

### Using Gemini (gemini.google.com)

For each style, combine the style.prompt.md and content file:

```
[Contents of style.prompt.md]

---
CONTENT TO VISUALIZE:
---

[Contents of ladder-safety.content.md]

---
Generate a safety infographic following the style specifications above.
Create a LANDSCAPE (16:9) aspect ratio image.
```

### Recommended Workflow

1. Open gemini.google.com
2. Sign in to Google account
3. Paste combined prompt + content
4. Generate 3 variants
5. Download best result
6. Save to `[style]/images/` directory

## Icon Resources

As specified by the project owner, use these icon libraries:

- **react-icons** - https://react-icons.github.io/react-icons/
- **lucide-icons** - https://lucide.dev/icons/

### Recommended Icon Categories

| Style | Icon Style | Suggested Sets |
|-------|------------|----------------|
| Straight Talk | Geometric, minimal | Lucide (clean lines) |
| Been There | Softer, rounded | React Icons - Feather |
| Let's Figure | Diagram elements | Lucide (arrows, shapes) |
| Real Consequences | Realistic, standard | React Icons - Material |
| Quick Hits | Pictogram, ISO-style | Lucide (bold variants) |

## Color Palettes (Quick Reference)

### Straight Talk
- Black #1A1A1A, Off-white #FAFAFA, Safety Yellow #FFD100, Gray #4A4A4A

### Been There
- Brown #3D2B1F, Cream #F5F0E8, Orange #CC7722, Sage #8B9A6B

### Let's Figure
- Blue #2C5282, White #FFFFFF, Green #38A169, Red #E53E3E

### Real Consequences
- Black #1A202C, White #FFFFFF, Orange #DD6B20, Green #276749

### Quick Hits
- Black #000000, White #FFFFFF, Yellow #FFD100

## Typography Recommendations

### Web-Safe Font Stacks

**Straight Talk:**
```css
font-family: Impact, "Arial Black", "Helvetica Neue", sans-serif;
```

**Been There:**
```css
font-family: "Nunito", Georgia, Merriweather, serif;
```

**Let's Figure:**
```css
font-family: "Permanent Marker", "Caveat", "Open Sans", sans-serif;
```

**Real Consequences:**
```css
font-family: Roboto, "Source Sans Pro", Arial, sans-serif;
```

**Quick Hits:**
```css
font-family: Oswald, "Barlow Condensed", "Arial Narrow", sans-serif;
```

## Production Formats

### Print Specifications

| Format | Size | Resolution | Color Mode |
|--------|------|------------|------------|
| Handbook page | 8.5" × 11" | 300 DPI | CMYK or RGB |
| Pocket card | 3" × 5" or 4" × 6" | 300 DPI | CMYK |
| Poster/Sign | 11" × 17"+ | 150 DPI min | CMYK |

### Digital Specifications

| Format | Resolution | Color Mode |
|--------|------------|------------|
| Screen display | 72-96 DPI | RGB |
| PDF export | 150 DPI | RGB |
| Web images | 1080p max | RGB/sRGB |

## Quality Checklist

Before finalizing any visual:

- [ ] Colors match style palette (exact hex codes)
- [ ] Typography matches style specification
- [ ] Layout follows style's structure
- [ ] Hierarchy is clear (what to read 1st/2nd/3rd)
- [ ] Works in grayscale (accessibility)
- [ ] Scannable in 5-10 seconds
- [ ] Would be recognized by construction workers
- [ ] Safety color conventions used appropriately

## Related Documentation

- `docs/discovery/10-visual-style-analysis.md` - Detailed style analysis
- `docs/discovery/11-safety-visual-design-principles.md` - Research foundations
- `docs/discovery/12-visual-style-concepts.md` - Complete specifications
- `docs/discovery/13-sample-visualizations.md` - ASCII mockups
- `docs/discovery/14-visual-style-selection-and-implementation.md` - Implementation plan
