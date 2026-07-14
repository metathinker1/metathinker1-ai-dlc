# QA Testing Plan

## Purpose
Generate a comprehensive testing plan that the user must execute manually when the application is deployed to a dev environment (or prod, if dev is not suitable). This plan ensures the deployed application behaves correctly in a real environment beyond automated unit/integration tests.

## Prerequisites
- Code Generation complete for all units
- Build and Test complete (all tests passing)

## Step 1: Analyze Deployment Context

Determine the appropriate target environment:
- **Dev environment** — Default target for QA testing
- **Prod environment** — Only if dev is not suitable (e.g., no dev environment exists, feature requires prod-only dependencies, or user specifies prod)

Document which environment the testing plan targets and why.

## Step 2: Generate QA Testing Plan

Create a **QA Testing Plan** Google Drive file under Quality Assurance with the following sections:

### Test Scenarios
For each user story / requirement, generate:
- **Scenario name** — Clear, descriptive name
- **Preconditions** — What must be true before executing the test
- **Steps** — Numbered step-by-step instructions the user must follow
- **Expected result** — What the user should observe if the feature works correctly
- **Environment** — Dev or Prod (with justification if Prod)

### Happy Path Tests
- Core business flows that must work end-to-end
- Primary use cases from user stories
- Critical integrations (APIs, messaging, data stores)

### Edge Case Tests
- Boundary conditions
- Error scenarios (invalid input, service unavailable, timeout)
- Concurrency/race conditions (if applicable)
- Empty/null data handling

### Non-Functional Tests
- **Performance** — Response time expectations, load behavior
- **Security** — Authentication/authorization verification, input validation
- **Observability** — Logs appear correctly, metrics are emitted, alerts fire as expected
- **Resilience** — Behavior under failure (dependency down, network issues)

## Step 3: Generate Test Checklist

Add a checklist summary at the end of the QA Testing Plan file:
- Each test scenario as a checkbox item
- Grouped by category (Happy Path, Edge Case, NFR)
- User can mark items as they execute tests

## Step 4: Post QA Testing Plan Link to Git Issue
- Disabled for now

## Step 5: Present for Approval

```markdown
# ✅ QA Testing Plan Complete

[AI-generated summary of test coverage]

> **📋 REVIEW REQUIRED:**
> Please examine the QA Testing Plan:
> - **Google Drive**: Quality Assurance → QA Testing Plan
>
> **You may:**
> 🔧 **Request Changes** — Modify test scenarios or add missing coverage
> ✅ **Approve & Begin Testing** — Accept the testing plan and start reporting results
```

## Step 6: Collect Testing Results

After the user approves the plan and deploys the application, enter an interactive loop where the user reports test results:

**Prompt the user:**
```markdown
# 🧪 Ready to Record Test Results

The QA Testing Plan has been posted to Google Drive. Once you've deployed and started testing, report your results here.

> **For each test scenario, tell me:**
> - Which test(s) you ran
> - ✅ **Pass** or ❌ **Fail**
> - Any observations, screenshots, or error messages
>
> You can report one at a time or in batches. Say **"done testing"** when all tests are complete.
```

**Interactive loop:**
1. User reports test results (pass/fail per scenario, observations, issues found)
2. AI acknowledges and records the result
3. Update the QA Testing Plan Google Drive file with reported results
4. Repeat until user says "done testing" or all scenarios are covered

## Step 7: Generate Testing Results Summary

After the user completes testing, generate a results summary:

**Update the QA Testing Plan Google Drive file** with the results appended at the bottom:
- **Test Execution Summary** — Total tests, passed, failed, not executed
- **Failed Tests** — Scenario name, actual result, observations
- **Passed Tests** — Scenario names (compact list)
- **Issues Found** — Any bugs or unexpected behavior reported by user
- **Overall Verdict** — Ready for production / Needs fixes


## Step 8: Present Completion

```markdown
# 🏁 QA Testing Complete

**Results**: [X passed] / [Y failed] / [Z not executed]

> **📋 Test results posted to:**
> - **Google Drive**: Updated QA Testing Plan file (full details)
>
> **You may:**
> 🔧 **Report More Results** — Continue testing
> ✅ **Approve & Complete** — Testing complete, workflow finished
```

## Step 9: Log and Update State
- Log approval in the `audit` Google Drive file
- Mark QA Testing Plan complete in the `aidlc-state` Google Drive file
