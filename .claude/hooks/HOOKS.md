# Claude Code Hooks Configuration

This directory contains hook scripts that enforce the coding standards and practices defined in CLAUDE.md.

## Active Hooks

### PreToolUse Hooks

1. **TDD Check** (`tdd-check.sh`)
   - Ensures test files exist before allowing production code changes
   - Blocks Write/Edit operations on code files without corresponding tests
   - Enforces Red-Green-Refactor cycle

2. **TypeScript Validation** (`typescript-check.sh`)
   - Prevents use of `any` type
   - Requires explanations for `@ts-ignore` and `@ts-expect-error`
   - Enforces strict TypeScript practices

3. **No Comments** (`no-comments.sh`)
   - Blocks addition of comments in code files
   - Enforces self-documenting code principle

4. **Prevent Unnecessary Files** (`prevent-unnecessary-files.sh`)
   - Blocks creation of documentation files unless explicitly requested
   - Prevents README.md creation without user request

### PostToolUse Hooks

1. **Update Prompt Index** (`update-prompt-index.sh`)
   - Automatically updates prompt-index.json after modifying prompts
   - Runs after edits to files in tasks/ or frameworks/ directories

2. **Log Bash Commands** (`log-bash-commands.sh`)
   - Logs all executed bash commands with timestamps
   - Creates audit trail in .claude/logs/bash-commands.log

## Hook Configuration

Hooks are configured in `.claude/settings.json`. Each hook entry includes:
- `match`: Array of tool names to intercept
- `command`: Path to the hook script
- `description`: Purpose of the hook

## Activation

Hooks may require Claude Code to be restarted to take effect. If hooks aren't working:
1. Ensure scripts are executable (`chmod +x`)
2. Check that paths in settings.json are absolute
3. Restart Claude Code session

## Testing Hooks

To test if hooks are active:
1. Try creating a file without tests - should be blocked by TDD hook
2. Try adding `any` type to TypeScript - should be blocked
3. Check .claude/logs/ for bash command logs after running commands