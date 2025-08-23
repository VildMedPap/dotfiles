---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git push:*)
argument-hint: [additional instructions]
description: Commit changes.
model: claude-sonnet-4-0
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

1. **Analyze Changes**: Based on the context provided
2. **Group Related Changes**: Identify which files and changes belong together logically
3. **Create Atomic Commits**: Each commit should represent one logical change that could be reverted independently
4. **Write Compliant Messages**: Follow the project's commit message template exactly

## Commit Message Template Rules

You MUST follow this exact format for every commit message:

```
[type]: [subject]

[optional body]

[optional footer]
```

### Type Selection
Choose the most appropriate type:
- `feat`: New feature for users (not build scripts)
- `fix`: Bug fix for users (not build scripts)
- `refactor`: Refactoring production code
- `chore`: No production code change
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `perf`: Performance improvements
- `vendor`: Dependency updates
- `test`: Test additions or refactoring
- `cicd`: CI/CD configuration changes

### Message Rules
1. Subject line: max 50 characters, no capitalization, no period
2. Use imperative mood ("add" not "adds" or "added")
3. Subject should complete: "If applied, this commit will [your subject]"
4. Separate subject from body with blank line
5. Body: explain what and why, not how (wrap at 50 chars, max 72)
6. Body is optional but recommended for complex changes

## Workflow

1. **Initial Analysis**:
   - Run `git status` to see all changed files
   - Run `git diff` for unstaged changes
   - Run `git diff --cached` for staged changes
   - Identify the nature of each change

2. **Change Grouping Strategy**:
   - Group by feature/functionality (all files for one feature)
   - Group by type (all documentation updates together)
   - Group by module/component (related files in same area)
   - Never mix unrelated changes in one commit

3. **Commit Creation Process**:
   - For each logical group:
     a. Stage only the relevant files: `git add [files]`
     b. Craft appropriate commit message
     c. Create commit: `git commit -m "message"`
   - Verify each commit before moving to the next

4. **Quality Checks**:
   - Ensure no commit is too large (prefer smaller, focused commits)
   - Verify commit messages follow the template
   - Confirm all changes are committed

## Decision Framework

When deciding how to group changes:
- If changes are interdependent (one requires the other), commit together
- If changes serve different purposes, commit separately
- If unsure, err on the side of smaller, more atomic commits
- Documentation updates about a feature can go with the feature commit
- Style/formatting changes should be separate unless minimal

## Example Commit Messages

```
feat: add user authentication endpoint

Implement POST /auth/login endpoint with JWT token
generation. Includes input validation and rate limiting.
```

```
fix: resolve memory leak in data processor
```

```
refactor: extract validation logic to separate module

Move all validation functions from controllers to a
dedicated validation module for better reusability.
```

## Error Handling

- If conflicts exist, alert the user before proceeding
- If uncommitted changes include generated files, ask whether to include them
- If a file has both feature and fix changes, prefer splitting if possible
- If unable to determine change type, analyze the code more carefully or ask for clarification

## Output Format

After completing all commits, provide a summary:
1. List each commit made with its hash and message
2. Summarize what was accomplished
3. Note any files that were not committed and why
4. Suggest any follow-up actions if needed

You will execute git commands directly to accomplish your task. Be thorough in your analysis but efficient in your execution. Your goal is to create a clean, understandable commit history that future developers will appreciate.

## Additional instructions
- IMPORTANT do not push anything!
$ARGUMENTS
