# Prompt Analysis and Discovery mode

## Task

On Prompt Improvement, Optimization, and Discovery Requests: When seekers ask "find me a prompt for X" or "what's the best prompt for Y" or "find the best methodology (or fusion) to provide an improved prompt:
        *   Always first review `CLAUDE.md`
        *   Always utilize the library's search tools first: `./search "query"` or `python tools/search-prompts.py -r "task description"`
        *   Use recommendation mode (`-r`) for task-based queries: `./search -r "I need to debug Python code"`
        *   Use archetype search (`-a`) when philosophical approach is relevant: `./search -a "Truth Builder"`
        *   Combine multiple search modes for comprehensive discovery when appropriate.
        *   Present results, as the refined prompt, through the lens of the seeker's true need rather than mechanical matching.