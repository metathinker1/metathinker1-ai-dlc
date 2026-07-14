# Documentation

## Purpose
Generate technical and user-facing documentation for the completed feature.

- **Technical docs** → stored under the application-specific directory in **Google Drive Technical Docs directory** (~/Google Drive/My Drive/SoftwareDevProjects/TechnicalDocs), not AI-DLC Docs folder.
- **User-facing docs** → stored under the application-specific directory in **Google Drive User Docs directory** (~/Google Drive/My Drive/SoftwareDevProjects/UserDocs), also not AI-DLC Docs folder.

## Prerequisites
- Quality Assurance phase complete (Build and Test, QA Testing Plan, Test Samples all approved)

## Step 1: Suggest Documentation Generation

After the Quality Assurance phase completes, present the user with the option to generate documentation:

```markdown
# 📝 Documentation Phase (Optional)

The Quality Assurance phase is complete. Would you like to generate documentation for this feature?

A) **Yes — Technical documentation only** (architecture, API references, data models, sequence diagrams)
B) **Yes — User-facing documentation only** (feature guides, usage instructions, configuration reference)
C) **Yes — Both technical and user-facing documentation**
D) **No — Skip documentation and complete the workflow**

[Answer]:
```

**If user selects D**: Skip the Documentation phase entirely, mark workflow as complete, and log in audit.

## Step 2: Identify Target Stack Directory

1. Resolve the stack/project name from the primary project path
2. Check if a file for this stack exists under **Google Drive Technical Docs directory** 
   - If not, create it 
3. All **technical** documentation files will be created under: `TechnicalDocs → <application-name>`

## Step 3: Generate Technical Documentation (if selected)

Create Google Drive files under `Technical Docs → <application-name>` covering applicable topics:

| Document | When to Include |
|----------|-----------------|
| Architecture Overview | New components, service interactions, or significant architectural changes |
| API Reference | New or modified API endpoints |
| Data Models | New or modified database schemas, event schemas, message formats |
| Sequence Diagrams | Complex multi-service flows or async workflows |
| Configuration Reference | New environment variables, feature flags, or config files |
| Deployment Guide | New infrastructure, deployment steps, or environment setup |
| Runbook / Troubleshooting | Operational concerns, common failure modes, recovery steps |

**Guidelines:**
- Use Mermaid diagrams for architecture and sequence diagrams (validate syntax before writing)
- Reference existing documentation and link to related files rather than duplicating content
- Include concrete examples (sample requests/responses, config snippets)
- Keep language concise and targeted at engineers operating the service

## Step 4: Generate User-Facing Documentation (if selected)

Create Documentation files under **Google Drive User Docs directory** at the root level, covering applicable topics:

| Document | When to Include |
|----------|-----------------|
| Feature Guide | New user-visible capabilities or workflows |
| Usage Instructions | How to use the feature (step-by-step) |
| FAQ | Common questions anticipated from users or stakeholders |
| Changelog Entry | Summary of what changed and why, suitable for stakeholder communication |

**Guidelines:**
- Write for the target audience (engineers consuming the service, stakeholders, or end users)
- Include screenshots or output examples where helpful
- Link to the technical docs for deeper detail

## Step 5: Present for Approval

```markdown
# 📝 Documentation Complete

[AI-generated summary: X files created]

> **📋 REVIEW REQUIRED:**
> Please review the generated documentation:
> - **Technical Docs**: Technical Docs → <application-name> → [file names] (if applicable)
> - **User Docs**: User Docs → [file names] (if applicable)
>
> **You may:**
> 🔧 **Request Changes** — Modify content, add missing sections, or adjust structure
> ✅ **Approve & Complete** — Documentation accepted, workflow finished
```

**DO NOT proceed until user explicitly approves.**

## Step 6: Log and Update State
- Log approval in the `audit` Google Drive file
- Mark Documentation complete in the `aidlc-state` Google Drive file
