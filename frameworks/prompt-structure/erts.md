---
title: "Enhanced Recursive Tagging System (ERTS)"
category: "frameworks/prompt-structure"
tags: ["framework", "tagging", "hierarchy", "llm-interaction"]
created: "2025-03-22"
updated: "2025-03-22"
version: 1.0
---

# Enhanced Recursive Tagging System (ERTS)

## Context
A robust and adaptable framework designed for seamless interaction with Language Model-based models (LLMs). ERTS facilitates the generation of precise instructions for LLMs across various tasks, including legal document analysis, financial reports, technical support responses, and content creation.

## Framework Overview

### Basic Syntax
ERTS employs a hierarchical organization for tags, composed of three parts:
- The category defines the broad classification of the tag
- The subcategory offers specific details
- Attributes provide additional customization options

Tags are separated by a colon (:), categories are enclosed in curly brackets ({}), subcategories in square brackets ([]), and attributes in angle brackets (<>).

```
{Category: [Subcategory]<Attributes>}
```

### Categories
ERTS organizes tags into the following categories:

1. **Core**
   - {Subject}: Defines the primary topic of the task
   - {Objective}: Outlines the main goal or purpose of the task
   - {Constraints}: Lists limitations or restrictions on the output
   - {Output}: Describes the desired format, medium, or structure of the output

2. **Contextual**
   - {Background}: Presents contextual information or background details
   - {Examples}: Supplies relevant examples or references
   - {Resources}: Specifies required resources or materials

3. **Options**
   - {Methodology}: Highlights preferred methods or techniques
   - {Approach}: Details the overall strategy for the task
   - {Theme}: Notes the primary focus or theme of the task

4. **Temporal**
   - {Deadline}: Sets a due date for the task
   - {Duration}: Indicates the task's intended time span

5. **Task-specific**
   - {Content}: Describes the content for the output
   - {Data}: Identifies necessary data or information
   - {Creative}: Notes required creative elements
   - {Technical}: Specifies technical requirements or aspects

6. **Communication**
   - {Audience}: Identifies the target audience for the output
   - {Format}: Describes the output's format or medium
   - {Channels}: Lists channels or methods for communication

7. **Assessment**
   - {Criteria}: Establishes standards or benchmarks for assessment
   - {Metrics}: Details metrics or measurements for evaluation
   - {Feedback}: Specifies the type of feedback to incorporate

### Recursive Structure
ERTS employs a recursive structure, supporting arbitrary depth and arbitrary length of lists within categories, enabling users to create custom, intricate tags extendable for any use case or task.

**Syntax:**
```
{Category(K): [Subcategory(N)]<Attributes(A)>}
```

This syntax implies a specific category (K) can have an arbitrary length of subcategories (N) and attributes (A). Users can create subcategories within existing subcategories to add depth and complexity to tags.

**Examples:**
```
{Category(Research): [Subcategory(Topic), Subcategory(Methodology), Subcategory(Sources)]<Attributes(Language, Region)>}
{Category(Presentation): [Subcategory(Format), Subcategory(Style), Subcategory(Audience)]<Attributes(Platform, Interaction)>}
{Category(Assessment): [Subcategory(Criteria), Subcategory(Metrics)]<Attributes(Weighting, Threshold)>}
```

## Best Practices
To optimize the use of the Enhanced Recursive Tagging System, consider these best practices:

1. Use relevant and specific tags: Employ tags that accurately represent the task, ensuring the LLM understands your instructions.
2. Maintain simplicity: Avoid overly complex tags or structures; the objective is to provide clear, concise instructions to the LLM.
3. Be consistent: Implement consistent naming conventions and formats for tags to enhance comprehension.
4. Iterate and refine: Test and adjust tags as needed, optimizing interactions with the LLM and enhancing output quality.

## Usage Template
When implementing ERTS for a new prompt, follow this template:

```
[ERTS FRAMEWORK IMPLEMENTATION]

{Subject: [YOUR_SUBJECT]}
{Objective: [YOUR_OBJECTIVE]}
{Constraints: [YOUR_CONSTRAINTS]}
{Output: [YOUR_DESIRED_OUTPUT_FORMAT]}

{Background: [RELEVANT_BACKGROUND]}
{Examples: [RELATED_EXAMPLES]}

// Add other relevant tags as needed

[YOUR PROMPT CONTENT]
```

Replace placeholder text with your specific requirements and prompt content.
