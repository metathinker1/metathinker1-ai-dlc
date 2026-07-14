#!/bin/bash

# AI-DLC Workflow Runner
# This script orchestrates the AI-DLC workflow for Python or Node.js projects

set -e

echo "AI-DLC Workflow Runner"
echo "======================"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project-type> <project-name>"
    echo "  project-type: python or nodejs"
    echo "  project-name: name of the new project"
    exit 1
fi

PROJECT_TYPE=$1
PROJECT_NAME=$2

echo "Starting AI-DLC workflow for $PROJECT_TYPE project: $PROJECT_NAME"

# Validate project type
if [ "$PROJECT_TYPE" != "python" ] && [ "$PROJECT_TYPE" != "nodejs" ]; then
    echo "Error: project-type must be 'python' or 'nodejs'"
    exit 1
fi

# Validate project name
if [ -z "$PROJECT_NAME" ]; then
    echo "Error: project-name cannot be empty"
    exit 1
fi

# Create project directory
PROJECT_DIR="projects/$PROJECT_TYPE-projects/$PROJECT_NAME"
mkdir -p "$PROJECT_DIR"

echo "Created project directory: $PROJECT_DIR"

# Copy template files
if [ "$PROJECT_TYPE" = "python" ]; then
    echo "Copying Python project template..."
    cp -r projects/python-projects/projects-template/* "$PROJECT_DIR/"
    echo "Python project template copied to: $PROJECT_DIR"
elif [ "$PROJECT_TYPE" = "nodejs" ]; then
    echo "Copying Node.js project template..."
    cp -r projects/nodejs-projects/projects-template/* "$PROJECT_DIR/"
    echo "Node.js project template copied to: $PROJECT_DIR"
fi

echo ""
echo "AI-DLC workflow completed successfully!"
echo "Project '$PROJECT_NAME' is ready for development."
echo ""
echo "Next steps:"
echo "1. Navigate to: $PROJECT_DIR"
echo "2. Review and customize the configuration files"
echo "3. Start the AI-DLC workflow phases: INCEPTION, DESIGN, CONSTRUCTION, QA, DOCS"