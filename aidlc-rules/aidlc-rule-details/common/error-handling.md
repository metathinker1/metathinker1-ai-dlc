# Error Handling

## When Things Go Wrong

### Missing Artifacts
If a required artifact from a previous stage is missing in Google Drive:
1. Log the issue in the `audit` Google Drive file
2. Inform the user which artifact is missing
3. Offer to regenerate it or skip the dependent step

### Session Interruption
If a session is interrupted mid-stage:
1. On resume, read the `aidlc-state` Google Drive file to determine last completed step
2. Load relevant artifacts from previous stages in Google Drive
3. Continue from where work left off

### Tool/MCP Failures
If an external tool (GitHub API, file system) fails:
1. Log the error in the `audit` Google Drive file
2. Retry once
3. If still failing, inform the user and suggest manual alternative

### User Provides Invalid Input
If user answers are contradictory or incomplete:
1. Identify the specific issue
2. Ask a targeted clarification question
3. Do not proceed until resolved
