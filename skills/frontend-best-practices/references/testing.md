# Testing

## Rule

Use the project's existing test stack and test user-observable behavior before implementation details.

## Discovery

Identify existing:

- Unit test framework.
- Component test setup.
- End-to-end test tool.
- Test data/factory pattern.
- Mocking strategy.
- Accessibility or visual test tooling.
- CI commands.

## Test Types

| Test type | Good for |
| --- | --- |
| Unit | Pure functions, reducers, formatters, validators |
| Component | Isolated UI states and interactions |
| Integration | Feature behavior with realistic boundaries |
| End-to-end | Critical user journeys |
| Visual | Layout regressions |
| Accessibility | Obvious accessibility violations plus manual checks |

## Prioritize

- Auth and permission boundaries.
- Create, update, delete flows.
- Forms with validation errors.
- Empty, loading, error, and unauthorized states.
- Complex tables, filters, and pagination.
- Mutation success/failure and refetch behavior.
- Keyboard behavior for custom widgets.
- Responsive behavior for key surfaces.

## Rules

- Prefer semantic/user-facing selectors.
- Avoid tests coupled to internal state variable names.
- Keep unit tests focused on pure logic.
- Use e2e tests for critical workflows, not every edge case.
- Run the narrowest relevant tests first, then broader checks when risk justifies it.
