---
name: novel-writing
description: End-to-end pipeline for drafting, revising, and polishing a full-length novel
---

# Novel Writing Workflow

**Goal:** Complete novel development from premise to final manuscript using the full creative writing team.

## Inputs

Collect from user before starting:
- **Working title**
- **Genre**
- **Target word count**

## Workflow

### 1. Generate Outline

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-doc.md` with template `story-outline-tmpl.yaml`

Create high-level story outline including three-act structure, key plot points, and thematic elements.

**Output:** story-outline.md

### 2. Develop Characters

**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/develop-character.md`

Flesh out protagonist(s), antagonist(s), and key supporting characters with profiles, arcs, and voice notes.

**Input:** story-outline.md
**Output:** characters.md

### 3. Build World

**Agent:** World Builder
**Task:** `{project-root}/_bmad/creative-writing/tasks/build-world.md`

Develop setting, cultural systems, magic/technology rules, and environmental storytelling elements.

**Input:** story-outline.md
**Output:** world-guide.md

### 4. Expand to Scene List

**Agent:** Narrative Designer
**Task:** `{project-root}/_bmad/creative-writing/tasks/generate-scene-list.md`

Break outline into detailed scene-by-scene breakdown with POV, goals, conflicts, and hooks.

**Input:** story-outline.md, characters.md, world-guide.md
**Output:** scene-list.md

### 5. Draft Manuscript

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`

Draft each chapter sequentially using scene list as guide. Repeat for each chapter.

**Input:** scene-list.md
**Output:** draft-manuscript.md

### 6. Dialog Pass

**Agent:** Dialog Specialist
**Task:** `{project-root}/_bmad/creative-writing/tasks/workshop-dialog.md`

Polish all dialogue for voice authenticity, subtext, and character distinction.

**Input:** draft-manuscript.md
**Output:** dialog-polished.md

### 7. Developmental Edit

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/final-polish.md`

Line-edit for style, clarity, grammar, and narrative flow.

**Input:** dialog-polished.md
**Output:** revised-manuscript.md

### 8. Beta Read

**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/provide-feedback.md`

Simulate beta reader experience. Identify plot holes, confusion points, pacing issues.

**Input:** revised-manuscript.md
**Output:** beta-notes.md

### 9. Final Edit

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/incorporate-feedback.md`

Merge beta feedback, apply final revisions, produce publication-ready manuscript.

**Input:** revised-manuscript.md, beta-notes.md
**Output:** final-manuscript.md

## Completion Criteria

- final-manuscript.md exists and all beta feedback addressed
