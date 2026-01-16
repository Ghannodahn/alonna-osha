# Commit Message Generation

Generate conventional commit messages with impact-focused bodies. No file lists, no testing steps - just observable impact.

## Format

```
<type>(<scope>): <subject>

<body>
```

### Subject Line (REQUIRED)
- **Type**: feat, fix, docs, style, refactor, perf, test, chore, ci, build, revert
- **Scope**: Optional component/area (e.g., kanban, auth, api)
- **Subject**: Lowercase, imperative mood, no period, max 100 chars

### Body (REQUIRED)
Impact-focused description with observable changes.

## Output Format

**ALWAYS output the commit message inside a code block:**

```
type(scope): subject line here

Summary of what changed and why it matters in 1-2 sentences.

**Category 1:**
- Observable change with quantification
- Observable change with quantification

**Category 2:**
- Observable change with quantification
```

## Types

| Type | Description | Triggers Release? |
|------|-------------|-------------------|
| feat | New feature | Minor bump |
| fix | Bug fix | Patch bump |
| perf | Performance improvement | Patch bump |
| docs | Documentation only | No |
| style | Code style (formatting) | No |
| refactor | Code refactoring | No |
| test | Adding/updating tests | No |
| chore | Build/tooling | No |
| ci | CI/CD configuration | No |
| build | Build system | No |
| revert | Revert commit | Depends |

## Impact Categories

Choose 1-3 categories for the body:

- **Features** - New capabilities, enhanced functionality
- **Bugs** - Eliminated errors, fixed broken behavior
- **Performance** - Reduced time/memory (with numbers)
- **Developer Experience** - Better debugging, clearer code
- **Documentation** - Improved guides, examples
- **Automation** - Reduced manual work
- **Security** - Fixed vulnerabilities

## Examples

### Example 1: Bug Fix
```
fix(payments): resolve batch timeout errors

Implemented async pagination for batch payment processing. Eliminates timeout failures and reduces processing time.

**Reliability:**
- Timeout errors: 12/week → 0
- Batch success rate: 73% → 100%

**Performance:**
- Processing time: 45s → 8s (82% faster)
```

### Example 2: Feature
```
feat(dashboard): add real-time revenue tracking

Live revenue tracking dashboard provides event staff real-time sales metrics during operations.

**Operational Efficiency:**
- Eliminated 2-hour post-event reconciliation
- Real-time inventory awareness prevents stockouts

**Revenue Optimization:**
- Identified peak hours for staffing optimization
```

### Example 3: Documentation
```
docs: add macos code signing guide

Documented root cause of Gatekeeper errors for Electron releases and created implementation guide for Apple code signing.

**Developer Experience:**
- Root cause identified: missing GitHub secrets
- Step-by-step guide: enrollment → certificate → secrets → config
- Workaround documented for local testing
```

### Example 4: Chore
```
chore(deps): update electron to v39

Updated Electron from v38 to v39 for security patches and performance improvements.

**Security:**
- Addresses CVE-2024-XXXX
- Updated Chromium to latest stable
```

## Key Principles

- Subject: lowercase, imperative, no period
- Body: impact-focused with quantification where possible
- NO file lists (git diff shows this)
- NO "next steps" sections
- YES observable impact with numbers when available

## Usage

Say: "Give me a commit message" or "/commit"

I will:
1. Analyze staged/unstaged changes
2. Determine appropriate type and scope
3. Write concise subject line
4. Add impact-focused body
5. Output in a code block for easy copying

## Execution

**After generating the commit message, ALWAYS:**
1. Stage relevant files with `git add`
2. Commit with the generated message
3. Push to remote with `git push`

**Do NOT just output the message and stop.** The full workflow is:
```bash
git add <files>
git commit -m "<message>"
git push
```

Work is not complete until changes are pushed to remote.
