# Personas Directory Deprecation Guide

## Overview

The `personas/` directory is being deprecated in favor of integrating persona-based prompts directly into the relevant task categories. This change simplifies the repository structure and makes it easier to find and use persona prompts for specific tasks.

## New Structure

Personas are now organized within each task category:

```
tasks/
├── coding/
│   └── personas/
│       ├── experts/          # Professional coding personas
│       └── characters/       # Creative coding personas
├── writing/
│   └── personas/
│       ├── experts/          # Professional writing personas
│       ├── characters/       # Creative writing personas
│       └── styles/           # Writing styles
├── analysis/
│   └── personas/
│       ├── experts/          # Professional analysis personas
│       └── characters/       # Creative analysis personas
└── etc/
    └── personas/             # Other specialized personas
```

## Migration Process

1. All files from the `personas/` directory have been migrated to their appropriate task categories
2. File paths in the YAML front matter have been updated to reflect the new location
3. The README.md has been updated to reflect the new structure

## Migration Script

For convenience, we've provided two migration scripts:
- `migrate_personas.sh` (Bash script for Linux/Mac)
- `migrate_personas.ps1` (PowerShell script for Windows)

These scripts will copy any remaining persona files to the appropriate task categories and update their metadata.

## Recommendations

1. After verifying the migration was successful, the original `personas/` directory can be safely removed
2. Update any documentation or links that reference the old structure
3. For future contributions, place persona prompts in the appropriate task category

## Rationale

This reorganization:
- Eliminates confusion between task-based and persona-based organization
- Makes it easier to find relevant personas for specific tasks
- Simplifies the top-level repository structure
- Follows a more intuitive organization pattern

For any questions about this reorganization, please open an issue on the repository.
