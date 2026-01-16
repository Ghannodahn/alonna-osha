#!/bin/bash
# Section Workflow Helper
# Automatically detects context and executes appropriate section-* skill

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

usage() {
    echo "Usage: section-workflow <command> <section-path|section-number> [topic-name]"
    echo ""
    echo "Commands:"
    echo "  auto <path>           - Auto-detect context and run appropriate workflow"
    echo "  create <num> <topic>  - Create new section from scratch"
    echo "  revise <path>         - Revise existing section"
    echo "  publish <draft-path>  - Publish final draft to RC"
    echo "  status <path>         - Show section status"
    echo ""
    echo "Examples:"
    echo "  section-workflow auto docs/writing/2-education/"
    echo "  section-workflow create 2 education"
    echo "  section-workflow revise docs/writing/2-education/"
    echo "  section-workflow publish docs/writing/2-education/drafts/education.draft7.md"
    echo "  section-workflow status docs/writing/2-education/"
}

# Check section status
check_section_status() {
    local section_path="$1"

    # Check if directory exists
    if [ ! -d "$section_path" ]; then
        echo "not_found"
        return
    fi

    # Check for drafts
    local draft_count=$(find "$section_path/drafts" -name "*.draft*.md" 2>/dev/null | wc -l)
    local visual_count=$(find "$section_path/visuals" -mindepth 1 -maxdepth 1 -type d ! -name "archive" 2>/dev/null | wc -l)

    if [ "$draft_count" -eq 0 ]; then
        echo "no_drafts"
    elif [ "$visual_count" -gt 0 ]; then
        echo "has_visuals"
    else
        echo "has_drafts"
    fi
}

# Get latest draft
get_latest_draft() {
    local section_path="$1"
    find "$section_path/drafts" -name "*.draft*.md" 2>/dev/null | sort -V | tail -1
}

# Preload required skills
preload_skills() {
    echo -e "${BLUE}📚 Preloading required skills...${NC}"
    echo ""
    echo "/textbook-bestpractices"
    echo "/infographics-bestpractices"
    echo "/narrative-refine-validate"
    echo "/validate"
    echo ""
    echo -e "${GREEN}✓ Skills should be loaded by Claude${NC}"
    echo ""
}

# Auto-detect and run appropriate workflow
auto_workflow() {
    local section_path="$1"

    echo -e "${BLUE}🔍 Analyzing section context...${NC}"
    echo ""

    local status=$(check_section_status "$section_path")

    case "$status" in
        "not_found")
            echo -e "${RED}❌ Section not found: $section_path${NC}"
            echo ""
            echo "To create a new section, use:"
            echo "  section-workflow create <section-num> <topic-name>"
            exit 1
            ;;
        "no_drafts")
            echo -e "${YELLOW}📝 No drafts found - Section needs creation${NC}"
            echo ""
            echo "Recommended workflow: /section-create"
            echo ""
            local section_num=$(basename "$section_path" | cut -d'-' -f1)
            local topic=$(basename "$section_path" | cut -d'-' -f2)
            echo "Command to run:"
            echo "  /section-create $section_num $topic"
            ;;
        "has_drafts")
            echo -e "${YELLOW}📄 Drafts exist but no visuals - Needs creation completion${NC}"
            echo ""
            local latest_draft=$(get_latest_draft "$section_path")
            echo "Latest draft: $(basename "$latest_draft")"
            echo ""
            echo "Recommended workflow: /section-create (continue from current state)"
            ;;
        "has_visuals")
            echo -e "${GREEN}🎨 Drafts and visuals exist - Ready for revision or publishing${NC}"
            echo ""
            local latest_draft=$(get_latest_draft "$section_path")
            echo "Latest draft: $(basename "$latest_draft")"
            echo ""
            echo "Choose workflow:"
            echo "  1. Revision (update narrative + regenerate visuals):"
            echo "     /section-revise $section_path"
            echo ""
            echo "  2. Publishing (final polish + RC generation):"
            echo "     /section-publish ${latest_draft}"
            ;;
    esac

    echo ""
    preload_skills
}

# Create new section
create_workflow() {
    local section_num="$1"
    local topic="$2"

    if [ -z "$section_num" ] || [ -z "$topic" ]; then
        echo -e "${RED}❌ Missing arguments${NC}"
        echo "Usage: section-workflow create <section-number> <topic-name>"
        exit 1
    fi

    echo -e "${BLUE}🆕 Creating Section $section_num: $topic${NC}"
    echo ""

    preload_skills

    echo -e "${GREEN}Ready to execute:${NC}"
    echo "  /section-create $section_num $topic"
    echo ""
    echo "This will:"
    echo "  ✓ Create Beads WBS for tracking"
    echo "  ✓ Archive any existing visuals"
    echo "  ✓ Review research and create initial draft"
    echo "  ✓ Validate all claims"
    echo "  ✓ Generate infographics"
    echo "  ✓ Create release candidate DOCX"
}

