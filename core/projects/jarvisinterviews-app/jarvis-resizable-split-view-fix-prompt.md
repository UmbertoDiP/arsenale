# MASTER PROMPT — RESIZABLE SPLIT VIEW FIX (SPHERE + LIST VIEW)

## ROLE
Agisci come:
- Principal Frontend Architect (React Specialist)
- UI Systems Engineer
- Performance & Layout Engineer
- UX Interaction Designer
- QA Automation Lead

Obiettivo:
Riprogettare in modo **impeccabile e 100% bug-free** il sistema di barra di trascinamento (split divider) nelle seguenti viste:
1. Vista Sfera (Sfera ↔ Teleprompter panel)
2. Vista Lista (Cards ↔ Tutorial completo panel)

L'obiettivo è perfezionare ogni elemento e generare *tutti i breakpoint responsive mancanti* in modo da supportare perfettamente Mobile, Tablet, Desktop e 4K, senza glitch di resize o UI clipping.

---
## FASE 1 — ARCHITETTURA MODERNA DEL LAYOUT (REACT)
Implementare un sistema unico e riutilizzabile: **SPLIT LAYOUT ENGINE**

Regole Tecnologiche:
- **React-Resizable-Panels:** Dato l'uso di React, utilizza librerie ultra-ottimizzate come `react-resizable-panels` (o architetture Vanilla equivalenti basate su Refs) per prevenire re-render globali durante il dragging. Non reinventare la ruota se esiste uno standard affidabile.
- Mai ricreare componenti interni (NO duplicazione teleprompter o tutorial).
- Non montare/unmountare componenti durante il drag (solo resize del container).

---
## FASE 2 — 100% PERFECT RESPONSIVE UI & VIEWPORT
Applicare le moderne best practice CSS per evitare i classici bug di viewport:
- **Dynamic Viewports:** Bandito l'uso di `100vh`. Utilizza **esclusivamente `100dvh`** per il layout a schermo intero (o `svh` per il bottom snapping). Questo evita che l'UI si rompa su mobile quando scompare o appare la barra degli indirizzi del browser.
- **Breakpoint Completi:** Genera regole per:
  - Mobile (stacked layout verticale, fallback).
  - Tablet (split adattivo orientato alla leggibilità).
  - Desktop (split orizzontale).
  - 4K (max-width constraints per non deformare la UI).

---
## FASE 3 — CONTAINER QUERIES (NO CLIPPING)
Per evitare che il testo o le card si taglino quando l'utente ridimensiona il pannello:
- **Divieto di Media Queries Globali sui figli:** Non usare `@media` queries per gli elementi interni ai pannelli.
- **Obbligo di Container Queries:** Definisci il pannello genitore con `container-type: inline-size;`. Utilizza `@container` queries e unità relative (`cqw`) per fare in modo che il Teleprompter e la Lista si ridimensionino perfettamente *in base alla larghezza del loro pannello*, non dello schermo intero.

---
## FASE 4 — BULLETPROOF DRAG BEHAVIOR & OBSERVERS
Il comportamento del divider deve essere fluido a 60fps, senza jitter e senza scroll hijacking su touch screen.
- **Touch Bug Fix:** Applica tassativamente `touch-action: none;` al divider per evitare che il browser confonda il drag con lo scroll della pagina. Usa i `PointerEvents`.
- **ResizeObserver Loop Fix:** Previeni in modo assoluto l'errore `ResizeObserver loop limit exceeded`. Se usi un Observer, non mutare le dimensioni del DOM direttamente nel callback. Usa `requestAnimationFrame` o logica di throttling.

---
## FASE 5 — LAYOUT RULES & STATE PERSISTENCE
Definire regole rigide di vincolo spaziale:
- min width pannello sinistro: 20%, max width pannello sinistro: 80%.
- Salvare la posizione del divider nel `localStorage` per utente e per vista (ripristinarla al caricamento).

Vista Sfera:
- LEFT: Sfera
- RIGHT: Teleprompter panel (RIUSATO, state preserved)

Vista Lista:
- LEFT: Cards list
- RIGHT: Tutorial completo (single source of truth)

---
## FASE 6 — VISUAL INDICATOR (UX IMPROVEMENT)
Il divider deve essere elegante ma evidente:
- spessore percepibile e hover state.
- drag cursor corretto (`col-resize` / `row-resize`).
- micro-feedback visivo senza causare paint-lag.

---
## FASE 7 — BUG FIX E REGRESSION CONTROL
Risolvere ogni criticità attuale:
- clipping teleprompter in alcune resolution.
- UI tagliata in responsive mode.
- mismatch tra vista sfera e vista lista.
- verifica che cards e tutorial non subiscano layout shift continui.

---
## FASE 8 — TEST AUTOMATICI (OBBLIGATORIO)
Generare set di test completi:
- Unit Test: divider state update, boundary constraints.
- Integration Test: layout sync tra pannelli, persistence restore.
- Visual Regression Test: 0% clipping su teleprompter e lista in tutti i breakpoint.

---
## FASE 9 — OUTPUT FINALE
Restituire:
- STATUS: FIXED
- ISSUES FOUND: Elenco dei problemi di viewport, observer e rendering corretti.
- RESPONSIVE AUDIT: Check sui breakpoint implementati (dvh, container queries).
- UX RESULT: Conferma stabilità e test eseguiti.
