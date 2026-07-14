# Code Generation

## Purpose
Generate code for each unit of work. Two parts: plan then execute.

## Prerequisites
- All applicable design stages complete for the unit
- Unit design artifacts available in Google Drive

---

## PART 1: PLANNING

### Step 1: Analyze Unit Context
- Load unit design artifacts from Google Drive (Functional Design, NFR Design, Infrastructure Design)
- Load workspace root and project type from the `aidlc-state` Google Drive file
- **Brownfield**: Review Code Structure file from Google Drive for existing files to modify

### Step 2: Create Code Generation Plan

Create a **Code Generation Plan** Google Drive file under Construction → {unit-name}:

- Project structure setup (greenfield only)
- Business logic generation + unit tests
- API layer generation + unit tests
- Repository/data layer generation + unit tests
- Frontend components + unit tests (if applicable)
- Database migration scripts (if data models exist)
- Documentation (API docs, README updates)
- Deployment artifacts

Each step must have a checkbox `[ ]` and specify target file paths.

### Step 3: Get User Approval

Present the plan and **DO NOT proceed until user explicitly approves**.

---

## PART 2: GENERATION

### Step 4: Execute Plan Steps
For each step in the plan:
1. Read the next uncompleted step
2. Generate/modify code at the specified path
3. Mark step `[x]` immediately after completion
4. Repeat until all steps done

### Step 5: Present Completion

```markdown
# 💻 Code Generation Complete - [unit-name]

> **📋 REVIEW REQUIRED:**
> Please examine the generated code.
>
> **You may:**
> 🔧 **Request Changes** — Modify the generated code
> ✅ **Continue to Next Stage** — Proceed to next unit or Build & Test
```

### Step 6: Log and Update State
- Log approval in the `audit` Google Drive file
- Mark Code Generation complete in the `aidlc-state` Google Drive file

---

## Critical Rules

### Code Location
- **Application code**: Target project root (NEVER in Google Drive)
- **Plans and documentation**: Google Drive files only

### Structure Patterns
- **Brownfield**: Use existing project structure
- **Greenfield single unit**: `src/`, `tests/`, `config/` in project root
- **Greenfield multi-unit (microservices)**: `{unit-name}/src/`, `{unit-name}/tests/`
- **Greenfield multi-unit (monolith)**: `src/{unit-name}/`, `tests/{unit-name}/`

### Brownfield Rules
- Check if file exists before generating
- If exists: modify in-place (NEVER create copies like `ClassName_modified.java`)
- If doesn't exist: create new file

### Automation-Friendly UI Code
- Add `data-testid` to interactive elements
- Naming: `{component}-{element-role}` (e.g., `login-form-submit-button`)
- Keep `data-testid` values stable across changes
