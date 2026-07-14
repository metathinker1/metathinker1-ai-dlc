# Functional Design

## Purpose
Detailed business logic design per unit — domain models, business rules, data flow.

## Prerequisites
- Requirements Analysis complete
- Unit of work defined

## Step 1: Analyze Unit Context
- Read unit definition and assigned stories from Google Drive
- Understand responsibilities and boundaries

## Step 2: Generate Functional Design Artifacts

Create a **Functional Design** Google Drive file under Design → {unit-name} with the following sections:

- **Business Logic Model** — Core algorithms, workflows, data transformations
- **Domain Entities** — Entities, relationships, data structures
- **Business Rules** — Validation logic, constraints, decision rules
- **Frontend Components** (if applicable) — Component hierarchy, props/state, user interactions

## Step 3: Present for Approval

```markdown
# 🔧 Functional Design Complete - [unit-name]

> **📋 REVIEW REQUIRED:**
> Please examine the Functional Design in Google Drive under Design → [unit-name] → Functional Design
>
> **You may:**
> 🔧 **Request Changes** — Modify the design
> ✅ **Continue to Next Stage** — Proceed to next stage
```

## Step 4: Log and Update State
- Log approval in the `audit` Google Drive file
- Mark Functional Design complete in the `aidlc-state` Google Drive file
