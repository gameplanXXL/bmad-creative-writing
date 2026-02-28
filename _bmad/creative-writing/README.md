# BMCW: BMad Creative Writing Studio

**10 agents. 8 workflows. From premise to publication.**

## Overview

BMCW is a BMAD module providing AI-powered creative writing support for fiction writers, screenwriters, and narrative designers. It installs into existing BMAD projects and provides specialized agents for every phase of the creative process.

## Agents

| Agent | Icon | Specialty |
|-------|------|-----------|
| Plot Architect | 🏗️ | Story structure, pacing, narrative arcs |
| Character Psychologist | 🧠 | Character development, motivation, psychology |
| World Builder | 🌍 | Settings, cultures, magic systems |
| Editor | ✏️ | Style, grammar, narrative flow |
| Beta Reader | 👓 | Reader perspective, plot holes, engagement |
| Dialog Specialist | 💬 | Conversation, voice, subtext |
| Narrative Designer | 🎭 | Interactive storytelling, branching narratives |
| Genre Specialist | 📚 | Genre conventions, tropes, market positioning |
| Book Critic (Evelyn Clarke) | 📖 | Professional literary analysis and ratings |
| Cover Designer (Iris Vega) | 🎨 | Cover concepts, AI prompts, KDP specs |

## Workflows

| Workflow | Description |
|----------|-------------|
| Novel Writing | End-to-end novel development pipeline |
| Novel Greenfield | Brand-new novel from concept to critique |
| Novel Snowflake | Snowflake Method: 1 sentence to full novel |
| Novel Serial | Web-serial cycle with reader feedback |
| Screenplay Development | Feature-length screenplay to shooting script |
| Short Story Creation | Focused short narrative for submission |
| Series Planning | Multi-book series architecture |
| Book Cover Design | Cover brief to KDP-ready package |

## Module Structure

```
_bmad/creative-writing/
├── module.yaml              # Module configuration
├── config.yaml              # Installed configuration
├── README.md                # This file
├── module-help.csv          # Help entries
├── agents/                  # 10 creative writing agents
├── workflows/               # 8 writing workflows
│   ├── novel-writing/
│   ├── novel-greenfield/
│   ├── novel-snowflake/
│   ├── novel-serial/
│   ├── screenplay-development/
│   ├── short-story-creation/
│   ├── series-planning/
│   └── book-cover-design/
├── tasks/                   # 25 executable tasks
├── templates/               # 8 document templates
├── checklists/              # 27 quality checklists
├── data/                    # Knowledge base
└── teams/                   # Agent team bundles
```

## Quick Start

1. Install module: `./setup.sh ~/my-project`
2. Start an agent: `/bmad-cw-plot-architect`
3. Or start any other agent from the list above
