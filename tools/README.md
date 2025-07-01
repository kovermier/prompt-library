# Prompt Library Search Tools

This directory contains tools for efficiently searching and navigating the prompt library.

## Quick Start

From the repository root:

```bash
# Search for prompts
./search "code review"
./search -t optimization debugging
./search -r "I need to analyze data"

# Update index after changes
./update-index
```

## Tools Overview

### 🔍 `search-prompts.py`
The main search engine with multiple search modes:

- **Keyword search**: `./search "your query"`
- **Tag search**: `./search -t tag1 tag2`
- **Category filter**: `./search -c "tasks/coding"`
- **Archetype search**: `./search -a "Clarity Architect"`
- **Similarity**: `./search -s "article writer"`
- **Recommendations**: `./search -r "analyze customer feedback"`

### 🗂️ `index-prompts.py`
Creates and updates the searchable index of all prompts:

- Extracts metadata from YAML frontmatter
- Builds searchable descriptions
- Tracks tags, categories, and archetypes
- Outputs to `prompt-index.json`

### 📊 `context-analyzer.py`
Analyzes prompts for context engineering optimization opportunities:

- Calculates token usage and redundancy
- Identifies optimization patterns
- Suggests context engineering techniques
- Generates optimization reports

Usage:
```bash
# Analyze all prompts
python3 tools/context-analyzer.py

# Analyze specific category
python3 tools/context-analyzer.py -c tasks/writing

# Export detailed JSON report
python3 tools/context-analyzer.py -j analysis.json

# Save report to file
python3 tools/context-analyzer.py -o optimization-report.md
```

### 📊 Generated Files

- **`prompt-index.json`**: Searchable metadata for all prompts
- **`prompt-dashboard.md`**: Quick reference guide

## Search Examples

```bash
# Find code-related prompts
./search "code"
./search -t coding optimization

# Get writing help
./search "article"
./search -c "tasks/writing"

# Explore vibecoding
./search --list-archetypes
./search -a "Truth Builder"

# Find similar prompts
./search -s "data analysis"

# Get task recommendations
./search -r "I need to debug Python code"

# Detailed results with descriptions
./search -v "machine learning"
```

## Advanced Usage

### Combining Searches
Use the search results to build prompt combinations:

1. Find base prompt: `./search "code review"`
2. Add framework: `./search "METRICS"`
3. Enhance with archetype: `./search -a "Truth Builder"`

### Maintenance
- Run `./update-index` after adding/modifying prompts
- Check `prompt-index.json` for indexing issues
- Use `-v` flag to verify descriptions are being extracted correctly

## Search Modes Explained

| Mode | Flag | Purpose | Example |
|------|------|---------|---------|
| Keyword | (default) | Full-text search | `./search "optimization"` |
| Tags | `-t` | Match specific tags | `./search -t debugging performance` |
| Category | `-c` | Filter by directory | `./search -c "frameworks"` |
| Archetype | `-a` | Vibecoding search | `./search -a "Clarity"` |
| Similar | `-s` | Find related prompts | `./search -s "article writer"` |
| Recommend | `-r` | Task-based suggestions | `./search -r "analyze logs"` |

## Integration with Git

Consider adding these to your git hooks:

```bash
# .git/hooks/post-merge
#!/bin/bash
./update-index

# .git/hooks/post-checkout
#!/bin/bash
./update-index
```

This ensures the search index stays current with repository changes.