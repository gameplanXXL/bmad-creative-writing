---
name: novel-serial
description: Web-serial cycle with regular releases, reader feedback, and season-end critique
---

# Iterative Release Novel Workflow

**Goal:** Web-serial development cycle with regular chapter releases, reader feedback loops, and season-end professional critique.

## Workflow

### Phase 1: Sprint Planning

#### 1.1 Select Next Arc
**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/select-next-arc.md`
**Output:** release-plan.md

### Phase 2: Chapter Loop

Repeat for each chapter in the release plan:

#### 2.1 Draft Chapter
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`
**Input:** release-plan.md
**Output:** chapter-draft.md

#### 2.2 Dialog Pass
**Agent:** Dialog Specialist
**Task:** `{project-root}/_bmad/creative-writing/tasks/workshop-dialog.md`
**Input:** chapter-draft.md
**Output:** chapter-dialog.md

#### 2.3 Quick Beta Feedback
**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/quick-feedback.md`
**Input:** chapter-dialog.md
**Output:** chapter-notes.md

#### 2.4 Final Polish
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/final-polish.md`
**Input:** chapter-dialog.md, chapter-notes.md
**Output:** chapter-final.md

#### 2.5 Publish Chapter
**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/publish-chapter.md`
**Input:** chapter-final.md
**Output:** publication-log.md

### Phase 3: Retrospective

#### 3.1 Analyze Reader Feedback
**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/analyze-reader-feedback.md`
**Input:** publication-log.md
**Output:** retro.md

### Phase 4: Season Critique

#### 4.1 Professional Review
**Agent:** Book Critic
**Task:** `{project-root}/_bmad/creative-writing/tasks/critical-review.md`
**Input:** publication-log.md
**Output:** critic-review.md

## Completion Criteria

- publication-log.md exists
- critic-review.md exists
