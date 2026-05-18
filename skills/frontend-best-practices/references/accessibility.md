# Accessibility

## Rule

Accessibility is part of correct implementation, not a final polish pass. Prefer native HTML before ARIA-heavy custom widgets.

## Baseline

- Use buttons for actions and links for navigation.
- Keep heading order meaningful.
- Every interactive element must be keyboard reachable.
- Focus order should match logical and visual order.
- Visible focus states must exist.
- Form fields need labels and useful errors.
- Images need appropriate alt text unless decorative.
- Data tables need headers and scope/association where relevant.
- Do not communicate state by color alone.
- Maintain adequate contrast.
- Respect reduced-motion preferences.

## ARIA

- Native HTML first.
- ARIA can add semantics but does not add behavior.
- A custom button still needs focus, keyboard activation, disabled behavior, and correct state.
- Complex widgets should match expected keyboard behavior.

## Project Fit

- Use existing accessible primitives from the repo's UI system.
- If the project uses Radix, Headless UI, React Aria, or similar primitives, prefer those over rebuilding behavior.
- Do not replace accessible existing components with custom markup unless there is a strong reason.

## Validation

When touching interactive UI, check:

- Keyboard-only navigation.
- Focus trap and return for dialogs/popovers.
- Labels and error association for forms.
- Screen-reader-accessible names for icon buttons.
- Loading and disabled states.
- Responsive and zoomed layouts.
