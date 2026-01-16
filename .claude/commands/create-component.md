# Create Component Command

Create a new TODD component with complete implementation, documentation, and test harness.

## Usage

```
/create-component [component-name] [type] [category]
```

**Parameters:**
- `component-name` - Kebab-case name (e.g., location-card)
- `type` - Framework or Solution
- `category` - layout, display, navigation, or utility

## Instructions

Execute the creation prompt at `.github/prompts/components/newcomp.prompt.md` for the specified component.

Follow all instructions in `.github/instructions/components/todd-newcomponent.instructions.md`.

## Output

Provide:
1. Component location path
2. Test harness URL (`/tests/[component-name]`)
3. Test coverage percentage
4. Documentation link
5. Updated task tracking status