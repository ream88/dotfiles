# Elixir Dependencies Update Skill

This skill provides a systematic workflow for updating Elixir project dependencies, handling both safe updates and breaking changes.

## Usage

Invoke this skill with:
```
/elixir-deps-update
```

## What it does

1. Identifies outdated dependencies using `mix hex.outdated`
2. Applies safe updates automatically
3. Handles breaking changes by:
   - Updating version constraints in `mix.exs`
   - Fetching changelogs and upgrade guides from HexDocs
   - Applying necessary code modifications
4. Verifies changes with compilation, formatting, and tests
5. Confirms all dependencies are up to date

## Requirements

- Elixir project with `mix.exs`
- Hex package manager

## Source

Original skill by [ChristianAlexander](https://gist.github.com/ChristianAlexander/838100a7a34d26c43bd829fad17c4e5d)
