# /functional - Functional Programming Patterns

## Core Principles

Follow a "functional light" approach:
- **No data mutation** - Work with immutable data structures
- **Pure functions** wherever possible
- **Composition** as the primary mechanism for code reuse
- Avoid heavy FP abstractions unless there's clear advantage
- Use array methods (`map`, `filter`, `reduce`) over imperative loops

## Immutable Updates

```typescript
// ❌ Bad - Mutation
const addItem = (items: Item[], newItem: Item) => {
  items.push(newItem); // Mutates array
  return items;
};

// ✅ Good - Immutable
const addItem = (items: Item[], newItem: Item): Item[] => {
  return [...items, newItem];
};

// ✅ Good - Object updates
const updateUser = (user: User, updates: Partial<User>): User => {
  return { ...user, ...updates };
};

// ✅ Good - Nested updates
const updateUserAddress = (user: User, city: string): User => {
  return {
    ...user,
    address: {
      ...user.address,
      city,
    },
  };
};
```

## Pure Functions

```typescript
// ❌ Bad - Side effects
let total = 0;
const addToTotal = (amount: number) => {
  total += amount; // Side effect
  return total;
};

// ✅ Good - Pure
const addToTotal = (currentTotal: number, amount: number): number => {
  return currentTotal + amount;
};
```

## Composition Over Complex Logic

```typescript
// ❌ Bad - Complex nested logic
const processOrder = (order: Order) => {
  // 100+ lines of nested code
};

// ✅ Good - Composed functions
const processOrder = (order: Order): ProcessedOrder => {
  return pipe(
    order,
    validateOrder,
    calculatePricing,
    applyDiscounts,
    addShipping,
    generateReceipt
  );
};

// Each function is small and focused
const validateOrder = (order: Order): ValidatedOrder => {
  if (!order.items.length) {
    throw new Error("Order must have items");
  }
  return order as ValidatedOrder;
};

const calculatePricing = (order: ValidatedOrder): PricedOrder => {
  const subtotal = order.items.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );
  return { ...order, subtotal };
};
```

## Array Methods Over Loops

```typescript
// ❌ Bad - Imperative
const activeUsers = [];
for (let i = 0; i < users.length; i++) {
  if (users[i].status === "active") {
    activeUsers.push(users[i]);
  }
}

// ✅ Good - Functional
const activeUsers = users.filter(user => user.status === "active");

// ✅ Good - Chaining
const totalActiveUserSpend = users
  .filter(user => user.status === "active")
  .map(user => user.totalSpend)
  .reduce((sum, spend) => sum + spend, 0);
```

## When Heavy FP IS Appropriate

Use advanced FP patterns when they provide clear value:

```typescript
// Complex async flows benefit from Task/IO types
type Result<T, E = Error> = 
  | { success: true; data: T }
  | { success: false; error: E };

// Error handling chains benefit from Result/Either types
const processPayment = (payment: Payment): Result<Receipt, PaymentError> => {
  return pipe(
    validatePayment(payment),
    chain(authorizePayment),
    chain(capturePayment),
    map(generateReceipt)
  );
};
```

## Function Parameter Guidelines

Use options objects by default:

```typescript
// ❌ Bad - Multiple positional parameters
const createPayment = (
  amount: number,
  currency: string,
  cardId: string,
  customerId: string,
  description?: string
): Payment => { };

// ✅ Good - Options object
type CreatePaymentOptions = {
  amount: number;
  currency: string;
  cardId: string;
  customerId: string;
  description?: string;
};

const createPayment = (options: CreatePaymentOptions): Payment => {
  const { amount, currency, cardId, customerId, description } = options;
  // implementation
};
```

## When This Command is Active

- Enforce immutability in all examples
- Guide towards pure functions
- Prefer composition over nesting
- Use functional array methods
- Keep abstractions practical, not academic