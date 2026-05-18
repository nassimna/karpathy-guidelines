# Performance

## Rule

Optimize user-visible experience, not just source aesthetics. Measure with production-like builds when possible.

## Core Concerns

- Largest Contentful Paint: main content load.
- Interaction to Next Paint: responsiveness after input.
- Cumulative Layout Shift: visual stability.

## Basics

- Ship less JavaScript.
- Keep server-renderable work on the server when the framework supports it.
- Code split by route or heavy interaction path.
- Avoid splitting every tiny module.
- Avoid large synchronous work on the main thread.
- Lazy load below-the-fold media, but not the LCP image.
- Provide image dimensions to reduce layout shift.
- Use responsive images and modern formats when the stack supports them.
- Virtualize very long lists and tables.
- Avoid unnecessary re-rendering of large subtrees.
- Cache server data intentionally.

## When To Split Code

- A route has a large dependency.
- A modal/editor/chart/map is expensive and not always opened.
- Admin-only code should not ship to normal users.
- A feature is not needed for initial render.

## Smells

- Heavy chart/editor/map libraries in the initial bundle without need.
- Loading blank screens when route-level skeletons would work.
- Layout shifts from images, ads, fonts, or late-loading content.
- Client-only rendering for static or server-friendly content without reason.
