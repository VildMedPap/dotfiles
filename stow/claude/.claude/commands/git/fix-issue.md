---
argument-hint: [issue number]
description: Fix issue.
---

Fetch issues number $ARGUMENTS and slowly but steady begin to solve the issue:

1. **Read and Analyze the Issue**:
   - Extract the issue title, description, and any relevant comments
   - Identify the core problem that needs solving
   - Note any acceptance criteria or specific requirements
   - Recognize what type of issue this is (bug fix, feature request, improvement, etc.)

2. **Create an Appropriate Branch Name**:
   - Follow the pattern: `<type>/<issue-number>-<brief-description>`
   - Types: `fix` for bugs, `feat` for features, `refactor` for code improvements, `docs` for documentation
   - Example: `fix/42-authentication-timeout` or `feat/156-add-user-preferences`
   - Keep descriptions concise (2-4 words max) and use kebab-case

3. **Plan the Solution**:
   - Break down the fix into clear, minimal steps
   - Identify which files need modification (prefer editing existing files over creating new ones)
   - Consider edge cases but don't over-anticipate unlikely scenarios
   - Choose the simplest approach that correctly solves the problem
   - Explicitly reject any solution that adds unnecessary abstraction layers or premature optimization

4. **Implement the Fix**:
   - Write clean, readable code that directly addresses the issue
   - Add comments only where the intent isn't immediately clear
   - Ensure your changes are focused and don't introduce unrelated modifications
   - Test your logic mentally - ensure it handles the reported issue without breaking existing functionality
   - Follow existing code patterns in the project
   - Make the minimal necessary changes to resolve the issue

**Decision Framework**:
- When choosing between solutions, always prefer the one with fewer moving parts
- If a simple 5-line fix works, don't implement a 50-line "extensible" solution
- Avoid creating new abstractions unless they significantly simplify the codebase
- Don't add features or improvements beyond what the issue specifically requests
- If the issue description is vague, implement the most likely interpretation and note any assumptions

**Quality Checks**:
- Before implementing, ask yourself: "Is this the simplest correct solution?"
- After implementing, verify: "Does this directly fix the reported issue without side effects?"
- Ensure your code is self-documenting through clear naming and structure

**Output Format**:
1. First, summarize your understanding of the issue
2. Present your branch name
3. Outline your solution plan with numbered steps
4. Implement the changes, explaining any non-obvious decisions
5. Provide a brief summary of what was changed and why
6. DO NOT commit anything

If you encounter ambiguity in the issue description, state your interpretation clearly and proceed with the most reasonable assumption. Never implement speculative features or "nice-to-haves" that weren't explicitly requested.

Remember: Good code is not clever code. Good code is simple, clear, and solves the problem at hand without creating new ones.
