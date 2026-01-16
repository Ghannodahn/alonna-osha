# Digital Companion Strategy Specification

**Document Date:** January 2026
**Status:** Final
**Purpose:** Define how digital tools complement the physical safety handbook

---

## Executive Summary

The digital companion is not a replacement for the handbook—it's an extension layer that makes safety information accessible in ways print cannot achieve. The core insight driving this strategy:

> **Print works when tech fails. Digital works when print is inaccessible. Together, they ensure safety information is always available.**

This specification defines:
1. What content lives where (handbook-only, digital-only, both)
2. How digital bridges connect print to expanded content
3. The technology stack and delivery mechanisms
4. MVP features vs. future enhancements

---

## Design Principles

### 1. Physical + Digital Hybrid

The handbook is the foundation. Digital enhances it but never replaces it.

| Scenario | Solution |
|----------|----------|
| No phone/dead battery | Physical handbook + pocket cards still work |
| Can't read small text | Audio version via QR code |
| Need video demonstration | QR links to hosted video |
| Searching for specific topic | Digital search (PWA) |
| Working with hands full | Audio playback while working |
| No connectivity | Essential info on physical card; digital cached via PWA |

### 2. Zero Friction Access

No apps to download. No accounts to create. No logins required.

| Interaction | Friction Level |
|-------------|----------------|
| Scan QR code | None - native on all smartphones |
| Visit URL | None - browser-based |
| Download PWA | Minimal - one-tap "Add to Home Screen" |
| Watch video | Low - auto-plays on page |
| Listen to audio | Low - one-tap play |

### 3. Offline-First Design

Assume connectivity is unreliable on construction sites.

| Content Type | Offline Strategy |
|--------------|------------------|
| Text content | Cached after first load (PWA) |
| Images/diagrams | Cached after first load |
| Videos | Download option for key content |
| Audio | Download option for all audio |
| Interactive quizzes | Works offline (PWA) |

### 4. Progressive Enhancement

Essential info always accessible; enhanced features available when technology permits.

```
┌─────────────────────────────────────────────────────────────────┐
│  LEVEL 1: NO TECH                                                │
│  Physical handbook + pocket cards                                │
│  → Everything needed to work safely                              │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  LEVEL 2: BASIC SMARTPHONE                                       │
│  QR scan → static web page                                       │
│  → Expanded content, audio version, video demos                  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  LEVEL 3: PWA INSTALLED                                          │
│  Offline access, full navigation, search                         │
│  → Complete digital companion experience                         │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  LEVEL 4: WITH CONNECTIVITY                                      │
│  Video streaming, SMS reminders, content updates                 │
│  → Enhanced engagement and spaced repetition                     │
└─────────────────────────────────────────────────────────────────┘
```

---

## Content Distribution Matrix

### What Lives Where

| Content Type | Handbook Only | Digital Only | Both |
|--------------|:-------------:|:------------:|:----:|
| **Core safety rules (3-5 points per topic)** | | | ✓ |
| **"Been There" narrative stories** | | | ✓ |
| **Quick reference checklists** | | | ✓ |
| **Visual diagrams** | | | ✓ |
| **Video demonstrations** | | ✓ | |
| **Audio narrations** | | ✓ | |
| **Interactive knowledge checks** | | ✓ | |
| **Full OSHA regulation references** | | ✓ | |
| **Expanded "why it matters" explanations** | | ✓ | |
| **Scenario walkthroughs** | | ✓ | |
| **Emergency contact fill-in cards** | ✓ | | |
| **Physical tear-out quick references** | ✓ | | |
| **Glossary** | | | ✓ |
| **Index (searchable)** | Print version | Full-text search | ✓ |
| **Toolbox talk scripts (for supervisors)** | | ✓ | |
| **Discussion question banks** | | ✓ | |
| **Incident scenario library** | | ✓ | |
| **Spanish language versions** | Select cards | Full content | Partial |
| **Update notifications** | Quarterly inserts | Real-time | |

### Content Distribution Rationale

**Handbook-only content:**
- Emergency contacts: Needs to work when phone is unavailable/damaged
- Tear-out references: Physical presence at point-of-use matters
- Tactile, visible, independent of technology

