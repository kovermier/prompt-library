# 🧠 Prompt Engineering Library

A comprehensive collection of cutting-edge prompts, personas, frameworks, and templates for maximizing the capabilities of Large Language Models (LLMs).

<div align="center">
  <img src="https://img.shields.io/badge/Frameworks-9-blue" alt="Frameworks">
  <img src="https://img.shields.io/badge/Prompts-20+-green" alt="Prompts">
  <img src="https://img.shields.io/badge/Version-2.0-orange" alt="Version">
</div>

## 🌟 Overview

This repository contains a curated library of prompting techniques organized into categories for different use cases. Each component is structured with clear metadata and content, designed for immediate use or customization. Our goal is to provide a comprehensive resource for prompt engineering and LLM interaction.

## 📚 Repository Structure

```
prompt-library/
├── README.md (this file - usage guides, overview)
├── tasks/             # Task-specific prompts
│   ├── coding/        # Code generation, review, optimization
│   ├── writing/       # Content creation and editing
│   └── analysis/      # Data and content analysis
├── personas/          # Role-based prompting
│   ├── experts/       # Domain specialist personas
│   ├── characters/    # Creative and fictional personas
│   └── styles/        # Writing and communication styles
├── frameworks/        # Advanced prompting frameworks
│   ├── ECARLM/        # Elementary Cellular Automata Reasoning
│   ├── fractal/       # Multi-scale reasoning approach
│   ├── EGAF/          # Enhanced Global Analysis Framework
│   ├── elsf/          # Enhanced Logic-Based Synergistic Framework
│   ├── mcpa/          # Modular Context Protocol Architecture
│   ├── metricsplus/   # Layered analytical framework
│   ├── reasoning/     # Structured reasoning framework
│   ├── decision-making/ # Decision-specific frameworks
│   ├── creativity/    # Creative process frameworks
│   └── prompt-structure/ # Meta-frameworks for prompt design
└── templates/         # Reusable prompt templates
    ├── basic.md       # Simple prompt structure
    ├── advanced.md    # Advanced prompt with all features
    └── erts-template.md # ERTS framework template
```

## 📋 File Format

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

## 🏆 Featured Frameworks

### 🔄 Modular Context Protocol Architecture (MCPA)

Our newest framework extends Anthropic's Model Context Protocol (MCP) with specialized protocols for advanced reasoning. It provides standardized interfaces for context management, tool orchestration, and multimodal reasoning while integrating strengths from our other frameworks.

Key features:
- Protocol-driven context exchange
- Modular processing components
- Seamless tool integration
- Native multimodal reasoning
- Comprehensive evaluation methodology

Documentation: [frameworks/mcpa/mcpa_framework.md](frameworks/mcpa/mcpa_framework.md)

### 🧩 Enhanced Recursive Tagging System (ERTS)

The ERTS framework provides a structured way to create prompts using a hierarchical tagging system. It organizes instructions into categories with a specific syntax for easy LLM interpretation.

Example ERTS tag: `{Category: [Subcategory]<Attributes>}`

Documentation: [frameworks/prompt-structure/erts.md](frameworks/prompt-structure/erts.md)

### 📊 METRICS+

A layered analytical framework that processes information through multiple perspectives:
1. Direct Analysis (explicit requirements)
2. Meta Analysis (assumptions and biases)
3. Pattern Recognition (cross-domain patterns)
4. Knowledge Integration (research and experience)
5. Emotional Processing (human factors)

Documentation: [frameworks/metricsplus/metrics_plus_framework.md](frameworks/metricsplus/metrics_plus_framework.md)

### 🌀 Fractal Framework

A multi-scale approach to problem-solving that analyzes challenges at three levels:
- Macro Scale: Overall cognitive architecture
- Meso Scale: Component-level analysis
- Micro Scale: Implementation details

Documentation: [frameworks/fractal/fractal_framework.md](frameworks/fractal/fractal_framework.md)

## 🚀 Usage Guidelines

1. **Adding New Prompts**: 
   - Place the prompt in the appropriate category folder
   - Use the template format with YAML front matter
   - Follow naming conventions: lowercase with hyphens (e.g., `expert-react-developer.md`)

2. **Updating Existing Prompts**:
   - Update the 'updated' date in the YAML front matter
   - Increment the version number if making significant changes
   - Document major changes in the commit message

3. **Applying Frameworks**:
   - Study the framework documentation thoroughly
   - Use the provided templates when available
   - Combine frameworks for complex use cases

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a new branch for your changes
3. Add or modify content following the format guidelines
4. Submit a pull request with a clear description of your changes

## 📜 License

[MIT License](LICENSE) - Feel free to use, modify, and distribute this content with proper attribution.

---

<div align="center">
  <p>Built with ❤️ by the prompt engineering community</p>
  <p>Last updated: March 22, 2025</p>
</div>
