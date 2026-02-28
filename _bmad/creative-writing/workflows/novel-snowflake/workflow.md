---
name: novel-snowflake
description: 10-step Snowflake Method from one-sentence premise to full novel
---

# Snowflake Novel Workflow

**Goal:** Build a novel using the Snowflake Method — iterative expansion from a single sentence to a complete manuscript, culminating in professional critique.

## Workflow

### Phase 1: Premise

#### 1.1 Brainstorm Premise
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/brainstorm-premise.md`
**Output:** premise.txt

### Phase 2: Paragraph

#### 2.1 Expand Premise
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/expand-premise.md`
**Input:** premise.txt
**Output:** premise-paragraph.md

### Phase 3: Characters

#### 3.1 Develop Characters
**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/develop-character.md`
**Input:** premise-paragraph.md
**Output:** character-summaries.md

### Phase 4: Synopsis

#### 4.1 Expand Synopsis
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/expand-synopsis.md`
**Input:** premise-paragraph.md
**Output:** synopsis.md

### Phase 5: Deep Character

#### 5.1 Character Depth Pass
**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/character-depth-pass.md`
**Input:** character-summaries.md
**Output:** characters.md

### Phase 6: Scene List

#### 6.1 Generate Scene List
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/generate-scene-list.md`
**Input:** synopsis.md, characters.md
**Output:** scene-list.md

### Phase 7: Outline

#### 7.1 Outline Scenes
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/outline-scenes.md`
**Input:** scene-list.md
**Output:** snowflake-outline.md

### Phase 8: Drafting

#### 8.1 Draft Chapters
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`
**Input:** snowflake-outline.md
**Repeat:** per chapter
**Output:** draft-manuscript.md

### Phase 9: Polish

#### 9.1 Beta Feedback
**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/provide-feedback.md`
**Input:** draft-manuscript.md
**Output:** beta-notes.md

#### 9.2 Incorporate Feedback
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/incorporate-feedback.md`
**Input:** draft-manuscript.md, beta-notes.md
**Output:** final-manuscript.md

### Phase 10: Critique

#### 10.1 Professional Review
**Agent:** Book Critic
**Task:** `{project-root}/_bmad/creative-writing/tasks/critical-review.md`
**Input:** final-manuscript.md
**Output:** critic-review.md

## Completion Criteria

- critic-review.md exists
