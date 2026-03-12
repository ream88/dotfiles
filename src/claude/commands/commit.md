Commit the tracked changes. Keep the commit subject short and concise, and follow the provided rules. Include only co-authoring information; add no other description.

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
