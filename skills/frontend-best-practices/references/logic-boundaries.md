# Logic Boundaries

## Rule

Classify logic before extracting it. Rendering logic, pure domain logic, stateful behavior, server state, browser integration, and side effects belong in different places.

## Keep Inline

Keep these in the component/template when they are simple:

- One-line display fallbacks.
- Simple render conditions.
- Basic disabled conditions.
- Short property access on already-reactive or already-loaded data.
- Event handlers that only update local UI state.

Avoid helper functions, computed wrappers, hooks, or composables that only hide one simple expression.

## Extract To Pure Functions

Use pure functions when logic:

- Has inputs and outputs.
- Does not need framework lifecycle or reactivity.
- Does not touch the DOM.
- Does not perform side effects.
- Represents a product rule, formatting rule, normalization rule, or calculation.

Examples:

- `formatCurrency(amount, locale, currency)`
- `canApproveOrder(userPermissions, orderStatus)`
- `normalizeSearchParams(params)`
- `calculateDiscount(price, policy)`

## Extract To Hooks, Composables, Or Services

Use framework-specific stateful abstractions when logic:

- Is reused across components.
- Coordinates several related state values/effects.
- Subscribes to external systems.
- Uses browser APIs.
- Has lifecycle cleanup.
- Represents a named behavior.

Good examples:

- online status
- media query state
- autosave
- keyboard shortcut handling
- resize observer
- persisted local draft

Weak examples:

- `useDisplayName` for `user.name || "Unassigned"` used once.
- `computed(() => props.item.title)` used once.
- `getValueOrDash(value)` for a single template field.

## Side Effects

- Keep effects synchronized with external systems only.
- Do not use effects for values that can be derived during render.
- Keep fetch, mutation, storage, analytics, subscriptions, and DOM integration explicit and named.
- Clean up subscriptions, timers, and event listeners.
