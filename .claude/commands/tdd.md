# /tdd - Test-Driven Development Guidelines

## THE FUNDAMENTAL PRACTICE

**TEST-DRIVEN DEVELOPMENT IS NON-NEGOTIABLE.** Every single line of production code must be written in response to a failing test. No exceptions.

## Red-Green-Refactor Process

1. **Red**: Write a failing test for the desired behavior. NO PRODUCTION CODE until you have a failing test.
2. **Green**: Write the MINIMUM code to make the test pass. Resist the urge to write more than needed.
3. **Refactor**: Assess the code for improvement opportunities. If refactoring would add value, clean up the code while keeping tests green. If the code is already clean and expressive, move on.

## Common TDD Violations to Avoid

- Writing production code without a failing test first
- Writing multiple tests before making the first one pass
- Writing more production code than needed to pass the current test
- Skipping the refactor assessment step when code could be improved
- Adding functionality "while you're there" without a test driving it

**Remember**: If you're typing production code and there isn't a failing test demanding that code, you're not doing TDD.

## Example TDD Workflow

```typescript
// Step 1: Red - Write failing test
describe("PaymentProcessor", () => {
  it("should decline payment when insufficient funds", () => {
    const payment = createPayment({ amount: 1000 });
    const account = createAccount({ balance: 500 });
    
    const result = processPayment(payment, account);
    
    expect(result.success).toBe(false);
    expect(result.error.message).toBe("Insufficient funds");
  });
});

// Step 2: Green - Minimal implementation
const processPayment = (payment: Payment, account: Account): Result => {
  if (account.balance < payment.amount) {
    return { success: false, error: new Error("Insufficient funds") };
  }
  return { success: true };
};

// Step 3: Refactor - Extract constants, improve readability
const INSUFFICIENT_FUNDS_ERROR = "Insufficient funds";

const hasInsufficientFunds = (account: Account, amount: number): boolean => {
  return account.balance < amount;
};

const processPayment = (payment: Payment, account: Account): Result => {
  if (hasInsufficientFunds(account, payment.amount)) {
    return { success: false, error: new Error(INSUFFICIENT_FUNDS_ERROR) };
  }
  return { success: true };
};
```

## Testing Philosophy

- **Test behavior, not implementation** - Tests should verify expected behavior through public APIs
- **No unit tests** - This term is not helpful. Test behavior instead.
- **100% coverage** expected, but through business behavior testing
- **Tests document business requirements** - They should read like specifications

## When This Command is Active

You MUST:
- Always write tests first
- Keep cycles small (Red-Green-Refactor)
- Refuse to write production code without a failing test
- Call out any code that wasn't test-driven
- Guide users through proper TDD cycles