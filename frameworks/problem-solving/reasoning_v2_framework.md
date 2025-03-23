---
title: "Reasoning v2 Framework"
category: "frameworks/problem-solving"
tags: ["reasoning", "problem-solving", "critical thinking", "analysis", "solution generation"]
created: "2024-03-22"
updated: "2024-03-22"
version: 1.0
author: "Original Author"
model_requirements: "Advanced language models (GPT-4 or equivalent)"
---

# Reasoning v2 Framework: Enhanced Problem-Solving Methodology

## Context
The Reasoning v2 Framework provides a comprehensive, step-by-step approach to problem-solving that emphasizes rigorous analysis, multiple solution generation, and critical review. It's designed to enhance the quality of reasoning by ensuring no crucial steps are skipped, potential biases are identified, and solutions are optimized for accuracy and effectiveness. This framework can be applied to virtually any type of problem or query.

## Problem Statement
Many problem-solving approaches lack systematic methodology, leading to incomplete analysis, overlooked alternatives, or solutions that don't fully address all aspects of the problem. The Reasoning v2 Framework addresses this by providing a structured, comprehensive process that guides the problem solver through all necessary steps from initial comprehension to final solution delivery.

## Framework Structure

The framework consists of eight sequential processing steps, each building on the previous:

### 1. Input Comprehension
```
<input_comprehension>
- Language parsing
- Semantic analysis
- Intent recognition
- Emotion/tone detection
- Forward processing (starting from given information)
- Backward processing (working from potential solutions)
- Bias awareness
</input_comprehension>
```

This step ensures complete understanding of the problem statement, including explicit and implicit components.

### 2. Contextual and Constraint Analysis
```
<contextual_analysis>
- Relation to previous context
- Consistency maintenance
- Ambiguity resolution
- Questioning assumed constraints
- Considering non-standard operations
- Defining problem boundaries
</contextual_analysis>
```

This step examines the problem in its broader context and identifies all relevant constraints and assumptions.

### 3. Knowledge Retrieval and Integration
```
<knowledge_retrieval>
- Accessing relevant information
- Integrating from multiple sources
- Fact-checking
- Identifying key relationships
- Connecting to established principles
- Leveraging domain-specific knowledge
</knowledge_retrieval>
```

This step ensures that all relevant knowledge is brought to bear on the problem.

### 4. Solution Generation and Optimization
```
<solution_generation>
- Creating multiple diverse approaches
- Seeking the simplest solution
- Iterative simplification
- Pattern recognition bias awareness
- Tailoring to problem specifics
- Considering novel combinations
</solution_generation>
```

This step focuses on generating and optimizing potential solutions.

### 5. Critical Review and Refinement
```
<critical_review>
- Reviewing each solution step
- Ensuring logical consistency
- Identifying improvements or simplifications
- Attention to detail
- Accuracy verification
- Edge case consideration
</critical_review>
```

This step subjects potential solutions to rigorous critical analysis.

### 6. Response Formulation
```
<response_formulation>
- Appropriate language modeling
- Tone and style adaptation
- Clarity and conciseness
- Structure and organization
- Emphasis on key points
- Anticipating follow-up questions
</response_formulation>
```

This step focuses on communicating the solution effectively.

### 7. Ethical and Policy Compliance
```
<ethical_compliance>
- Content moderation
- Bias mitigation
- User safety considerations
- Ethical principle application
- Potential impact assessment
- Alignment with established policies
</ethical_compliance>
```

This step ensures the solution meets ethical standards and policy requirements.

### 8. Final Output
```
<final_output>
- Response refinement
- Readability formatting
- Delivery preparation
- Conciseness balancing
- Key information highlighting
- Action item clarification
</final_output>
```

This step finalizes the solution for presentation.

## Implementation Guidelines

For effective implementation of the Reasoning v2 Framework:

1. **Sequential Processing**: Follow all steps in order, as each builds on the previous
2. **Thorough Documentation**: Record your thinking at each stage using the provided tags
3. **Multiple Solutions**: Generate at least 2-3 distinct approaches before selecting one
4. **Simplification**: Always seek the simplest valid solution after initial generation
5. **Criticism**: Rigorously critique your own solution before finalizing

## Usage Example

### Complex Math Problem

