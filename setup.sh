#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# setup.sh - BMCW (BMad Creative Writing Studio) Module Installer
# Installs the Creative Writing module into an existing BMAD installation.
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE_CODE="creative-writing"

# ---- Colors (if terminal supports it) ----
if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BOLD='\033[1m'
    NC='\033[0m'
else
    RED='' GREEN='' YELLOW='' BOLD='' NC=''
fi

# ---- Help ----
show_help() {
    cat <<EOF
${BOLD}BMCW - BMad Creative Writing Studio Installer${NC}

${BOLD}Usage:${NC}
  ./setup.sh <BMAD_PROJECT_DIR>
  ./setup.sh -h | --help

${BOLD}Arguments:${NC}
  BMAD_PROJECT_DIR  Path to an existing BMAD project
                    (must contain _bmad/_config/manifest.yaml)

${BOLD}Options:${NC}
  -h, --help        Show this help

${BOLD}Description:${NC}
  Installs the BMCW module (BMad Creative Writing Studio) into an
  existing BMAD installation. If a previous version exists, it will
  be completely removed and replaced (clean reinstall).

  The installer:
    - Validates the target directory has a valid BMAD installation
    - Removes any previous BMCW installation
    - Copies the creative writing module to _bmad/creative-writing/
    - Copies Claude Code commands to .claude/commands/
    - Updates BMAD configuration files (manifests, help)
    - Adapts the module configuration to the target installation

${BOLD}Agents (10):${NC}
  Plot Architect, Character Psychologist, World Builder, Editor,
  Beta Reader, Dialog Specialist, Narrative Designer, Genre Specialist,
  Book Critic (Evelyn Clarke), Cover Designer (Iris Vega)

${BOLD}Examples:${NC}
  ./setup.sh ~/my-novel-project
  ./setup.sh /home/user/writing-project

${BOLD}Installed Components:${NC}
  - Creative Writing Module   (_bmad/creative-writing/)
  - Claude Code Commands      (.claude/commands/bmad-cw-*)
  - Agent Registration        (agent-manifest.csv)
  - Workflow Registration     (workflow-manifest.csv)
  - Help Entries              (bmad-help.csv)
  - Module Manifest           (manifest.yaml)
EOF
}

# ---- Helpers ----
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# Ensure file ends with a newline before appending
ensure_trailing_newline() {
    local file="$1"
    if [[ -f "$file" ]] && [[ -s "$file" ]]; then
        if [ -n "$(tail -c 1 "$file")" ]; then
            echo >> "$file"
        fi
    fi
}

