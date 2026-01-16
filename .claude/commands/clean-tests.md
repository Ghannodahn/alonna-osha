# Clean Tests Command

Fix ALL test errors with careful analysis to ensure tests encode correct behavior.

## Usage

```
/clean-tests
```

## Process

### Phase 1: Discovery & Analysis

1. **Run tests to identify failures**
   ```bash
   cd client-web && npm run test
   ```

2. **For EACH failing test, perform detailed research:**
   - Read the component/utility being tested
   - Read the test file to understand what behavior is being validated
   - Identify the root cause: is this a test bug or component bug?
   - Document findings in `.todd/tasks/test-cleanup/`

3. **Create test cleanup effort folder** (if not exists):
   ```
   .todd/tasks/test-cleanup/
   ├── README.md       # Design overview of test cleanup effort
   ├── issues.md       # Catalog of test issues found
   └── tasks.md        # Implementation tasks
   ```

### Phase 2: Categorization

Categorize each failing test into one of these categories in `issues.md`:

**Category A: Clear Test Bug** - Test expectations are wrong
- Example: Test expects `'function'` but component correctly returns `'string'`
- Action: Fix test expectations

**Category B: Clear Component Bug** - Component behavior is wrong
- Example: Component missing required functionality that test validates
- Action: Fix component implementation

**Category C: Unclear/Ambiguous** - Cannot determine correct behavior
- Example: Test and component disagree, no clear documentation
- Action: **FLAG FOR REVIEW** - Document question, skip for now, continue to next test

**Category D: Breaking Change** - Component API changed, test outdated
- Example: Component now requires different prop format
- Action: Update test to match new API (document change in issues.md)

### Phase 3: Planning

In `.todd/tasks/test-cleanup/tasks.md`, create tasks for:

1. **Task: Fix Category A Issues (Test Bugs)**
   - List each test that needs expectation fixes
   - Acceptance criteria: Test passes with correct expectations

2. **Task: Fix Category B Issues (Component Bugs)**
   - List each component that needs implementation fixes
   - Acceptance criteria: Component works correctly, test passes

3. **Task: Document Category C Issues (Flagged for Review)**
   - List ambiguous cases
   - Acceptance criteria: Questions documented, awaiting clarification

4. **Task: Update Category D Issues (API Changes)**
   - List tests needing updates for API changes
   - Acceptance criteria: Tests updated to match current component API

### Phase 4: Execution

Execute tasks in this order:

1. **Start with Category A** (safest - just fixing test expectations)
2. **Then Category D** (updating tests for known API changes)
3. **Then Category B** (fixing actual component bugs)
4. **Skip Category C** (flagged for review)

For each fix:
- Update the component or test file
- Re-run tests to verify fix
- Mark task as completed in `tasks.md`
- Update issue status in `issues.md`

### Phase 5: Verification

1. **Run full test suite:**
   ```bash
   cd client-web && npm run test
   ```

2. **Verify results:**
   - All Category A, B, D tests should pass
   - Category C tests still fail (expected - flagged for review)
   - Document final status in `README.md`

## Research Guidelines

**CRITICAL**: Before fixing ANY test, you MUST:

1. **Read the component source code** to understand current behavior
2. **Read the test code** to understand what's being validated
3. **Check for documentation** (README.md files) explaining intended behavior
4. **Look for recent changes** (git log) that might explain discrepancies
5. **Verify your understanding** by checking related tests or examples

**If there is ANY doubt about correct behavior:**
- Do NOT guess
- Do NOT assume test is correct
- Do NOT assume component is correct
- **FLAG IT** as Category C and move on

## Anti-Patterns to Avoid

❌ **DO NOT** fix tests to match broken components
❌ **DO NOT** change component behavior without understanding why
❌ **DO NOT** assume test expectations are always correct
❌ **DO NOT** skip documentation of your analysis
❌ **DO NOT** batch-fix without verifying each change

✅ **DO** thoroughly research each failure
✅ **DO** document your reasoning for each fix
✅ **DO** flag ambiguous cases for human review
✅ **DO** verify fixes don't break other tests
✅ **DO** update task tracking as you progress

## Output Requirements

Provide:

1. **Initial Analysis Report**
   - Total test count
   - Failed test count
   - Breakdown by category (A, B, C, D)
   - List of flagged tests requiring review

2. **Detailed Plan** (in `.todd/tasks/test-cleanup/tasks.md`)
   - Task for each category with specific items
   - Clear acceptance criteria
   - Estimated effort

3. **Execution Updates**
   - Progress after each fix
   - Test results showing improvements
   - Issues encountered

4. **Final Summary**
   - Tests fixed
   - Tests still failing (with reasons)
   - Flagged items requiring human review
   - Verification that all passing tests validate correct behavior

## Success Criteria

✅ All Category A test expectations fixed and passing
✅ All Category B component bugs fixed and tests passing
✅ All Category D tests updated for API changes and passing
✅ All Category C issues documented and flagged (may still fail)
✅ Full documentation of analysis and decisions in `.todd/tasks/test-cleanup/`
✅ No incorrect test expectations encoded
✅ `npm run test` shows maximum possible passing tests

## Notes

- **Accuracy over speed** - Take time to understand each failure
- **Documentation is mandatory** - Record your analysis
- **When in doubt, flag it** - Better to ask than encode wrong behavior
- Follow `.todd/tasks/README.md` structure for all task tracking
- This command may require multiple sessions to complete thoroughly
