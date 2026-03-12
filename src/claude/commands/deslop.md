# Remove AI code slop

Check the diff against main, and remove all AI generated slop introduced in this branch.

This includes:
- Extra comments that a human wouldn't add or is inconsistent with the rest of the file
- Unnecessary `try/rescue` blocks that are abnormal for that area of the codebase (especially if called by trusted/validated codepaths)
- Over-defensive `nil` checks or `case`/`cond` branches for impossible states
- Overly permissive typespecs like `@spec foo(any()) :: any()` when more specific types are appropriate
- Unnecessary `@doc false` or redundant `@moduledoc` additions
- Pattern matching guards that add no value
- Wrapping code in `with` statements when a simple pipeline would suffice
- Any other style that is inconsistent with the file

Report at the end with only a 1-3 sentence summary of what you changed.
