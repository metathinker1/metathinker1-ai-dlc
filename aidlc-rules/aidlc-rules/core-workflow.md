# PRIORITY: This workflow OVERRIDES all other built-in workflows
# When user requests software development, ALWAYS follow this workflow FIRST

## Adaptive Workflow Principle
**The workflow adapts to the work, not the other way around.**

The AI model intelligently assesses what stages are needed based on:
1. User's stated intent and clarity
2. Existing codebase state (if any)
3. Complexity and scope of change
4. Risk and impact assessment

## MANDATORY: Rule Details Loading
**CRITICAL**: When performing any phase, you MUST read and use relevant content from rule detail files. Check these paths in order and use the first one that exists, regardless of which IDE or setup method was used:
- `.aidlc/aidlc-rules/aws-aidlc-rule-details/` (typical with AI-assisted setup, including Pi Coding Agent)
- `.aidlc-rule-details/` (typical with Cursor, Cline, Claude Code, GitHub Copilot, OpenAI Codex)
- `.kiro/aws-aidlc-rule-details/` (typical with Kiro IDE and CLI)

All subsequent rule detail file references (e.g., `common/process-overview.md`, `inception/workspace-detection.md`) are relative to whichever rule details directory was resolved above.

**Common Rules**: ALWAYS load common rules at workflow start:
- Load `common/process-overview.md` for workflow overview
- Load `common/session-continuity.md` for session resumption guidance
- Load `common/content-validation.md` for content validation requirements
- Load `common/question-format-guide.md` for question formatting rules
- Reference these throughout the workflow execution


## MANDATORY: Engineering Standards Loading (Planning Phase)
**CRITICAL**: During the Workflow Planning stage, you MUST load and consider Engineering standards stored at `engineering-strandards/`.


## MANDATORY: Content Validation
**CRITICAL**: Before creating ANY file, you MUST validate content according to `common/content-validation.md` rules:
- Validate Mermaid diagram syntax
- Escape special characters properly
- Provide text alternatives for complex visual content

## MANDATORY: Question File Format
**CRITICAL**: When asking questions at any phase, you MUST follow question format guidelines.

**See `common/question-format-guide.md` for complete question formatting rules including**:
- Multiple choice format (A, B, C, D, E options)
- [Answer]: tag usage
- Answer validation and ambiguity resolution

## MANDATORY: Custom Welcome Message
**CRITICAL**: When starting ANY software development request, you MUST display the welcome message.

**How to Display Welcome Message**:
1. Load the welcome message from `common/welcome-message.md` (in the resolved rule details directory)
2. Display the complete message to the user
3. This should only be done ONCE at the start of a new workflow
4. Do NOT load this file in subsequent interactions to save context space

# Adaptive Software Development Workflow

---

# INCEPTION PHASE

**Purpose**: Planning, requirements gathering, and architectural decisions

**Focus**: Determine WHAT to build and WHY

**Stages in INCEPTION PHASE**:
- Project Initialization (ALWAYS)
- Workspace Detection (ALWAYS)
- Reverse Engineering (CONDITIONAL - Brownfield only)
- Requirements Analysis (ALWAYS - Adaptive depth)
- User Stories (CONDITIONAL)
- Workflow Planning (ALWAYS)
- Application Design (CONDITIONAL)
- Units Generation (CONDITIONAL)

---

## Project Initialization (ALWAYS EXECUTE)

**Purpose**: Collect the target project path and feature request description from the user to establish the working context and output directory structure.

**Execution**:
1. **MANDATORY**: Ask the user for the following information:
   - **Feature request description**: A short name/description for the current feature request (used as directory name, kebab-case)
   - **Multi-project scope**: Does this feature request span multiple projects/applications?
     - **If no**: Ask for a single **Project path** (e.g., `../apm-alert-router`)
     - **If yes**: Ask the user to specify all project paths involved (e.g., `../apm-alert-router`, `../apm-incident-radar-service`), then ask **which project is the primary** (where AI-DLC artifacts will be stored)
   - **Git Issue**: Does a Git issue already exist for this feature request?
     - **If yes**: Ask for the Git issue key and store it as the linked story for this workflow
     - **If no**: Inform the user that a Git issue will be created after the Inception phase completes (with their confirmation on title, description, and story points)
2. **Validate project path(s)**:
   - Resolve each path relative to the current working directory
   - Verify each path exists and is accessible
   - Extract the project name from each path (last directory segment, e.g., `apm-alert-router`)
