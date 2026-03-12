---
description: Scrape all Claude sessions and categorize usage patterns into skills, plugins, agents, and claude.md recommendations
model: opus
---

You are auditing all of my Claude Code usage history to find patterns and recommend what's worth turning into reusable automations.

## Step 1: Read the session history

Read `~/.claude/history.jsonl` — each line is JSON with `display` (what I typed), `timestamp`, and `project` fields. Read the entire file.

## Step 2: Analyze and categorize

Go through every prompt I've sent and identify:

1. **Repeated tasks** — things I ask for frequently (even if worded differently)
2. **Project patterns** — common workflows per project
3. **One-off vs recurring** — separate things I did once from things I keep doing
4. **Complexity levels** — simple commands vs multi-step workflows

## Step 3: Produce the report

Give me a structured breakdown with these sections:

### What I use Claude Code for
Top categories of usage, ranked by frequency. Include example prompts for each.

### Recommendations

For each repeated pattern, recommend the best automation type:

**Skills** (`.claude/skills/`) — Best for: complex, multi-step workflows that need detailed instructions, specific methodologies, or domain expertise. Skills are loaded on-demand when relevant.
- What pattern it automates
- Why a skill is the right fit
- Suggested skill name

**Commands** (`.claude/commands/`) — Best for: simple, user-triggered actions with optional arguments. Things I'd invoke explicitly like `/command-name`.
- What pattern it automates
- Why a command is the right fit
- Suggested command name and arguments

**Hooks** (`.claude/settings.json` hooks) — Best for: automatic actions that should run on every tool call, notification, or lifecycle event without me asking. Things like auto-formatting, pre-commit checks, notifications.
- What pattern it automates
- Why a hook is the right fit
- Suggested hook trigger and script

**CLAUDE.md additions** — Best for: persistent context, preferences, or instructions that should always be active. Things I keep repeating that Claude should just know.
- What I keep saying
- Suggested CLAUDE.md entry

### Already automated
List things I'm already using commands/skills for effectively.

### Not worth automating
Things that appear repeated but are too context-dependent to automate well.

Be specific with examples from my actual history. Quote my prompts where relevant.
