#!/bin/bash
# No Comments Rule - Prevents adding comments to code

# Read the input JSON
INPUT=$(cat)

# Extract tool info
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Check if it's a code file
is_code_file() {
    [[ "$1" =~ \.(ts|tsx|js|jsx|py|java|c|cpp|go|rs|rb|php|swift|kt|scala|cs)$ ]]
}

# For Write tool
if [[ "$TOOL" == "Write" ]] && is_code_file "$FILE_PATH"; then
    CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
    
    # Check for common comment patterns
    if echo "$CONTENT" | grep -E '^\s*(//|/\*|#|"""|\'\'\')\s*[A-Z]' > /dev/null; then
        echo '{
            "block": true,
            "message": "❌ No comments allowed in code. Write self-documenting code instead."
        }' | jq -c
        exit 0
    fi
fi

# For Edit/MultiEdit
if [[ "$TOOL" =~ ^(Edit|MultiEdit)$ ]] && is_code_file "$FILE_PATH"; then
    if [[ "$TOOL" == "Edit" ]]; then
        NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')
        
        if echo "$NEW_STRING" | grep -E '^\s*(//|/\*|#|"""|\'\'\')\s*[A-Z]' > /dev/null; then
            echo '{
                "block": true,
                "message": "❌ No comments allowed in code. Write self-documenting code instead."
            }' | jq -c
            exit 0
        fi
    else
        # For MultiEdit, check each edit
        EDITS=$(echo "$INPUT" | jq -r '.tool_input.edits[]?.new_string // empty')
        while IFS= read -r edit; do
            if [[ -n "$edit" ]] && echo "$edit" | grep -E '^\s*(//|/\*|#|"""|\'\'\')\s*[A-Z]' > /dev/null; then
                echo '{
                    "block": true,
                    "message": "❌ No comments allowed in code. Write self-documenting code instead."
                }' | jq -c
                exit 0
            fi
        done <<< "$EDITS"
    fi
fi

exit 0