# QA Test Samples

## Purpose
Generate concrete test data and sample payloads needed to execute each test scenario defined in the QA Testing Plan. This ensures the user has ready-to-use inputs when manually testing the deployed application.

## Prerequisites
- QA Testing Plan complete and approved

## Step 1: Analyze Test Scenarios

Load the QA Testing Plan from Google Drive and identify all test scenarios that require input data, setup data, or expected output verification.

## Step 2: Generate Test Samples

Create a **Test Samples** Google Drive file under Quality Assurance with the concrete data for each test scenario.

For each test scenario, generate:
- **Scenario reference** — Name matching the test scenario in the QA Testing Plan
- **Input data** — Request payloads, message bodies, CLI arguments, form inputs, or query parameters
- **Setup data** — Database records, configuration values, or environment variables that must exist before the test
- **Mock/stub data** — Expected responses from dependencies (if simulating failures or specific behaviors)
- **Expected output** — Response bodies, log entries, metric values, or state changes to verify

### Sample Categories

| Category | Contents |
|----------|----------|
| Happy path samples | Valid payloads and data that exercise the core flow |
| Error samples | Malformed payloads, missing fields, invalid values |
| Boundary samples | Max/min values, empty collections, large payloads |
| Security samples | Unauthenticated requests, unauthorized access attempts, injection strings |

### Format Guidelines
- Use code blocks with language annotations (JSON, SQL, YAML, shell, etc.)
- Label each sample clearly with its corresponding test scenario name
- Include comments explaining what each sample tests
- Provide both the input AND the expected output/response for each sample
- If a sample requires sequential steps (e.g., create then query), number them in order

## Step 3: Present for Approval

```markdown
# 🧪 Test Samples Generated

[AI-generated summary: X samples covering Y test scenarios]

> **📋 REVIEW REQUIRED:**
> Please examine the Test Samples:
> - **Google Drive**: Quality Assurance → Test Samples
>
> **You may:**
> 🔧 **Request Changes** — Modify samples, add missing data, or adjust values
> ✅ **Approve & Continue** — Proceed to test execution
```

**DO NOT proceed until user explicitly approves.**

## Step 4: Log and Update State
- Log approval in the `audit` Google Drive file
- Mark Test Samples complete in the `aidlc-state` Google Drive file
