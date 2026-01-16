---
description: Generate a structured WBS (Work Breakdown Structure) from a user prompt for creating beads issues
argument-hint: <feature description or work context>
---

# Task Generation from Prompt

## CRITICAL: DUAL-MODE SKILL

This skill operates in two modes based on how it's called:

### Mode 1: JSON Output Mode (when `--json-output` is in the prompt)
When the prompt contains `--json-output`, output a JSON WBS structure for programmatic consumption.
**DO NOT execute any `bd` commands.** Just output the JSON structure.

### Mode 2: Action Mode (default, no `--json-output` flag)
When `--json-output` is NOT present, execute `bd create` commands directly to create issues.

---

## Mode Detection

**First, check if `--json-output` appears anywhere in the prompt.**

- If YES → Follow [JSON Output Mode Instructions](#json-output-mode-instructions)
- If NO → Follow [Action Mode Instructions](#action-mode-instructions)

---

## JSON Output Mode Instructions

When `--json-output` is detected, output a valid JSON object matching this schema:

```json
{
  "title": "Epic/Feature title",
  "description": "High-level description of the work",
  "type": "epic",
  "priority": 1,
  "tasks": [
    {
      "title": "Task title",
      "description": "Task description with acceptance criteria",
      "type": "task",
      "priority": 2,
      "dependencies": ["Title of task this depends on"],
      "labels": ["optional-label"]
    }
  ],
  "dependencies": [
    {
      "from": "Task that is blocked",
      "to": "Task that blocks",
      "type": "blocks"
    }
  ],
  "metadata": {
    "prompt": "Original prompt text",
    "generated_at": "ISO 8601 timestamp"
  }
}
```

**IMPORTANT for JSON mode:**
- Output ONLY the JSON object, no other text
- Ensure valid JSON syntax (proper escaping, no trailing commas)
- Include all required fields: title, description, type, priority, tasks, dependencies
- Use dependency titles in the `dependencies` array within tasks
- Use the `dependencies` array at root level for explicit relationships

**Skip to [Task Quality Checklist](#task-quality-checklist) after outputting JSON.**

---

## Action Mode Instructions

Generate a structured Work Breakdown Structure (WBS) from a natural language description and **create all issues directly** using the `bd` CLI. Supports two modes:

1. **Discovery Mode** (default for complex work): Creates analysis tasks that output implementation tasks
2. **Implementation Mode**: Creates actionable tasks directly

## Expected Final Output

After executing all `bd` commands, output a tree showing what was created:

```
Created WBS:
├── todd-lab-abc1 (epic): Better Beads CLI Error Logging
│   ├── todd-lab-def2 (feature): Discovery - Error Analysis
│   │   ├── todd-lab-ghi3 (task): Analyze current error handling [P1]
│   │   └── todd-lab-jkl4 (task): Research best practices [P1]
│   └── todd-lab-mno5 (feature): Implementation - Error Improvements
│       └── (blocked by Discovery)

Dependencies established:
- todd-lab-mno5 blocked by todd-lab-def2
- todd-lab-jkl4 blocked by todd-lab-ghi3

Ready to work: todd-lab-ghi3 (no blockers)
```

**DO NOT output JSON structures.** The above tree format is the expected output.

## The Discovery-to-Implementation Pattern

Complex work benefits from a two-phase approach:

```
Epic: [High-Level Goal]
├── Feature: Discovery
│   ├── Task: Analyze current state → outputs: implementation tasks
│   ├── Task: Research best practices → outputs: design decisions
│   ├── Task: Generate mockups/designs → outputs: visual specs
│   └── Task: Choose approach → outputs: final task list
│
└── Feature: Implementation (blocked by Discovery)
    ├── Task: [Generated from Discovery outputs]
    ├── Task: [Generated from Discovery outputs]
    └── ...
```

### Why Discovery First?

- **Complex work has unknowns**: You can't plan what you don't understand
- **Discovery tasks are meta**: Their output IS the implementation plan
- **Prevents over-planning**: Only plan implementation after research
- **Supports iteration**: Discovery can reveal scope changes

## When to Use Each Mode

### Use Discovery Mode When:
- Work requires research or design exploration
- Multiple valid approaches exist
- Visual/UX design is involved
- Technical investigation needed
- Scope is unclear or abstract
- Work involves new technologies or patterns

### Use Implementation Mode When:
- Requirements are well-defined
- Approach is known and proven
- Small, focused changes
- Bug fixes with clear root cause
- Maintenance tasks

## Usage

### Discovery Mode (Complex Work)

```
/task-generate --discovery Redesign the issue detail page with game-design-inspired UI
```

### Implementation Mode (Well-Defined Work)

```
/task-generate Add pagination to the issues list endpoint
```

### Force Implementation Mode

```
/task-generate --impl Add caching to the API
```

## Execution Instructions

### Step 1: Analyze the Request

Determine:
- **Complexity**: Is this well-defined or exploratory?
- **Unknowns**: Does it require research or design?
- **Scope**: Clear boundaries or open-ended?
- **Type**: Technical, UI/UX, infrastructure, etc.

### Step 2: Choose Mode

- Default to Discovery for: UI work, architecture, new features, unclear scope
- Default to Implementation for: bug fixes, small changes, well-defined tasks

### Step 3: Create Issues Using bd CLI

**CRITICAL**: You MUST use the Bash tool to execute each `bd` command. Do NOT just show the commands - RUN them.

For each issue:
1. Run `bd create` with the Bash tool
2. Capture the returned issue ID from the command output
3. Use that ID for subsequent `--parent` flags and `bd dep add` commands

#### Creating the Epic (Root)

```bash
bd create --title="Epic: [Goal Name]" --type=epic --priority=1 \
  --description="[High-level description of the goal]" --silent
```

Capture the returned ID - this is your **root ID** to return at the end.

#### Creating Features Under the Epic

```bash
# Create feature
bd create --title="Feature: [Feature Name]" --type=feature --priority=1 \
  --description="[Feature description]" --parent=<epic-id> --silent
```

Use `--parent=<epic-id>` to establish the parent-child relationship.

#### Creating Tasks Under Features

```bash
# Create task under a feature
bd create --title="[Task Name]" --type=task --priority=2 \
  --description="[Task description with acceptance criteria]" --parent=<feature-id> --silent
```

#### Establishing Blocking Dependencies

For tasks or features that must complete before others can start:

```bash
# Feature: Implementation blocked by Feature: Discovery
bd dep add <implementation-feature-id> <discovery-feature-id>
```

For sequential tasks within a feature:

```bash
# Task B depends on Task A completing first
bd dep add <task-b-id> <task-a-id>
```

### Step 4: Output the Created WBS Tree

After all `bd` commands have been executed, output a summary in this format:

```
Created WBS:
├── <epic-id> (epic): <title>
│   ├── <feature-id> (feature): <title>
│   │   ├── <task-id> (task): <title> [P<priority>]
│   │   └── <task-id> (task): <title> [P<priority>]
│   └── <feature-id> (feature): <title>
│       └── (blocked by <blocker-id>)

Dependencies established:
- <blocked-id> blocked by <blocker-id>

Ready to work: <first-unblocked-task-id> (no blockers)
```

## Example Execution: UI Redesign (Discovery Mode)

Input:
```
/task-generate --discovery Redesign issue detail page with game-design UI principles
```

**Execute these commands in sequence using the Bash tool:**

First, create the Epic:
```bash
bd create --title="Epic: Improve Issue Detail Page" --type=epic --priority=1 \
  --description="Redesign issue detail page with game-design-inspired UI/UX" --silent
```
Capture the returned ID (e.g., `todd-lab-abc1`)

Then create the Discovery Feature:
```bash
bd create --title="Feature: Discovery - Issue Detail Page Analysis & Design" --type=feature --priority=1 \
  --description="Analyze current state and design new UI approach" --parent=todd-lab-abc1 --silent
```
Capture the returned ID (e.g., `todd-lab-def2`)

Then create the Implementation Feature (will be blocked):
```bash
bd create --title="Feature: Implementation - Issue Detail Page Build" --type=feature --priority=1 \
  --description="Build the redesigned issue detail page (tasks to be added after discovery)" --parent=todd-lab-abc1 --silent
```
Capture the returned ID (e.g., `todd-lab-ghi3`)

Block Implementation on Discovery:
```bash
bd dep add todd-lab-ghi3 todd-lab-def2
```

Create Discovery Tasks under Discovery Feature:
```bash
bd create --title="Analyze current issue detail data model" --type=task --priority=1 \
  --description="OUTPUT: Data layer implementation tasks. Analyze: Bead interface fields, data fetching patterns, Bishop log structure, labels/dependencies schemas. Deliverable: List of data model changes needed" \
  --parent=todd-lab-def2 --silent
```
Capture ID (e.g., `todd-lab-t1`)

```bash
bd create --title="Research game-design UI/UX principles" --type=task --priority=1 \
  --description="OUTPUT: Design principles document. Research: Information density patterns, color coding systems, icon conventions, compact UI patterns. Deliverable: Design principles to apply" \
  --parent=todd-lab-def2 --silent
```
Capture ID (e.g., `todd-lab-t2`)

```bash
bd create --title="Generate 3+ visual mockups" --type=task --priority=1 \
  --description="OUTPUT: Mockup images + design rationale. Create 3+ distinct design approaches with documented rationale." \
  --parent=todd-lab-def2 --silent
```
Capture ID (e.g., `todd-lab-t3`)

Add task dependency (mockups depend on research):
```bash
bd dep add todd-lab-t3 todd-lab-t2
```

```bash
bd create --title="Select design and create implementation plan" --type=task --priority=1 \
  --description="OUTPUT: Final implementation task list. Choose 2 favorite designs for implementation with TDD approach." \
  --parent=todd-lab-def2 --silent
```
Capture ID (e.g., `todd-lab-t4`)

Add dependency (selection depends on mockups):
```bash
bd dep add todd-lab-t4 todd-lab-t3
```

**Final output (after all commands executed):**
```
Created WBS:
├── todd-lab-abc1 (epic): Improve Issue Detail Page
│   ├── todd-lab-def2 (feature): Discovery - Issue Detail Page Analysis & Design
│   │   ├── todd-lab-t1 (task): Analyze current issue detail data model [P1]
│   │   ├── todd-lab-t2 (task): Research game-design UI/UX principles [P1]
│   │   ├── todd-lab-t3 (task): Generate 3+ visual mockups [P1]
│   │   └── todd-lab-t4 (task): Select design and create implementation plan [P1]
│   └── todd-lab-ghi3 (feature): Implementation - Issue Detail Page Build
│       └── (blocked by todd-lab-def2)

Dependencies established:
- todd-lab-ghi3 blocked by todd-lab-def2
- todd-lab-t3 blocked by todd-lab-t2
- todd-lab-t4 blocked by todd-lab-t3

Ready to work: todd-lab-t1 (no blockers)
```

## Example Execution: Simple Feature (Implementation Mode)

Input:
```
/task-generate Add pagination to the issues list endpoint
```

**Execute these commands using the Bash tool:**

Create the Feature:
```bash
bd create --title="Feature: Add Pagination to Issues List" --type=feature --priority=2 \
  --description="Implement cursor-based pagination for the issues list API endpoint" --silent
```
Capture ID (e.g., `todd-lab-xyz1`)

Create implementation tasks:
```bash
bd create --title="Add pagination parameters to API handler" --type=task --priority=2 \
  --description="Add limit, cursor parameters to GET /issues endpoint. Acceptance: limit defaults to 20 (max 100), cursor is base64 encoded, returns next_cursor in response" \
  --parent=todd-lab-xyz1 --silent
```
Capture ID (e.g., `todd-lab-t1`)

```bash
bd create --title="Update database query with pagination" --type=task --priority=2 \
  --description="Modify issues query to support cursor-based pagination. Use efficient cursor-based query (not offset), consistent ordering, handle edge cases" \
  --parent=todd-lab-xyz1 --silent
```
Capture ID (e.g., `todd-lab-t2`)

Add dependency:
```bash
bd dep add todd-lab-t2 todd-lab-t1
```

```bash
bd create --title="Write pagination tests" --type=task --priority=2 \
  --description="Test pagination edge cases: first page, middle pages, last page, empty results, invalid cursor handling" \
  --parent=todd-lab-xyz1 --silent
```
Capture ID (e.g., `todd-lab-t3`)

Add validation dependency:
```bash
bd dep add todd-lab-t3 todd-lab-t2 --type=validates
```

**Final output (after all commands executed):**
```
Created WBS:
├── todd-lab-xyz1 (feature): Add Pagination to Issues List
│   ├── todd-lab-t1 (task): Add pagination parameters to API handler [P2]
│   ├── todd-lab-t2 (task): Update database query with pagination [P2]
│   └── todd-lab-t3 (task): Write pagination tests [P2]

Dependencies established:
- todd-lab-t2 blocked by todd-lab-t1
- todd-lab-t3 validates todd-lab-t2

Ready to work: todd-lab-t1 (no blockers)
```

## Error Handling

If a `bd create` command fails mid-way through WBS creation:

1. **Report what was created**: List the IDs of successfully created issues
2. **Report the failure**: Which issue failed and why
3. **Suggest recovery**: How to resume or clean up

Example partial failure output:
```
WBS creation partially completed.

Created:
- todd-lab-abc1 (Epic: Improve Issue Detail Page)
- todd-lab-def2 (Feature: Discovery - Issue Detail Page Analysis & Design)

Failed at:
- Feature: Implementation - Issue Detail Page Build
- Error: [error message]

To resume: Create remaining issues manually with --parent=todd-lab-abc1
To cleanup: bd close todd-lab-abc1 todd-lab-def2 --reason="WBS creation failed"
```

## Discovery Phase Templates

### For UI/UX Work

```
Feature: Discovery - [Component] Design
├── Task: Analyze current [component] structure
│   OUTPUT: Data model requirements, component inventory
├── Task: Research UI/UX best practices for [use case]
│   OUTPUT: Design principles to apply, reference examples
├── Task: Generate visual mockups (3+ options)
│   OUTPUT: Image files, design rationale
├── Task: Select preferred design approach
│   OUTPUT: Chosen design, implementation task list
```

### For Technical Architecture

```
Feature: Discovery - [System] Architecture
├── Task: Analyze current architecture
│   OUTPUT: Dependency map, pain points list
├── Task: Research solutions/patterns
│   OUTPUT: Evaluated options with trade-offs
├── Task: Design new architecture
│   OUTPUT: Architecture diagram, component specs
├── Task: Create implementation plan
│   OUTPUT: Ordered task list with dependencies
```

### For Feature Development

```
Feature: Discovery - [Feature] Planning
├── Task: Gather requirements
│   OUTPUT: User stories, acceptance criteria
├── Task: Technical feasibility analysis
│   OUTPUT: Approach recommendation, risks
├── Task: Design API/data model
│   OUTPUT: Schema, endpoint specs
├── Task: Create implementation WBS
│   OUTPUT: Task breakdown with estimates
```

## Priority Guidelines

| Priority | When to Use |
|----------|-------------|
| P0 (0) | Blocks other work, critical path |
| P1 (1) | Core functionality, high value |
| P2 (2) | Standard priority (default) |
| P3 (3) | Nice to have, polish |
| P4 (4) | Future consideration, backlog |

## Task Quality Checklist

Before creating issues, ensure:

- [ ] Each task is completable in one session
- [ ] Acceptance criteria are specific and testable
- [ ] Dependencies form a valid DAG (no cycles)
- [ ] Discovery tasks specify output type (for discovery mode)
- [ ] Implementation blocked by Discovery (if both exist)
- [ ] Used `--parent` for hierarchical relationships
- [ ] Used `bd dep add` for blocking dependencies

## Summary of bd Commands Used

| Purpose | Command |
|---------|---------|
| Create epic | `bd create --title="..." --type=epic --priority=N --silent` |
| Create feature under epic | `bd create --title="..." --type=feature --parent=<epic-id> --silent` |
| Create task under feature | `bd create --title="..." --type=task --parent=<feature-id> --silent` |
| Block issue on another | `bd dep add <blocked-id> <blocker-id>` |
| Validation dependency | `bd dep add <test-id> <feature-id> --type=validates` |

## Related Skills

- `/task` - Manual beads issue creation guide
- `/execute-task` - Execute a beads task
- `/beads-cleanup` - Reorganize existing beads structure

## Tips

1. **Use `--silent` flag**: Gets only the issue ID, easier to capture
2. **Create parent first**: Always create epic/feature before children
3. **Establish blocks after creation**: Create all issues, then add dependencies
4. **Start abstract**: Let Discovery refine the scope
5. **Trust the process**: Don't skip Discovery for complex work
6. **Output-oriented**: Every Discovery task produces something concrete
