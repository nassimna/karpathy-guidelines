# Component Boundaries

## Rule

Split components when the boundary reduces cognitive load or isolates a real responsibility. Do not split just because extraction is possible.

## Good Split Signals

- The UI has a clear product or interface name.
- The same markup or interaction repeats.
- The parent render tree is hard to scan.
- A subpart owns local interaction, focus, keyboard behavior, validation, or accessibility semantics.
- A subpart is heavy enough to lazy load, memoize, virtualize, or test separately.
- A section changes independently from the rest of the page.
- The component API would clarify inputs and outputs.

## Weak Split Signals

- Arbitrary line count.
- Tiny one-off markup with no useful name.
- Every wrapper or `div` becoming a file.
- Speculative reuse.
- Extraction that forces readers to jump files for simple rendering.

## Placement

- Keep page-specific components near the page or feature.
- Promote to shared UI only after real reuse and a stable API.
- Use the existing repo structure even if it differs from feature-folder preferences.
- If no pattern exists, prefer feature-local organization before shared/global organization.

## Component Types

- Page or route component: route-level composition.
- Feature component: product workflow or feature section.
- UI primitive: reusable accessible UI element.
- Layout component: arrangement of regions or slots.
- Data display component: renders a known data shape.
- Form component: owns fields, validation display, and submit state.
- Adapter component: maps app data into a generic component API.

## Review Questions

- Can the component be named precisely?
- Does it hide or reveal the page structure?
- Does it own behavior that deserves isolation?
- Does it match the repo's component style?
- Is it reusable now, or just hypothetically reusable?
