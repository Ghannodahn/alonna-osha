# Audit Component Command

Audit an existing TODD component against current standards.

## Usage

```
/audit-component [component-name]
```

## Instructions

Execute the audit prompt at `.github/prompts/components/todd-cleancomp.prompt.md` for the specified component.

**Component to audit:** `[component-name]`

Follow all instructions in `.github/instructions/components/todd-cleancomp.instructions.md`.

## Output

Provide:
1. Summary (status, gap counts, effort estimate)
2. Critical gaps list
3. Minor gaps list
4. Detailed remediation plan with steps
5. Verification checklist