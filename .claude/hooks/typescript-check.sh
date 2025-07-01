#!/bin/bash
# TypeScript Strict Mode Validation Hook

# Read the input JSON
INPUT=$(cat)

# Extract tool info
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# For Write tool, check content
if [[ "$TOOL" == "Write" ]] && [[ "$FILE_PATH" =~ \.(ts|tsx)$ ]]; then
    CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
    
    # Check for 'any' type usage
    if echo "$CONTENT" | grep -E ':\s*any\b|<any>|as\s+any\b' > /dev/null; then
        echo '{
            "block": true,
            "message": "❌ TypeScript violation: Use of '\''any'\'' type detected. Use '\''unknown'\'' or proper types instead."
        }' | jq -c
        exit 0
    fi
    
    # Check for @ts-ignore or @ts-expect-error without explanation
    if echo "$CONTENT" | grep -E '@ts-(ignore|expect-error)\s*$' > /dev/null; then
        echo '{
            "block": true,
            "message": "❌ TypeScript violation: @ts-ignore or @ts-expect-error must have an explanation."
        }' | jq -c
        exit 0
    fi
fi

# For Edit/MultiEdit, check the new_string
if [[ "$TOOL" =~ ^(Edit|MultiEdit)$ ]] && [[ "$FILE_PATH" =~ \.(ts|tsx)$ ]]; then
    if [[ "$TOOL" == "Edit" ]]; then
        NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')
        
        if echo "$NEW_STRING" | grep -E ':\s*any\b|<any>|as\s+any\b' > /dev/null; then
            echo '{
                "block": true,
                "message": "❌ TypeScript violation: Use of '\''any'\'' type detected in edit. Use '\''unknown'\'' or proper types instead."
            }' | jq -c
            exit 0
        fi
    fi
fi

exit 0