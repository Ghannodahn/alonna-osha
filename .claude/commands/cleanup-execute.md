# Execute Cleanup Investigation Command

Execute a cleanup investigation task from the MVP Cleanup WBS, performing comprehensive research, creating concise findings documentation, and generating follow-up beads as needed.

## Usage

```
/execute-cleanup [bead-id]
```

**Parameters:**
- `bead-id` - The bead ID to investigate (e.g., todd-lab-mlr, todd-lab-onf)

**Examples:**
```
/execute-cleanup todd-lab-mlr
/execute-cleanup todd-lab-onf
/execute-cleanup todd-lab-vi2
```

## What This Does

This command executes a full investigation workflow:

1. **Load Bead** - Reads bead details using `bd show [bead-id]`
2. **Analyze Scope** - Parses description to understand investigation requirements
3. **Explore Codebase** - Uses appropriate tools (Serena, Explore agent, Read, Grep, etc.)
4. **Research Best Practices** - Online research for official docs, patterns, alternatives
5. **Generate Findings** - Creates concise `.md` and `.json` files in `.beads/findings/[bead-id]/`
6. **Create Follow-up Beads** - Generates Bugs, Chores, Tasks, Features, or Epics based on findings
7. **Link Dependencies** - Establishes proper relationships between beads
8. **Update Original Bead** - Adds comments and updates status
9. **Report Summary** - Provides concise output with next actions

## Investigation Workflow

### Phase 1: Understand the Task

```bash
# Load bead details
bd show [bead-id]

# Identify:
# - What area to investigate (files, components, dependencies)
# - What to look for (code smells, patterns, gaps)
# - What research is needed (docs, best practices, alternatives)
# - What deliverables are expected
```

### Phase 2: Explore & Analyze

**For Code Quality Tasks:**
- Use Serena tools for symbol-level analysis
- Search for patterns with `search_for_pattern`
- Analyze complexity, duplication, type safety
- Identify anti-patterns and code smells

**For Documentation Tasks:**
- Read existing READMEs and docs
- Map file structure and navigation
- Identify gaps and inconsistencies
- Check cross-references

**For Dependency Tasks:**
- Check package.json versions
- Review usage patterns in code
- Research latest versions and compatibility
- Evaluate alternatives

**For Testing Tasks:**
- Run coverage reports
- Identify untested code paths
- Check E2E test completeness
- Evaluate accessibility compliance

### Phase 3: Research Best Practices

**Online Research:**
- Official documentation (Next.js, React, library docs)
- Best practices articles from reputable sources
- GitHub issues and discussions
- Migration guides and changelogs
- Security advisories

**Research Questions:**
- What does official documentation recommend?
- What are industry standard patterns?
- What alternatives exist?
- What are the tradeoffs?
- What is the migration cost?

### Phase 4: Generate Findings

Create findings in `.beads/findings/[bead-id]/`:

**1. findings.md** - Comprehensive investigation report:
```markdown
# [Task Title] - Investigation Findings

**Bead:** [bead-id]
**Investigated:** [date]
**Investigator:** [name]

## Executive Summary
[2-3 sentences: what was investigated, key findings, primary recommendation]

## Current State

### What Exists
[Description of current implementation]

### Issues Identified
1. **[Issue Name]** - [Description]
   - **Location:** [files/lines]
   - **Impact:** [severity and scope]
   - **Evidence:** [code examples, metrics]

2. **[Issue Name]** - [Description]
   - **Location:** [files/lines]
   - **Impact:** [severity and scope]
   - **Evidence:** [code examples, metrics]

## Research Summary

### Official Documentation Review
- [Library/Framework]: [version] - [key findings]
- Best practices: [summary]
- Security advisories: [any relevant issues]

### Alternative Analysis
[Summary of alternatives evaluated]

## Recommendations

### Primary Recommendation: [Approach Name]

**What to Do:**
[Clear, actionable steps]

**Why:**
- [Benefit 1]
- [Benefit 2]
- [Benefit 3]

**Tradeoffs:**
- **Pros:** [list]
- **Cons:** [list]
- **Effort:** [estimate]
- **Risk:** [Low/Medium/High]

### Alternative 1: [Approach Name]

**What to Do:**
[Clear, actionable steps]

**Why:**
[Rationale]

**Tradeoffs:**
- **Pros:** [list]
- **Cons:** [list]
- **Effort:** [estimate]
- **Risk:** [Low/Medium/High]

### Alternative 2: [Approach Name]

**What to Do:**
[Clear, actionable steps]

**Why:**
[Rationale]

**Tradeoffs:**
- **Pros:** [list]
- **Cons:** [list]
- **Effort:** [estimate]
- **Risk:** [Low/Medium/High]

## Decision Criteria

- **If [condition]**, choose [approach]
- **If [condition]**, choose [alternative]

## Implementation Plan

### Recommended Approach: [Name]

**Prerequisites:**
- [Requirement 1]
- [Requirement 2]

**Steps:**
1. [Step with file references]
2. [Step with file references]
3. [Step with file references]

**Verification:**
- [ ] [How to verify step 1]
- [ ] [How to verify step 2]
- [ ] [How to verify step 3]

**Estimated Effort:** [hours/days]

## Follow-up Actions

**Bugs Found:**
- [Bug description] → Create bug bead

**Chores Needed:**
- [Chore description] → Create chore bead

**Tasks Required:**
- [Task description] → Create task bead

**Features Suggested:**
- [Feature description] → Consider feature bead

## References

**Documentation:**
- [Link 1]: [Description]
- [Link 2]: [Description]

**Code Locations:**
- [File:line]: [Description]
- [File:line]: [Description]

**Related Beads:**
- [bead-id]: [Description]
```

