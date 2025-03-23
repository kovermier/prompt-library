# Prompt Library

A structured collection of prompts, frameworks, personas, and templates for working with large language models.

## Structure

```
prompt-library/
├── README.md (usage guides, overview)
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
│   └── problem-solving/
├── chains/
│   ├── content_development_chain.md
│   └── visual_content_chain.md
└── templates/
    ├── basic.md
    └── advanced.md
```

## Prompt Format

All prompts use Markdown with YAML front matter for metadata:

```markdown
---
title: "Title of the Prompt"
category: "category/subcategory"
tags: ["tag1", "tag2", "tag3"]
created: "YYYY-MM-DD"
updated: "YYYY-MM-DD"
version: 1.0
author: "Your Name"
---

# Title of the Prompt

## Context
Brief explanation of when and how to use this prompt.

## Prompt Content
The actual prompt text goes here...
```

## Usage

### Creating a New Prompt

1. Choose the appropriate category directory
2. Copy one of the templates from the `templates/` directory
3. Fill in the YAML front matter metadata and prompt content
4. Save the file with a descriptive name using kebab-case (e.g., `expert-react-developer.md`)

### Working with Prompt Chains

Prompt chains connect multiple prompts in a workflow where the output of one prompt becomes the input for the next. Prompt chains can be found in the `chains/` directory and include detailed instructions for each stage of the workflow.

### Finding Prompts

Prompts can be found by:
- Browsing the directory structure
- Checking the YAML frontmatter for tags and categories
- Using Git search functionality

### Contributing

When contributing to this library:
1. Follow the established directory structure
2. Use the provided templates
3. Include all required metadata
4. Test your prompts before submission
5. Submit a pull request with a clear description of your addition

## License

[Add your license information here]