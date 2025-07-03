# Claude Framework Deployment Guide

This guide explains how to deploy the Claude development framework (CLAUDE.md, hooks, commands, and settings) to any project.

## Quick Start

### 1. Clone Framework Files
```bash
# From your project root
mkdir -p .claude/{hooks,commands}
```

### 2. Copy Core Files
- `.claude/CLAUDE.md` - Your project-specific instructions
- `.claude/settings.json` - Hook and tool configurations  
- `.claude/hooks/` - Automated validation scripts
- `.claude/commands/` - Custom command definitions

### 3. Initialize Project-Specific CLAUDE.md
```bash
cp /path/to/template/CLAUDE.md .claude/CLAUDE.md
# Edit to add project-specific guidelines
```

## Deployment Strategies

### Strategy 1: Template Repository
Create a template repo with your standard Claude setup that can be cloned for new projects.

```bash
# Create template
git init claude-template
cd claude-template
mkdir -p .claude/{hooks,commands}
# Add your standard files
git add .
git commit -m "Initial Claude framework"
```

### Strategy 2: Deployment Script
Create an installation script that sets up the framework:

```bash
#!/bin/bash
# deploy-claude.sh

PROJECT_DIR="${1:-.}"
TEMPLATE_DIR="$HOME/claude-templates/default"

# Copy framework
cp -r "$TEMPLATE_DIR/.claude" "$PROJECT_DIR/"

# Make hooks executable
chmod +x "$PROJECT_DIR/.claude/hooks/"*.sh

# Create project-specific config
cat > "$PROJECT_DIR/.claude/project.config" << EOF
PROJECT_TYPE=auto
LANGUAGE=auto
TEST_COMMAND=auto
EOF

echo "Claude framework deployed to $PROJECT_DIR"
```

### Strategy 3: Git Submodule
Maintain your Claude framework as a submodule:

```bash
# Add as submodule
git submodule add https://github.com/yourusername/claude-framework .claude-framework

# Link files
ln -s .claude-framework/.claude .claude
```

## Project-Specific Customization

### 1. Detect Project Type
Create a hook that auto-detects the project:

```bash
# .claude/hooks/detect-project.sh
#!/bin/bash

if [ -f "package.json" ]; then
    echo "NODE_PROJECT"
elif [ -f "Cargo.toml" ]; then
    echo "RUST_PROJECT"
elif [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
    echo "PYTHON_PROJECT"
else
    echo "UNKNOWN"
fi
```

### 2. Project-Specific CLAUDE.md Template

```markdown
# CLAUDE.md - [PROJECT NAME]

## Project Overview
[Brief description of what this project does]

## Tech Stack
- Language: [Primary language]
- Framework: [Main framework]
- Testing: [Test framework]
- Build: [Build system]

## Development Workflow

### Commands
- Build: `[build command]`
- Test: `[test command]`
- Lint: `[lint command]`
- Format: `[format command]`

### Project-Specific Rules
[Add rules specific to this codebase]

## Forbidden Practices
[List practices to avoid in this project]

---
*Inherits all rules from global Claude configuration*
```

### 3. Dynamic Hook Configuration

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {"type": "command", "command": ".claude/hooks/smart-lint.sh"},
          {"type": "command", "command": ".claude/hooks/project-specific-check.sh"}
        ]
      }
    ]
  }
}
```

## Integration Patterns

### For Existing Projects

1. **Gradual Integration**
   - Start with CLAUDE.md only
   - Add hooks one at a time
   - Test each addition thoroughly

2. **Full Integration**
   ```bash
   # Run deployment script
   ./deploy-claude.sh /path/to/project
   
   # Customize for project
   cd /path/to/project
   vim .claude/CLAUDE.md
   
   # Test hooks
   .claude/hooks/run-all-checks.sh
   ```

### For New Projects

1. **Template-Based**
   ```bash
   # Use template with Claude pre-configured
   npx create-my-app --template claude-enabled
   ```

2. **Manual Setup**
   ```bash
   # Initialize project
   mkdir new-project && cd new-project
   
   # Deploy Claude framework
   ~/scripts/deploy-claude.sh .
   
   # Initialize project files
   npm init -y  # or cargo init, etc.
   ```

## Maintenance

### Updating Framework Across Projects

```bash
#!/bin/bash
# update-claude-framework.sh

PROJECTS=(
    ~/projects/project1
    ~/projects/project2
    ~/projects/project3
)

for project in "${PROJECTS[@]}"; do
    echo "Updating $project..."
    cp -r ~/.claude-template/.claude/hooks "$project/.claude/"
    cp ~/.claude-template/.claude/commands/* "$project/.claude/commands/"
    # Keep project-specific CLAUDE.md intact
done
```

### Version Control

Include framework files in your project's git:
```gitignore
# Don't ignore Claude framework
!.claude/
!.claude/**
```

## Best Practices

1. **Keep Core Framework Separate**
   - Maintain a master template
   - Project-specific customizations in separate files
   - Use inheritance where possible

2. **Document Project Deviations**
   - Note why certain hooks are disabled
   - Document project-specific commands
   - Keep a CHANGELOG for framework updates

3. **Test Before Deploying**
   - Run all hooks manually first
   - Verify commands work as expected
   - Test with actual Claude interactions

4. **Progressive Enhancement**
   - Start with basic CLAUDE.md
   - Add hooks as needed
   - Build up commands over time

## Troubleshooting

### Common Issues

1. **Hook Permissions**
   ```bash
   chmod +x .claude/hooks/*.sh
   ```

2. **Path Issues**
   ```bash
   # Use absolute paths in hooks
   PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
   ```

3. **Language Detection**
   ```bash
   # Add fallbacks for detection
   LANG="${DETECTED_LANG:-unknown}"
   ```

## Example Deployment

```bash
# 1. Create deployment package
tar -czf claude-framework.tar.gz \
    .claude/CLAUDE.md.template \
    .claude/settings.json \
    .claude/hooks/ \
    .claude/commands/ \
    deploy-claude.sh

# 2. Deploy to new project
cd /new/project
tar -xzf ~/claude-framework.tar.gz
./deploy-claude.sh

# 3. Customize
vim .claude/CLAUDE.md
# Add project-specific rules

# 4. Test
claude-code .
# Verify hooks trigger correctly
```

## Framework Evolution

As you develop patterns that work well:
1. Update your template repository
2. Document what works in your main prompt library
3. Share improvements back to the community
4. Keep a log of what works best for different project types

---

*Remember: The goal is to make every project benefit from your accumulated Claude development wisdom while still allowing project-specific needs.*