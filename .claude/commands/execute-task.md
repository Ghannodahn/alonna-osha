# Creating Beady Issues (Beads)

Beads is an installed CLI for persistent issue tracking across sessions. Use for strategic work, dependencies, and multi-session projects.

## When to Use Beads vs TodoWrite

- **Beads (`bd create`)**: Multi-session work, dependencies, blocking issues, discovered tasks, strategic planning
- **TodoWrite**: Single-session execution, simple task lists, temporary tracking

## Issue Types

```bash
--type=feature    # New feature or functionality
--type=epic       # Large feature with multiple dependencies
--type=task       # Work item or implementation task
--type=bug        # Bug fix or defect
--type=refactor   # Code improvement without new features
--type=docs       # Documentation or README updates
--type=test       # Testing or test infrastructure
--type=chore      # Maintenance, dependencies, configuration
```

## Priority Levels

```bash
--priority=0      # P0 (Critical - block everything)
--priority=1      # P1 (High - urgent)
--priority=2      # P2 (Medium - standard)
--priority=3      # P3 (Low - nice to have)
--priority=4      # P4 (Backlog - future)
```
⚠️ **DO NOT use**: "high", "medium", "low" (use numeric values only)

## Creating Issues

### Basic Issue
```bash
bd create --title="Implement user authentication" --type=feature --priority=2
```

### Full-Featured Issue
```bash
bd create \
  --title="Add error handling to API" \
  --type=task \
  --priority=1 \
  --description="Handle network failures gracefully" \
  --assignee=username
```

## Status Management

```bash
bd update <id> --status=in_progress    # Claim work
bd update <id> --status=open           # Return to backlog
bd close <id> --reason="Completed"     # Mark complete
bd close <id1> <id2> <id3>             # Batch close (more efficient)
```

## Dependencies & Relationships

### Dependency Types

**Blocking Dependencies** (prevent progress):
```bash
bd dep add <issue> --depends-on <blocker>
# OR
bd dep add <issue> <blocker>           # Default: --type=blocks
# OR
bd dep <blocker> --blocks <issue>
# issue is blocked and cannot start until blocker completes
# ✅ Use for: prerequisites, critical path, sequential work
```

**Hierarchy & Structure**:
```bash
bd dep add <child> --depends-on <parent> --type=parent-child
# parent-child: Parent task must complete before child can progress
# ✅ Use for: epic → feature → task breakdown, hierarchical decomposition
```

**Relationship Types** (different purposes):
```bash
# TRACKING - issue monitors/references another
bd dep add <tracker> --depends-on <tracked> --type=tracks
# ✅ Use for: story points tracked in another issue, sync points

# VALIDATION - issue validates/verifies another
bd dep add <test> --depends-on <feature> --type=validates
# ✅ Use for: testing depends on feature, QA verification

# DISCOVERY - issue was discovered while working on another
bd dep add <discovered> --depends-on <source> --type=discovered-from
# ✅ Use for: tech debt found during implementation, scope expansion

# CAUSATION - one issue caused/created another
bd dep add <follow-up> --depends-on <root> --type=caused-by
# ✅ Use for: bug fixes, followup work, issue chains

# TIME-BASED - work until another issue is done
bd dep add <work> --depends-on <deadline> --type=until
# ✅ Use for: temporary workarounds, deadline-based dependencies

# SUPERSEDING - one issue replaces/makes another obsolete
bd dep add <new> --depends-on <old> --type=supersedes
# ✅ Use for: version upgrades, refactoring replacements
```

**Loose Relationships** (no blocking, for knowledge graphs):
```bash
bd dep relate <issue1> <issue2>        # Bidirectional "see also"
# Related issues referenced each other
# ✅ Use for: similar features, related concerns, cross-references (non-blocking)
```

### Querying Dependencies

```bash
bd show <id>                           # View issue with all relationships
bd dep list <id>                       # List dependencies of an issue
bd dep tree <id>                       # Show dependency tree/graph
bd blocked                             # Show all currently blocked issues
bd dep cycles                          # Detect circular dependencies
```

### Example: Multi-Level Feature with Dependencies

```bash
# Epic (high-level feature)
bd create --title="Implement cache layer" --type=epic --priority=1
# Returns: beads-epic-1

# Design task (must complete first)
bd create --title="Design cache schema" --type=task --priority=1
# Returns: beads-001

# Make epic depend on design (blocks epic until design is done)
bd dep add beads-epic-1 beads-001 --type=parent-child

# Implementation task (depends on design)
bd create --title="Implement cache storage" --type=task --priority=1
# Returns: beads-002
bd dep add beads-002 beads-001         # Default: --type=blocks

# Testing task (validates implementation)
bd create --title="Test cache performance" --type=test --priority=1
# Returns: beads-003
bd dep add beads-003 beads-002 --type=validates

# Related optimization work (see also, non-blocking)
bd create --title="Optimize query patterns" --type=task --priority=3
# Returns: beads-004
bd dep relate beads-004 beads-003

# View the dependency structure
bd dep tree beads-epic-1               # Shows all dependencies
bd show beads-epic-1                   # Shows what's blocking it
bd blocked                             # Shows beads-002 and beads-003 are blocked
```

## Useful Commands

```bash
bd ready                        # Issues ready to work (no blockers)
bd list --status=open          # All open issues
bd list --status=in_progress   # Your active work
bd list --status=closed        # Completed issues

bd show <id>                    # Detailed view (dependencies, assignees, etc.)
bd epic <name>                  # Epic management
bd stats                        # Project statistics

bd sync                         # Push changes to remote
bd doctor                       # Check for sync issues
```

## Session Workflow

### Starting Work
```bash
bd ready                                    # Find available work
bd show <id>                                # Review details
bd update <id> --status=in_progress        # Claim it
```

### Completing Work
```bash
bd close <id1> <id2> ...                   # Close completed issues
bd sync                                    # Push to remote
```

## Tips

- Use `bd create` in parallel for multiple related issues (e.g., via subagents)
- Batch close related issues with `bd close <id1> <id2> <id3>` (more efficient than individual closes)
- Check `bd ready` before planning new work (shows blockers)
- Run `bd sync` at session end to persist changes
- Add `--assignee=username` to assign work to team members

---

For full documentation:
```bash
bd --help
bd <command> --help
```