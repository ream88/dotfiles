# Critic: Ruthless Code Review Skill

A brutally honest code reviewer that questions every single line change with an unwavering commitment to simplicity and the elimination of unnecessary complexity.

## What is this?

This skill makes Claude into an extremely critical code reviewer who:
- Questions EVERY line change
- Has zero tolerance for over-engineering
- Ruthlessly enforces KISS (Keep It Simple, Stupid)
- Aggressively pursues DRY (Don't Repeat Yourself)
- Calls out unnecessary complexity, premature abstractions, and code bloat
- Defaults to "NO" - every change must justify its existence

## When to use

Use this skill when you want to:
- Review code changes before committing
- Get honest feedback on whether changes are actually necessary
- Ensure you're not over-engineering a solution
- Check for code duplication and violations of DRY
- Get called out for adding unnecessary complexity
- Validate that your "clever" code is actually a good idea
- Make sure you're building exactly what's needed, not what might be needed later

## How to use

### Basic usage

```bash
claude /critic
```

The skill will automatically detect git changes and review them.

### Review specific changes

Review staged changes:
```bash
git add .
claude /critic
```

Review a specific commit:
```bash
claude /critic --args="<commit-sha>"
```

Review changes between branches:
```bash
claude /critic --args="main...feature-branch"
```

## What you'll get

A brutally honest review that includes:

1. **Line-by-line analysis** of every change
   - 🔴 BLOCKER: Must be fixed
   - 🟡 WARNING: Should be reconsidered
   - 🟢 NITPICK: Minor suggestion

2. **Pattern detection**
   - Over-engineering instances
   - DRY violations (code duplication)
   - KISS violations (unnecessary complexity)
   - Unnecessary changes that don't serve the goal

3. **Specific questions** about each questionable change:
   - "Why does this exist?"
   - "Is this really needed?"
   - "Could we use existing code instead?"
   - "Why not just do it the simple way?"

4. **Summary stats**
   - Total lines changed
   - Actually necessary changes
   - Changes that could be removed
   - Changes that should be simplified

5. **Final recommendation**: APPROVE / REQUEST CHANGES / REJECT

## Philosophy

This skill embodies these principles:

### KISS (Keep It Simple, Stupid)
- Simpler is ALWAYS better
- 3 lines beats 10 lines
- Readable beats clever
- Direct beats abstracted

### DRY (Don't Repeat Yourself)
- Duplicate code is unacceptable
- Extract common patterns
- But don't abstract prematurely

### YAGNI (You Aren't Gonna Need It)
- No features "for the future"
- No configuration "just in case"
- Build exactly what's needed NOW

### Default to NO
- Every line must JUSTIFY its existence
- Burden of proof is on the code
- If deleting it wouldn't break anything, DELETE IT
- If it could be simpler, SIMPLIFY IT

## What it catches

**Over-Engineering:**
- Factory patterns for single implementations
- Strategy patterns with one strategy
- Generic/abstract classes with one concrete implementation
- Configuration systems for hardcoded values

**Unnecessary Complexity:**
- Nested ternaries instead of if/else
- Deep method chains (5+ levels)
- Regex when string methods suffice
- Libraries for simple operations

**Breaking DRY:**
- Copy-pasted functions
- Duplicate validation logic
- Repeated string literals
- Duplicate error handling

**Breaking KISS:**
- 50-line functions that could be 10
- Classes when functions suffice
- Deep inheritance hierarchies (3+ levels)
- "Clever" one-liners that obscure intent

**Unnecessary Changes:**
- Reformatting unrelated code
- Renaming for "consistency"
- Comments that repeat the code
- Performance optimizations without measurements

## Examples

### Before running /critic

```typescript
// Added a factory pattern "for flexibility"
export class UserServiceFactory {
  static create(): IUserService {
    return new UserService();
  }
}

// Added generic error handler "for consistency"
export class ErrorHandler<T extends Error> {
  handle(error: T): void {
    console.error(error.message);
  }
}

// Added config "for future use"
export const CONFIG = {
  maxRetries: 3,
  timeout: 5000,
  enableFeatureX: false,
  enableFeatureY: false,
  enableFeatureZ: false,
};
```

### After /critic review

```
🔴 BLOCKER: Factory pattern for single implementation
- Only ONE UserService exists
- Factory adds zero value
- Delete this class entirely

🔴 BLOCKER: Generic error handler that just wraps console.error
- This is literally: error => console.error(error.message)
- Use console.error directly
- Delete this class

🟡 WARNING: Config options that aren't used
- Features X, Y, Z don't exist in codebase
- maxRetries not used anywhere
- timeout not used anywhere
- Delete everything except what's actually used

Recommendation: REJECT
Remove 90% of these changes. Build what you need TODAY.
```

## Tips

1. **Run it early and often** - Before you get attached to your "clever" solution
2. **Don't get defensive** - The skill is brutal because code bloat is a real problem
3. **Question your abstractions** - If the skill calls out a pattern, really think about whether you need it
4. **Embrace simplicity** - The simplest solution is usually the right one
5. **Delete liberally** - The best code is code you don't write

## Warning

This skill is INTENTIONALLY harsh. It will:
- Question your design decisions
- Call out unnecessary complexity
- Challenge "best practices" that add no value
- Default to assuming changes are unnecessary

If you want gentle, encouraging feedback, this is NOT the skill for you.

If you want honest, brutal truth that will make you a better engineer, welcome aboard.

## Version

1.0.0 - Initial release
