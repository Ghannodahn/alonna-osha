# Facilitator's Guide Publishing Guide

**Document Set:** Facilitator's Guide for Peer-Led Safety Training
**Version:** 1.2
**Publication Date:** January 2026
**Status:** OSHA Verified | Ready for Distribution

---

## Overview

This guide explains how to produce print-ready and digital versions of the Facilitator's Guide document set for distribution to construction safety facilitators.

### Document Set Contents

| Document | Purpose | Format | Pages (Est.) |
|----------|---------|--------|--------------|
| Facilitator's Guide | Full training context | Letter (8.5×11) | 12-14 |
| Facilitator Script | Word-for-word practice | Letter (8.5×11) | 6-8 |
| Cliff Notes | Pocket reference | Letter or Half-letter | 1-2 |
| Quick Reference Card | Laminated pocket card | 4×6 index card | 2 (front/back) |

---

## Print Production

### Paper Specifications

**Main Documents (Guide & Script):**
- Paper size: Letter (8.5" × 11")
- Paper weight: 24 lb bond / 90 gsm
- Color: Full color for headers, black text
- Binding: Saddle stitch or 3-hole punch for binder

**Cliff Notes:**
- Paper size: Letter (8.5" × 11") or Half-letter (5.5" × 8.5")
- Paper weight: 24 lb bond / 90 gsm or heavier
- Fold: Tri-fold or half-fold for pocket carry
- Lamination: Optional for outdoor durability

**Quick Reference Card:**
- Paper size: 4" × 6" index card
- Paper weight: 80-100 lb cover stock / 216-270 gsm
- Lamination: Recommended (outdoor/jobsite use)
- Print: Full color, high contrast

### Color Palette (Print-Optimized)

| Element | Hex | CMYK | Usage |
|---------|-----|------|-------|
| Background | #FDF8F3 | 0/2/4/1 | Page background (optional, can use white) |
| Primary text | #1A1A1A | 0/0/0/90 | Body text |
| Accent (headers) | #E85D04 | 0/65/98/9 | Section headers, checkmarks |
| Alert/negative | #C1121F | 0/92/84/24 | X marks, warnings |
| Table borders | #D1D1D1 | 0/0/0/18 | Table grid lines |

### Printing Instructions

**For professional print shop:**

1. **Export to PDF** using your markdown-to-PDF tool of choice:
   - Pandoc with LaTeX
   - Markdown to PDF converter
   - Google Docs/Word export

2. **Page settings:**
   - Margins: 0.75" all sides (minimum 0.5" for bleed-safe)
   - Headers: Document title, page number
   - Page breaks: Honor `<div style="page-break-after: always;"></div>` markers

3. **Print specifications:**
   - Resolution: 300 DPI minimum
   - Color profile: CMYK for professional printing, sRGB for office printers
   - Bleed: 0.125" if full-bleed design elements used

**For office printing:**
- Print on standard letter paper
- Use duplex (double-sided) printing to reduce page count
- Consider printing Cliff Notes at 90% scale for pocket-friendliness

### Quick Reference Card Production

The quick reference card images are available in `/docs/assets/quick-reference-card/`:

| File | Format | Use Case |
|------|--------|----------|
| facilitator-card-1.png | PNG (high-res) | Professional printing |
| facilitator-card-1.webp | WebP | Digital display, web |
| facilitator-card-2.png | PNG (high-res) | Alternative design |
| facilitator-card-3.png | PNG (high-res) | Alternative design |

**Production steps:**
1. Select preferred card design (1, 2, or 3)
2. Print at 4" × 6" or scale proportionally
3. Cut along card boundaries
4. Laminate with 5-7 mil pouches for durability
5. Punch hole in corner for lanyard attachment (optional)

---

## Digital Production

### Digital Document Format

The digital versions are available in `/docs/publish/digital/` and are designed for:
- On-screen reading (tablet, laptop, phone)
- Interactive navigation
- Quick reference during live sessions

### HTML Export

For web-based distribution, export markdown files to HTML:

```bash
# Using Pandoc
pandoc facilitators-guide.md -o facilitators-guide.html --standalone --toc

# With custom CSS
pandoc facilitators-guide.md -o facilitators-guide.html --standalone --toc --css=styles.css
```

### Mobile-Friendly Considerations

