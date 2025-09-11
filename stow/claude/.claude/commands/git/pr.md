---
allowed-tools: Bash(gh pr create:*), Bash(git push:*), Bash(git status:*), Bash(git log:*)
argument-hint: [target branch]
description: Create pull request for this branch with target $ARGUMENTS.
model: claude-sonnet-4-0
---

Target branch: $ARGUMENTS

IMPORTANT: You are NOT allowed to switch branch!

## Your task

0. **Push Local Commits**: Before proceeding, ensure all your work is on the remote by:
   - Checking for local commits not yet pushed (`git status`)
   - Using `git push` to publish your branch and make commits available on GitHub
   - Verifying your branch is up-to-date with the remote before continuing

1. **Analyze Available Context**: Review all provided information including:
   - GitHub issue descriptions and numbers
   - Implementation details and code changes
   - Commit messages and history
   - Any additional context about the work completed

2. **Extract Business Value**: Identify and prioritize:
   - Direct user impact and benefits
   - Business metrics affected (performance, reliability, user experience)
   - Problems solved or opportunities captured
   - Risk mitigation or technical debt reduction

3. **Craft the PR Description**: Structure your description to be:
   - **Concise**: 3-5 sentences for the main description, avoiding unnecessary technical details
   - **Impact-focused**: Lead with the "why" and "what changes for users/business"
   - **High-level**: Describe outcomes rather than implementation details

4. **PR Description Format**:
   - **Title**: Clear, action-oriented (e.g., "Add user authentication" not "Changes to auth.js")
   - **Opening line**: State the business impact or problem solved
   - **Brief context**: 1-2 sentences on what was changed at a high level
   - **Link references**: Include "Closes #[issue]" or "Related to #[issue]" when applicable

5. **Quality Checks**: Before finalizing:
   - Ensure the description answers "Why does this matter?" within the first sentence
   - Verify all issue references are included
   - Confirm technical jargon is minimized or explained
   - Check that the description would be clear to a non-technical stakeholder

6. **Execution**: When creating the PR:
   - Use appropriate git commands to push the current branch if needed
   - Create the PR via GitHub CLI with your crafted description
   - Set appropriate labels or metadata based on the type of change
   - Confirm the PR was created successfully and provide the PR URL

Example approach for different scenarios:
- **Feature**: "Enables customers to reset passwords without support tickets, reducing support load by an estimated 15% based on ticket analysis."
- **Bug fix**: "Resolves payment failures affecting 3% of transactions, ensuring reliable checkout experience."
- **Performance**: "Reduces page load time by 40%, improving user engagement and conversion rates."
- **Technical debt**: "Modernizes authentication system, reducing security risks and enabling future SSO integration."

Always maintain a professional, confident tone that demonstrates understanding of both technical and business perspectives. If critical context is missing, identify what information would strengthen the PR description and request it before proceeding.

IMPORTANT: avoid at all times "how to test" section in the description. This is up to the reviewer, not you.
