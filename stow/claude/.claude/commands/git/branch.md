---
allowed-tools: Bash(git switch --create:*)
description: Create branch and switch based on changes.
model: claude-sonnet-4-0
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Task

1. Create a new branch that accurately reflects the changes described above.

2. Name the Branch Properly
   - Use the format: `<type>/<short-description>`
   - Allowed types:
     - `fix` --> bug fixes
     - `feat` --> new features
     - `refactor` --> code improvements
     - `docs` --> documentation updates
   - Examples: `fix/authentication-timeout`, `feat/add-user-preferences`
   - Keep the description short (2–4 words) and use kebab-case.