**Digital-only content:**
- Video: Print can't demonstrate motion, technique, real-world scenarios
- Audio: Accessibility for low-literacy, hands-busy situations
- Search: Print indexes are limited; digital enables instant lookup
- Interactive: Knowledge checks require response capture
- Depth: Full OSHA references, extended explanations—too bulky for print
- Updates: Real-time correction of errors, new content addition

**Both (parallel availability):**
- Core safety content: Available regardless of technology status
- Checklists: Print for hands-on use; digital for progress tracking
- Diagrams: Print for physical reference; digital for zoom/detail
- Glossary: Print for quick lookup; digital for search

---

## QR Code Strategy

### QR Code Types

| QR Type | Destination | Use Case |
|---------|-------------|----------|
| **Topic QR** | PWA topic page | From handbook chapter to expanded content |
| **Video QR** | Hosted video | Direct to demonstration video |
| **Audio QR** | Audio player | "Listen to this section" accessibility |
| **Card QR** | Topic page + downloads | From pocket card to full resources |
| **Emergency QR** | Emergency procedures page | Critical info access |

### QR Code Placement

**In the handbook:**
- One QR per chapter (bottom right corner, footer zone)
- Links to corresponding topic page in digital hub
- Caption: "Scan for video demo & more detail"

**On pocket cards:**
- Back of every card
- Links to topic page with video, audio, and expanded checklist
- Caption: "Scan to watch | Listen | Learn more"

**On signage:**
- Optional for permanent site signage
- Links to just-in-time briefing content
- Caption: "Quick safety briefing"

### QR Code Technical Specifications

| Attribute | Specification |
|-----------|---------------|
| **Size** | Minimum 1" x 1" (25mm x 25mm) for reliable scanning |
| **Error correction** | Level H (30% damage tolerance) for construction environment |
| **URL structure** | Short URLs (e.g., `site.org/s/ladder`) for smaller QR codes |
| **Tracking** | UTM parameters optional (e.g., `?src=card-ladder`) |
| **Destination** | Always a PWA page, not direct video link (enables offline caching) |

### QR Code URL Mapping

| Topic | Short URL | Destination |
|-------|-----------|-------------|
| Ladder Safety | `/s/ladder` | Ladder topic page (video + audio + checklist) |
| PPE | `/s/ppe` | PPE topic page |
| Manual Handling | `/s/lifting` | Lifting topic page |
| Emergency | `/s/emergency` | Emergency procedures page |
| Heat Illness | `/s/heat` | Heat illness topic page |
| Power Tools | `/s/power-tools` | Power tools topic page |
| Working Above/Below | `/s/overhead` | Overhead hazards topic page |

---

## Digital Hub Architecture (PWA)

### Site Structure

```
/                           Home (topic grid, search)
├── /topics/                Topic index
│   ├── /ladder            Ladder safety
│   ├── /ppe               Personal protective equipment
│   ├── /lifting           Manual handling
│   ├── /power-tools       Power tool safety
│   ├── /overhead          Working above/below others
│   ├── /electrical        Electrical safety
│   ├── /heat              Heat illness prevention
│   └── /emergency         Emergency procedures
├── /video/                 Video library
├── /audio/                 Audio library
├── /quiz/                  Knowledge checks
├── /toolbox/               Supervisor resources
│   ├── /talks             Toolbox talk scripts
│   ├── /discussion        Discussion question bank
│   └── /scenarios         Incident scenario library
├── /reference/
│   ├── /glossary          Searchable glossary
│   ├── /osha              OSHA regulation references
│   └── /updates           Change log
├── /es/                    Spanish language mirror
└── /offline/               Offline content index
```

### Topic Page Template

Each topic page follows consistent structure:

