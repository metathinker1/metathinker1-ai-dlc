# AI-DLC Welcome Message

**Purpose**: This file contains the user-facing welcome message that should be displayed ONCE at the start of any AI-DLC workflow.

---

# 👋 Welcome to AI-DLC (AI-Driven Development Life Cycle)! 👋

I'll guide you through an adaptive software development workflow that intelligently tailors itself to your specific needs.

## What is AI-DLC?

AI-DLC is a structured yet flexible software development process that adapts to your project's needs. Think of it as having an experienced software architect who:

- **Analyzes your requirements** and asks clarifying questions when needed
- **Plans the optimal approach** based on complexity and risk
- **Skips unnecessary steps** for simple changes while providing comprehensive coverage for complex projects
- **Documents everything** so you have a complete record of decisions and rationale
- **Guides you through each phase** with clear checkpoints and approval gates

## The Five-Phase Lifecycle

```
                         User Request
                              |
                              v
        +---------------------------------------+
        |     INCEPTION PHASE                   |
        |     Planning & Application Design     |
        +---------------------------------------+
        | * Workspace Detection (ALWAYS)        |
        | * Reverse Engineering (COND)          |
        | * Requirements Analysis (ALWAYS)      |
        | * User Stories (CONDITIONAL)          |
        | * Workflow Planning (ALWAYS)          |
        | * Application Design (CONDITIONAL)    |
        | * Units Generation (CONDITIONAL)      |
        +---------------------------------------+
                              |
                              v
        +---------------------------------------+
        |     DESIGN PHASE (per unit)           |
        |     Detailed Technical Design         |
        +---------------------------------------+
        | * Functional Design (CONDITIONAL)     |
        | * NFR Design (CONDITIONAL)            |
        | * Infrastructure Design (CONDITIONAL) |
        +---------------------------------------+
                              |
                              v
        +---------------------------------------+
        |     CONSTRUCTION PHASE (per unit)     |
        |     Code Generation                   |
        +---------------------------------------+
        | * Code Generation (ALWAYS)            |
        +---------------------------------------+
                              |
                              v
        +---------------------------------------+
        |     QUALITY ASSURANCE PHASE           |
        |     Build, Test & Verification        |
        +---------------------------------------+
        | * Build and Test (ALWAYS)             |
        | * QA Testing Plan (ALWAYS)            |
        | * QA Test Samples (ALWAYS)            |
        +---------------------------------------+
                              |
                              v
        +---------------------------------------+
        |     DOCUMENTATION PHASE (OPTIONAL)    |
        |     Technical & User-Facing Docs      |
        +---------------------------------------+
        | * Documentation (CONDITIONAL)         |
        |   Stored in Technical Docs → <app>    |
        +---------------------------------------+
                              |
                              v
                          Complete
```

### Phase Breakdown:

**INCEPTION PHASE** - *Planning & Application Design*
- **Purpose**: Determines WHAT to build and WHY
- **Activities**: Understanding requirements, analyzing existing code (if any), planning the approach
- **Output**: Clear requirements, execution plan, decisions on the number of units of work for parallel development
- **Your Role**: Answer questions, review plans, approve direction

**DESIGN PHASE** - *Detailed Technical Design*
- **Purpose**: Determines HOW to build it (per unit)
- **Activities**: Functional design, NFR design, infrastructure design
- **Output**: Detailed design artifacts ready for code generation
- **Your Role**: Review designs, approve technical decisions

**CONSTRUCTION PHASE** - *Code Generation*
- **Purpose**: BUILD it
- **Activities**: Code generation per unit
- **Output**: Working code, implementation plans
- **Your Role**: Approve implementation plans, validate results

**QUALITY ASSURANCE PHASE** - *Build Verification & Manual Testing*
- **Purpose**: VERIFY it builds, passes tests, and works in a real environment
- **Activities**: Build and test, generate QA testing plan, collect test results from user
- **Output**: Build instructions, test results, testing plan in Google drive
- **Your Role**: Review build results, execute tests in dev/prod, report results

**DOCUMENTATION PHASE** - *Technical & User-Facing Documentation (Optional)*
- **Purpose**: DOCUMENT what was built
- **Activities**: Generate technical and/or user-facing documentation
- **Output**: Documentation files in Google drive under Technical Docs → `<application-name>`
- **Your Role**: Choose documentation scope, review generated files

## Key Principles:

- ⚡ **Fully Adaptive**: Each stage independently evaluated based on your needs
- 🎯 **Efficient**: Simple changes execute only essential stages
- 📋 **Comprehensive**: Complex changes get full treatment with all safeguards
- 🔍 **Transparent**: You see and approve the execution plan before work begins
- 📝 **Documented**: Complete audit trail of all decisions and changes
- 🎛️ **User Control**: You can request stages be included or excluded

## What Happens Next:

1. **I'll analyze your workspace** to understand if this is a new or existing project
2. **I'll gather requirements** and ask clarifying questions if needed
3. **I'll create an execution plan** showing which stages I propose to run and why
4. **You'll review and approve** the plan (or request changes)
5. **We'll execute the plan** with checkpoints at each major stage
6. **You'll get working code** with complete documentation and tests

The AI-DLC process adapts to:
- 📋 Your intent clarity and complexity
- 🔍 Existing codebase state
- 🎯 Scope and impact of changes
- ⚡ Risk and quality requirements

Let's begin!
