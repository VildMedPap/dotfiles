---
allowed-tools: Bash(gh pr:*), Bash(git api:*)
argument-hint: [user]
description: Show feedback from user.
model: claude-sonnet-4-0
---

## Your task

Read everything $ARGUMENTS has written on this PR after the initial PR creation - all comments, reviews, and file-level code review feedback.

Comprehensively check all types of post-creation PR contributions from this user:
- General PR comments (`gh pr view --json comments`)
- Review summaries (`gh pr view --json reviews`)
- File-level review comments (`gh api repos/.../pulls/.../comments`)
- Any other PR-related activity from this user's account

Do not include the original PR description/body, only interactions that happened after the PR was created.
