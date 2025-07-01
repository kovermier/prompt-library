#!/bin/bash
# Log Bash Commands - Keeps track of executed commands

# Read the input JSON
INPUT=$(cat)

# Extract command and description
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // "No description"')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Create log directory if it doesn't exist
LOG_DIR="/mnt/c/Users/kover/documents/github/prompt-library/.claude/logs"
mkdir -p "$LOG_DIR"

# Log the command
echo "[$TIMESTAMP] $COMMAND - $DESCRIPTION" >> "$LOG_DIR/bash-commands.log"

exit 0