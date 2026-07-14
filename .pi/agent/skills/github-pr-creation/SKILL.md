---
name: github-pr-creation
description: Create branches and pull requests via gh CLI across primary and secondary projects.
---

# GitHub PR Creation

## Process

For each project (primary first, then secondary):

1. Navigate to the project directory
2. Create and push the branch:
   ```bash
   git checkout -b <issueId>-<story_name>
   git push -u origin <issueId>-<story_name>
   ```

## Naming Conventions

- **Branch**: `<issueID>-<story_name>` (e.g., `AVBLTY-2031-classify-errors-add-resiliency`)
  - issueId is the Git issue key (e.g., `AVBLTY-2031`)
  - story_name is a kebab-case short description (e.g., `classify-errors-add-resiliency`)
  - **ALWAYS** use this exact format: `{GITHUB_KEY}-{kebab-case-description}`
- **PR title**: `<issueID> <story_name>` (e.g., `AVBLTY-2031 classify-errors-add-resiliency`)

## PR Description

The PR description MUST include a summary of what was implemented. Structure it as:

```markdown
## Summary
Brief overview of the feature/fix implemented.

## Changes
- List of key changes made (files, components, logic)

## Testing
- How the changes were tested (unit tests, manual verification)

## Git Issue
[<issueId>](https:https://github.com/metathinker1/metathinker1-ai-dlc/issues/<issueId>)
```

Generate the description from the AI-DLC workflow context:
- **Summary**: From the Requirements/User Stories
- **Changes**: From the Code Generation plan and implemented files
- **Testing**: From the Build and Test stage results
- **Git Issue**: Link to the linked story

## ⛔ Safety Rules

- **NEVER push directly to main/master**
- **NEVER use force push** (`git push --force-with-lease`) without explicit user confirmation
- **NEVER use destructive git operations** (`git reset --hard`, `git clean -f`, `branch -D`)
- **NEVER amend pushed commits** — only amend your own unpushed commits when explicitly asked
- **ALWAYS use `-u` flag** when pushing a new branch to set up remote tracking
- **ALWAYS confirm with user** before creating a PR to verify branch, title, and description are correct
- **NEVER skip pre-commit hooks** (`--no-verify`) unless the user explicitly asks

