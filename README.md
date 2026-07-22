# AI-DLC (AI-Driven Lifecycle)

> **To start a workflow**, say **"Using AI-DLC, ..."** followed by your intent in the chat.

> **Artifacts**: [AI-DLC Docs (Confluence)](https://ancestry.atlassian.net/wiki/spaces/PTH/pages/220266510/AI-DLC+Docs)

> **Docs**: [Technical Docs](~/Google Drive/My Drive/SoftwareDevProjects/TechnicalDocs)· [User Docs](~/Google Drive/My Drive/SoftwareDevProjects/UserDocs)

## Prerequisites

- Pi Coding Agent installed
- LM Studio installed with model loaded
- Target project repository accessible from this workspace

## Installation

{Edit}
**Latest version**: `v1.0.0`

{Edit}
```bash
git clone --branch v1.0.0 git@github.ancestry.com:Ancestry/agile-observability-ai-dlc.git
```

## How It Works

This repo contains the AI-DLC (AI-Driven Development Life Cycle) steering rules and Metathinker1 engineering standards. The workflow follows a clear 5-phase progression:

```
INCEPTION (what/why) → DESIGN (how) → CONSTRUCTION (build) → QA (verify & test) → DOCS (optional)
```

| Phase | Purpose | Key Outputs |
|-------|---------|-------------|
| **Inception** | Determine *what* to build and *why* | Requirements, User Stories, Workflow Plan, Application Design, Units |
| **Design** | Determine *how* to build it (per unit) | Functional Design, NFR Design, Infrastructure Design |
| **Construction** | *Build* it (per unit) | Code Generation |
| **Quality Assurance** | *Verify* it builds, passes tests, and works in environment | Build & Test, QA Testing Plan, Test Samples |
| **Documentation** *(optional)* | *Document* what was built | Technical docs (in Technical Docs → `<stack-name>`), user-facing docs (in Observability User Docs) |

### What are Units?

Units are logical groupings of work that the system gets decomposed into for development purposes. Each unit is designed and built independently, in sequence.

- **Microservices** → each unit = an independently deployable service
- **Monolith** → the single unit = the entire application (with logical modules inside)

For example, if a feature request requires changes to both a message processor and a notification service, those would be two separate units. Each unit then goes through Design (functional, NFR, infrastructure) and Construction (code generation) independently.

Units Generation produces three artifacts:
- **Unit of Work** — definitions, responsibilities, and boundaries of each unit
- **Unit of Work Dependency** — how units relate to and depend on each other
- **Unit of Work Story Map** — which user stories belong to which unit

For simple single-component changes, Units Generation is skipped and the work is treated as one implicit unit.

When you start a workflow, AI-DLC will:

1. Ask for a **feature request description** (e.g., `fix-memory-leak`)
2. Ask whether the feature request spans **multiple projects/stacks**
   - If yes, ask for all project paths and **which is the primary**
   - If no, ask for a single **project path** (e.g., `../apm-alert-router`)
3. Ask whether a **Git Issue** already exists (or create one after Inception)
4. Store **ALL** AI-DLC artifacts (including state and audit) in **Confluence** under PTH → AI-DLC Docs → `<project-name>` → `<feature-request-name>`

Secondary projects are used for analysis, planning, and implementation only — no artifacts are stored there.

### Git Issue Integration

For now there is no Git Issue Integration


## Quick Start

1. Start any software development project by stating your intent starting with the phrase **"Using AI-DLC, ..."** in the chat
2. AI-DLC will ask you for the **target project path** and a **feature request description**
3. AI-DLC workflow automatically activates and guides you from there
4. Answer structured questions that AI-DLC asks you
5. Carefully review every plan that AI generates. Provide your oversight and validation
6. Review the execution plan to see which stages will run
7. Carefully review the artifacts and approve each stage to maintain control
8. All artifacts are stored in Confluence (no in-repo AI-DLC files are created)

## Working with Multiple Sessions

AI-DLC workflows persist all state in Google Drive, so you can pause at any approval checkpoint and resume later.

### Resuming a Workflow

Open a new chat session and say: **"Using AI-DLC, continue work on `<feature-request-name>` for `<project-path>`"**

AI-DLC detects the existing `aidlc-state` Google Drive file, loads previous artifacts, and shows a Welcome Back prompt with your current progress.

### Parallel Workflows

Multiple workflows can run simultaneously — each is isolated by its `<project-name>/<YYYY-MM-DD-feature-request-name>` path in Confluence:

```
AI-DLC Docs → spend-manager-service → 2026-07-01-add-retry-logic
AI-DLC Docs → spend-manager-service → 2026-07-05-fix-memory-leak
AI-DLC Docs → thoughtpal-service → 2026-07-03-pydantic-upgrade
```

- Same project, different features → coexist (distinguished by date-prefixed name)
- Different projects → fully independent
- Switch between workflows by referencing the matching project path + feature request name in a new chat



## Directory Structure

All AI-DLC artifacts live exclusively in Google Drive:
```
PTH → AI-DLC Docs → <project-name> → <feature-request-name>
  ├── aidlc-state
  ├── audit
  ├── Inception/  (Reverse Engineering, Requirements, User Stories, Workflow Plan, Application Design)
  ├── Design/  ({unit-name}/: Functional Design, NFR Design, Infrastructure Design)
  ├── Construction/  ({unit-name}/: Code Generation Plan)
  └── Quality Assurance/  (Build and Test, QA Testing Plan, Test Samples)
```

{Edit}
## Included Rules & Standards

```
   ├── .pi                                                                                                  
   │   ├── agent                                                                                            
   │   │   └── skills                                                                                       
   │   │       ├── github-pr-creation                                                                       
   │   │       └── google-drive-management                                                                  
   │   ├── agents                                                                                           
   │   └── steering                                                                                         
   │       └── github-mcp                                                                                   
   ├── aidlc-rules                                                                                          
   │   ├── aidlc-rule-details                                                                               
   │   │   ├── common                                                                                       
   │   │   ├── construction                                                                                 
   │   │   ├── design                                                                                       
   │   │   ├── documentation                                                                                
   │   │   ├── inception                                                                                    
   │   │   └── quality-assurance                                                                            
   │   └── aidlc-rules                                                                                      
   ├── config                                                                                               
   ├── docs                                                                                                 
   │   ├── standards                                                                                        
   │   └── tools                                                                                            
   ├── engineering-standards                                                                                
   ├── scripts                                                                                              
   └── workflows      
```

{Edit}
## Integrations

- **Atlassian Jira** — User stories created directly in Jira (Observability Team)
- **Atlassian Confluence** — [Technical Docs](https://ancestry.atlassian.net/wiki/spaces/PTH/pages/100509797/Technical+Docs) for stack documentation, [Observability User Docs](https://ancestry.atlassian.net/wiki/spaces/PTH/pages/191168542/Observability+User+Docs) for user-facing documentation
- **Ancestry Standards** — ENGP standards enforced during design & construction

