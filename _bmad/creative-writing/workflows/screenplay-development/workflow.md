---
name: screenplay-development
description: Feature-length screenplay from concept to polished shooting script
---

# Screenplay Development Workflow

**Goal:** Develop a feature-length screenplay from concept to polished shooting script with industry-standard formatting.

## Inputs

Collect from user before starting:
- **Working title**
- **Genre**
- **Target length (pages)**

## Workflow

### 1. Logline & Premise

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/brainstorm-premise.md`

Craft compelling logline and one-sentence premise.

**Output:** logline.md

### 2. Beat Sheet

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/analyze-story-structure.md`

Create Save the Cat or equivalent beat sheet from logline.

**Input:** logline.md
**Output:** beat-sheet.md

### 3. Treatment

**Agent:** Narrative Designer
**Task:** Expand beat sheet into prose treatment.

**Input:** beat-sheet.md
**Output:** treatment.md

### 4. Character Bios

**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/develop-character.md`

Write character bios with motivation, arc, and voice notes.

**Input:** treatment.md
**Output:** character-bios.md

### 5. First Draft

**Agent:** Narrative Designer
**Task:** `{project-root}/_bmad/creative-writing/tasks/create-draft-section.md`

Draft screenplay with proper formatting (scene headings, action, dialogue).

**Input:** treatment.md, character-bios.md
**Output:** draft-script.md

### 6. Dialog Polish

**Agent:** Dialog Specialist
**Task:** `{project-root}/_bmad/creative-writing/tasks/workshop-dialog.md`

Polish all dialogue for voice, subtext, and naturalism.

**Input:** draft-script.md
**Output:** dialog-polished-script.md

### 7. Format & Technical Check

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/final-polish.md`

Verify industry-standard formatting (Final Draft / Fountain compatible).

**Input:** dialog-polished-script.md
**Output:** production-ready-script.md

### 8. Table Read Feedback

**Agent:** Beta Reader
**Task:** `{project-root}/_bmad/creative-writing/tasks/provide-feedback.md`

Simulate table read and provide feedback.

**Input:** production-ready-script.md
**Output:** beta-script-notes.md

### 9. Final Shooting Script

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/incorporate-feedback.md`

Apply feedback and produce final shooting script.

**Input:** production-ready-script.md, beta-script-notes.md
**Output:** final-screenplay.md

## Completion Criteria

- final-screenplay.md exists
