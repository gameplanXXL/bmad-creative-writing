---
name: short-story-creation
description: Pipeline for drafting and polishing a standalone short story (up to ~7,500 words)
---

# Short Story Creation Workflow

**Goal:** Draft and polish a standalone short story suitable for magazine or anthology submission.

## Inputs

Collect from user before starting:
- **Working title**
- **Genre**
- **Target word count** (up to ~7,500 words)

## Workflow

### 1. Generate Premise

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/brainstorm-premise.md`

Generate and refine premise for short narrative.

**Output:** premise.md

### 2. Create Compact Outline

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/analyze-story-structure.md`

Create focused outline optimized for short form.

**Input:** premise.md
**Output:** outline.md

### 3. Draft Story

**Agent:** Narrative Designer
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`

Draft complete short story.

**Input:** outline.md
**Output:** draft-story.md

### 4. Tighten Prose & Pacing

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/final-polish.md`

Tighten prose, remove redundancy, optimize pacing for short form.

**Input:** draft-story.md
**Output:** tightened-story.md

### 5. Beta Read

**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/provide-feedback.md`

Simulate reader experience for short narrative.

**Input:** tightened-story.md
**Output:** beta-feedback.md

### 6. Final Edit

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/incorporate-feedback.md`

Apply feedback and produce submission-ready story.

**Input:** tightened-story.md, beta-feedback.md
**Output:** final-story.md

## Completion Criteria

- final-story.md exists
