# Session Continuity Templates

## Welcome Back Prompt Template
When a user returns to continue work on an existing AI-DLC project, present this prompt:

```markdown
**Welcome back! I can see you have an existing AI-DLC project in progress.**

Based on your aidlc-state Google Drive file, here's your current status:
- **Project**: [project-name]
- **Current Phase**: [INCEPTION/DESIGN/CONSTRUCTION/QUALITY ASSURANCE]
- **Current Stage**: [Stage Name]
- **Last Completed**: [Last completed step]
- **Next Step**: [Next step to work on]

**What would you like to work on today?**

A) Continue where you left off ([Next step description])

B) Review a previous stage ([Show available stages])

[Answer]: 
```

## MANDATORY: Session Continuity Instructions
1. **Always read the `aidlc-state` Google Drive file first** when detecting existing project
2. **Parse current status** from the state file to populate the prompt
3. **MANDATORY: Load Previous Stage Artifacts** - Before resuming any stage, automatically read all relevant Google Drive files from previous stages:
   - **Reverse Engineering**: Read Architecture, Code Structure, API Documentation pages
   - **Requirements Analysis**: Read Requirements, Requirement Verification Questions files
   - **User Stories**: Read Story Plan file and any story detail files
   - **Application Design**: Read Application Design artifacts (Components, Component Methods, Services files)
   - **Design (Units)**: Read Unit of Work, Unit of Work Dependency, Unit of Work Story Map files
   - **Per-Unit Design**: Per-unit artifacts live as Google Drive files under Construction → {unit-name}
     (Functional Design, NFR Design, Infrastructure Design files).
     On resume, determine the in-progress unit from the `aidlc-state` Google Drive file and load that
     unit's design artifacts, plus the design artifacts of any units it depends on (per
     Unit of Work Dependency file). The exact files in each section are enumerated by the
     corresponding construction stage rules.
   - **Code Stages**: Read all code files, plans, AND all previous Google Drive artifacts
4. **Smart Context Loading by Stage**:
   - **Early Stages (Workspace Detection, Reverse Engineering)**: Load workspace analysis
   - **Requirements/Stories**: Load reverse engineering + requirements Google Drive files
   - **Design Stages**: Load requirements + stories + architecture + design Google Drive files
   - **Code Stages**: Load ALL Google Drive artifacts + existing code files
5. **Adapt options** based on architectural choice and current phase
6. **Show specific next steps** rather than generic descriptions
7. **Log the continuity prompt** in the `audit` Google Drive file with timestamp
8. **Context Summary**: After loading artifacts, provide brief summary of what was loaded for user awareness
9. **Asking questions**: ALWAYS ask clarification or user feedback questions by placing them in Google Drive files or presenting them directly. DO NOT place the multiple-choice questions only in-line in the chat session without recording them.

## Error Handling
If artifacts are missing or corrupted during session resumption, see [error-handling.md](error-handling.md) for guidance on recovery procedures.
