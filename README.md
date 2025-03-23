# Prompt Library

A structured collection of prompts, personas, frameworks, and templates for effective interaction with Large Language Models (LLMs).

## Overview

This repository contains a curated library of prompts organized into categories for different use cases. Each prompt is structured with metadata (using YAML front matter) and content (in Markdown).

## Repository Structure

```
prompt-library/
├── README.md (this file - usage guides, overview)
├── tasks/
│   ├── coding/
│   ├── writing/
│   └── analysis/
├── personas/
│   ├── experts/
│   ├── characters/
│   └── styles/
├── frameworks/
│   ├── decision-making/
│   ├── creativity/
│   ├── problem-solving/
│   └── prompt-structure/
│       └── erts.md (Enhanced Recursive Tagging System)
└── templates/
    ├── basic.md
    ├── advanced.md
    └── erts-template.md
```

## File Format

Each prompt follows a consistent format with YAML front matter for metadata and Markdown content:

```markdown
---
title: "Prompt Title"
category: "category/subcategory"
tags: ["tag1", "tag2", "tag3"]
created: "YYYY-MM-DD"
updated: "YYYY-MM-DD"
version: 1.0
---

# Prompt Title

## Context
Brief description of when and how to use this prompt.

## Prompt Content
The actual prompt text goes here...
```

## Featured Frameworks

### Enhanced Recursive Tagging System (ERTS)

The ERTS framework provides a structured way to create prompts using a hierarchical tagging system. It organizes instructions into categories like Core, Contextual, Options, etc., with a specific syntax for easy LLM interpretation.

To use ERTS:
1. See the full documentation in `frameworks/prompt-structure/erts.md`
2. Use the template provided in `templates/erts-template.md`

Example ERTS tag: `{Category: [Subcategory]<Attributes>}`

## Usage Guidelines

1. **Adding New Prompts**: 
   - Place the prompt in the appropriate category folder
   - Use the template format with YAML front matter
   - Follow naming conventions: lowercase with hyphens (e.g., `expert-react-developer.md`)

2. **Updating Existing Prompts**:
   - Update the 'updated' date in the YAML front matter
   - Increment the version number if making significant changes
   - Document major changes in the commit message

3. **Using Prompts**:
   - Copy the content from the "Prompt Content" section
   - Modify as needed for your specific use case

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a new branch for your changes
3. Add or modify prompts following the format guidelines
4. Submit a pull request with a clear description of your changes

## License

[Insert appropriate license information here]
