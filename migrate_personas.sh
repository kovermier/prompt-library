#!/bin/bash
# migrate_personas.sh - Script to migrate persona files into tasks directory
# Usage: bash migrate_personas.sh

# Define base directories
PERSONA_DIR="C:/Users/kover/Documents/GitHub/prompt-library/personas"
TASKS_DIR="C:/Users/kover/Documents/GitHub/prompt-library/tasks"

# Create necessary directories if they don't exist
mkdir -p "$TASKS_DIR/writing/personas/experts"
mkdir -p "$TASKS_DIR/writing/personas/characters"
mkdir -p "$TASKS_DIR/writing/personas/styles"
mkdir -p "$TASKS_DIR/analysis/personas/experts"
mkdir -p "$TASKS_DIR/analysis/personas/characters"
mkdir -p "$TASKS_DIR/etc/personas/experts"
mkdir -p "$TASKS_DIR/etc/personas/characters"

# Process experts
for file in "$PERSONA_DIR/experts/"*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    
    # Check file content to determine category
    if grep -q "coding\|programming\|developer" "$file"; then
      # Already migrated coding experts
      if [ "$filename" != "react_developer.md" ]; then
        cp "$file" "$TASKS_DIR/coding/personas/experts/$filename"
        sed -i 's/personas\/experts/tasks\/coding\/personas\/experts/g' "$TASKS_DIR/coding/personas/experts/$filename"
      fi
    elif grep -q "writing\|content\|copywriting" "$file"; then
      cp "$file" "$TASKS_DIR/writing/personas/experts/$filename"
      sed -i 's/personas\/experts/tasks\/writing\/personas\/experts/g' "$TASKS_DIR/writing/personas/experts/$filename"
    elif grep -q "analysis\|analytics\|data" "$file"; then
      cp "$file" "$TASKS_DIR/analysis/personas/experts/$filename"
      sed -i 's/personas\/experts/tasks\/analysis\/personas\/experts/g' "$TASKS_DIR/analysis/personas/experts/$filename"
    else
      cp "$file" "$TASKS_DIR/etc/personas/experts/$filename"
      sed -i 's/personas\/experts/tasks\/etc\/personas\/experts/g' "$TASKS_DIR/etc/personas/experts/$filename"
    fi
  fi
done

# Process characters
for file in "$PERSONA_DIR/characters/"*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    
    # Check file content to determine category
    if grep -q "coding\|programming\|developer" "$file"; then
      # Already migrated coding characters
      if [ "$filename" != "hackerman_code_reviewer.md" ]; then
        cp "$file" "$TASKS_DIR/coding/personas/characters/$filename"
        sed -i 's/personas\/characters/tasks\/coding\/personas\/characters/g' "$TASKS_DIR/coding/personas/characters/$filename"
      fi
    elif grep -q "writing\|content\|copywriting" "$file"; then
      cp "$file" "$TASKS_DIR/writing/personas/characters/$filename"
      sed -i 's/personas\/characters/tasks\/writing\/personas\/characters/g' "$TASKS_DIR/writing/personas/characters/$filename"
    elif grep -q "analysis\|analytics\|data" "$file"; then
      cp "$file" "$TASKS_DIR/analysis/personas/characters/$filename"
      sed -i 's/personas\/characters/tasks\/analysis\/personas\/characters/g' "$TASKS_DIR/analysis/personas/characters/$filename"
    else
      cp "$file" "$TASKS_DIR/etc/personas/characters/$filename"
      sed -i 's/personas\/characters/tasks\/etc\/personas\/characters/g' "$TASKS_DIR/etc/personas/characters/$filename"
    fi
  fi
done

# Process styles if any
for file in "$PERSONA_DIR/styles/"*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    cp "$file" "$TASKS_DIR/writing/personas/styles/$filename"
    sed -i 's/personas\/styles/tasks\/writing\/personas\/styles/g' "$TASKS_DIR/writing/personas/styles/$filename"
  fi
done

echo "Migration complete. Please review the migrated files and test functionality before removing the original personas directory."
