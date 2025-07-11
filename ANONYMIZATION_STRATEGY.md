# Anonymization Strategy

## Replacement Mappings

### Personal Names
- `Kurt Overmier` → `[Your Name]` or `[Author]` (context-dependent)
- `Kurt` (in personal preference contexts) → `the user`

### Usernames & Accounts
- `kovermier` → `[your-github-username]`
- `kover` (in file paths) → `[username]`

### Project Names
- `TamlyNO` / `tamlyno` / `TamlyNO.com` → `[Project A]` (spiritual services project)
- `SmartBrandStrategies` / `SBS` → `[Project B]` (AI worker project)
- `FoodFiles` / `foodfiles` → `[Project C]` (food tracking project)

### Path Replacements
- `C:\Users\kover\Documents\GitHub\` → `~/projects/`
- `/mnt/c/Users/kover/documents/github/` → `~/projects/`
- `C:\Users\kover\AppData\Roaming\Claude\` → `~/.claude/`

### URL Replacements
- `https://github.com/kovermier/prompt-library/` → `https://github.com/[your-username]/prompt-library/`

## Implementation Plan

1. Start with configuration files (CLAUDE.md, claude-improved.md)
2. Update command files in .claude/commands/
3. Update task files with author references
4. Update prompt-index.json
5. Update README.md
6. Remove or genericize project-specific command references

## Notes
- Keep functional references intact (e.g., framework names, tool names)
- Maintain file structure and relationships
- Ensure all command references remain functional
- Create placeholder files for removed project-specific commands