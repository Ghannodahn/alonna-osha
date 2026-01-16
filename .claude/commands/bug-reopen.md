# Bug Reopen Command

Reopen a closed bug issue, set appropriate Beads state, and use Bishop to resume work with user-provided context.

## Arguments

- `$ARGUMENTS` - Required: The bug/issue ID to reopen (e.g., `todd-lab-abc123`)

## When to Use

- When a bug was closed but the fix didn't work or regressed
- When a closed issue needs additional work based on new information
- When resuming work on a previously closed bug with new context

## Execution Flow

### Step 1: Validate Issue ID

Extract the issue ID from arguments:
```bash
bd show $ARGUMENTS
```

If the issue doesn't exist, inform the user and stop.

### Step 2: Verify Issue is Closed

Check the issue status. If the issue is not closed, inform the user:
- "Issue is already open - no need to reopen"
- Offer to run Bishop on it directly if they want to resume work

### Step 3: Gather Reopen Context

**CRITICAL**: Ask the user for the reason/context for reopening using AskUserQuestion:

Questions to ask:
1. "Why is this bug being reopened?" with options:
   - "Fix didn't work - bug still occurs"
   - "Regression - bug returned after other changes"
   - "Incomplete fix - additional cases discovered"
   - "New information - requirements changed"

2. "What additional context should the AI have when resuming work?"
   - This is a free-form text input the user provides
   - This becomes the `--inject` parameter for Bishop

### Step 4: Reopen the Issue

Execute the reopen command with the user's reason:
```bash
bd reopen $ARGUMENTS --reason "<user's reason from step 3>"
```

### Step 5: Update Issue Status

Set the issue to in_progress since we're about to work on it:
```bash
bd update $ARGUMENTS --status=in_progress
```

### Step 6: Resume with Bishop

Use Bishop to resume the task with the user's context injected:

```bash
todd-bishop beads-resume $ARGUMENTS --inject "<user's additional context from step 3>"
```

**Important flags to consider:**
- `--json` - For structured output in automation contexts
- `--dry-run` - Show what would happen without executing (useful for verification)

## Example Usage

User runs: `/bug-reopen todd-lab-xyz789`

1. Validate `todd-lab-xyz789` exists and is closed
2. Ask user why they're reopening (fix didn't work, regression, etc.)
3. Ask user for context to inject ("The fix works for case A but fails for case B with error X")
4. Run: `bd reopen todd-lab-xyz789 --reason "Fix didn't work - bug still occurs"`
5. Run: `bd update todd-lab-xyz789 --status=in_progress`
6. Run: `todd-bishop beads-resume todd-lab-xyz789 --inject "The fix works for case A but fails for case B with error X"`

## Error Handling

- **Issue not found**: "Issue $ARGUMENTS not found. Please verify the issue ID."
- **Issue already open**: "Issue $ARGUMENTS is already open (status: <status>). Use `/task-execute` to work on it instead."
- **Bishop not available**: Fall back to reopening only, inform user they can manually resume later
- **No context provided**: Require at least a reason for reopening before proceeding

## Notes

- This command combines Beads state management with Bishop task execution
- The user's context is critical for AI to understand what changed since the bug was closed
- Always verify the fix attempt after Bishop completes work
