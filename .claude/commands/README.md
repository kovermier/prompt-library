# Claude Commands

This directory contains custom slash commands that enhance Claude Code's capabilities with project-specific shortcuts and workflows.

## Available Commands

- `/tdd` - Test-Driven Development guidelines and enforcement
- `/typescript` - TypeScript strict mode requirements and patterns
- `/functional` - Functional programming patterns and principles
- `/refactor` - Refactoring guidelines with emphasis on pure functions
- `/vibecoder` - Access the vibecoding philosophical approach
- `/patterns` - Pattern synthesis and system thinking approaches
- `/search` - Optimized prompt library search strategies
- `/frameworks` - List and access available frameworks

## Project-Specific Commands

- `/project1` - Example project documentation
- `/project2` - Another project specifics
- `/project3` - Third project details

## Deployment to Other Projects

When deploying the Claude framework to other projects:

```bash
# Deploy framework including commands
.claude/deploy-claude.sh /path/to/project
```

The deployment will:
1. Copy all standard commands to the target project
2. Allow you to add project-specific commands
3. Configure command aliases in CLAUDE.md
4. Maintain command consistency across projects

## Creating Custom Commands

To add a new command:
1. Create a markdown file in this directory (e.g., `mycommand.md`)
2. Add the command reference to CLAUDE.md
3. Follow the existing command format for consistency

## Command Format

```markdown
# Command Name

## Purpose
Brief description of what this command provides

## Usage
When and how to use this command

## Guidelines
Specific rules or patterns to follow

## Examples
Concrete examples if applicable
```

See [DEPLOYMENT.md](../DEPLOYMENT.md) for complete framework deployment instructions.