3. **Create Google Drive file hierarchy**:
   - **AI-DLC Docs root**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC 
   - Check if a directory for the **primary project name** exists under AI-DLC Docs root
     - If not, create it 
   - Under the project directory, create a directory named `YYYY-MM-DD-<feature-request-name>`
   - Under the feature request directory, create directories: `aidlc-state`, `audit`, `Inception`, `Design`, `Construction`, `Quality Assurance`
   - **ALL** AI-DLC artifacts are stored as Google Drive files here (including state and audit)
   - **Secondary projects** do NOT get Google Drive files — they are used for analysis, planning, and implementation only
5. **Set workspace context**:
   - **Primary Project Root**: The user-designated primary project directory path (where AI-DLC artifacts are stored)
   - **Secondary Project Root(s)**: Additional project paths (for analysis, planning, and implementation only — no artifacts stored here)
   - **AI-DLC Google Drive Root**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → `<project-name>` → `YYYY-MM-DD-<feature-request-name>`
   - **All AI-DLC artifacts** (including `aidlc-state` and `audit`) are stored exclusively in Google Drive
6. **MANDATORY**: Log project path, feature request name, and resolved paths in audit
7. **No user approval required** - automatically proceed to Workspace Detection

**Completion Message**:
```markdown
# 📁 Project Initialization Complete

• **Target Project**: [resolved-project-path]
• **Project Name**: [project-name]
• **Feature Request**: [YYYY-MM-DD-feature-request-name]
• **Google Drive Artifacts**: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC → [project-name] → [YYYY-MM-DD-feature-request-name]
• **Next Step**: Proceeding to **Workspace Detection**...
```

---

## Workspace Detection (ALWAYS EXECUTE)

1. **MANDATORY**: Log initial user request in audit with complete raw input
2. Load all steps from `inception/workspace-detection.md`
3. Execute workspace detection:
   - Check for existing aidlc-state file in Google Drive (resume if found)
   - Scan workspace for existing code
   - Determine if brownfield or greenfield
   - Check for existing reverse engineering artifacts
4. Determine next phase: Reverse Engineering (if brownfield and no artifacts) OR Requirements Analysis
5. **MANDATORY**: Log findings in audit
6. Present completion message to user (see workspace-detection.md for message formats)
7. Automatically proceed to next phase

## Reverse Engineering (CONDITIONAL - Brownfield Only)

**Execute IF**:
- Existing codebase detected
- No previous reverse engineering artifacts found

**Skip IF**:
- Greenfield project
- Previous reverse engineering artifacts exist

**Execution**:
1. **MANDATORY**: Log start of reverse engineering in audit
2. Load all steps from `inception/reverse-engineering.md`
3. Execute reverse engineering:
   - Analyze all packages and components
   - Generate a business overview of the whole system covering the business transactions
   - Generate architecture documentation
   - Generate code structure documentation
   - Generate API documentation
   - Generate component inventory
   - Generate Interaction Diagrams depicting how business transactions are implemented across components
   - Generate technology stack documentation
   - Generate dependencies documentation

4. **Wait for Explicit Approval**: Present detailed completion message (see reverse-engineering.md for message format) - DO NOT PROCEED until user confirms
5. **MANDATORY**: Log user's response in audit with complete raw input

## Requirements Analysis (ALWAYS EXECUTE - Adaptive Depth)

**Always executes** but depth varies based on request clarity and complexity:
- **Minimal**: Simple, clear request - just document intent analysis
- **Standard**: Normal complexity - gather functional and non-functional requirements
- **Comprehensive**: Complex, high-risk - detailed requirements with traceability

**Execution**:
1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `inception/requirements-analysis.md`
3. Execute requirements analysis:
   - Load reverse engineering artifacts (if brownfield)
   - Analyze user request (intent analysis)
   - Determine requirements depth needed
   - Assess current requirements
   - Ask clarifying questions (if needed)
   - Generate requirements document
4. Execute at appropriate depth (minimal/standard/comprehensive)
5. **Wait for Explicit Approval**: Follow approval format from requirements-analysis.md detailed steps - DO NOT PROCEED until user confirms
6. **MANDATORY**: Log user's response in audit with complete raw input

## User Stories, as Git Issues (CONDITIONAL)

**INTELLIGENT ASSESSMENT**: Determine if user stories add value based on user impact and complexity:

**Execute IF**: User-facing features, multiple personas, complex business requirements, cross-functional work, customer-facing API changes, or changes affecting user workflows. Default to inclusion for borderline cases.

**Skip IF**: Pure internal refactoring, simple bug fixes, infrastructure-only changes, technical debt cleanup, developer tooling, or documentation-only updates — all with zero user impact.

**Note**: If Requirements Analysis executed, Stories can reference and build upon those requirements.

