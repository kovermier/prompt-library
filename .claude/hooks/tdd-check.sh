#!/bin/bash
# TDD Enforcement Hook - Ensures tests exist before writing production code

# Read the input JSON
INPUT=$(cat)

# Extract tool name and file path
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only check for Write/Edit/MultiEdit tools on non-test files
if [[ "$TOOL" =~ ^(Write|Edit|MultiEdit)$ ]] && [[ -n "$FILE_PATH" ]]; then
    # Skip if it's a test file
    if [[ "$FILE_PATH" =~ \.(test|spec)\.(ts|tsx|js|jsx)$ ]] || [[ "$FILE_PATH" =~ __tests__/ ]]; then
        exit 0
    fi
    
    # Skip if it's not a code file
    if [[ ! "$FILE_PATH" =~ \.(ts|tsx|js|jsx|py|java|c|cpp|go|rs)$ ]]; then
        exit 0
    fi
    
    # Derive potential test file paths
    BASE_NAME=$(basename "$FILE_PATH" | sed 's/\.[^.]*$//')
    DIR_NAME=$(dirname "$FILE_PATH")
    
    # Check for corresponding test files
    TEST_EXISTS=false
    for test_pattern in "${BASE_NAME}.test" "${BASE_NAME}.spec" "${BASE_NAME}_test"; do
        for ext in ts tsx js jsx; do
            if [[ -f "${DIR_NAME}/${test_pattern}.${ext}" ]] || [[ -f "${DIR_NAME}/__tests__/${test_pattern}.${ext}" ]]; then
                TEST_EXISTS=true
                break 2
            fi
        done
    done
    
    if [[ "$TEST_EXISTS" == "false" ]]; then
        echo '{
            "block": true,
            "message": "❌ TDD Violation: No test file found for '"$FILE_PATH"'. Write tests first! (Red-Green-Refactor)"
        }' | jq -c
        exit 0
    fi
fi

# Allow the operation
exit 0