# Revise existing section
revise_workflow() {
    local section_path="$1"

    if [ -z "$section_path" ]; then
        echo -e "${RED}❌ Missing section path${NC}"
        echo "Usage: section-workflow revise <section-path>"
        exit 1
    fi

    if [ ! -d "$section_path" ]; then
        echo -e "${RED}❌ Section not found: $section_path${NC}"
        exit 1
    fi

    echo -e "${BLUE}🔄 Revising section: $section_path${NC}"
    echo ""

    local latest_draft=$(get_latest_draft "$section_path")
    if [ -z "$latest_draft" ]; then
        echo -e "${RED}❌ No drafts found in section${NC}"
        exit 1
    fi

    echo "Latest draft: $(basename "$latest_draft")"
    echo ""

    preload_skills

    echo -e "${GREEN}Ready to execute:${NC}"
    echo "  /section-revise $section_path"
    echo ""
    echo "This will:"
    echo "  ✓ Archive old visuals (preserve .content.md/.prompt.md)"
    echo "  ✓ Validate latest draft"
    echo "  ✓ Update visual content with corrections"
    echo "  ✓ Regenerate infographics"
    echo "  ✓ Create new release candidate"
}

# Publish final draft
publish_workflow() {
    local draft_path="$1"

    if [ -z "$draft_path" ]; then
        echo -e "${RED}❌ Missing draft path${NC}"
        echo "Usage: section-workflow publish <draft-path>"
        exit 1
    fi

    if [ ! -f "$draft_path" ]; then
        echo -e "${RED}❌ Draft not found: $draft_path${NC}"
        exit 1
    fi

    echo -e "${BLUE}📤 Publishing draft: $(basename "$draft_path")${NC}"
    echo ""

    preload_skills

    echo -e "${GREEN}Ready to execute:${NC}"
    echo "  /section-publish $draft_path"
    echo ""
    echo "This will:"
    echo "  ✓ Refine narrative and validate claims"
    echo "  ✓ Review visual content"
    echo "  ✓ Regenerate visuals if needed"
    echo "  ✓ Generate publication-ready DOCX"
}

# Show section status
status_workflow() {
    local section_path="$1"

    if [ -z "$section_path" ]; then
        echo -e "${RED}❌ Missing section path${NC}"
        echo "Usage: section-workflow status <section-path>"
        exit 1
    fi

    echo -e "${BLUE}📊 Section Status: $section_path${NC}"
    echo ""

    if [ ! -d "$section_path" ]; then
        echo -e "${RED}❌ Section not found${NC}"
        exit 1
    fi

    # Count drafts
    local draft_count=$(find "$section_path/drafts" -name "*.draft*.md" 2>/dev/null | wc -l)
    local latest_draft=$(get_latest_draft "$section_path")

    # Count RCs
    local rc_count=$(find "$section_path/drafts" -name "*.rc*.docx" 2>/dev/null | wc -l)
    local latest_rc=$(find "$section_path/drafts" -name "*.rc*.docx" 2>/dev/null | sort -V | tail -1)

    # Count visuals
    local visual_count=$(find "$section_path/visuals" -mindepth 1 -maxdepth 1 -type d ! -name "archive" 2>/dev/null | wc -l)

    # Count fact-check reports
    local report_count=$(find "$section_path/drafts" -name "*FACT-CHECK-REPORT.md" 2>/dev/null | wc -l)

    echo "Drafts: $draft_count"
    if [ -n "$latest_draft" ]; then
        echo "  Latest: $(basename "$latest_draft")"
    fi
    echo ""

    echo "Release Candidates: $rc_count"
    if [ -n "$latest_rc" ]; then
        echo "  Latest: $(basename "$latest_rc")"
    fi
    echo ""

    echo "Visuals: $visual_count folders"
    if [ "$visual_count" -gt 0 ]; then
        find "$section_path/visuals" -mindepth 1 -maxdepth 1 -type d ! -name "archive" | while read -r visual; do
            local variant_count=$(find "$visual" -name "*.webp" 2>/dev/null | wc -l)
            echo "  - $(basename "$visual"): $variant_count variants"
        done
    fi
    echo ""

    echo "Fact-check reports: $report_count"
    echo ""

    # Determine recommendation
    local status=$(check_section_status "$section_path")
    case "$status" in
        "no_drafts")
            echo -e "${YELLOW}💡 Recommendation: Run /section-create${NC}"
            ;;
        "has_drafts")
            echo -e "${YELLOW}💡 Recommendation: Continue /section-create or start /section-revise${NC}"
            ;;
        "has_visuals")
            echo -e "${GREEN}💡 Recommendation: /section-revise for updates or /section-publish for final RC${NC}"
            ;;
    esac
}

# Main command router
main() {
    local command="$1"
    shift

    case "$command" in
        "auto")
            auto_workflow "$@"
            ;;
        "create")
            create_workflow "$@"
            ;;
        "revise")
            revise_workflow "$@"
            ;;
        "publish")
            publish_workflow "$@"
            ;;
        "status")
            status_workflow "$@"
            ;;
        "help"|"-h"|"--help"|"")
            usage
            ;;
        *)
            echo -e "${RED}❌ Unknown command: $command${NC}"
            echo ""
            usage
            exit 1
            ;;
    esac
}

main "$@"
