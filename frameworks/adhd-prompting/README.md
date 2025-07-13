# ADHD Prompting Framework

## Core Insight
ADHD communication patterns optimize for the same constraints LLMs face: limited working memory, context degradation, and attention management. What helps ADHD brains helps AI models.

## The Context Window Analogy

| ADHD Brain | LLM Processing |
|------------|----------------|
| Working memory: 3-7 chunks | Context window: Token limit |
| Attention drift over time | Attention degradation with distance |
| Executive function overhead | Instruction parsing complexity |
| Pattern matching preference | Statistical pattern recognition |

## Quick Start Template

```markdown
🎯 TASK: [One clear action]
📋 CONTEXT: [3 key facts max]
✅ OUTPUT: [Specific format]
⚠️ CONSTRAINTS: [Hard limits]
```

## Core Patterns

### 1. Front-Load Critical Info
```markdown
❌ BAD: "I've been thinking about maybe implementing..."
✅ GOOD: "TASK: Implement cache | CONTEXT: High-traffic API | NEED: Redis example"
```

### 2. Structure as Semantic Anchors
```markdown
🎯 OBJECTIVE: Build auth system
🔧 TOOLS: JWT, bcrypt
⏱️ DEADLINE: 2 hours
🚫 AVOID: Session storage
```

### 3. Explicit State Management
```markdown
CURRENT: Database connected
NEXT: Add indexes
REMEMBER: Connection string = xyz
```

### 4. Progressive Disclosure
```markdown
MAIN TASK: Deploy app

DETAILS (if needed):
- Environment: Production
- Server: Cloudflare Workers
- Dependencies: Minimal
```

## Why It Works

1. **Clarity reduces inference** - Both ADHD brains and LLMs struggle with "reading between the lines"
2. **Structure survives degradation** - Well-formatted prompts maintain coherence as context grows
3. **Constraints improve focus** - Boundaries prevent both human and AI attention from wandering
4. **Visual markers aid retrieval** - Emojis/symbols create memorable reference points

## Practical Examples

### For Debugging
```markdown
🐛 BUG: API returns 500
📍 WHERE: /api/users endpoint  
🔍 TRIED: Check logs, test locally
💭 THEORY: Auth token expired
❓ NEED: Fix for production
```

### For Code Generation
```markdown
🎯 FUNCTION: processOrders
📥 INPUT: Order[] array
📤 OUTPUT: ProcessedOrder[]
⚡ PERF: Must handle 1000/sec
🚫 NO: External API calls
```

### For Learning
```markdown
📚 LEARN: WebSockets
🎓 LEVEL: Used REST, new to WS
🎯 GOAL: Build chat in 1 hour
💡 PREFER: Code examples > theory
```

## Advanced Patterns

### The Context Budget
- **First 20%**: Critical instructions (premium slots)
- **Middle 60%**: Supporting details (standard slots)  
- **Last 20%**: Nice-to-have context (economy slots)

### Compression Through Structure
```markdown
Instead of: "Create a function that takes an array of user objects and filters..."
Use: "FUNC: filterUsers | IN: User[] | OUT: User[] | FILTER: age > 18"
```
Saves ~70% tokens, increases clarity.

### Stateless Instructions
```markdown
❌ "As mentioned above..."
✅ "Using Redis (port: 6379)..."
```
Each instruction stands alone.

## Integration Tips

1. **Start simple** - Use basic template first
2. **Add structure as needed** - Don't over-engineer
3. **Test both ways** - Compare traditional vs ADHD-optimized
4. **Measure results** - Track token usage and output quality

## The Meta-Lesson

The best prompts aren't the most sophisticated - they're the most accessible. By designing for cognitive constraints, we create prompts that work better for everyone: humans with ADHD, neurotypical users in a hurry, and AI models with limited context windows.

**Remember**: The constraint is the feature.