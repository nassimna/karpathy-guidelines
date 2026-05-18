# Styling And Design Systems

## Rule

Use the project's existing UI and styling system first. Do not introduce a second design system casually.

## Discovery

Before building UI, identify:

- UI library or design system: shadcn, Radix, MUI, Chakra, Ant Design, Headless UI, custom primitives, native elements.
- Styling system: Tailwind, CSS modules, scoped CSS, Sass, CSS-in-JS, design tokens.
- Icon library.
- Existing spacing, radius, typography, color, density, and responsive patterns.
- Existing form, table, dialog, menu, tabs, tooltip, and button primitives.

## Rules

- Reuse existing primitives before creating new ones.
- Preserve design-system tokens and variants.
- Layout should usually be owned by the parent.
- Components should expose intentional variants, not unlimited styling escape hatches.
- Use semantic HTML before styling custom elements.
- Keep focus states visible.
- Respect reduced motion preferences.
- Test long text, translated text, RTL where relevant, and small screens.

## Responsive Design

- Use flexible layout: grid, flexbox, wrapping, intrinsic sizing.
- Add breakpoints where the layout breaks, not just at named device sizes.
- Avoid accidental horizontal overflow.
- Intentional data-table horizontal scrolling must be obvious and usable.
- Constrain images and media.

## Promotion To Shared UI

Promote local UI to shared/design-system only when:

- Reuse is real.
- Accessibility behavior must be consistent.
- Visual consistency matters across features.
- The API is stable enough.
- The shared version reduces duplication without many escape hatches.

## Smells

- Adding shadcn/MUI/Chakra/etc. to a project with a different established UI system.
- Recreating a button, dialog, menu, or form field that already exists.
- Feature-specific data assumptions inside shared UI primitives.
- Many boolean props trying to serve unrelated use cases.
