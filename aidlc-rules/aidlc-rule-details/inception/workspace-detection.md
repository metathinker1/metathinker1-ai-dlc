# Workspace Detection

**Purpose**: Determine workspace state and check for existing AI-DLC projects

**Prerequisite**: Project Initialization must be complete. The target project path and Google Drive file hierarchy are already established.

## Step 1: Check for Existing AI-DLC Project

Check if an `aidlc-state` Google Drive file exists under the current feature request file (~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → `<project-name>` → `<feature-request-name>` → `aidlc-state`):
- **If exists**: Resume from last phase (load context from previous phases)
- **If not exists**: Continue with new project assessment

## Step 2: Scan Target Project for Existing Code

**Use the target project path (from Project Initialization) to determine if it has existing code:**
- Scan the **target project path** for source code files (.java, .py, .js, .ts, .jsx, .tsx, .kt, .kts, .scala, .groovy, .go, .rs, .rb, .php, .c, .h, .cpp, .hpp, .cc, .cs, .fs, etc.)
- Check for build files (pom.xml, package.json, build.gradle, etc.)
- Look for project structure indicators
- The workspace root for code analysis is the **target project path** (NOT the AI-DLC workspace)

**Record findings:**
```markdown
## Workspace State
- **Existing Code**: [Yes/No]
- **Programming Languages**: [List if found]
- **Build System**: [Maven/Gradle/npm/etc. if found]
- **Project Structure**: [Monolith/Microservices/Library/Empty]
- **Target Project Root**: [Resolved target project path]
- **AI-DLC Google Drive**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → [project-name] → [feature-request-name]
```

## Step 3: Determine Next Phase

**IF target project is empty (no existing code)**:
- Set flag: `brownfield = false`
- Next phase: Requirements Analysis

**IF target project has existing code**:
- Set flag: `brownfield = true`
- Check for existing reverse engineering artifacts in Google Drive (~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → `<project-name>` → `<feature-request-name>` → Inception)
- **IF reverse engineering artifacts exist**:
    - Check if artifacts are stale (compare artifact timestamps against codebase's last significant modification)
    - **IF artifacts are current**: Load them, skip to Requirements Analysis
    - **IF artifacts are stale**: Next phase is Reverse Engineering (rerun to refresh artifacts)
    - **IF user explicitly requests rerun**: Next phase is Reverse Engineering regardless of staleness
- **IF no reverse engineering artifacts**: Next phase is Reverse Engineering

## Step 4: Create Initial State File

Create the `aidlc-state` Google Drive file under the feature request directory with the following content:

```markdown
# AI-DLC State Tracking

## Project Information
- **Project Type**: [Greenfield/Brownfield]
- **Project Name**: [project-name]
- **Feature Request Name**: [feature-request-name]
- **Target Project Path**: [resolved target project path]
- **AI-DLC Google Drive**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → [project-name] → [feature-request-name]
- **Start Date**: [ISO timestamp]
- **Current Stage**: INCEPTION - Workspace Detection

## Workspace State
- **Existing Code**: [Yes/No]
- **Reverse Engineering Needed**: [Yes/No]
- **Target Project Root**: [Resolved target project path]

## Code Location Rules
- **Application Code**: Target project path (NEVER in Google Drive)
- **ALL AI-DLC Artifacts**: Google Drive ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → <project-name> → <feature-request-name>
- **Structure patterns**: See code-generation.md Critical Rules

## Stage Progress
[Will be populated as workflow progresses]
```

## Step 5: Present Completion Message

**For Brownfield Projects:**
```markdown
# 🔍 Workspace Detection Complete

Workspace analysis findings:
• **Project Type**: Brownfield project
• [AI-generated summary of workspace findings in bullet points]
• **Next Step**: Proceeding to **Reverse Engineering** to analyze existing codebase...
```

**For Greenfield Projects:**
```markdown
# 🔍 Workspace Detection Complete

Workspace analysis findings:
• **Project Type**: Greenfield project
• **Next Step**: Proceeding to **Requirements Analysis**...
```

## Step 6: Automatically Proceed

- **No user approval required** - this is informational only
- Automatically proceed to next phase:
  - **Brownfield**: Reverse Engineering (if no existing artifacts) or Requirements Analysis (if artifacts exist)
  - **Greenfield**: Requirements Analysis