```
┌─────────────────────────────────────────────────────────────────┐
│  [TOPIC TITLE]                                    [Audio icon] │
│  Read time: X min | Watch: X min                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  WHY THIS MATTERS                                               │
│  [1-2 sentence hook - peer-to-peer tone]                       │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  [VIDEO EMBED - "Been There" demonstration]                     │
│  Duration: 1-3 minutes                                         │
│  [Download for offline] button                                  │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  THE ESSENTIALS                                                 │
│  → Key point 1                                                  │
│  → Key point 2                                                  │
│  → Key point 3                                                  │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  QUICK CHECK                                                    │
│  [3-5 question knowledge check - interactive]                   │
│  [Works offline]                                                │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  WANT TO KNOW MORE?                                             │
│  [Expandable: Full OSHA reference]                              │
│  [Expandable: Common scenarios Q&A]                             │
│  [Expandable: Supervisor talking points]                        │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  [Download PDF checklist] [Share this page]                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### PWA Technical Requirements

| Feature | Implementation |
|---------|----------------|
| **Installable** | Web app manifest with icons, start_url |
| **Offline capable** | Service worker caching all static assets |
| **Responsive** | Mobile-first design, works on any screen size |
| **Fast** | Target < 3s first contentful paint on 3G |
| **Accessible** | WCAG 2.1 AA compliant |
| **Searchable** | Client-side search (no server needed) |

### Offline Caching Strategy

| Content | Cache Strategy |
|---------|----------------|
| **HTML pages** | Cache-first, update in background |
| **CSS/JS** | Cache-first with versioning |
| **Images/diagrams** | Cache on first load |
| **Videos** | Manual download to cache (user-initiated) |
| **Audio** | Manual download to cache (user-initiated) |
| **Quiz data** | Pre-cached with app |

---

## Video Content Strategy

### Video Types

| Type | Duration | Purpose | Tone |
|------|----------|---------|------|
| **"Been There" Story** | 60-90 sec | Emotional hook, memorable narrative | Been There |
| **Technique Demo** | 30-60 sec | Show correct procedure | Straight Talk |
| **"Spot the Hazard"** | 45-60 sec | Interactive awareness exercise | Let's Figure This Out |
| **Quick Reminder** | 15-30 sec | Point-of-use reinforcement | Quick Hits |

### Video Production Guidelines

| Attribute | Specification |
|-----------|---------------|
| **Resolution** | 1080p (720p acceptable for MVP) |
| **Aspect ratio** | 16:9 (mobile-friendly vertical crops available) |
| **Captioning** | Required - burned-in or closed captions |
| **Narration** | Clear, peer-to-peer tone; not corporate voice |
| **Background** | Realistic jobsite context, not studio |
| **Talent** | Real volunteers/workers preferred over actors |
| **File size** | Optimized for mobile download (< 20MB per minute) |

### Video Priority (MVP)

| Topic | Video Type | Priority |
|-------|-----------|----------|
| Ladder Safety | Technique Demo + Been There | P0 |
| Manual Handling | Technique Demo | P0 |
| Heat Illness Signs | Recognition Demo | P0 |
| PPE Fitting | Technique Demo | P1 |
| Working Above/Below | Awareness + Communication | P1 |
| Power Tool Safety | Technique Demo | P2 |
| Emergency Response | Procedure Walkthrough | P1 |

---

## Audio Content Strategy

### Audio Types

| Type | Duration | Purpose |
|------|----------|---------|
| **Page narration** | 2-4 min | Full topic page read aloud |
| **Key points only** | 30-60 sec | Just the essentials |
| **Story version** | 60-90 sec | "Been There" narrative only |

### Audio Production Options

| Option | Cost | Quality | Scalability |
|--------|------|---------|-------------|
| **Text-to-speech (AI)** | Free | Good (with ElevenLabs/similar) | High |
| **Volunteer narration** | Free | Variable | Medium |
| **Professional VO** | $50-200/topic | High | Low |

**Recommendation:** Start with AI text-to-speech for MVP; evaluate upgrade to professional VO for high-priority topics based on feedback.

### Audio Requirements

| Attribute | Specification |
|-----------|---------------|
| **Format** | MP3 (universal compatibility) |
| **Bitrate** | 128kbps (voice-optimized) |
| **Player** | Simple play/pause, no scrubbing needed |
| **Download** | Available for offline listening |
| **Speed control** | Optional 0.75x / 1x / 1.25x / 1.5x |

---

## Interactive Checklist Strategy

### Checklist Types

| Type | Location | Interactive? |
|------|----------|--------------|
| **Print checklist** | Pocket card / handbook | No (checkbox) |
| **Digital checklist** | PWA topic page | Yes (tap to complete) |
| **Supervisor tracking** | PWA toolbox section | Yes (multi-person tracking) |

### Digital Checklist Features

| Feature | MVP | Future |
|---------|-----|--------|
| Tap to complete items | ✓ | ✓ |
| Progress indicator | ✓ | ✓ |
| Reset checklist | ✓ | ✓ |
| Save completed state | | ✓ |
| Supervisor sign-off | | ✓ |
| Export/share completion | | ✓ |
| Multi-language toggle | | ✓ |

### Example: Ladder Setup Interactive Checklist

```
LADDER SETUP CHECKLIST

