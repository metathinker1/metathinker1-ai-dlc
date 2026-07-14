# Workflow Planning

**Purpose**: Determine which Design, Construction, and QA stages to execute and present the plan for user approval.

**Always Execute**: This phase always runs after Requirements Analysis.

## Step 1: Load Prior Context

- Load the **Requirements** Google Drive file from Inception
- Load reverse engineering artifacts from Google Drive (if brownfield)
- Load user stories from Google Drive (if executed)
- Load application design from Google Drive (if executed)

## Step 2: Determine Design and Construction Stages

For each stage, decide execute/skip based on the task:

| Stage | Execute IF | Skip IF |
|-------|-----------|---------|
| Functional Design | New data models, complex business logic | Simple logic, no new models |
| NFR Requirements | Performance/security/scalability concerns, tech stack selection needed | No NFR concerns, stack already set |
| NFR Design | NFR Requirements was executed | NFR Requirements skipped |
| Infrastructure Design | Cloud resources, deployment architecture needed | No infra changes |
| Code Generation | **Always** | Never |
| Build and Test (QA) | **Always** | Never |

## Step 3: Identify Applicable Ancestry Standards

Load relevant standards from `engineering-strandards/content/` based on the task domain (see core-workflow.md "Ancestry Standards Loading" section).

List which ENGP standards apply to this task.

## Step 4: Determine Units of Work

- **Single unit**: Most tasks (one logical deliverable)
- **Multiple units**: Only if system decomposition is genuinely needed (e.g., new microservice + infrastructure)

## Step 5: Generate Execution Plan

Create a **Workflow Plan** Google Drive file under Inception:

```markdown
# Workflow Execution Plan

## Design Stages (per unit)
- [ ] Functional Design: [Execute/Skip] — [reason]
- [ ] NFR Design: [Execute/Skip] — [reason]
- [ ] Infrastructure Design: [Execute/Skip] — [reason]

## Construction Stages (per unit)
- [ ] Code Generation: Execute

## Quality Assurance Stages
- [ ] Build and Test: Execute
- [ ] QA Testing Plan: Execute
- [ ] QA Test Samples: Execute

## Documentation (Optional)
- [ ] Documentation: [Execute/Skip] — user decides after QA

## Units of Work
- [unit-name]: [description]

## Applicable Ancestry Standards
- ENGP-XXX: [name]
- ENGP-XXX: [name]
```

## Step 6: Present Plan for Approval

```markdown
# 📋 Workflow Planning Complete

[Summary of what stages will run and why]

> **📋 REVIEW REQUIRED:**
> Please review the execution plan in Google Drive under Inception → Workflow Plan
>
> **You may:**
> 🔧 **Request Changes** — Add/remove stages, adjust depth
> ✅ **Approve & Continue** — Proceed to **Design Phase**
```

**DO NOT proceed until user explicitly approves.**

## Step 7: Log and Update State

- Log approval in the `audit` Google Drive file
- Update the `aidlc-state` Google Drive file marking Workflow Planning complete
