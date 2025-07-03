#!/bin/bash
# deploy-claude.sh - Deploy Claude framework to any project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="${CLAUDE_TEMPLATE_DIR:-$SCRIPT_DIR}"
PROJECT_DIR="${1:-.}"

# Functions
print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║    Claude Framework Deployment       ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

detect_project_type() {
    local project_dir="$1"
    
    if [ -f "$project_dir/package.json" ]; then
        echo "node"
    elif [ -f "$project_dir/Cargo.toml" ]; then
        echo "rust"
    elif [ -f "$project_dir/pyproject.toml" ] || [ -f "$project_dir/requirements.txt" ]; then
        echo "python"
    elif [ -f "$project_dir/go.mod" ]; then
        echo "go"
    elif [ -f "$project_dir/pom.xml" ] || [ -f "$project_dir/build.gradle" ]; then
        echo "java"
    else
        echo "unknown"
    fi
}

get_test_command() {
    local project_type="$1"
    
    case "$project_type" in
        "node")
            if [ -f "package.json" ] && grep -q '"test"' package.json; then
                echo "npm test"
            else
                echo "echo 'No tests configured'"
            fi
            ;;
        "rust")
            echo "cargo test"
            ;;
        "python")
            if [ -f "pyproject.toml" ] && grep -q 'pytest' pyproject.toml; then
                echo "pytest"
            else
                echo "python -m unittest"
            fi
            ;;
        "go")
            echo "go test ./..."
            ;;
        *)
            echo "echo 'No test command detected'"
            ;;
    esac
}

get_lint_command() {
    local project_type="$1"
    
    case "$project_type" in
        "node")
            if grep -q '"lint"' package.json 2>/dev/null; then
                echo "npm run lint"
            elif command -v eslint &> /dev/null; then
                echo "eslint ."
            else
                echo "echo 'No linter configured'"
            fi
            ;;
        "rust")
            echo "cargo clippy"
            ;;
        "python")
            if command -v ruff &> /dev/null; then
                echo "ruff check ."
            elif command -v flake8 &> /dev/null; then
                echo "flake8"
            else
                echo "echo 'No linter configured'"
            fi
            ;;
        "go")
            echo "go vet ./..."
            ;;
        *)
            echo "echo 'No lint command detected'"
            ;;
    esac
}

# Main deployment process
print_header
echo ""

# Validate project directory
if [ ! -d "$PROJECT_DIR" ]; then
    print_error "Project directory does not exist: $PROJECT_DIR"
    exit 1
fi

PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
print_info "Deploying to: $PROJECT_DIR"

# Detect project type
PROJECT_TYPE=$(detect_project_type "$PROJECT_DIR")
print_info "Detected project type: $PROJECT_TYPE"

# Create .claude directory structure
print_info "Creating .claude directory structure..."
mkdir -p "$PROJECT_DIR/.claude"/{hooks,commands}
print_success "Directory structure created"

# Copy core files
print_info "Copying framework files..."

# Copy settings.json
if [ -f "$TEMPLATE_DIR/settings.json" ]; then
    cp "$TEMPLATE_DIR/settings.json" "$PROJECT_DIR/.claude/"
    print_success "Copied settings.json"
else
    # Create default settings.json
    cat > "$PROJECT_DIR/.claude/settings.json" << 'EOF'
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {"type": "command", "command": ".claude/hooks/smart-lint.sh"}
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {"type": "command", "command": ".claude/hooks/log-bash-commands.sh"}
        ]
      }
    ]
  }
}
EOF
    print_success "Created default settings.json"
fi

# Copy hooks
if [ -d "$TEMPLATE_DIR/hooks" ]; then
    cp -r "$TEMPLATE_DIR/hooks/"* "$PROJECT_DIR/.claude/hooks/" 2>/dev/null || true
    chmod +x "$PROJECT_DIR/.claude/hooks/"*.sh 2>/dev/null || true
    print_success "Copied hooks"
fi

# Copy commands
if [ -d "$TEMPLATE_DIR/commands" ]; then
    cp -r "$TEMPLATE_DIR/commands/"* "$PROJECT_DIR/.claude/commands/" 2>/dev/null || true
    print_success "Copied commands"
fi

# Create project-specific CLAUDE.md
print_info "Creating project-specific CLAUDE.md..."

TEST_COMMAND=$(get_test_command "$PROJECT_TYPE")
LINT_COMMAND=$(get_lint_command "$PROJECT_TYPE")

cat > "$PROJECT_DIR/.claude/CLAUDE.md" << EOF
# CLAUDE.md - Project Configuration

## Project Overview
Project Type: $PROJECT_TYPE
Directory: $PROJECT_DIR

## Development Workflow

### Build & Test Commands
- Test: \`$TEST_COMMAND\`
- Lint: \`$LINT_COMMAND\`

### Core Principles

1. **Test-Driven Development (TDD)**
   - Write tests before implementation
   - Follow Red-Green-Refactor cycle
   - Maintain high test coverage

2. **Code Quality**
   - All hooks must pass (no exceptions)
   - Fix issues immediately when detected
   - No warnings, only errors that block

3. **Development Process**
   - Research → Plan → Implement (never skip steps)
   - Use reality checkpoints after each feature
   - Validate all changes before proceeding

## Project-Specific Rules
<!-- Add your project-specific guidelines here -->

## Forbidden Practices
- No \`any\` types in TypeScript
- No commented-out code
- No console.log in production code
- No direct DOM manipulation in React
- No mutable state operations
- No skipping tests

## Quick Commands
- \`/tdd\` - Test-driven development guidelines
- \`/check\` - Run all validation checks
- \`/refactor\` - Refactoring best practices

---
*This configuration inherits all global Claude rules and adds project-specific guidelines.*
EOF

print_success "Created CLAUDE.md"

# Create project configuration file
cat > "$PROJECT_DIR/.claude/project.config" << EOF
# Claude Project Configuration
PROJECT_TYPE=$PROJECT_TYPE
TEST_COMMAND="$TEST_COMMAND"
LINT_COMMAND="$LINT_COMMAND"
CREATED_AT=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
EOF

print_success "Created project.config"

# Create .claude-hooks-ignore if it doesn't exist
if [ ! -f "$PROJECT_DIR/.claude-hooks-ignore" ]; then
    cat > "$PROJECT_DIR/.claude-hooks-ignore" << 'EOF'
# Files and patterns to ignore in Claude hooks
node_modules/
dist/
build/
.git/
*.min.js
*.min.css
vendor/
coverage/
EOF
    print_success "Created .claude-hooks-ignore"
fi

# Summary
echo ""
echo -e "${GREEN}╔══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Deployment Complete!              ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""
print_info "Next steps:"
echo "  1. Review and customize .claude/CLAUDE.md"
echo "  2. Test hooks: .claude/hooks/smart-lint.sh"
echo "  3. Configure project-specific rules"
echo ""
print_info "To use: claude-code $PROJECT_DIR"