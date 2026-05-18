# State Management

## Rule

Every state value needs a clear owner. Prefer the smallest owner that preserves correct behavior.

## Ownership Guide

| State type | Preferred owner |
| --- | --- |
| Open menu, local tab, small input draft | Local component |
| Sibling coordination | Nearest common parent |
| Search, filters, sorting, pagination, selected route entity | URL/router |
| Backend-owned records | Server-state cache, route loader, server component, or data layer |
| Theme, locale, session summary, app-wide notifications | App provider/store |
| Multi-route draft or wizard | Feature store or persistence layer |

## Rules

- Avoid redundant state. Calculate derived values during render when possible.
- Avoid duplicate sources of truth.
- Store IDs instead of duplicating full objects when referencing related data.
- Keep server data separate from local draft edits.
- Lift state only when coordination requires it.
- Use global state only for truly shared client-owned state.
- Use URL state when refresh, sharing, deep-linking, or back/forward behavior matters.

## Server State

Backend-owned data has server-state concerns:

- loading
- empty state
- error state
- stale data
- refetching
- cache invalidation
- optimistic updates
- authorization
- retries

Use the project's existing server-state pattern. Do not introduce a new query/cache library if the repo already has one.

## Smells

- Copying API data into local state without a draft/edit reason.
- Using global store for one page's modal or table selection.
- Syncing two state values with effects when one can be derived.
- Putting URL-like state only in memory.