The digital version includes:
- **Responsive tables:** Use scrollable tables on narrow screens
- **Large tap targets:** Links and buttons ≥44px for touch
- **High contrast:** Meets WCAG 2.1 AA standards
- **Collapsible sections:** Optional for the full guide
- **Offline availability:** Can be saved as PWA or PDF

### PDF Generation

For digital PDF distribution:

```bash
# Pandoc with LaTeX
pandoc facilitators-guide.md -o facilitators-guide.pdf \
  --pdf-engine=xelatex \
  --variable geometry:margin=1in

# Or using weasyprint for HTML-first approach
weasyprint facilitators-guide.html facilitators-guide.pdf
```

---

## Distribution Checklist

### Before Distribution

- [ ] All documents spell-checked
- [ ] OSHA verification status confirmed (v1.2 PASSED)
- [ ] Version numbers consistent across documents
- [ ] Internal links working (Guide ↔ Script ↔ Cliff Notes)
- [ ] Page breaks render correctly in print preview
- [ ] Quick reference card images print at correct size

### Print Package (Per Facilitator)

| Item | Qty | Notes |
|------|-----|-------|
| Facilitator's Guide | 1 | Full document for reading/reference |
| Facilitator Script | 1 | For practice sessions |
| Cliff Notes | 1 | Laminated, for pocket |
| Quick Reference Card | 1 | Laminated, for pocket/lanyard |

### Digital Package

| Item | Format | Distribution |
|------|--------|--------------|
| Facilitator's Guide | PDF | Email, download, LMS |
| Facilitator Script | PDF | Email, download, LMS |
| Cliff Notes | PDF | Email, download, LMS |
| Quick Reference Card | PNG/PDF | Email, download, print-at-home |
| Complete Package | ZIP | Single download option |

---

## Compliance & Attribution

### OSHA Verification Status

This document set has been verified for OSHA compliance:

| Document | Verification Status | Date |
|----------|---------------------|------|
| Facilitator's Guide v1.2 | ✅ PASSED | January 2026 |
| Facilitator Script v1.0 | ✅ Derivative (covered by Guide verification) | January 2026 |
| Cliff Notes | ✅ Derivative (covered by Guide verification) | January 2026 |
| Quick Reference Card | ✅ Derivative (covered by Guide verification) | January 2026 |

Full verification report: `/docs/verification/facilitators-guide-osha-verification.md`

### Document Attribution

All published materials should include:

```
Facilitator's Guide: Peer-Led Safety Training
Version 1.2 | OSHA Verified | January 2026

This material is intended for peer-led safety training in construction
volunteer contexts. It does not replace official OSHA training or
professional safety certification.

For questions or feedback: [Organization Contact]
```

### Revision Control

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | January 2026 | Initial release |
| 1.1 | January 2026 | Enhanced 3-point contact language |
| 1.2 | January 2026 | Language psychology updates (RACE, soft phrases) |

---

## File Locations

```
docs/
├── content/
│   ├── facilitators-guide.md          # Source: Main guide
│   ├── facilitators-guide-script.md   # Source: Practice script
│   └── facilitators-guide-cliff-notes.md # Source: Pocket reference
├── assets/
│   └── quick-reference-card/
│       ├── facilitator-card-1.png     # Card design option 1
│       ├── facilitator-card-2.png     # Card design option 2
│       ├── facilitator-card-3.png     # Card design option 3
│       └── prompt.txt                 # Card generation prompt
├── verification/
│   └── facilitators-guide-osha-verification.md # Compliance report
└── publish/
    ├── PUBLISHING-GUIDE.md            # This file
    ├── print/
    │   ├── facilitators-guide-print.md
    │   ├── facilitators-script-print.md
    │   └── facilitators-cliff-notes-print.md
    └── digital/
        └── (digital versions)
```

---

## Support & Feedback

### Stakeholder Feedback Collection

A structured feedback form is available for collecting input from:
- Safety coordinators/supervisors
- Experienced volunteer facilitators
- New volunteers

Form location: `/docs/content/facilitators-guide-stakeholder-feedback.md`

### Revision Requests

For content revisions:
1. Document the requested change
2. Assess OSHA compliance impact
3. If safety claims change, re-verify against OSHA standards
4. Update version number
5. Update all derivative documents (Script, Cliff Notes, Card)

---

**Publishing Guide Version:** 1.0
**Last Updated:** January 2026