**2. findings.json** - Structured data for tooling:
```json
{
  "bead_id": "todd-lab-xxx",
  "investigation_date": "2026-01-07",
  "investigator": "agent-name",
  "status": "complete",
  "issues_found": [
    {
      "id": "issue-1",
      "title": "Issue name",
      "severity": "high|medium|low",
      "type": "bug|smell|gap|debt",
      "files": ["path/to/file.ts:123"],
      "description": "...",
      "recommendation": "..."
    }
  ],
  "recommendations": [
    {
      "id": "rec-1",
      "title": "Primary recommendation",
      "approach": "...",
      "effort_hours": 8,
      "risk": "low|medium|high",
      "pros": ["..."],
      "cons": ["..."]
    }
  ],
  "alternatives": [
    {
      "id": "alt-1",
      "title": "Alternative 1",
      "effort_hours": 12,
      "risk": "medium",
      "pros": ["..."],
      "cons": ["..."]
    }
  ],
  "follow_up_beads": [
    {
      "type": "bug|chore|task|feature",
      "title": "...",
      "description": "...",
      "priority": 0-4,
      "depends_on": ["bead-id"]
    }
  ],
  "references": [
    {
      "type": "documentation|article|github",
      "url": "...",
      "title": "..."
    }
  ]
}
```

**3. metrics.json** - Quantitative findings:
```json
{
  "bead_id": "todd-lab-xxx",
  "code_metrics": {
    "files_analyzed": 12,
    "lines_of_code": 1543,
    "duplicated_lines": 234,
    "duplication_percentage": 15.2,
    "complexity_average": 8.5,
    "complexity_max": 23,
    "type_safety_issues": 5,
    "test_coverage": 72.5
  },
  "performance_metrics": {
    "render_count": 45,
    "rerender_unnecessary": 12,
    "bundle_size_kb": 234.5,
    "load_time_ms": 1234
  },
  "dependency_metrics": {
    "total_dependencies": 15,
    "outdated_dependencies": 3,
    "security_vulnerabilities": 0,
    "version_compatibility_issues": 1
  }
}
```

### Phase 5: Create Follow-up Beads

Based on findings, create appropriate beads:

**For Bugs Found:**
```bash
bd create \
  --title="[Bug: specific issue]" \
  --type=bug \
  --priority=[0-4] \
  --description="[Description from findings]

Found during: [parent-bead-id]
Location: [file:line]
Impact: [severity and scope]

See: .beads/findings/[parent-bead-id]/findings.md"

# Link to parent investigation
bd dep add [new-bug-id] [parent-bead-id] --type discovered-from
```

**For Chores (Refactoring, Cleanup):**
```bash
bd create \
  --title="[Action verb] [what] [for what purpose]" \
  --type=chore \
  --priority=[0-4] \
  --description="[Description from recommendation]

Recommendation from: [parent-bead-id]
Effort: [estimate]
Risk: [Low/Medium/High]

Approach: [brief description]

See: .beads/findings/[parent-bead-id]/findings.md"

# Link to parent investigation
bd dep add [new-chore-id] [parent-bead-id] --type discovered-from
```

