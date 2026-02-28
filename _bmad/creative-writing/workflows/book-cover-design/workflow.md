---
name: book-cover-design
description: Complete book cover design process from brief to KDP-ready package
---

# Book Cover Design Workflow

**Goal:** Create a complete book cover design package from initial brief to KDP-ready deliverables with AI image prompts.

## Workflow

### 1. Generate Cover Brief

**Agent:** Cover Designer (Iris Vega)
**Task:** `{project-root}/_bmad/creative-writing/tasks/generate-cover-brief.md`

Interactive questionnaire capturing all creative and technical parameters:
- Title, subtitle, author, series info
- Genre, target audience, comparable titles
- Trim size, page count, paper color
- Mood keywords, imagery, color palette
- Back cover content (blurb, reviews, bio, ISBN)

**Output:** cover-brief.md

### 2. Generate Cover Prompts

**Agent:** Cover Designer (Iris Vega)
**Task:** `{project-root}/_bmad/creative-writing/tasks/generate-cover-prompts.md`

Produce AI image generator prompts and typography guidance:
- 3-5 alternative Stable Diffusion / DALL-E prompts
- Safe negative prompts
- Font pairing suggestions (Google Fonts)
- Style, lens, color keywords

**Input:** cover-brief.md
**Output:** cover-prompts.md

### 3. Assemble KDP Package

**Agent:** Cover Designer (Iris Vega)
**Task:** `{project-root}/_bmad/creative-writing/tasks/assemble-kdp-package.md`

Compile final deliverables for Amazon KDP:
- Full-wrap cover dimensions (front, spine, back)
- Bleed and margin values
- Layout diagram (ASCII or Mermaid)
- ISBN/barcode placement
- Back-cover content sections
- KDP cover ready checklist execution

**Input:** cover-brief.md, cover-prompts.md
**Output:** design-package.md

## Completion Criteria

- design-package.md exists
- KDP cover ready checklist passes
