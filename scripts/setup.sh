#!/bin/bash

# AI-DLC Project Setup Script
# This script initializes the AI-DLC environment for Python and Node.js projects

set -e

echo "Setting up AI-DLC environment..."

# Create necessary directories
mkdir -p projects/python-projects/projects-template
mkdir -p projects/nodejs-projects/projects-template
mkdir -p config
mkdir -p workflows
mkdir -p docs/tools
mkdir -p docs/standards
mkdir -p scripts

# Copy configuration files
cp config/python-config.yaml projects/python-projects/projects-template/
cp config/nodejs-config.yaml projects/nodejs-projects/projects-template/

echo "AI-DLC environment setup complete!"
echo ""
echo "Directory structure created:"
echo "  - projects/python-projects/projects-template"
echo "  - projects/nodejs-projects/projects-template"
echo "  - config/"
echo "  - workflows/"
echo "  - docs/tools/"
echo "  - docs/standards/"
echo "  - scripts/"

echo ""
echo "To get started with a new Python project:"
echo "  1. Copy the template: cp -r projects/python-projects/projects-template <your-project-name>"
echo "  2. Customize the configuration in your project"
echo ""
echo "To get started with a new Node.js project:"
echo "  1. Copy the template: cp -r projects/nodejs-projects/projects-template <your-project-name>"
echo "  2. Customize the configuration in your project"