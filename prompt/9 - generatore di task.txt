# OAI Work Order — Spec operativa per generare Task / App / Test / Fix

## 0) Metadati
- ID: WO-YYYYMMDD-001
- Prodotto/Repo: <nome-repo>
- Owner: <nome>
- Priorità: P0 | P1 | P2
- Tipo richiesta: FEATURE | BUGFIX | REFACTOR | TEST | DOCS
- Target release: <versione o milestone>
- Ambiente: DEV | STAGING | PROD

---

## 1) Contesto
### 1.1 Problema / Obiettivo
Descrivi in 3–6 righe cosa vuoi ottenere e perché.

### 1.2 Utenti e scenario
- Utente: <es. content creator>
- Scenario: <es. organizza contenuti in kanban>

### 1.3 Vincoli
- Non rompere retro-compatibilità: SÌ/NO
- Requisiti legali/compliance: <se applicabile>
- Performance: <es. 2000 card senza lag percepibile>
- Accessibilità: <es. keyboard + screen reader base>

---

## 2) Ambito
### 2.1 In scope (cosa va fatto)
Elenco puntato.

### 2.2 Out of scope (cosa NON va fatto)
Elenco puntato.

---

## 3) Requisiti funzionali (FR)
Scrivi requisiti numerati e verificabili.

Esempio:
- FR-1: La board mostra 3 colonne: To Do, Doing, Done.
- FR-2: Pulsante "+ Aggiungi card" apre un modal con Titolo (obbligatorio) e Descrizione (opzionale).
- FR-3: Alla creazione, la card appare in To Do.

---

## 4) Requisiti non funzionali (NFR)
- NFR-1 (Qualità): Typecheck e lint devono passare.
- NFR-2 (UX): Modal con ESC per chiudere e focus trap.
- NFR-3 (Stile): UI simile a Trello (colonne, spacing, scroll per colonna).
- NFR-4 (i18n): Lingua UI: IT (se applicabile).

---

## 5) Specifiche tecniche
### 5.1 Stack e regole di codice
- Frontend: <React/Next/Vue/...>
- Backend: <Node/Go/... o N/A>
- Test: <Vitest/Jest/Playwright/...>
- Gestione stato: <Redux/Zustand/...>
- CSS: <Tailwind/CSS modules/...>

### 5.2 Contratti dati / Modelli
Definisci strutture minime.

Esempio:
- ColumnId: "todo" | "doing" | "done"
- Card:
  - id: string
  - title: string (required, trimmed)
  - description?: string
  - columnId: ColumnId
  - createdAt: ISO string

### 5.3 API (se presente)
- Endpoint:
  - POST /cards
  - GET /board
- Errori standard:
  - 400 validation_error
  - 500 internal_error

### 5.4 Regole di validazione
- Titolo: required, trim, 1..120
- Descrizione: opzionale, max 2000

---

## 6) Acceptance Criteria (AC) — verificabili
Formato consigliato: “Dato / Quando / Allora”.

- AC-1: Dato che sono sulla board, quando la pagina carica, allora vedo 3 colonne con header corretto.
- AC-2: Dato che vedo "+ Aggiungi card", quando clicco, allora si apre un modal con Titolo e Descrizione.
- AC-3: Dato che il Titolo è vuoto, quando premo "Crea", allora vedo errore sul Titolo e non si crea la card.
- AC-4: Dato un Titolo valido, quando premo "Crea", allora il modal si chiude e la card appare in To Do.

---

## 7) Test Plan
### 7.1 Unit test
- Validazioni form (required/trim)
- Reducer/store (se presente)
- Component rendering base

### 7.2 Integration test
- Creazione card e render in colonna To Do

### 7.3 E2E (se applicabile)
- Flusso completo: apri modal → compila → crea → verifica

### 7.4 Manual test rapido
- Desktop e mobile
- Keyboard navigation nel modal
- Scroll colonne

---

## 8) Definition of Done (DoD)
- [ ] Tutti gli AC soddisfatti
- [ ] Typecheck OK
- [ ] Test unit/integration passano
- [ ] E2E (se presenti) passano
- [ ] Nessun warning/errore in console durante il flusso principale
- [ ] PR descrive cambi e include istruzioni di verifica

---

## 9) Output richiesti all’AI (obbligatori)
L’AI deve produrre:
1) Lista task tecnici atomici (con stima relativa S/M/L e dipendenze)
2) Piano di implementazione (ordine dei commit)
3) Implementazione completa (codice)
4) Test completi (unit + integration, e2e se richiesto)
5) Note di verifica (comandi e passaggi)
6) Se BUGFIX: Root cause + regress test

---

## 10) Prompt operativo (da dare all’AI/agent)
**Ruolo:** Sei un senior software engineer.  
**Regole:**
- Non inventare dipendenze non necessarie.
- Scrivi codice pronto per produzione.
- Mantieni naming chiaro, niente abbreviazioni inutili.
- Aggiungi test significativi, non “happy path” soltanto.
- Ogni modifica deve essere coerente con stack e convenzioni indicate.
- Se mancano info essenziali, fai 1 sola domanda e poi procedi con assunzioni minimali esplicitate.

**Consegna:**
- Genera prima la lista task, poi il piano commit, poi il codice e test, poi istruzioni di run.

---

## 11) Sezione “BUGFIX” (usa solo se Tipo richiesta = BUGFIX)
### 11.1 Descrizione bug
- Comportamento attuale:
- Comportamento atteso:
- Impatto:
- Frequenza:

### 11.2 Riproduzione
Passi numerati.

### 11.3 Evidenze
- Log / screenshot / stack trace:
- Link issue:

### 11.4 Criteri di fix
- Test di regressione obbligatorio: SÌ/NO

---

## 12) Sezione “TEST” (usa solo se Tipo richiesta = TEST)
### 12.1 Copertura desiderata
- Componenti:
- Flussi:
- Casi limite:

### 12.2 Tooling
- Runner:
- Mocking:
- E2E:

---

## 13) Sezione “REFACTOR” (usa solo se Tipo richiesta = REFACTOR)
- Obiettivo refactor:
- Vincoli (no behavior change):
- Metriche (bundle size, complexity, ecc.):

---

# ESEMPIO COMPILATO (MINIMO) — FEATURE: Kanban Board
## Metadati
- ID: WO-20260127-001
- Tipo richiesta: FEATURE
- Priorità: P1

## FR
- FR-1: 3 colonne To Do/Doing/Done.
- FR-2: "+ Aggiungi card" apre modal con titolo(required) e descrizione(optional).
- FR-3: Crea card in To Do.

## AC
- AC-1..AC-4 come sopra.

## DoD
- Typecheck + test pass.

