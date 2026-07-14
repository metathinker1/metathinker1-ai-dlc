# Build and Test

## Purpose
Build all units and provide comprehensive testing instructions.

## Prerequisites
- Code Generation complete for all units

## Step 1: Generate Build Instructions

Create a **Build Instructions** Google Drive file under Quality Assurance → Build and Test:
- Prerequisites (tools, dependencies, env vars)
- Build steps (install, configure, build)
- Verification of successful build
- Troubleshooting common issues
- **NEVER include user-specific local paths** (e.g., home directories, virtualenv absolute paths). Use project-relative paths and refer to setup scripts instead.

## Step 2: Generate Test Instructions

Create test instruction files in Google Drive under Quality Assurance → Build and Test as applicable:

| File | When |
|------|------|
| Unit Test Instructions | Always |
| Integration Test Instructions | Multiple units/services |
| Performance Test Instructions | Performance NFRs defined |
| Security Test Instructions | Security NFRs defined |
| E2E Test Instructions | User-facing workflows |

Each file should include: setup, execution commands, expected results, cleanup.

## Step 3: Generate Summary

Create a **Build and Test Summary** Google Drive file under Quality Assurance → Build and Test:
- Build status and artifacts
- Test results by category
- Overall readiness assessment

## Step 4: Present Completion

```markdown
# 🔨 Build and Test Complete

> **📋 REVIEW REQUIRED:**
> Please examine the Build and Test files in Google Drive under Quality Assurance → Build and Test
>
> **You may:**
> 🔧 **Request Changes** — Modify build/test instructions
> ✅ **Approve & Continue** — Proceed to **QA Testing Plan**
```

## Step 5: Log and Update State
- Log in the `audit` Google Drive file
- Mark Build and Test complete in the `aidlc-state` Google Drive file
