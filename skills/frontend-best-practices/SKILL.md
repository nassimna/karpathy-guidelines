---
name: frontend-best-practices
description: Use when designing, implementing, reviewing, or refactoring front-end UI, components, state, forms, data fetching, styling, accessibility, performance, or tests. Applies across React, Vue, Angular, Svelte, Next, Nuxt, and similar stacks. This skill provides project-aware decision criteria, not a universal architecture.
---

# Front-End Best Practices

Use this skill for front-end implementation, review, refactoring, or planning. It helps decide when to split components, where logic belongs, how to place state, and how to avoid fragile UI architecture.

## Prime Directive

This skill provides decision criteria, not a universal project structure. Existing project conventions and libraries win unless they are clearly broken or the user explicitly asks to change them.

Precedence:

1. User's explicit request.
2. Local repo instructions such as `AGENTS.md`, `CLAUDE.md`, README, architecture docs, and design-system docs.
3. Existing project patterns in nearby files.
4. Existing installed libraries and framework conventions.
5. Official framework/library guidance.
6. This skill's general heuristics.

Do not introduce a new UI library, form library, validation library, state manager, router, styling system, test tool, or folder architecture unless the user asks or the repo has no established pattern and the benefit clearly justifies the added dependency and migration cost.

## Required Workflow

1. Hydrate local context before making architecture choices:
   - Read local instructions.
   - Inspect nearby pages/components.
   - Inspect package dependencies and existing library usage.
   - Identify the framework, routing model, styling system, UI system, form approach, validation approach, state/data-fetching approach, and test setup.
2. Preserve established patterns:
   - Use existing components and design-system primitives first.
   - Follow existing form and validation patterns.
   - Follow existing folder and naming conventions.
   - Keep feature-specific code close to the feature unless the repo already has another pattern.
3. Apply boundary rules:
   - Split components only for meaningful UI/product/state/accessibility/performance/test boundaries.
   - Split logic by category: rendering, pure domain logic, stateful behavior, server state, browser integration, or side effects.
   - Keep simple one-line display logic inline when extraction adds indirection without clarity.
4. Validate with the repo's existing tools and realistic UI checks:
   - Run the narrowest relevant lint/type/build/test commands.
   - For visual or interaction changes, prefer browser validation when available.
   - Check loading, empty, error, unauthorized, responsive, keyboard, and mutation states when the touched surface requires them.

## Project Discovery Checklist

Before adding or changing frontend code, answer these from repo evidence:

- Framework: React, Vue, Angular, Svelte, or other?
- Rendering/routing: SPA, SSR, server components, route loaders, Nuxt pages, Angular routes, etc.?
- UI system: shadcn, Radix, MUI, Chakra, Ant Design, Headless UI, custom primitives, native HTML, or design system?
- Styling: Tailwind, CSS modules, scoped CSS, Sass, CSS-in-JS, design tokens?
- Forms: native forms, React Hook Form, Formik, VeeValidate, Angular forms, framework actions?
- Validation: Zod, Yup, Valibot, class-validator, custom schemas, backend-only validation?
- State: local state, context/provide-inject, Pinia, Redux, Zustand, NgRx, signals, server-state cache?
- Data fetching: framework loader, server component, TanStack Query, Apollo, tRPC, REST client, generated SDK?
- Tests: unit, component, e2e, visual, accessibility, Playwright, Cypress, Testing Library?
- Existing examples: which nearby file is the best pattern to copy?

## Core Rules

- Start local. Promote to shared only after real reuse or a stable API need.
- Use existing libraries if present; avoid parallel systems.
- Keep state as local as possible and as global as necessary.
- Put shareable navigational state in the URL when it affects refresh/share/back-button behavior.
- Treat backend-owned data as server state, not casual local state.
- Keep pure product rules independent from UI components.
- Use hooks/composables/services for named stateful behavior, not one-line aliases.
- Use semantic HTML and accessible primitives before custom ARIA-heavy widgets.
- Test user-observable behavior, not implementation details.
- Avoid broad refactors while delivering a focused feature or fix.

## Output Expectations

- When implementing: briefly state the project conventions discovered, the files changed, and the validation run.
- When reviewing: lead with concrete findings and file references, then list risks, assumptions, and suggested fixes.
- When planning: distinguish repo evidence from recommendations, and call out decisions that depend on the user's product or team preference.
- When no code change is needed: explain the decision and point to the relevant existing pattern.

## When Not To Use

Do not use this skill for backend-only work, database-only work, DevOps-only work, pure copywriting, general research, or non-frontend architecture unless the user explicitly asks for frontend implications.

## Example Prompts

- "Refactor this Vue page without changing the repo's existing conventions."
- "Review this React form that already uses Zod and shadcn."
- "Decide whether this table should be split into smaller components."
- "Implement this UI using the project's current design system and validation patterns."

## When To Read References

- Component extraction, page decomposition, or shared UI decisions: read `references/component-boundaries.md`.
- Hooks/composables/services, helpers, derived values, or side effects: read `references/logic-boundaries.md`.
- Local/lifted/global/URL/server state decisions: read `references/state-management.md`.
- Form library, validation schema, submit behavior, or field errors: read `references/forms-and-validation.md`.
- Design system, styling, responsive layout, or UI library choices: read `references/styling-and-design-systems.md`.
- Keyboard, semantics, ARIA, focus, labels, or custom widgets: read `references/accessibility.md`.
- Bundle size, rendering cost, images, Core Web Vitals, or large lists: read `references/performance.md`.
- Test strategy or test implementation: read `references/testing.md`.