**For Tasks (Implementation Work):**
```bash
bd create \
  --title="[Implement/Add/Create] [specific feature/component]" \
  --type=task \
  --priority=[0-4] \
  --description="[Description from recommendation]

Recommendation from: [parent-bead-id]
Effort: [estimate]

Implementation plan in: .beads/findings/[parent-bead-id]/findings.md"

# Link to parent investigation
bd dep add [new-task-id] [parent-bead-id] --type discovered-from
```

**For Features (New Capabilities):**
```bash
bd create \
  --title="[User-facing feature description]" \
  --type=feature \
  --priority=[0-4] \
  --description="[Description from findings]

Suggested by: [parent-bead-id]
Benefits: [list]
Effort: [estimate]

Details in: .beads/findings/[parent-bead-id]/findings.md"

# Link to parent investigation
bd dep add [new-feature-id] [parent-bead-id] --type discovered-from
```

**For Complex Work (New Epics with WBS):**
```bash
# Create epic
bd create \
  --title="[Major initiative description]" \
  --type=epic \
  --priority=[0-4] \
  --description="[Epic description]

Recommended by: [parent-bead-id]
See WBS in: .beads/findings/[parent-bead-id]/findings.md"

# Link to parent investigation
bd dep add [new-epic-id] [parent-bead-id] --type discovered-from

# Create child tasks for the epic (if WBS is defined)
bd create --title="[Task 1]" --type=task --priority=2 --description="..."
bd dep add [task1-id] [new-epic-id] --type parent-child

bd create --title="[Task 2]" --type=task --priority=2 --description="..."
bd dep add [task2-id] [new-epic-id] --type parent-child

# ... more tasks
```

### Phase 6: Update Original Bead

**Add Comment with Summary:**
```bash
bd comments add [bead-id] -f .beads/findings/[bead-id]/findings.md
```

**Or Add Concise Summary Comment:**
```bash
bd comments add [bead-id] "Investigation complete. Found [X] issues, created [Y] follow-up beads.

Primary recommendation: [brief summary]

See detailed findings: .beads/findings/[bead-id]/findings.md

Follow-up beads:
- [bead-id]: [title]
- [bead-id]: [title]"
```

**Update Status:**
```bash
# Mark investigation complete
bd update [bead-id] --status=closed

# Or keep open if awaiting decision
bd update [bead-id] --status=in_progress
```

## Beads CLI Quick Reference

### Essential Commands

**Show Details:**
```bash
bd show [bead-id]                    # Full details
bd show [bead-id] --json             # JSON format
```

**Create Bead:**
```bash
bd create \
  --title="Title" \
  --type=[task|bug|chore|feature|epic] \
  --priority=[0-4] \
  --description="Description"
```

**Update Bead:**
```bash
bd update [bead-id] --status=[open|in_progress|closed]
bd update [bead-id] --priority=[0-4]
bd update [bead-id] --assignee=[name]
```

**Dependencies:**
```bash
# Add dependency (A depends on B / B blocks A)
bd dep add [A] [B] --type blocks

# Parent-child (A is child of B / B is parent of A)
bd dep add [A] [B] --type parent-child

# Discovered from (A was found during B investigation)
bd dep add [A] [B] --type discovered-from

# Related
bd dep add [A] [B] --type related
```

**Comments:**
```bash
bd comments [bead-id]                # List comments
bd comments add [bead-id] "Comment"  # Add comment
bd comments add [bead-id] -f file.md # Add from file
```

**Search & Filter:**
```bash
bd list --status=open                # Open issues
bd list --type=bug                   # All bugs
bd list --priority=0                 # P0 issues
bd ready                             # Ready to work (no blockers)
bd blocked                           # Blocked issues
bd search "query"                    # Text search
```

**Close:**
```bash
bd close [bead-id]                   # Close single
bd close [id1] [id2] [id3]           # Close multiple
```

## Investigation Categories

### Documentation Investigation

**Focus:**
- README clarity and structure
- Cross-reference completeness
- File tree navigation
- Architecture documentation

**Tools:**
- Read tool for existing docs
- Glob for file discovery
- Grep for cross-reference checking

**Output:**
- Revised README templates
- Cross-reference map
- File tree diagrams

### Code Quality Investigation

**Focus:**
- Duplicate patterns
- Code complexity
- Type safety gaps
- Error handling consistency
- Performance anti-patterns

**Tools:**
- Serena symbol analysis
- search_for_pattern for duplication
- find_symbol for type analysis
- find_referencing_symbols for impact analysis