Before you climb:
[ ] Right ladder for the job (height, weight rating)
[ ] Ladder inspected - no damage, no wobble
[ ] Firm, level surface
[ ] 4:1 ratio (1 foot out for every 4 feet up)
[ ] Tied off or held at base
[ ] Area clear below

While climbing:
[ ] 3 points of contact at all times
[ ] Face the ladder
[ ] Don't carry materials in hands
[ ] Someone knows you're up there

[✓ All checked - ready to climb]
```

---

## Knowledge Check Strategy

### Quiz Design Principles

| Principle | Implementation |
|-----------|----------------|
| **Low stakes** | No failure state; incorrect → immediate feedback |
| **Recall practice** | Questions require retrieval, not recognition |
| **3-5 questions max** | Respects attention span |
| **Immediate feedback** | Correct/incorrect shown instantly |
| **Retry encouraged** | "Try again" not "You failed" |
| **Offline capable** | Works without connectivity |

### Question Types

| Type | Example | When to Use |
|------|---------|-------------|
| **Multiple choice** | "What's the correct ladder angle ratio?" | Factual recall |
| **True/False** | "You can carry tools while climbing a ladder" | Myth-busting |
| **Scenario choice** | "You notice a frayed cord. What do you do?" | Decision practice |
| **Image-based** | "Which setup is correct?" [two images] | Visual recognition |

### Sample Knowledge Check: Ladder Safety

```
QUICK CHECK: LADDER SAFETY

1. What's the correct setup ratio for an extension ladder?
   a) 1 foot out for every 2 feet up
   b) 1 foot out for every 4 feet up ✓
   c) 2 feet out for every 4 feet up
   d) It doesn't matter as long as it feels stable

2. True or False: It's okay to carry tools in your hands
   while climbing if you go slowly.
   [ ] True
   [✓] False

   → Correct! Always maintain 3 points of contact.
     Use a tool belt or haul line for materials.

3. You're about to climb a ladder and notice one rung
   feels loose. What do you do?
   a) Climb carefully, avoiding that rung
   b) Tell someone after you're done with the task
   c) Tag it as damaged and find another ladder ✓
   d) It's probably fine for light work

[3/3 correct - Nice work!]
```

---

## SMS/Text Reminder System

### Purpose

Leverage spaced repetition through opt-in text reminders:
- Pre-arrival briefing (day before)
- Return visitor refresher
- Seasonal reminders (heat safety in summer)

### Message Types

| Type | Timing | Content |
|------|--------|---------|
| **Pre-arrival** | 24 hours before build day | "Tomorrow's safety focus + what to bring" |
| **Return refresher** | When returning after 2+ weeks | "Welcome back! Quick refresher on [topic]" |
| **Seasonal** | Start of season | "Summer's here - heat safety reminder" |
| **Post-training** | 24-48 hours after orientation | "Remember: 4:1 ratio, 3 points of contact" |

### Sample Messages

**Pre-arrival (day before):**
```
Tomorrow at [Site Name]!

Quick safety prep:
→ Wear closed-toe shoes (no sandals)
→ Long pants recommended
→ We provide hard hats, safety glasses, gloves

See you at [time]!

Questions? Reply to this message.
```

**Return refresher:**
```
Welcome back!

