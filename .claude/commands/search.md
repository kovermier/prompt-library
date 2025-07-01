# /search - Optimized Prompt Library Search Strategies

## Search Tool Location
```bash
python3 tools/search-prompts.py
```

## Optimized Search Sequence

When searching for prompts, use this sequence to minimize failures:

### 1. Archetypal Foundation Search
Start with archetype searches - highest hit probability:
```bash
python3 tools/search-prompts.py -a "Pattern Synthesizer"
python3 tools/search-prompts.py -a "Creative Organizer"
```

### 2. Framework & Category Search
Search frameworks and broad categories:
```bash
python3 tools/search-prompts.py -c "frameworks"
python3 tools/search-prompts.py -c "tasks/analysis"
```

### 3. Task Recommendation Engine
Use for complex synthesis tasks:
```bash
python3 tools/search-prompts.py -r "detailed task description"
```

### 4. Broad Tag Combinations
Use conceptual tags rather than domain-specific:
```bash
python3 tools/search-prompts.py -t automation workflow systems
```

### 5. Similarity Search
If patterns emerge from other searches:
```bash
python3 tools/search-prompts.py -s "similar-prompt-title"
```

## Search Strategy Principles

- **Start with archetypal patterns** (higher hit probability)
- **Use conceptual tags** before domain-specific terms
- **Leverage recommendation mode** for complex synthesis tasks
- **Search frameworks** before task-specific prompts
- **Run multiple search strategies** when possible

## Search Before Creating

**ALWAYS** search existing prompts before creating new ones:
1. Prevents redundancy
2. Maintains library coherence
3. Builds on existing patterns
4. Respects the library's Way

## Example Search Flow

```bash
# Looking for data analysis prompts
# Step 1: Try archetype
python3 tools/search-prompts.py -a "Truth Builder"

# Step 2: Try category
python3 tools/search-prompts.py -c "tasks/analysis"

# Step 3: Try recommendation
python3 tools/search-prompts.py -r "analyze complex data patterns"

# Step 4: Try tags
python3 tools/search-prompts.py -t analysis patterns data

# Step 5: If you found something close
python3 tools/search-prompts.py -s "found-prompt-name"
```

## After Any Changes

Always update the index:
```bash
python3 tools/index-prompts.py
```

## When This Command is Active

- Search thoroughly before creating
- Use multiple search strategies
- Present findings through user's lens
- Update index after modifications
- Guide towards existing patterns