**User Stories has two parts within one stage**:
1. **Part 1 - Planning**: Create story plan with questions, collect answers, analyze for ambiguities, get approval
2. **Part 2 - Generation**: Execute approved plan to generate stories and personas

**Execution**:
1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `inception/user-stories.md`
3. **MANDATORY**: Perform intelligent assessment (Step 1 in user-stories.md) to validate user stories are needed
4. Load reverse engineering artifacts (if brownfield)
5. If Requirements exist, reference them when creating stories
6. Execute at appropriate depth (minimal/standard/comprehensive)
7. **PART 1 - Planning**: Create story plan with questions, wait for user answers, analyze for ambiguities, get approval
8. **PART 2 - Generation**: Execute approved plan to generate stories and personas
9. **Wait for Explicit Approval**: Follow approval format from user-stories.md detailed steps - DO NOT PROCEED until user confirms
10. **MANDATORY**: Log user's response in audit with complete raw input

## Workflow Planning (ALWAYS EXECUTE)

1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `inception/workflow-planning.md`
3. **MANDATORY**: Load content validation rules from `common/content-validation.md`
4. **MANDATORY**: Load relevant Engineering standards from `engineering-strandards/content/` based on the task's technology stack and domain
5. Load all prior context:
   - Reverse engineering artifacts (if brownfield)
   - Intent analysis
   - Requirements (if executed)
   - User stories (if executed)
6. Execute workflow planning:
   - Determine which phases to execute
   - Determine depth level for each phase
   - Create multi-package change sequence (if brownfield)
   - Generate workflow visualization (VALIDATE Mermaid syntax before writing)
   - **Include list of applicable Ancestry standards** in the workflow plan
7. **MANDATORY**: Validate all content before file creation per content-validation.md rules
8. **Wait for Explicit Approval**: Present recommendations using language from workflow-planning.md Step 9, emphasizing user control to override recommendations - DO NOT PROCEED until user confirms
9. **MANDATORY**: Log user's response in audit with complete raw input

## Application Design (CONDITIONAL)

**Execute IF**:
- New components or services needed
- Component methods and business rules need definition
- Service layer design required
- Component dependencies need clarification

**Skip IF**:
- Changes within existing component boundaries
- No new components or methods
- Pure implementation changes

**Execution**:
1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `inception/application-design.md`
3. Load reverse engineering artifacts (if brownfield)
4. Execute at appropriate depth (minimal/standard/comprehensive)
5. **Wait for Explicit Approval**: Present detailed completion message (see application-design.md for message format) - DO NOT PROCEED until user confirms
6. **MANDATORY**: Log user's response in audit with complete raw input

## Units Generation (CONDITIONAL)

**Execute IF**:
- System needs decomposition into multiple units of work
- Multiple services or modules required
- Complex system requiring structured breakdown

**Skip IF**:
- Single simple unit
- No decomposition needed
- Straightforward single-component implementation

**Execution**:
1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `inception/units-generation.md`
3. Load reverse engineering artifacts (if brownfield)
4. Execute at appropriate depth (minimal/standard/comprehensive)
5. **Wait for Explicit Approval**: Present detailed completion message (see units-generation.md for message format) - DO NOT PROCEED until user confirms
6. **MANDATORY**: Log user's response in audit with complete raw input

---

# 🔗 GIT ISSUE (STORY) CREATION (CONDITIONAL - After Inception)

**Execute IF**: No Git issue was provided during Project Initialization

**Skip IF**: User provided an existing Git issue key during Project Initialization

**Purpose**: Create a Git issue linked to this AI-DLC workflow, with user confirmation on all details.

**Execution**:
1. Present the user with a proposed story based on Inception phase outputs (requirements, user stories, workflow plan)
2. **MANDATORY**: Ask the user to confirm or adjust the following before creating:
   - **Title**: Proposed story title (user can modify) — MUST follow naming rules from `github-issue-rules.md`: `<service-name>: <title>` format, max 7 words after prefix, clear and concise
   - **Assignee**: Ask who should be assigned (default: the person submitting the story)
3. **Wait for Explicit Approval** — DO NOT create the story until user confirms all fields
4. Create the Git issue using `createGitIssue` with confirmed details:
   - Include `AI-DLC` label via `additional_fields`
   - Set the confirmed assignee
   - **MANDATORY**: The story description MUST begin with an **Objective** section that includes the AI-DLC request name. Format:
     ```
     h2. Objective
     [AI-DLC <feature-request-name]

     <rest of the story description>
     ```