Since your last visit, here's a 60-second refresher:
[link to PWA page]

See you tomorrow at [Site Name]!
```

**Seasonal (heat):**
```
Summer safety reminder:

☀️ Hydrate BEFORE you're thirsty
☀️ Take shade breaks
☀️ Know the signs: headache, dizziness, confusion

Full heat safety guide: [link]
```

### Implementation

| Phase | Capability |
|-------|------------|
| **MVP** | Manual send via Twilio/similar; opt-in list |
| **Phase 2** | Automated scheduling based on build calendar |
| **Phase 3** | Integration with volunteer management system |

### Privacy Considerations

- Opt-in only (never auto-enroll)
- Easy opt-out (reply STOP)
- Phone numbers used only for safety communications
- No sharing with third parties
- Clear data retention policy

---

## Searchable Content

### Search Scope

| Content | Searchable? |
|---------|-------------|
| Topic page titles | ✓ |
| Topic page body text | ✓ |
| Glossary terms and definitions | ✓ |
| Video titles and descriptions | ✓ |
| Audio titles | ✓ |
| OSHA regulation text | ✓ |
| Quiz questions | ✓ |

### Search Implementation

| Approach | Pros | Cons |
|----------|------|------|
| **Client-side (Lunr.js, Fuse.js)** | Works offline; no server | Index size grows with content |
| **Algolia (free tier)** | Fast, typo-tolerant | Requires connectivity |
| **Simple keyword match** | Zero dependencies | Less sophisticated |

**Recommendation:** Lunr.js for MVP (offline-compatible); evaluate Algolia if search quality feedback indicates need.

### Search UX

```
┌─────────────────────────────────────────────────────────────────┐
│  🔍 Search safety topics...                                     │
│  ─────────────────────────────────────────────────────────────  │
│                                                                 │
│  RECENT SEARCHES                                                │
│  → ladder                                                       │
│  → lifting                                                      │
│                                                                 │
│  QUICK ACCESS                                                   │
│  → [Emergency] [PPE] [Ladders] [Lifting]                       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Multilingual Support

### Language Priority

| Language | Priority | Rationale |
|----------|----------|-----------|
| English | P0 | Primary audience |
| Spanish | P1 | Largest non-English construction workforce; OSHA requirement |
| Other | P3 | Based on actual volunteer demographics |

### Translation Strategy

| Content Type | Translation Approach |
|--------------|---------------------|
| **Core safety points** | Professional human translation |
| **"Been There" stories** | Professional human translation (tone matters) |
| **Extended explanations** | AI translation with human review |
| **OSHA references** | Link to official OSHA Spanish materials |
| **UI elements** | Professional human translation |
| **Video captions** | Professional human translation |
| **Audio narration** | Separate Spanish recordings |

### Implementation Phases

| Phase | Spanish Coverage |
|-------|-----------------|
| **MVP** | None (English only) |
| **Phase 2** | P0/P1 topic pages translated |
| **Phase 3** | Full content parity |

### URL Structure for Languages

```
/topics/ladder        → English ladder page
/es/topics/ladder     → Spanish ladder page
```

---

## Supervisor/Facilitator Resources

### Toolbox Talk Support

Digital resources that don't belong in volunteer-facing handbook:

| Resource | Description |
|----------|-------------|
| **Talk scripts** | Ready-to-deliver 10-minute toolbox talks |
| **Discussion questions** | Open-ended questions for each topic |
| **Scenario library** | "What would you do if..." situations |
| **Visual aids** | Large-format images for group display |
| **Timing guides** | Suggested pacing for each segment |

### Talk Script Structure

