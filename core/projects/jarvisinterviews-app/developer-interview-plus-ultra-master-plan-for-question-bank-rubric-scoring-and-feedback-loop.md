# 👑 PLUS ULTRA MASTER PLAN: developerinterview.guide 👑
**Legacy Context:** Folder2Text.com (Use ONLY as Vite/Tailwind/React Scaffolding)
**Target System:** 3D Tech Interview Knowledge Graph (Fog of War Edition)
**Execution Mode:** Auto-Pilot (Strict Production Level)

## ⚠️ SYSTEM DIRECTIVES & "BANANA" PROTOCOL ⚠️
1. **Destructive Override:** OVERWRITE all existing Folder2Text functional logic, file parsing utilities, and UI. Keep ONLY the Vite config, Tailwind setup, and base React hooks. The app identity is now exclusively `developerinterview.guide`.
2. **Auto-Execution:** Read this entire plan, auto-approve the steps, and begin execution immediately from Phase 1. Do not ask for permission to start.
3. **The "Banana" Protocol:** If you reach your output generation limit, token limit, or need the user to link the Supabase project manually, PAUSE execution and print exactly: `[AWAITING BANANA]`. When the user replies with `banana`, resume instantly from where you left off.
4. **Target Stack:** React, Vite, Tailwind CSS, `@react-three/fiber`, `@react-three/drei`, `framer-motion`, `zustand` (with persist middleware), `@supabase/supabase-js`, `react-helmet-async`, `lucide-react`, `react-router-dom`.

---

## 🗂️ PHASE 1: INFRASTRUCTURE & ROUTING (ZERO RE-RENDERS)
1. **Dependencies:** Install the required 3D, animation, and routing stack.
2. **Persistent Layout Strategy:** Set up `react-router-dom`. Create a `RootLayout.tsx` where the `<SphereGraph />` acts as a permanent, absolute-positioned background. The Modals and UI overlays must be nested routes (e.g., `/node/:id`) rendered via `<Outlet />` floating ON TOP of the canvas. This prevents the WebGL context from unmounting during navigation.
3. **White-Label Config:** Create `src/config/app.config.ts`. Implement the `AppConfig` interface (dark-mode `zinc-950`, neon cyan `#06b6d4`/violet `#8b5cf6` sphere colors, EUR currency, multi-language fallbacks).
4. **Error Boundaries:** Wrap the WebGL `<Canvas>` in a strict React Error Boundary. If WebGL crashes, display a sleek 2D fallback list UI instead of a white screen.

## 🗄️ PHASE 2: DATABASE & MULTI-LANGUAGE STATE
1. **Supabase Initialization:** Use the native integration to connect the DB.
2. **Table Schema & RLS:** Create these tables:
   - `tech_nodes`: `id` (uuid), `primary_tech` (text), `related_techs` (text array), `status` ('locked' | 'unlocked'), `discovered_by` (uuid, nullable).
   - `node_content`: `node_id` (uuid, fk), `translations` (JSONB - e.g., `{"en": {"q": "...", "a": "..."}, "it": {"q": "...", "a": "..."}}`).
   - `user_wallets`: `user_id` (uuid, pk), `credits` (int, default 0).
3. **Zustand Store:** Rebuild `src/store/useAppStore.ts` using the `persist` middleware. State: `userCredits` (number), `userLanguage` (string, default to `navigator.language`), `isSearchOpen` (boolean).

## 🌐 PHASE 3: 3D WEBGL CORE
1. **The Core Canvas:** Build `src/components/SphereGraph.tsx` inside `RootLayout`. Use `OrbitControls` (autoRotate, enableDamping, no zoom).
2. **Topology:** Apply Fibonacci sphere math to distribute `tech_nodes` dynamically in 3D space.
3. **Nodes (`<Html>` from drei):** 
   - *Unlocked:* Neon glowing border (cyan/violet).
   - *Locked:* Translucent grey with a `<Lock size={12} />` icon.
   - *Click Action:* Push the route to `/node/:id` (triggering the modal via Outlet) instead of lifting state manually.

## 🚀 PHASE 4: ZERO-FRICTION UX
1. **Frictionless Unlock Flow:** Implement the click handler for locked nodes. 
   - NO popups.
   - On click: Check local `userCredits`. If < 1: Open `TopUpModal.tsx`.
   - If >= 1: Instantly change local node state to `Loading` (pulsing animation).
   - Trigger `supabase.rpc('unlock_node_with_credit', { node_id })`.
   - On success: Transition node to `Unlocked` and push route to `/node/:id`.
2. **Multilingual Content Panel (`/node/:id` route):** Create `src/components/NodeContentModal.tsx`. Fetch data for `id`. Parse the `translations` JSONB object using the `userLanguage` store variable. Fallback to `"en"`.
3. **Command Palette:** Build `src/components/CommandPalette.tsx` (Cmd+K) for semantic searching across `tech_nodes`.

## 💳 PHASE 5: PAYMENTS & EDGE EXPORTS
1. **Auth UI:** Build the login modal using Supabase Auth. Display `⚡ [Credits]` in the fixed top-right header.
2. **Stripe Top-Up:** Create `TopUpModal.tsx` for purchasing credits. Implement the `handleCheckout` function ready to receive a Stripe Checkout Session URL from a Supabase Edge Function.
3. **Edge Functions Export:** Create local reference files:
   - `supabase/functions/stripe-webhook/index.ts`
   - `supabase/functions/create-checkout/index.ts`

## 🕸️ PHASE 6: SEO & ACCESSIBILITY (SHADOW DOM)
1. **Dynamic Helmet:** Set up `react-helmet-async`. Change the `<title>` and `<meta name="description">` dynamically based on the active `/node/:id` route.
2. **Accessibility Layer:** Build `src/components/SeoShadowDom.tsx`. Map over all `unlocked` nodes and render their JSONB translated content inside standard `<article>`, `<h2>`, `<p>` tags with the `sr-only` Tailwind class. Place this alongside the Canvas so Googlebot can crawl the entire DB structure perfectly.

---
**END OF PLAN.**
**ACTION REQUIRED:** Acknowledge this plan. Confirm the destructive override of Folder2Text legacy logic. Auto-approve all steps. Begin generating Phase 1 immediately. If you need me, print `[AWAITING BANANA]`.