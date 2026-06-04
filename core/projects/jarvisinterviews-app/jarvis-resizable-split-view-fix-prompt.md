# MASTER PROMPT — RESIZABLE SPLIT VIEW FIX (SPHERE + LIST VIEW)

## ROLE
Agisci come:
- Principal Frontend Architect
- UI Systems Engineer
- Performance & Layout Engineer
- UX Interaction Designer
- QA Automation Lead

Obiettivo:
Correggere e riprogettare completamente il sistema di barra di trascinamento (split divider) nelle seguenti viste:
1. Vista Sfera (Sfera ↔ Teleprompter panel)
2. Vista Lista (Cards ↔ Tutorial completo panel)

Il sistema attuale è instabile, non fluido e causa:
- clipping UI
- rendering incompleto
- resize errato
- comportamento non coerente tra viewport
- esperienza utente degradante

---
## FASE 1 — ANALISI LAYOUT ATTUALE
Analizzare:
- struttura DOM/Componenti
- gestione flex/grid attuale
- event handling del resize
- eventuali re-render inutili
- gestione state (React state / Angular state / store)

Identificare:
- perché il divider non funziona correttamente
- dove avvengono i glitch
- dove avviene clipping del teleprompter
- differenze tra viewport (desktop/tablet/mobile)

---
## FASE 2 — ARCHITETTURA CORRETTA DEL SPLIT VIEW
Implementare un sistema unico e riutilizzabile:
**SPLIT LAYOUT ENGINE**

Requisiti:
- 2 pannelli affiancati (left/right o top/bottom se mobile)
- divider centrale trascinabile
- resize continuo (non a step)
- constraint min/max width

Regole:
- mai ricreare componenti interni (NO duplicazione teleprompter o tutorial)
- usare SOLO resize del container
- non montare/unmountare componenti durante drag

---
## FASE 3 — DRAG BEHAVIOR (CRITICO)
Il comportamento del divider deve essere:
- fluido (60fps target)
- senza jitter
- senza lag
- senza re-render globale della pagina

Implementare:
- pointer events (pointerdown / pointermove / pointerup)
- supporto mouse + touch + trackpad
- throttling leggero SOLO se necessario
- gestione boundary constraints

---
## FASE 4 — LAYOUT RULES
Definire regole rigide:
- min width pannello sinistro: 20%
- max width pannello sinistro: 80%
- il resto si adatta automaticamente

Vista Sfera:
- LEFT: Sfera
- RIGHT: Teleprompter panel (RIUSATO, NON ricreato)

Vista Lista:
- LEFT: Cards list
- RIGHT: Tutorial completo (single source of truth)

---
## FASE 5 — TELEPROMPTER PANEL (VINCOLO CRITICO)
Il teleprompter:
- NON deve essere ricreato
- NON deve essere duplicato
- NON deve essere rimontato durante resize

Deve essere:
- shared component instance
- state preserved
- layout responsive only via container resizing

---
## FASE 6 — RESPONSIVE BEHAVIOR
Gestire correttamente:
- Desktop: split orizzontale
- Tablet: split adattivo
- Mobile: fallback a stacked layout (vertical)

Verificare:
- nessun overflow orizzontale
- nessun clipping contenuto
- nessun cutoff del teleprompter

---
## FASE 7 — VISUAL INDICATOR (UX IMPROVEMENT)
Il divider deve essere chiaramente visibile:
- spessore percepibile
- hover state
- drag cursor (col-resize / row-resize)
- feedback visivo durante drag
- stile elegante ma evidente

---
## FASE 8 — STATE PERSISTENCE
Salvare:
- posizione divider
- per utente
- per vista (sfera / lista)

Persistenza:
- localStorage o backend (in base al sistema esistente)

Regola:
- all’apertura vista, ripristinare ultimo layout

---
## FASE 9 — PERFORMANCE REQUIREMENTS
Il resize NON deve causare:
- rerender completo pagina
- reload componenti
- perdita stato teleprompter
- perdita stato lista/tutorial

Obiettivo: layout update only (no logic re-run)

---
## FASE 10 — BUG FIX OBBLIGATORI
Risolvere:
- clipping teleprompter in alcune resolution
- UI tagliata in responsive mode
- divider non preciso o non fluido
- mismatch tra vista sfera e vista lista

---
## FASE 11 — TEST AUTOMATICI (OBBLIGATORIO)
Generare test:
- Unit Test: divider state update, boundary constraints
- Integration Test: layout sync tra pannelli, persistence restore
- E2E Test: drag divider → verify resize, refresh page → verify state restored
- Visual Regression Test: no clipping teleprompter, no UI overflow
- Performance Test: drag stress test (100+ resize events)

---
## FASE 12 — REGRESSION CONTROL
Verificare che:
- teleprompter non venga duplicato
- tutorial non venga duplicato
- cards non vengano re-renderizzate inutilmente
- nessun layout shift continuo

---
## FASE 13 — OUTPUT FINALE
Restituire:
- STATUS: FIXED / PARTIALLY FIXED / NOT FIXED
- ISSUES FOUND: elenco bug reali
- FIX APPLIED: cosa è stato modificato
- UX RESULT: fluido / instabile / migliorato
- RISK: regressioni possibili
- TEST COVERAGE: elenco test generati

---
## FASE 14 — GOAL FINALE
Sistema finale deve garantire: divider stabile, resize fluido, nessun clipping, teleprompter riusato, vista lista coerente, UX consistente, comportamento identico su browser moderni.