5. After creation, ask if the story should be moved to a specific state
6. Store the created issue key as the linked story for this workflow
7. **MANDATORY**: Log the created story key in audit

---

# 🔵 DESIGN PHASE

**Purpose**: Detailed technical design per unit — business logic, NFRs, and infrastructure mapping

**Focus**: Determine HOW to build it

**Stages in DESIGN PHASE**:
- Per-Unit Loop (executes for each unit):
  - Functional Design (CONDITIONAL, per-unit)
  - NFR Design (CONDITIONAL, per-unit)
  - Infrastructure Design (CONDITIONAL, per-unit)

**Note**: Each unit's design stages are completed fully before moving to the next unit's design. All units must complete the Design phase before Construction begins.

---

## Per-Unit Loop (Executes for Each Unit)

**For each unit of work, execute the following design stages in sequence:**

### Functional Design (CONDITIONAL, per-unit)

**Execute IF**:
- New data models or schemas
- Complex business logic
- Business rules need detailed design

**Skip IF**:
- Simple logic changes
- No new business logic

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `design/functional-design.md`
3. Execute functional design for this unit
4. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
5. **MANDATORY**: Log user's response in audit with complete raw input

### NFR Design (CONDITIONAL, per-unit)

**Execute IF**:
- Performance/security/scalability concerns
- Tech stack selection required
- Resilience patterns needed

**Skip IF**:
- No NFR requirements
- Tech stack already determined
- Simple CRUD with no special requirements

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `design/nfr-design.md`
3. Execute NFR design for this unit
4. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
5. **MANDATORY**: Log user's response in audit with complete raw input

### Infrastructure Design (CONDITIONAL, per-unit)

**Execute IF**:
- Infrastructure services need mapping
- Deployment architecture required
- Cloud resources need specification

**Skip IF**:
- No infrastructure changes
- Infrastructure already defined

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `design/infrastructure-design.md`
3. Execute infrastructure design for this unit
4. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
5. **MANDATORY**: Log user's response in audit with complete raw input

---

# 🟢 CONSTRUCTION PHASE

**Purpose**: Code generation

**Focus**: BUILD it

**Stages in CONSTRUCTION PHASE**:
- Per-Unit Loop (executes for each unit):
  - Code Generation (ALWAYS, per-unit)

**Note**: Each unit's code is generated in sequence.

---

## Per-Unit Loop (Executes for Each Unit)

**For each unit of work, execute the following stages in sequence:**

### Code Generation (ALWAYS EXECUTE, per-unit)

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `construction/code-generation.md`
3. **PART 1**: Create code generation plan, get user approval
4. **PART 2**: Execute approved plan to generate code
5. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
6. **MANDATORY**: Log user's response in audit with complete raw input

---

# 🟣 QUALITY ASSURANCE PHASE

**Purpose**: Build verification, testing, and manual QA testing plan for the user to execute after deployment

**Focus**: VERIFY it builds, passes tests, and works in a real environment

**Stages in QUALITY ASSURANCE PHASE**:
- Build and Test (ALWAYS)
- QA Testing Plan (ALWAYS)
- QA Test Samples (ALWAYS)

---

## Build and Test (ALWAYS EXECUTE)

1. **MANDATORY**: Log any user input during this phase in audit
2. Load all steps from `quality-assurance/build-and-test.md`
3. Generate build instructions, test instructions, and summary
4. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
5. **MANDATORY**: Log user's response in audit with complete raw input

---

## QA Testing Plan (ALWAYS EXECUTE)

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `quality-assurance/qa-testing-plan.md`
3. Determine target environment (dev preferred, prod if dev not suitable)
4. Generate testing plan covering happy path, edge cases, and non-functional tests
5. Create QA Testing Plan as a Google Drive file under Quality Assurance
6. Post a link to the Google Drive QA Testing Plan file as a comment on the linked Git issue
7. **Wait for Explicit Approval** of the plan - DO NOT PROCEED until user confirms
8. Enter interactive testing results loop: collect pass/fail results from user as they test
9. Generate testing results summary and update Google Drive file; post link with summary to Git issue
10. **Wait for Explicit Approval** of results - DO NOT PROCEED until user confirms
11. **MANDATORY**: Log user's response in audit with complete raw input

---

## QA Test Samples (ALWAYS EXECUTE)

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `quality-assurance/qa-test-samples.md`
3. Generate concrete test data and sample payloads for each test scenario in the QA Testing Plan
4. Create Test Samples as a Google Drive file under Quality Assurance
5. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
6. **MANDATORY**: Log user's response in audit with complete raw input

---

# 📄 DOCUMENTATION PHASE (CONDITIONAL)

