# Clean Project

**Task**: Fix ALL ESLint errors and TypeScript warnings in the entire project to achieve 100% clean status.

## Objectives

1. **Fix ALL ESLint errors** - Exit code 1 errors that block deployment
2. **Fix ALL ESLint warnings** - Code quality issues
3. **Fix ALL TypeScript errors** - Type safety issues
4. **Remove unused variables** - Clean up dead code
5. **Fix React Hook warnings** - Dependency arrays and effect usage
6. **Fix accessibility warnings** - Next.js Image usage, escaped entities, etc.
7. **Remove `any` types** - Replace with proper TypeScript types
8. **Fix import issues** - Unused imports, missing dependencies

## Process

### Step 1: Run TypeScript Check
```bash
npm run typecheck
```

**Fix all TypeScript errors:**
- Replace `any` with proper types
- Add missing type definitions
- Fix type mismatches
- Add proper function return types
- Fix generic type parameters

### Step 2: Run ESLint
```bash
npm run lint
```

**Fix all ESLint errors and warnings:**
- Remove unused variables and imports
- Fix React Hook dependency arrays
- Fix `useEffect` usage
- Replace `<img>` with Next.js `<Image>`
- Fix escaped entities in JSX
- Fix `no-explicit-any` violations
- Fix `@typescript-eslint/no-unused-vars` violations
- Fix `react-hooks/exhaustive-deps` violations

### Step 3: Verify Clean Status
```bash
npm run typecheck && npm run lint
```

Both commands should exit with code 0 and show:
- TypeScript: "Found 0 errors"
- ESLint: No errors or warnings

## Common Fixes

### Unused Variables
```typescript
// ❌ Before
const [unused, setUnused] = useState(0);

// ✅ After - Remove or prefix with underscore
const [_unused, setUnused] = useState(0);
// Or remove entirely if truly unused
```

### Any Types
```typescript
// ❌ Before
function process(data: any) { }

// ✅ After
function process(data: Record<string, unknown>) { }
// Or better: define proper interface
interface Data {
  id: string;
  value: number;
}
function process(data: Data) { }
```

### React Hook Dependencies
```typescript
// ❌ Before
useEffect(() => {
  doSomething(value);
}, []); // Missing 'value' dependency

// ✅ After
useEffect(() => {
  doSomething(value);
}, [value]);

// Or if intentional, use comment:
useEffect(() => {
  doSomething(value);
  // eslint-disable-next-line react-hooks/exhaustive-deps
}, []);
```

### Next.js Image
```typescript
// ❌ Before
<img src="/logo.png" alt="Logo" />

// ✅ After
import Image from 'next/image';
<Image src="/logo.png" alt="Logo" width={100} height={100} />
```

### Escaped Entities
```typescript
// ❌ Before
<div>Don't use quotes</div>

// ✅ After
<div>Don&apos;t use quotes</div>
// Or use template literals
<div>{`Don't use quotes`}</div>
```

## Rules

1. **Fix ALL errors and warnings** - No exceptions
2. **Do not skip files** - Clean the entire project
3. **Do not use `@ts-ignore` or `eslint-disable`** unless absolutely necessary
4. **Prefer proper fixes over suppressions**
5. **Test after fixes** - Ensure nothing breaks
6. **Do not modify functionality** - Only fix code quality issues

## Success Criteria

✅ `npm run typecheck` exits with code 0 and "Found 0 errors"
✅ `npm run lint` exits with code 0 with no errors or warnings
✅ All files can be built without warnings
✅ No `any` types remain (except in type definitions where necessary)
✅ All imports are used
✅ All React Hooks have correct dependencies

## Execution

Run the clean script:
```bash
npm run clean
```

This will:
1. Run TypeScript type checking
2. Run ESLint with auto-fix
3. Report remaining issues
4. Guide you through manual fixes if needed