**Output:**
- Code smell inventory
- Refactoring recommendations
- Type safety improvements
- Performance optimization opportunities

### Dependency Investigation

**Focus:**
- Version compatibility
- Best practices adherence
- Security vulnerabilities
- Alternative evaluation

**Tools:**
- Read package.json
- Grep for usage patterns
- WebSearch for latest docs
- WebFetch for changelogs

**Output:**
- Dependency audit report
- Upgrade recommendations
- Alternative comparisons
- Migration cost estimates

### Testing Investigation

**Focus:**
- Coverage gaps
- E2E completeness
- Edge cases
- Accessibility compliance

**Tools:**
- Bash for coverage reports
- Read test files
- Grep for test patterns
- WebSearch for WCAG guidelines

**Output:**
- Coverage gap analysis
- Test implementation plan
- Accessibility audit results
- E2E test scenarios

## Output Format

At completion, provide:

```markdown
## Investigation Complete: [Bead Title]

**Bead:** [bead-id]
**Status:** Closed ✓

### Findings Summary

**Issues Found:** [X]
- [count] High severity
- [count] Medium severity
- [count] Low severity

**Primary Recommendation:** [Brief description]
- **Effort:** [estimate]
- **Risk:** [Low/Medium/High]

### Follow-up Beads Created

**Bugs ([X]):**
- [bead-id]: [title]
- [bead-id]: [title]

**Chores ([X]):**
- [bead-id]: [title]
- [bead-id]: [title]

**Tasks ([X]):**
- [bead-id]: [title]

**Features ([X]):**
- [bead-id]: [title]

### Documentation

**Findings:** `.beads/findings/[bead-id]/findings.md`
**Data:** `.beads/findings/[bead-id]/findings.json`
**Metrics:** `.beads/findings/[bead-id]/metrics.json`

### Next Actions

1. Review findings document
2. Prioritize follow-up beads
3. Decide on recommendation vs. alternatives
4. Begin implementation with highest priority bead

**Ready to work:** `bd ready` to see actionable beads
```

## Token Optimization Strategies

### Concise Findings Format

**Instead of:**
```
The current implementation uses a pattern that repeats across multiple files.
This creates duplication and makes maintenance difficult. We should consider
extracting this to a shared utility function.
```

**Use:**
```
**Duplication:** Pattern repeats in 4 files (234 lines total)
**Impact:** Maintenance burden, inconsistent behavior
**Fix:** Extract to shared utility
```

### Structured Lists Over Prose

**Instead of:**
```
The investigation revealed several issues. First, there are type safety problems
in three components. Second, error handling is inconsistent. Third, performance
could be improved by memoization.
```

**Use:**
```
**Issues:**
- Type safety: 3 components use `any` (Card.tsx:45, List.tsx:23, Form.tsx:67)
- Error handling: 5 functions lack try-catch (see metrics.json)
- Performance: 12 unnecessary re-renders (memoization opportunity)
```

### Reference, Don't Repeat

**Instead of:**
Copying code examples in markdown

**Use:**
```
See duplication: src/components/KanbanCard.tsx:45-67 vs KanbanColumn.tsx:89-111
```

### Metrics Over Description

**Instead of:**
```
The function is quite complex and has many branches
```

**Use:**
```
Complexity: 23 (threshold: 10) - 8 branches, 4 levels nesting
```

## Success Criteria

Investigation is complete when:

- [x] Bead loaded and analyzed
- [x] Codebase explored with appropriate tools
- [x] Best practices researched online
- [x] Findings documented in `.beads/findings/[bead-id]/`
  - [x] findings.md (comprehensive report)
  - [x] findings.json (structured data)
  - [x] metrics.json (quantitative data)
- [x] Primary recommendation with 2+ alternatives
- [x] Tradeoff analysis completed
- [x] Follow-up beads created as needed
- [x] Dependencies linked properly
- [x] Original bead updated with comment
- [x] Original bead status updated
- [x] Concise summary provided to user

## Notes

- **Use Explore agent** for comprehensive codebase understanding
- **Research thoroughly** - online docs, best practices, alternatives
- **Be concise** - token-optimized findings, structured data
- **Create actionable beads** - specific, implementable follow-ups
- **Link dependencies** - discovered-from for traceability
- **Quantify findings** - metrics over prose
- **Reference code** - file:line instead of copying
- **Multiple alternatives** - always provide 2+ options with tradeoffs
