# Fix Component Command

Systematically fix gaps identified in a TODD component audit and bring it to full compliance with framework standards.

## Usage

```
/fix-component [component-name]
```

## Instructions

Execute the fix prompt at `.github/prompts/components/comp-fix.prompt.md` for the specified component.

**Component to fix:** `[component-name]`

Follow all instructions in `.github/instructions/components/todd-fixcomp.instructions.md`.

## Output

Provide regular progress updates as specified in the instructions, culminating in a final report that includes:
1. Total gaps fixed (by severity)
2. Test results (before/after)
3. Total time spent
4. Files modified
5. Verification checklist status
6. Link to `.todd/tasks/<component-name>/` folder
