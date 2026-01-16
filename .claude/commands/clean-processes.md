# Clean Processes Command

Kill orphaned test processes (vitest, jest) that may be consuming system resources.

## Usage

```
/clean-processes
```

## Process

### 1. Check for orphaned processes

```bash
# Check for vitest processes
ps aux | grep -i vitest | grep -v grep | wc -l

# Check for jest processes
ps aux | grep -i jest | grep -v grep | wc -l
```

### 2. Kill orphaned test runners

```bash
# Kill vitest workers
pkill -f vitest 2>/dev/null || true

# Kill jest workers (if present)
pkill -f jest 2>/dev/null || true
```

### 3. Verify cleanup

```bash
# Confirm processes are gone
ps aux | grep -E "(vitest|jest)" | grep -v grep | wc -l
```

## When to Use

- System feels sluggish during development
- Memory or CPU usage is high
- Test runs were interrupted (Ctrl+C, crash, etc.)
- Before starting a new test session
- At the end of any coding session

## Notes

- Safe to run anytime - won't affect anything if no processes exist
- Vitest uses worker processes that can persist after interrupted test runs
- Watch mode (`--watch`) spawns persistent processes that survive test completion