**Purpose**: Generate technical and user-facing documentation for the completed feature

**Focus**: DOCUMENT it

**Condition**: After QA completes, ask the user if they want documentation. Skip entirely if user declines.

**Note**: 
- **Technical documentation** is stored under **Technical Docs → `<application-name>`** in Google Drive, NOT under the AI-DLC Docs hierarchy.
- **User-facing documentation** is stored under **User Docs** in Google Drive, at the root level.

**Stages in DOCUMENTATION PHASE**:
- Documentation (CONDITIONAL — user must opt in)

---

## Documentation (CONDITIONAL — user opt-in)

**Execution**:
1. **MANDATORY**: Log any user input during this stage in audit
2. Load all steps from `documentation/documentation.md`
3. Present documentation options to user (technical only, user-facing only, both, or skip)
4. If user declines, skip phase and mark workflow complete
5. **Technical docs**: Identify target application directory under Technical Docs and generate files there
6. **User-facing docs**: Create files directly under **User Docs** at the root level
7. **Wait for Explicit Approval** - DO NOT PROCEED until user confirms
8. **MANDATORY**: Log user's response in audit with complete raw input

---

## Key Principles

- **Adaptive Execution**: Only execute stages that add value
- **Transparent Planning**: Always show execution plan before starting
- **User Control**: User can request stage inclusion/exclusion
- **Progress Tracking**: Update aidlc-state Google Drive file with executed and skipped stages
- **Complete Audit Trail**: See Audit Logging section below
- **Quality Focus**: Complex changes get full treatment, simple changes stay efficient
- **Content Validation**: Always validate content before file creation per content-validation.md rules
- **NO EMERGENT BEHAVIOR**: Construction phases MUST use standardized 2-option completion messages as defined in their respective rule files. DO NOT create 3-option menus or other emergent navigation patterns.

## MANDATORY: Plan-Level Checkbox Enforcement

### MANDATORY RULES FOR PLAN EXECUTION
1. **NEVER complete any work without updating plan checkboxes**
2. **IMMEDIATELY after completing ANY step described in a plan file, mark that step [x]**
3. **This must happen in the SAME interaction where the work is completed**
4. **NO EXCEPTIONS**: Every plan step completion MUST be tracked with checkbox updates

### Two-Level Checkbox Tracking System
- **Plan-Level**: Track detailed execution progress within each stage
- **Stage-Level**: Track overall workflow progress in aidlc-state Google Drive file
- **Update immediately**: All progress updates in SAME interaction where work is completed

## MANDATORY: Audit Logging

**Rules**:
- Log EVERY user input with timestamp (ISO 8601) — capture COMPLETE RAW INPUT, never summarize
- Log every approval prompt before asking, and every user response after receiving
- ALWAYS read existing `audit` Google Drive file first, then append new entries (NEVER overwrite)

**Format**:
```markdown
## [Stage Name]
**Timestamp**: [YYYY-MM-DDTHH:MM:SSZ]
**User Input**: "[exact raw input]"
**AI Response**: "[action taken]"
**Context**: [stage/decision]
---
```

## Directory Structure

### In Google Drive (ALL AI-DLC artifacts) mapped to local file system

```text
AI-DLC Docs (Google Drive: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC)
├── <project-name>/
│   ├── YYYY-MM-DD-<feature-request-name>/
│   │   ├── aidlc-state
│   │   ├── audit
│   │   ├── Inception/
│   │   │   ├── Reverse Engineering
│   │   │   ├── Requirements
│   │   │   ├── User Stories
│   │   │   ├── Workflow Plan
│   │   │   └── Application Design
│   │   ├── Design/
│   │   │   └── {unit-name}/
│   │   │       ├── Functional Design
│   │   │       ├── NFR Design
│   │   │       └── Infrastructure Design
│   │   ├── Construction/
│   │   │   └── {unit-name}/
│   │   │       └── Code Generation Plan
│   │   ├── Quality Assurance/
│   │   │   ├── Build and Test
│   │   │   ├── QA Testing Plan
│   │   │   └── Test Samples
│   │   └── ...
└── <another-project>/
    └── ...
```

**CRITICAL RULES**:
- **Application code**: Lives at the **target project root** (NEVER in Google Drive)
- **ALL AI-DLC artifacts**: Stored exclusively on Google Drive: ~/Google Drive/My Drive/SoftwareDevProjects/AI-DLC `<feature-request-name>`
- **No in-repo AI-DLC files**: Do NOT create `docs/` or `aidlc-docs/` directories in the project repo
- **Project structure**: See code-generation.md for patterns by project type