```
TOOLBOX TALK: LADDER SAFETY
Estimated time: 10 minutes

─────────────────────────────────────────────────────────────────
SETUP (30 sec)
Have a ladder nearby for demonstration

─────────────────────────────────────────────────────────────────
HOOK (1 min)
"Falls are the #1 cause of construction deaths.
Most ladder accidents happen to experienced people who
thought they knew what they were doing. Here's what I want
you to remember today..."

─────────────────────────────────────────────────────────────────
THE STORY (2 min)
[Insert "Been There" narrative about near-miss or incident]

─────────────────────────────────────────────────────────────────
KEY POINTS (3 min)
1. 4:1 ratio - demonstrate on the ladder
2. 3 points of contact - have someone demonstrate
3. Someone watching - explain buddy system

─────────────────────────────────────────────────────────────────
DISCUSSION (2 min)
- "What could go wrong if the ladder isn't stable?"
- "Why do experienced people sometimes skip steps?"
- "What should you do if a ladder looks damaged?"

─────────────────────────────────────────────────────────────────
CLOSE (1 min)
Recap: "4:1, 3 points, someone watching. Questions?"

─────────────────────────────────────────────────────────────────
```

---

## MVP vs. Future Features

### MVP (Phase 1): Foundation

**Goal:** Functional digital companion that proves the concept

| Component | Scope |
|-----------|-------|
| **PWA site** | Static site generator (11ty, Hugo, Astro) |
| **QR codes** | Generated for all P0/P1 topics |
| **Topic pages** | P0 topics (5-6 topics) with full content |
| **Video** | 2-3 demo videos (ladder, lifting, heat) |
| **Audio** | AI-generated narration for P0 topics |
| **Checklists** | Static (non-interactive) on topic pages |
| **Knowledge checks** | Simple multiple choice, 3-5 questions per P0 topic |
| **Search** | Basic keyword search |
| **Offline** | Service worker caching all static content |
| **Mobile** | Responsive design, mobile-first |
| **Hosting** | Free tier (GitHub Pages, Netlify, Vercel) |

**Not in MVP:**
- Spanish translation
- Interactive checklist state persistence
- SMS reminders
- Supervisor toolbox section
- Video downloads
- Analytics

**MVP Effort Estimate:**
- Site structure and styling: Development time required
- Content population: Per-topic content writing
- QR generation: Automated via build process
- Total: Achievable with focused effort

---

### Phase 2: Enhancement

**Goal:** Improve engagement and accessibility based on MVP feedback

| Component | Enhancement |
|-----------|-------------|
| **Video** | Videos for all P1 topics |
| **Audio** | Professional narration for P0 topics |
| **Checklists** | Interactive with local state persistence |
| **Spanish** | P0/P1 topics translated |
| **SMS** | Opt-in reminder system (Twilio) |
| **Analytics** | Privacy-respecting usage tracking (Plausible) |
| **Supervisor resources** | Toolbox talk scripts for P0 topics |

---

### Phase 3: Scale

**Goal:** Full-featured platform with organizational integration

| Component | Enhancement |
|-----------|-------------|
| **Full Spanish parity** | All content available in Spanish |
| **Additional languages** | Based on demographic data |
| **Supervisor portal** | Attendance tracking, certification logging |
| **Content updates** | CMS for non-technical updates |
| **Integration** | Connect with volunteer management systems |
| **Native app** | Consider if PWA limitations become blockers |

---

## Technical Architecture Summary

### MVP Tech Stack

| Layer | Technology | Rationale |
|-------|------------|-----------|
| **Static site generator** | Astro or 11ty | Simple, fast, good PWA support |
| **Styling** | Tailwind CSS | Utility-first, consistent, small bundle |
| **PWA** | Workbox | Google's service worker library |
| **Search** | Lunr.js | Client-side, offline-compatible |
| **Video hosting** | YouTube (unlisted) or Cloudflare Stream | Free/cheap, good mobile support |
| **Audio hosting** | Same as site (static files) | Small files, no streaming needed |
| **Hosting** | Netlify or Vercel | Free tier, automatic deploys |
| **QR generation** | Build-time generation (qrcode npm) | No runtime dependencies |
| **Domain** | Custom domain | Professional appearance |

### Future Considerations

| Need | Solution |
|------|----------|
| If CMS needed | Decap CMS (Git-based) or Sanity (free tier) |
| If SMS needed | Twilio or Vonage |
| If analytics needed | Plausible (privacy-first) |
| If translations at scale | i18n framework (Astro has built-in) |

---

## Content Production Pipeline

### Per-Topic Deliverables

For each safety topic, produce:

