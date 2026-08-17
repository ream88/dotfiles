---
name: commit
description: Use when the user asks to commit changes, asks for a commit message, mentions the commit workflow from ~/.dotfiles, or says "use the commit skill". Produces a short imperative subject focused on impact, under 50 characters, with no trailing period. If multiple plausible descriptions exist, present up to 3 options before committing.
---

Commit the tracked changes. Keep the commit subject short and concise, and follow the provided rules. Include only co-authoring information; add no other description.

Stage only the paths you edited yourself — pass each one explicitly to `git add`. Never use `git add -A`, `git add .`, or `git commit -a`. Another session may share the checkout, so treat every other entry in `git status` as somebody else's in-flight work: leave it unstaged, and say what you left out.

- Describe the **impact** (what the user/system gains), not how it was implemented
  - Good: "Allow switching accounts in iOS app"
  - Bad: "Use ephemeral web auth session for sign-in"
  - Good: "Fix status bar color mismatch on iOS 26"
  - Bad: "Fix iOS 26 Safari theme-color and body backgrounds"
- Limit the answer to 50 characters
- Capitalize first word of the answer
- Keep the other capitalization as is
- Do not end the answer with a period
- Use the imperative mood in the answer
- Don't wrap the answer in quotes

If the changes could reasonably be described in more than one way (e.g. different angles: impact vs. scope, user-facing vs. technical), present up to 3 numbered commit message options and ask the user to pick one before committing. If the changes are straightforward and only one message makes sense, commit directly without asking.
