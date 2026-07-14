---
name: google-drive-management
description: Create and manage AI-DLC artifact files on Google Drive. Use for directory hierarchy setup, artifact storage, and audit logging.
---

# Google Drive Management

## Context

- **Google Drive AI-DLC artifact root directory**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC

## Operations

### Create Project Hierarchy

Given a project name and feature request name, create the full directory hierarchy:

1. Check if `<project-name>` directory exists under AI-DLC Docs directory root
   - If not, create it
2. Create `YYYY-MM-DD-<feature-request-name>` under the project directory
3. Create sub directories under the feature directory:
   - `aidlc-state`
   - `audit`
   - `Inception`
   - `Design`
   - `Construction`
   - `Quality Assurance`

### Store Artifact

Create or update a markdown file with AI-DLC artifact content:
- Create the markdown file for new artifacts
- Update existing markdown file for updates (read existing content first, append — NEVER overwrite)

### Audit Logging

Append entries to the `audit` file:
1. Read existing content from the markdown file
2. Append new entries to the file
3. NEVER overwrite — always preserve existing content

Format:
```markdown
## [Stage Name]
**Timestamp**: [YYYY-MM-DDTHH:MM:SSZ]
**User Input**: "[exact raw input]"
**AI Response**: "[action taken]"
**Context**: [stage/decision]
---
```

### Update State

Update the `aidlc-state` file with workflow progress:
- Mark completed stages
- Record skipped stages with reasons
- Track current position in workflow

## ⛔ Safety Rules

- **NEVER delete** any Google drive files, comments, or attachments
- **NEVER overwrite** existing file content — always read first, then append
- **NEVER modify** existing file without explicit user confirmation (except `audit` and `aidlc-state` which are updated programmatically)

