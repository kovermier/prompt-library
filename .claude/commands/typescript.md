# /typescript - TypeScript Strict Mode Requirements

## Non-Negotiable Configuration

```json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "alwaysStrict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true
  }
}
```

## Absolute Rules

- **No `any`** - EVER. Use `unknown` if type is truly unknown
- **No type assertions** (`as SomeType`) unless absolutely necessary with clear justification
- **No `@ts-ignore`** or `@ts-expect-error` without explicit explanation
- These rules apply to test code as well as production code

## Type Definition Guidelines

### Prefer `type` over `interface`
```typescript
// Good
type User = {
  id: string;
  name: string;
};

// Avoid
interface User {
  id: string;
  name: string;
}
```

### Create Domain-Specific Types
```typescript
// Good - branded types for type safety
type UserId = string & { readonly brand: unique symbol };
type PaymentAmount = number & { readonly brand: unique symbol };

// Avoid - too generic
type UserId = string;
type PaymentAmount = number;
```

### Schema-First Development with Zod
```typescript
// Define schemas first
const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  createdAt: z.date(),
});

// Derive types from schemas
type User = z.infer<typeof UserSchema>;

// Use at runtime boundaries
export const parseUser = (data: unknown): User => {
  return UserSchema.parse(data);
};
```

## Critical Schema Rule

**Tests must use real schemas from the project, not redefine their own.**

```typescript
// ❌ WRONG - Defining schemas in test files
const TestSchema = z.object({ id: z.string() });

// ✅ CORRECT - Import from shared location
import { UserSchema, type User } from "@your-org/schemas";
```

## Utility Type Usage

Leverage TypeScript's utility types effectively:
- `Pick<T, K>` - Select properties
- `Omit<T, K>` - Remove properties  
- `Partial<T>` - Make all properties optional
- `Required<T>` - Make all properties required
- `Readonly<T>` - Make all properties readonly

## When This Command is Active

- Enforce strict typing in all code examples
- Call out any `any` usage immediately
- Ensure proper schema imports in tests
- Guide towards type-safe patterns
- No compromises on type safety