---
name: series-planning
description: Plan a multi-book or multi-season narrative series with overarching arcs
---

# Series Planning Workflow

**Goal:** Plan a multi-book or multi-season narrative series, including overarching arcs and individual installment roadmaps.

## Inputs

Collect from user before starting:
- **Series title**
- **Genre**
- **Number of installments**

## Workflow

### 1. Define High Concept

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/brainstorm-premise.md`

Define series-level high concept and overarching story question.

**Output:** high-concept.md

### 2. Build Series Bible

**Agent:** World Builder
**Task:** `{project-root}/_bmad/creative-writing/tasks/build-world.md`

Create series bible covering world, rules, tone, and continuity framework.

**Input:** high-concept.md
**Output:** series-bible.md

### 3. Map Character Arcs

**Agent:** Character Psychologist
**Task:** `{project-root}/_bmad/creative-writing/tasks/develop-character.md`

Map long-arc character development across all installments.

**Input:** high-concept.md, series-bible.md
**Output:** character-arc-map.md

### 4. Plot Installment Overviews

**Agent:** Plot Architect
**Task:** `{project-root}/_bmad/creative-writing/tasks/analyze-story-structure.md`

Plot each installment overview. Repeat for number of installments.

**Input:** high-concept.md, character-arc-map.md
**Output:** installment-overviews.md

### 5. Genre & Market Alignment

**Agent:** Genre Specialist
**Task:** Genre and market alignment check.

**Input:** installment-overviews.md
**Output:** market-positioning.md

### 6. Compile Master Roadmap

**Agent:** Narrative Designer
**Task:** Compile all elements into master series roadmap.

**Input:** series-bible.md, character-arc-map.md, installment-overviews.md, market-positioning.md
**Output:** series-roadmap.md

### 7. Editorial Review

**Agent:** Editor
**Task:** `{project-root}/_bmad/creative-writing/tasks/final-polish.md`

Review and polish the series plan for consistency and completeness.

**Input:** series-roadmap.md
**Output:** final-series-plan.md

## Completion Criteria

- final-series-plan.md exists