| Asset | Format | Destination |
|-------|--------|-------------|
| **Handbook page** | Print-ready PDF | Physical handbook |
| **Pocket card** | Print-ready PDF (4"x6") | Laminated handout |
| **Topic page** | Markdown → HTML | PWA site |
| **Audio narration** | MP3 | PWA site |
| **Video demo** | MP4 (P0 topics) | YouTube/host → embed |
| **Knowledge check** | JSON/YAML data | PWA site |
| **QR code** | SVG | Handbook, pocket card |
| **Signage version** | Print-ready PDF | Site posting |

### Content Dependencies

```
Handbook chapter content
        │
        ├─── Pocket card (condensed version)
        │           │
        │           └─── QR code → Topic page
        │
        └─── Topic page (expanded version)
                    │
                    ├─── Audio narration (of page content)
                    ├─── Video demo (separate production)
                    ├─── Knowledge check (from key points)
                    └─── Signage (from key points)
```

---

## Success Metrics

### Quantitative (Phase 2+)

| Metric | Target | Measurement |
|--------|--------|-------------|
| QR code scans | Baseline + 20% over time | Analytics |
| Page views per visit | 2+ pages | Analytics |
| Video watch rate | 50%+ completion | Video analytics |
| Quiz completion | 70%+ attempt rate | Analytics |
| PWA installs | Track trend | Analytics |
| Time to find info | < 30 seconds | User testing |

### Qualitative (Ongoing)

| Metric | Target | Measurement |
|--------|--------|-------------|
| Volunteer feedback | "Easy to use" | Post-build surveys |
| Supervisor feedback | "Saves me time" | Supervisor interviews |
| Content clarity | "Understood the topic" | Survey + quiz performance |
| Accessibility | "Audio/video helpful" | Survey |

---

## Implementation Priorities

### Immediate (MVP)

1. Set up static site structure with PWA support
2. Create topic page template
3. Populate P0 topic pages (Ladder, Lifting, Heat, Emergency, PPE)
4. Generate audio narrations (AI)
5. Create 2-3 demo videos
6. Build knowledge checks for P0 topics
7. Generate QR codes
8. Deploy to free hosting
9. Create pocket card print files with QR codes

### Near-term (Phase 2)

1. Gather MVP feedback from real volunteers
2. Add P1 topics
3. Spanish translation for P0 content
4. Interactive checklists
5. SMS reminder pilot
6. Supervisor toolbox section

### Long-term (Phase 3)

1. Full Spanish parity
2. CMS for content updates
3. Expanded video library
4. Integration with volunteer systems
5. Additional language support as needed

---

## Appendix: QR Code Placement Guide

### In Handbook

| Location | QR Links To |
|----------|-------------|
| Front cover (inside) | PWA home page |
| Each chapter footer | Corresponding topic page |
| Quick reference section | Download page for all pocket cards |
| Back cover | PWA home page + "How to use digital companion" |

### On Pocket Cards

| Card | QR Links To |
|------|-------------|
| All cards | Corresponding topic page |

### On Signage

| Sign Location | QR Links To |
|---------------|-------------|
| Tool storage | Tool safety topic page |
| Ladder station | Ladder safety topic page |
| Material staging | Lifting safety topic page |
| Break area | Heat illness page (seasonal) |
| Entry/check-in | PWA home page |

---

## References

### Project Research Documents

- [Digital Training Delivery Options](digital-delivery-options.md)
- [Learning Modalities and Accessibility Survey](learning-modalities.md)
- [Adult Learning Principles for Safety Training](adult-learning-principles.md)
- [Retention and Reinforcement Strategies](retention-strategies.md)
- [Safety Handbook Structure Design](handbook-structure.md)
- [Tone Selection Decision](tone-selection-decision.md)

### Technical Resources

- [PWA Builder](https://www.pwabuilder.com/)
- [Workbox Documentation](https://developers.google.com/web/tools/workbox)
- [Lunr.js Documentation](https://lunrjs.com/)
- [QR Code API](https://goqr.me/api/)
- [Astro Documentation](https://docs.astro.build/)
- [Twilio SMS API](https://www.twilio.com/docs/sms)
