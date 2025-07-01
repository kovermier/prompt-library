#!/bin/bash
# Update Prompt Index - Runs after edits to prompt files

# Read the input JSON
INPUT=$(cat)

# Extract tool info
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Check if a prompt file was modified
if [[ "$TOOL" =~ ^(Write|Edit|MultiEdit)$ ]] && [[ -n "$FILE_PATH" ]]; then
    # Check if it's in the tasks or frameworks directories and is a .md file
    if [[ "$FILE_PATH" =~ /tasks/.*\.md$ ]] || [[ "$FILE_PATH" =~ /frameworks/.*\.md$ ]]; then
        # Change to the prompt library directory
        cd /mnt/c/Users/kover/documents/github/prompt-library
        
        # Run the index update script
        if [[ -f "tools/index-prompts.py" ]]; then
            python3 tools/index-prompts.py > /dev/null 2>&1
            echo "✅ Prompt index updated after modifying: $(basename "$FILE_PATH")"
        fi
    fi
fi

exit 0