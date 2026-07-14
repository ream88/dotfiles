---
name: tidy
description: Analyze all unpushed commits on the current branch and propose which ones belong together and should be squashed into the same commit. Use when the user says "tidy", "tidy commits", "which commits belong together", "clean up my commits", or "squash plan" before pushing.
---

# Tidy

Go through every commit on the checked-out branch that is not yet pushed to
its upstream and think hard (ultrathink) about which of them are logically
related and should probably have been the same commit in the first place.

## Scope

- Only unpushed commits: `git log @{upstream}..HEAD` (fall back to the
  branch's merge-base with the default branch if no upstream is set).
- If there are no unpushed commits, say so and stop.
- Never touch pushed commits — they are immutable.

## Procedure

1. List the unpushed commits: `git log --oneline @{upstream}..HEAD`.
2. For each commit inspect subject, body, and the files/hunks it touches
   (`git show --stat`, and the actual diff when the stat is ambiguous).
3. Reason deeply about relatedness. Signals that two commits belong together:
   - One is a fixup/typo/formatting/review-feedback pass on the other.
   - They touch the same feature across layers (schema + context + LiveView
     + test for the same behavior).
   - A later commit is only needed because of an earlier one (compile fix,
     test fix, forgotten file).
   - The mirrored change in a sibling app (e.g. platform_web + verify_web
     versions of the same feature) — mirror pairs usually belong together.
   Signals they should stay separate: independent features, refactor vs.
   behavior change, deliberate stepping stones the history should show.
4. Output a grouping plan: each group with its member commits (SHA + subject),
   a one-line reason, and a proposed subject for the combined commit. List
   commits that should stay standalone too.
5. Do NOT rebase. Present the plan and wait; only perform the interactive
   rebase/squash if the user approves. When squashing, follow the [commit
   skill](../commit/SKILL.md) rules for the new subjects.
