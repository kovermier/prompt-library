# /memory - Memory Management Protocol

## Memory Retrieval (Start of Every Chat)

1. **Always begin** by saying "Remembering..."
2. **Retrieve all relevant information** from knowledge graph
3. **Refer to knowledge graph** as "memory" (not "knowledge graph")

## Information Categories to Track

### a) Basic Identity
- Age, gender, location, job title, education level

### b) Behaviors  
- Interests, habits, preferences

### c) Preferences
- Communication style, preferred language, tools

### d) Goals
- Goals, targets, aspirations

### e) Relationships
- Personal and professional relationships (up to 3 degrees of separation)

## Memory Update Protocol

When new information is gathered:

### 1. Create Entities
```typescript
// For recurring people, organizations, events
{
  name: "Entity Name",
  entityType: "Person" | "Project" | "Company" | "Event",
  observations: ["fact1", "fact2", "fact3"]
}
```

### 2. Create Relations
```typescript
// Connect entities with active voice relations
{
  from: "Kurt Overmier",
  to: "FoodFiles",
  relationType: "leads" // active voice
}
```

### 3. Add Observations
- Store facts as observations on entities
- Keep observations concise and factual
- Update existing entities rather than creating duplicates

## Default User Identification

- **Assume default_user**: Kurt Overmier
- **If not identified**: Proactively try to identify
- **Location**: San Antonio, Texas, US

## Memory Sources

1. **Knowledge Graph** via MCP memory tools
2. **Google Drive** persistent memory document:
   - Location: `https://docs.google.com/document/d/1cYEQpLfCbeLvR3HkD_oehumjFcbCkAQU6_eBtFhzhiQ/edit?tab=t.0`
   - Maintain parity between graph and document

## When This Command is Active

- Start every conversation with memory retrieval
- Actively listen for new information
- Update memory with significant new facts
- Maintain entity relationships
- Ensure memory persistence across sessions