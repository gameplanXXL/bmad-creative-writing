---
name: novel-greenfield
description: Brand-new novel from concept through professional critique
---

# Greenfield Novel Workflow

**Goal:** End-to-end pipeline for writing a brand-new novel: concept -> outline -> draft -> beta feedback -> polish -> professional critique.

## Workflow

### Phase 1: Ideation

#### 1.1 Brainstorm Premise
**Agent:** Narrative Designer
**Task:** `{project-root}/_bmad/creative-writing/tasks/brainstorm-premise.md`
**Output:** concept-brief.md

#### 1.2 Build World
**Agent:** World Builder
**Task:** `{project-root}/_bmad/creative-writing/tasks/build-world.md`
**Input:** concept-brief.md
**Output:** world-guide.md

#### 1.3 Develop Characters
**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/develop-character.md`
**Input:** concept-brief.md
**Output:** characters.md

### Phase 2: Outlining

#### 2.1 Analyze Story Structure
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/analyze-story-structure.md`
**Input:** concept-brief.md, world-guide.md, characters.md
**Output:** story-outline.md

### Phase 3: Drafting

#### 3.1 Draft Chapters
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`
**Input:** story-outline.md
**Repeat:** per chapter
**Output:** draft-manuscript.md

#### 3.2 Dialog Pass
**Agent:** Dialog Specialist
**Task:** `{project-root}/_bmad/creative-writing/tasks/workshop-dialog.md`
**Input:** draft-manuscript.md
**Output:** dialog-pass.md

### Phase 4: Revision

#### 4.1 Beta Feedback
**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/provide-feedback.md`
**Input:** draft-manuscript.md
**Output:** beta-notes.md

#### 4.2 Incorporate Feedback
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/incorporate-feedback.md`
**Input:** draft-manuscript.md, beta-notes.md
**Output:** polished-manuscript.md

### Phase 5: Critique

#### 5.1 Professional Review
**Agent:** Book Critic
**Task:** `{project-root}/_bmad/creative-writing/tasks/critical-review.md`
**Input:** polished-manuscript.md
**Output:** critic-review.md

## Completion Criteria

- critic-review.md exists
