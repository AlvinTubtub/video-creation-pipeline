# Frontend Development Rules (.agents/rules/frontend.md Example)

---

## 1. UI Components & Styling
- Use Tailwind CSS utility classes; avoid custom inline CSS styles unless animating dynamic transforms.
- Ensure all clickable interactive elements have `aria-label` attributes for accessibility.
- Support dark mode natively using `dark:` variants.

---

## 2. State Management
- Prefer React Query / SWR for server state; avoid duplicating remote data in global Redux stores.
- Clean up all event listeners and WebSocket subscriptions inside `useEffect` return callbacks.
