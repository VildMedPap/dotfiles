---
allowed-tools: Bash(gh pr create:*), Bash(git push:*), Bash(git status:*), Bash(git log:*)
argument-hint: [target branch]
description: Create pull request for this branch with target $ARGUMENTS.
model: claude-sonnet-4-0
---

Target branch: $ARGUMENTS

## Your task

1. **Push commits**: Ensure all local work is pushed to remote (`git push`)

2. **Create a business-focused PR**:
   - **Title**: Action-oriented, clear outcome (e.g., "Enable password reset self-service")
   - **Description**: 2-3 sentences maximum focusing ONLY on:
     - Business impact in the first sentence (what improves for users/company)
     - What was done at the highest level (one sentence)
     - Issue references: "Closes #123" if applicable
   
3. **Avoid**:
   - Technical implementation details
   - Testing instructions
   - Code structure explanations
   - "How to review" sections
   - Bullet point lists

## Examples

**Good PR description:**
"Reduces customer support tickets by 20% by enabling self-service password reset. Adds forgot password flow to the login page. Closes #456"

**Good PR description:**
"Fixes checkout failures affecting 5% of mobile users, protecting $50K monthly revenue. Corrects payment validation timing issue. Closes #789"

**Good PR description:**
"Improves page load speed by 2 seconds, increasing conversion rate potential. Implements lazy loading for images and components."

Focus solely on what matters to the business. Keep it brief.