```
<user_query>
Three people check into a hotel. They pay $30 to the manager and go to their room. The manager finds out that the room rate is $25 and gives $5 to the bellboy to return to the people. On the way to the room the bellboy reasons that $5 would be difficult to share among three people so he pockets $2 and gives $1 to each person. Now each person paid $10 and got back $1. So they paid $9 each, totaling $27. The bellboy has $2, totaling $29. Where is the remaining $1?
</user_query>

<input_comprehension>
This is a classic misdirection math puzzle. The query presents a scenario involving money and accounting, with an apparent discrepancy in the final sum. The puzzle involves:
- 3 people initially paying $30 total ($10 each)
- Manager finding that the actual cost is $25
- $5 given to bellboy to return
- Bellboy keeps $2 and returns $1 to each person
- Final accounting shows $27 paid by guests plus $2 kept by bellboy equals $29
- Query asks where the "missing" $1 is
</input_comprehension>

<contextual_analysis>
The key constraint here is that we need to properly track the money flow. The question assumes a particular accounting method that's creating confusion. There's an implicit assumption that adding what the guests paid minus refunds ($27) to what the bellboy kept ($2) should equal the original amount ($30), but this is a flawed approach to the accounting.
</contextual_analysis>

<knowledge_retrieval>
This is a well-known logical fallacy puzzle that depends on improper accounting. The proper way to account for the money is:
- Track where the original $30 went
- Alternatively, create a balanced accounting equation
- Understand that adding what guests paid after refunds + bellboy's take is not mathematically meaningful
</knowledge_retrieval>

<solution_generation>
Approach 1: Track the original $30
- $25 went to the hotel
- $3 went back to the guests ($1 each)
- $2 went to the bellboy
- Total: $25 + $3 + $2 = $30, so all money is accounted for

Approach 2: Correct the accounting equation
- The guests paid $27 net ($30 - $3)
- The hotel received $25
- The bellboy received $2
- $27 = $25 + $2, which balances perfectly

Approach 3: Identify the logical error
- Adding what guests paid after refunds ($27) + bellboy's take ($2) is mixing two different accounting perspectives
- The correct equation is either:
  a) Original payment = Hotel + Bellboy + Refunds: $30 = $25 + $2 + $3
  b) Net guest payment = Hotel + Bellboy: $27 = $25 + $2
</solution_generation>

<critical_review>
Approach 3 most clearly identifies the fallacy. The error in the puzzle is trying to add:
- What the guests paid minus refunds ($27)
- What the bellboy kept ($2)

This addition is mathematically meaningless because it's double-counting. The $2 the bellboy kept is already part of the $27 net payment (specifically, it's part of the $25 that went to the hotel, which the manager then gave $5 from, of which $2 went to the bellboy).

The simplest explanation is Approach 2: The guests paid $27 net, which exactly equals what the hotel received ($25) plus what the bellboy received ($2).
</critical_review>

<response_formulation>
I'll explain this classic misdirection puzzle by tracking where all the money went and identifying the accounting error in the problem statement.
</response_formulation>

<ethical_compliance>
The response provides educational content about a math puzzle with no ethical concerns. It promotes clear thinking and helps dispel a common mathematical misconception.
</ethical_compliance>

<final_output>
The "missing dollar" doesn't actually exist - it's an accounting error in how the problem is presented.

Let's trace the money properly:
- The guests initially paid $30
- The hotel kept $25
- The bellboy kept $2
- The guests received $3 back ($1 each)
- Total: $25 + $2 + $3 = $30 (all accounted for)

The error in the puzzle is adding the $27 (what guests paid minus refunds) to the $2 (what the bellboy kept). This is invalid accounting because the $2 the bellboy kept is already accounted for in the $27.

The correct equation is: Net payment ($27) = Hotel revenue ($25) + Bellboy tip ($2)

Everything balances perfectly when you track the money flows correctly!
</final_output>
```

## Performance Notes
The Reasoning v2 Framework excels at complex problems that benefit from thorough analysis and structured thinking. It's particularly effective for:

- Problems with subtle logical fallacies
- Situations requiring multiple perspective consideration
- Complex scenarios with many variables
- Questions requiring careful factual analysis
- Problems where initial intuitions may be misleading

While comprehensive, the framework can be applied efficiently by experienced users who internalize the process. For straightforward queries, certain steps can be processed more quickly while still maintaining the overall structure.

## Limitations
- May be unnecessarily comprehensive for simple, straightforward queries
- Requires significant cognitive resources to apply fully
- Documentation of all steps can be time-consuming
- Some steps may seem redundant for certain problem types

## Changelog
- v1.0 (2024-03-22): Initial standardized version with YAML frontmatter
- Original version: Framework development and documentation