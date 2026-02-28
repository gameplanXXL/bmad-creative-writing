# BMCW: BMad Creative Writing Studio

**10 agents. 8 workflows. From premise to publication.**

## Overview

BMCW is a BMAD module that transforms your AI into a complete creative writing studio with specialized agents for fiction, screenwriting, and narrative design. Whether you're crafting novels, screenplays, short stories, or interactive narratives, BMCW provides structured AI assistance throughout your creative process.

### Key Features

- **10 Specialized Writing Agents** — From plot architecture to dialogue refinement
- **8 Complete Workflows** — Novel writing, screenplay development, series planning, and more
- **27 Quality Checklists** — Genre-specific and technical quality assurance
- **25 Writing Tasks** — Structured activities for every phase of writing
- **8 Professional Templates** — Character profiles, story outlines, world guides
- **KDP Publishing Integration** — Cover design and Amazon KDP package assembly

## Installation

```bash
./setup.sh ~/my-project
```

The installer will:
- Validate the target has a BMAD installation
- Copy the creative writing module to `_bmad/creative-writing/`
- Register agents and workflows in BMAD manifests
- Install Claude Code slash commands
- Set up output directories

## Agents

### Core Writing Team

| Command | Agent | Specialty |
|---------|-------|-----------|
| `/bmad-cw-plot-architect` | Plot Architect 🏗️ | Story structure, pacing, narrative arcs |
| `/bmad-cw-character-psychologist` | Character Psychologist 🧠 | Character development, motivation |
| `/bmad-cw-world-builder` | World Builder 🌍 | Settings, cultures, magic systems |
| `/bmad-cw-editor` | Editor ✏️ | Style, grammar, narrative flow |
| `/bmad-cw-beta-reader` | Beta Reader 👓 | Reader perspective, engagement |

### Specialist Agents

| Command | Agent | Specialty |
|---------|-------|-----------|
| `/bmad-cw-dialog-specialist` | Dialog Specialist 💬 | Conversation, voice, subtext |
| `/bmad-cw-narrative-designer` | Narrative Designer 🎭 | Interactive storytelling |
| `/bmad-cw-genre-specialist` | Genre Specialist 📚 | Genre conventions, market awareness |
| `/bmad-cw-book-critic` | Evelyn Clarke 📖 | Professional literary analysis |
| `/bmad-cw-cover-designer` | Iris Vega 🎨 | Cover concepts, KDP specs |

## Workflows

| Workflow | Description |
|----------|-------------|
| Novel Writing | End-to-end novel development from premise to manuscript |
| Novel Greenfield | Brand-new novel: concept -> outline -> draft -> critique |
| Novel Snowflake | Snowflake Method: 1 sentence iteratively expanded to full novel |
| Novel Serial | Web-serial cycle with regular releases and reader feedback |
| Screenplay Development | Feature-length screenplay to polished shooting script |
| Short Story Creation | Focused short narrative for magazine/anthology submission |
| Series Planning | Multi-book series architecture and continuity management |
| Book Cover Design | Cover brief to KDP-ready package with AI image prompts |

## Quality Checklists

### Genre-Specific
Fantasy Magic System, Sci-Fi Technology, Cyberpunk Aesthetic, Steampunk Gadget, Historical Accuracy, Romance Emotional Beats, Mystery Clue Trail, Thriller Pacing, Horror Suspense, Comedic Timing, Epic Poetry Meter, YA Appropriateness

### Technical/Craft
Plot Structure, Character Consistency, World-Building Continuity, Timeline Continuity, Foreshadowing/Payoff, Scene Quality, Line-Edit Quality, Sensitivity & Representation, Genre Tropes

### Publishing
Publication Readiness, eBook Formatting, KDP Cover Ready, Marketing Copy, Beta Feedback Closure

## Templates

- `character-profile-tmpl.yaml` — Comprehensive character development
- `story-outline-tmpl.yaml` — Three-act structure planning
- `world-guide-tmpl.yaml` — World-building documentation
- `scene-list-tmpl.yaml` — Scene-by-scene breakdown
- `chapter-draft-tmpl.yaml` — Chapter structure template
- `premise-brief-tmpl.yaml` — Story concept development
- `beta-feedback-form.yaml` — Structured reader feedback
- `cover-design-brief-tmpl.yaml` — Cover concept specifications

## Quick Start

1. Install module: `./setup.sh ~/my-project`
2. Open project in Claude Code
3. Start with `/bmad-cw-plot-architect` for story structure
4. Or any other agent from the list above
5. Use `/bmad-help` anytime for guidance

## Module Structure

```
_bmad/creative-writing/
├── agents/          # 10 creative writing agents
├── workflows/       # 8 writing workflows
├── tasks/           # 25 executable tasks
├── templates/       # 8 document templates
├── checklists/      # 27 quality checklists
├── data/            # Knowledge base & story structures
└── teams/           # Agent team bundles
```

## Credits

Based on the BMad Creative Writing Expansion Pack by Wes.
Transformed to BMAD v6 module format.
# bmad-creative-writing
