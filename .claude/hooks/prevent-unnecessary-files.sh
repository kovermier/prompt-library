#!/bin/bash
# Prevent Unnecessary File Creation - Blocks creation of docs unless explicitly requested

# Read the input JSON
INPUT=$(cat)

# Extract tool info
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only check Write tool for new files
if [[ "$TOOL" == "Write" ]] && [[ -n "$FILE_PATH" ]]; then
    # Check if file already exists
    if [[ ! -f "$FILE_PATH" ]]; then
        # Check if it's a documentation file
        if [[ "$FILE_PATH" =~ \.(md|MD|txt|rst|adoc)$ ]] || [[ "$FILE_PATH" =~ README|readme|CHANGELOG|changelog ]]; then
            # Get conversation context hint from tool description if available
            DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty' | tr '[:upper:]' '[:lower:]')
            
            # Allow if explicitly requested (would need conversation context)
            if [[ "$DESCRIPTION" =~ (document|documentation|readme|explicitly|requested) ]]; then
                exit 0
            fi
            
            echo '{
                "block": true,
                "message": "❌ Documentation file creation blocked. Only create docs when explicitly requested by the user."
            }' | jq -c
            exit 0
        fi
    fi
fi

exit 0