# ---- Argument parsing ----
if [[ $# -eq 0 ]]; then
    error "No target directory specified."
    echo "Usage: ./setup.sh <BMAD_PROJECT_DIR>" >&2
    echo "Help:  ./setup.sh --help" >&2
    exit 1
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

TARGET_DIR="$(cd "$1" 2>/dev/null && pwd)" || {
    error "Directory '$1' does not exist or is not accessible."
    exit 1
}

# ---- Validate BMAD installation ----
BMAD_DIR="${TARGET_DIR}/_bmad"
CONFIG_DIR="${BMAD_DIR}/_config"
MANIFEST="${CONFIG_DIR}/manifest.yaml"

if [[ ! -d "$BMAD_DIR" ]]; then
    error "No BMAD installation found in '${TARGET_DIR}'."
    echo "       Directory '_bmad/' is missing." >&2
    exit 1
fi

if [[ ! -f "$MANIFEST" ]]; then
    error "No valid BMAD installation in '${TARGET_DIR}'."
    echo "       File '_bmad/_config/manifest.yaml' is missing." >&2
    exit 1
fi

# Prevent installing into self
if [[ "$TARGET_DIR" == "$SCRIPT_DIR" ]]; then
    error "Cannot install into own source directory."
    echo "       Please specify a different BMAD project as target." >&2
    exit 1
fi

echo ""
echo -e "${BOLD}BMCW - BMad Creative Writing Studio Installer${NC}"
echo "========================================"
info "BMAD installation found: ${TARGET_DIR}"

# ---- Remove previous creative-writing installation ----
echo ""
echo -e "${BOLD}Phase 1: Clean previous installation${NC}"
echo "----------------------------------------"

# 1. Remove module directory
if [[ -d "${BMAD_DIR}/${MODULE_CODE}" ]]; then
    info "Removing _bmad/${MODULE_CODE}/"
    rm -rf "${BMAD_DIR}/${MODULE_CODE}"
else
    info "No existing _bmad/${MODULE_CODE}/ directory."
fi

# 2. Remove Claude Code commands
COMMANDS_DIR="${TARGET_DIR}/.claude/commands"
if [[ -d "$COMMANDS_DIR" ]]; then
    found_cmds=0
    for f in "${COMMANDS_DIR}"/bmad-cw-*; do
        [[ -e "$f" ]] || continue
        rm -f "$f"
        found_cmds=$((found_cmds + 1))
    done
    if [[ $found_cmds -gt 0 ]]; then
        info "Removed: ${found_cmds} old Claude Code commands"
    else
        info "No old Claude Code commands found."
    fi
fi

# 3. Remove creative-writing entries from CSV config files
info "Cleaning configuration files..."

AGENT_MANIFEST="${CONFIG_DIR}/agent-manifest.csv"
if [[ -f "$AGENT_MANIFEST" ]]; then
    grep -v ',"creative-writing",' "$AGENT_MANIFEST" > "${AGENT_MANIFEST}.tmp" 2>/dev/null || head -1 "$AGENT_MANIFEST" > "${AGENT_MANIFEST}.tmp"
    mv "${AGENT_MANIFEST}.tmp" "$AGENT_MANIFEST"
    info "  agent-manifest.csv cleaned"
fi

WORKFLOW_MANIFEST="${CONFIG_DIR}/workflow-manifest.csv"
if [[ -f "$WORKFLOW_MANIFEST" ]]; then
    grep -v ',"creative-writing",' "$WORKFLOW_MANIFEST" > "${WORKFLOW_MANIFEST}.tmp" 2>/dev/null || head -1 "$WORKFLOW_MANIFEST" > "${WORKFLOW_MANIFEST}.tmp"
    mv "${WORKFLOW_MANIFEST}.tmp" "$WORKFLOW_MANIFEST"
    info "  workflow-manifest.csv cleaned"
fi

HELP_CSV="${CONFIG_DIR}/bmad-help.csv"
if [[ -f "$HELP_CSV" ]]; then
    grep -v '^creative-writing,' "$HELP_CSV" > "${HELP_CSV}.tmp" 2>/dev/null || head -1 "$HELP_CSV" > "${HELP_CSV}.tmp"
    mv "${HELP_CSV}.tmp" "$HELP_CSV"
    info "  bmad-help.csv cleaned"
fi

FILES_MANIFEST="${CONFIG_DIR}/files-manifest.csv"
if [[ -f "$FILES_MANIFEST" ]]; then
    grep -v ',"creative-writing",' "$FILES_MANIFEST" > "${FILES_MANIFEST}.tmp" 2>/dev/null || head -1 "$FILES_MANIFEST" > "${FILES_MANIFEST}.tmp"
    mv "${FILES_MANIFEST}.tmp" "$FILES_MANIFEST"
    info "  files-manifest.csv cleaned"
fi

TASK_MANIFEST="${CONFIG_DIR}/task-manifest.csv"
if [[ -f "$TASK_MANIFEST" ]]; then
    grep -v ',"creative-writing",' "$TASK_MANIFEST" > "${TASK_MANIFEST}.tmp" 2>/dev/null || head -1 "$TASK_MANIFEST" > "${TASK_MANIFEST}.tmp"
    mv "${TASK_MANIFEST}.tmp" "$TASK_MANIFEST"
    info "  task-manifest.csv cleaned"
fi

# 4. Remove creative-writing block from manifest.yaml
if grep -q "name: ${MODULE_CODE}" "$MANIFEST" 2>/dev/null; then
    awk -v mod="$MODULE_CODE" '
    $0 ~ "^  - name: " mod "$" { skip=1; next }
    skip && /^  - name:/ { skip=0 }
    skip && /^[^ ]/ { skip=0 }
    skip && /^$/ { skip=0 }
    skip { next }
    { print }
    ' "$MANIFEST" > "${MANIFEST}.tmp"
    mv "${MANIFEST}.tmp" "$MANIFEST"
    info "  manifest.yaml cleaned"
fi

# ---- Install new creative-writing module ----
echo ""
echo -e "${BOLD}Phase 2: Install Creative Writing module${NC}"
echo "----------------------------------------"

# 1. Copy module directory
info "Copying _bmad/${MODULE_CODE}/ ..."
cp -r "${SCRIPT_DIR}/_bmad/${MODULE_CODE}" "${BMAD_DIR}/${MODULE_CODE}"

# 2. Adapt config.yaml to target installation
CORE_CONFIG="${BMAD_DIR}/core/config.yaml"
TARGET_MODULE_CONFIG="${BMAD_DIR}/${MODULE_CODE}/config.yaml"
INSTALL_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

if [[ -f "$CORE_CONFIG" ]]; then
    user_name=$(grep '^user_name:' "$CORE_CONFIG" | sed 's/^user_name: *//' | head -1)
    comm_lang=$(grep '^communication_language:' "$CORE_CONFIG" | sed 's/^communication_language: *//' | head -1)
    doc_lang=$(grep '^document_output_language:' "$CORE_CONFIG" | sed 's/^document_output_language: *//' | head -1)
    output_folder=$(grep '^output_folder:' "$CORE_CONFIG" | sed 's/^output_folder: *//' | head -1)

    # Compute writing_output_folder from output_folder
    output_folder_clean="${output_folder//\"/}"
    writing_output_folder="${output_folder_clean}/creative-writing"

    cat > "$TARGET_MODULE_CONFIG" <<CONFIGEOF
# BMCW (BMad Creative Writing Studio) Module Configuration
# Installed by setup.sh
# Date: ${INSTALL_DATE}

# Core Configuration Values
user_name: ${user_name}
communication_language: ${comm_lang}
document_output_language: ${doc_lang}
output_folder: ${output_folder}
writing_output_folder: ${writing_output_folder}
CONFIGEOF
    info "config.yaml adapted to target installation (user: ${user_name})"
else
    warn "core/config.yaml not found - config.yaml copied unchanged."
fi

# 3. Copy Claude Code commands
info "Copying Claude Code commands ..."
mkdir -p "$COMMANDS_DIR"
cmd_count=0
for f in "${SCRIPT_DIR}/.claude/commands"/bmad-cw-*; do
    [[ -e "$f" ]] || continue
    cp "$f" "${COMMANDS_DIR}/"
    cmd_count=$((cmd_count + 1))
done
info "${cmd_count} commands installed"

# ---- Update config files ----
echo ""
echo -e "${BOLD}Phase 3: Update configuration${NC}"
echo "----------------------------------------"

# 1. Add creative-writing module to manifest.yaml
if grep -q "^ides:" "$MANIFEST" 2>/dev/null; then
    awk -v date="$INSTALL_DATE" '
    /^ides:/ {
        print "  - name: creative-writing"
        print "    version: null"
        print "    installDate: " date
        print "    lastUpdated: " date
        print "    source: external"
        print "    npmPackage: null"
        print "    repoUrl: null"
    }
    { print }
    ' "$MANIFEST" > "${MANIFEST}.tmp"
    mv "${MANIFEST}.tmp" "$MANIFEST"
else
    cat >> "$MANIFEST" <<MANIFESTEOF
  - name: creative-writing
    version: null
    installDate: ${INSTALL_DATE}
    lastUpdated: ${INSTALL_DATE}
    source: external
    npmPackage: null
    repoUrl: null
MANIFESTEOF
fi
info "manifest.yaml updated"

# 2. Append creative-writing agents to agent-manifest.csv
SRC_AGENT_MANIFEST="${SCRIPT_DIR}/_bmad/_config/agent-manifest.csv"
if [[ -f "$AGENT_MANIFEST" ]] && [[ -f "$SRC_AGENT_MANIFEST" ]]; then
    ensure_trailing_newline "$AGENT_MANIFEST"
    grep ',"creative-writing",' "$SRC_AGENT_MANIFEST" >> "$AGENT_MANIFEST" 2>/dev/null || true
    info "agent-manifest.csv updated"
fi

# 3. Append creative-writing workflows to workflow-manifest.csv
SRC_WORKFLOW_MANIFEST="${SCRIPT_DIR}/_bmad/_config/workflow-manifest.csv"
if [[ -f "$WORKFLOW_MANIFEST" ]] && [[ -f "$SRC_WORKFLOW_MANIFEST" ]]; then
    ensure_trailing_newline "$WORKFLOW_MANIFEST"
    grep ',"creative-writing",' "$SRC_WORKFLOW_MANIFEST" >> "$WORKFLOW_MANIFEST" 2>/dev/null || true
    info "workflow-manifest.csv updated"
fi

# 4. Append creative-writing entries to bmad-help.csv
SRC_HELP_CSV="${SCRIPT_DIR}/_bmad/_config/bmad-help.csv"
if [[ -f "$HELP_CSV" ]] && [[ -f "$SRC_HELP_CSV" ]]; then
    ensure_trailing_newline "$HELP_CSV"
    grep '^creative-writing,' "$SRC_HELP_CSV" >> "$HELP_CSV" 2>/dev/null || true
    info "bmad-help.csv updated"
fi

# 5. Append creative-writing tasks to task-manifest.csv
SRC_TASK_MANIFEST="${SCRIPT_DIR}/_bmad/_config/task-manifest.csv"
if [[ -f "$TASK_MANIFEST" ]] && [[ -f "$SRC_TASK_MANIFEST" ]]; then
    ensure_trailing_newline "$TASK_MANIFEST"
    grep ',"creative-writing",' "$SRC_TASK_MANIFEST" >> "$TASK_MANIFEST" 2>/dev/null || true
    info "task-manifest.csv updated"
fi

# 6. Append creative-writing entry to files-manifest.csv
SRC_FILES_MANIFEST="${SCRIPT_DIR}/_bmad/_config/files-manifest.csv"
if [[ -f "$FILES_MANIFEST" ]] && [[ -f "$SRC_FILES_MANIFEST" ]]; then
    ensure_trailing_newline "$FILES_MANIFEST"
    grep ',"creative-writing",' "$SRC_FILES_MANIFEST" >> "$FILES_MANIFEST" 2>/dev/null || true
    info "files-manifest.csv updated"
fi

# ---- Writing Output Directory ----
echo ""
echo -e "${BOLD}Phase 4: Set up output directory${NC}"
echo "----------------------------------------"

# Resolve writing_output_folder for filesystem operations
writing_output_resolved="${writing_output_folder//\{project-root\}/${TARGET_DIR}}"
mkdir -p "$writing_output_resolved"
info "Output directory created: ${writing_output_resolved}"

# ---- CLAUDE.md Integration ----
echo ""
echo -e "${BOLD}Phase 5: Update CLAUDE.md${NC}"
echo "----------------------------------------"

CLAUDE_MD="${TARGET_DIR}/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
    if ! grep -q "BMad Creative Writing\|bmad-cw-" "$CLAUDE_MD" 2>/dev/null; then
        ensure_trailing_newline "$CLAUDE_MD"
        cat >> "$CLAUDE_MD" <<CLAUDEEOF

## Creative Writing (BMCW)
- For creative writing agents, use slash commands: /bmad-cw-plot-architect, /bmad-cw-character-psychologist, etc.
- Writing outputs: ${writing_output_resolved#${TARGET_DIR}/}
- Available workflows: novel-writing, novel-greenfield, novel-snowflake, novel-serial, screenplay, short-story, series-planning, cover-design
CLAUDEEOF
        info "CLAUDE.md updated with creative writing reference"
    else
        info "CLAUDE.md already contains creative writing reference"
    fi
else
    warn "No CLAUDE.md found in target project - reference not added."
fi

# ---- Summary ----
echo ""
echo "========================================"
echo -e "${GREEN}${BOLD}Installation complete!${NC}"
echo "========================================"
echo ""
echo "BMCW module installed in:"
echo "  ${TARGET_DIR}/_bmad/${MODULE_CODE}/"
echo ""
echo "Installed Components:"
echo "  - Creative Writing Module   (_bmad/${MODULE_CODE}/)"
echo "  - Claude Code Commands      (.claude/commands/bmad-cw-*)"
echo "  - Agent Registration        (agent-manifest.csv)"
echo "  - Workflow Registration     (workflow-manifest.csv)"
echo "  - Help Entries              (bmad-help.csv)"
echo "  - Module Manifest           (manifest.yaml)"
echo ""
echo "Available Agents (10):"
echo "  /bmad-cw-plot-architect          # Story structure specialist"
echo "  /bmad-cw-character-psychologist  # Character development"
echo "  /bmad-cw-world-builder           # Settings & universes"
echo "  /bmad-cw-editor                  # Style & structure editing"
echo "  /bmad-cw-beta-reader             # Reader experience simulation"
echo "  /bmad-cw-dialog-specialist       # Conversation & voice"
echo "  /bmad-cw-narrative-designer      # Interactive narratives"
echo "  /bmad-cw-genre-specialist        # Genre conventions"
echo "  /bmad-cw-book-critic             # Professional critique"
echo "  /bmad-cw-cover-designer          # Cover design & KDP"
echo ""
echo "Next Steps:"
echo "  1. Open the project in Claude Code"
echo "  2. Start with '/bmad-cw-plot-architect' to begin structuring your story"
echo "  3. Or use '/bmad-help' for guidance on what to do next"
echo ""
