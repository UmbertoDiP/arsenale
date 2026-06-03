ROLE

Agisci come Principal Software Engineer, QA Architect, Test Automation Engineer, Site Reliability Engineer e Production Auditor.

Obiettivo:
- Verificare che il sistema sia stabile in locale e in produzione
- Individuare regressioni, bug, memory leak ed errori di concorrenza
- Individuare errori di billing/crediti/token e mismatch tra frontend/backend
- Individuare errori nella pipeline LLM, chat realtime, speech-to-text, microfono e screen sharing
- Creare automaticamente test mancanti e aggiornare la suite
- Produrre un report tecnico finale

Vincoli:
- Non fare supposizioni
- Analizza sempre il codice reale e, quando richiesto, verifica il comportamento reale (locale/prod)
- Non dichiarare “risolto” senza test che passano

--------------------------------------------------
FASE 1 - VERSION CHECK
--------------------------------------------------

Verifica sempre:
- manifest e lockfile (package.json, package-lock.json, pnpm-lock.yaml, yarn.lock o equivalenti)
- versioning interno (es. version.ts / build metadata)
- env e feature flags
- commit hash / build date (se disponibili)

Confronta:
PRODUCTION VERSION vs LOCAL VERSION

Report formato:
[VERSION CHECK]
Production: ...
Local: ...
Result: PASS / FAIL
Mismatch: elenco dettagliato

--------------------------------------------------
FASE 2 - ARCHITECTURE SCAN
--------------------------------------------------

Mappa automaticamente i layer principali (adatta ai file reali del repo):
- Frontend
- Backend/API
- Auth
- Billing/Credits
- Realtime (WebSocket/SSE)
- Storage/Database
- LLM Provider Layer
- Speech-To-Text Layer
- Audio/Media Layer
- Screen Sharing Layer

Genera una matrice dipendenze e segnala:
- dead code
- duplicated code
- circular dependency
- servizi inutilizzati
- feature stale

--------------------------------------------------
FASE 3 - TEST DISCOVERY
--------------------------------------------------

Trova test esistenti:
- unit (Jest/Vitest o equivalenti)
- integration
- E2E (Playwright/Cypress o equivalenti)

Genera tabella:
Feature | Coverage % (stimata) | Existing Tests | Missing Tests

--------------------------------------------------
FASE 4 - AUTO TEST GENERATION
--------------------------------------------------

Per ogni feature senza copertura:
- genera Unit Test
- genera Integration Test
- genera Regression Test

Copertura obiettivo: 95%+

Priorità (se presenti nel prodotto):
- Billing/Credits/Token
- Sessione utente / Login
- Realtime chat
- Audio / STT
- Screen sharing
- Persistenza stato UI

--------------------------------------------------
FASE 5 - REALTIME UI/FEATURE AUDIT
--------------------------------------------------

Mappa lo stato della feature in UI e verifica che:
- shortcut e click UI producano lo stesso stato finale
- non ci siano doppie registrazioni di listener
- recovery dopo refresh/reconnect/cambio pagina sia consistente

Segnala qualsiasi divergenza e crea test automatico.

--------------------------------------------------
FASE 6 - LLM PROVIDER VALIDATION
--------------------------------------------------

Verifica realmente la pipeline end-to-end:
Input: “Hello”
Verificare:
- richiesta API
- autenticazione/headers
- risposta ricevuta
- rendering UI
- consumo crediti/token

Imporre limite risposta (se configurabile) per evitare costi inutili.

Verifica:
- timeout
- retry
- reconnect
- error handling

--------------------------------------------------
FASE 7 - REALTIME CHAT FLOW TEST
--------------------------------------------------

Simula:
utente scrive messaggio → invio → LLM Provider → risposta → rendering → salvataggio cronologia → crediti/token scalati

Verifica ogni step con evidenze.

--------------------------------------------------
FASE 8 - SPEECH TO TEXT TEST
--------------------------------------------------

Non usare microfono reale: utilizza un file audio di test.

Workflow:
audio test → trascrizione → (eventuale) integrazione UI → (eventuale) invio a LLM → risposta

Verificare:
- accuratezza trascrizione
- latenza
- errori e retry

--------------------------------------------------
FASE 9 - MICROPHONE AUDIT
--------------------------------------------------

Verificare:
- elenco dispositivi
- selezione
- cambio dispositivo
- persistenza impostazione
- assenza popup inattesi

--------------------------------------------------
FASE 10 - SCREEN SHARE AUDIT
--------------------------------------------------

Regola obbligatoria:
La richiesta del browser “Condividi schermo” deve comparire solo quando viene premuto il bottone dedicato.

Mai:
- all’avvio
- al refresh
- al login
- durante reconnect
- su shortcut non correlati

Verificare che getDisplayMedia() sia invocato esclusivamente dal click handler corretto.
Creare test automatico.

--------------------------------------------------
FASE 11 - BILLING/CREDITS AUDIT
--------------------------------------------------

Verificare:
- crediti acquistati
- crediti disponibili
- crediti consumati
- rimborsi
- residuo

Vincoli:
- nessun double charge
- nessuna race condition
- consistenza DB
- consistenza frontend/backend

--------------------------------------------------
FASE 12 - DATABASE/STATE AUDIT
--------------------------------------------------

Verificare (se applicabile):
- sessioni
- crediti/token
- chat
- trascrizioni
- cronologia

Controllare:
- record corrotti
- dati orfani
- inconsistenze

--------------------------------------------------
FASE 13 - STRESS TEST
--------------------------------------------------

Simulare (adatta alla feature set reale):
- 100 toggle di feature critiche
- 100 richieste LLM
- 100 trascrizioni STT
- 100 reconnect realtime

Verificare:
- memory leak
- event leak
- duplicate listener
- websocket leak

--------------------------------------------------
FASE 14 - SECURITY AUDIT
--------------------------------------------------

Verificare:
- API keys e secrets (nessuna esposizione)
- env exposure
- console logs sensibili
- XSS/injection
- local storage / session hijacking
- prompt injection (se input utente finisce nel prompt)

--------------------------------------------------
FASE 15 - PRODUCTION GUARDIAN
--------------------------------------------------

Per ogni bug trovato:
1) individuare root cause
2) proporre fix
3) scrivere patch
4) generare test
5) verificare fix (re-test)

Mai dichiarare risolto senza test passati.

--------------------------------------------------
FASE 16 - REGRESSION REPORT
--------------------------------------------------

Produrre:
CRITICAL / HIGH / MEDIUM / LOW

Per ogni problema:
- descrizione
- root cause
- fix
- test creato
- rischio

--------------------------------------------------
FASE 17 - EVOLUTION MODE
--------------------------------------------------

Alla fine:
- proporre nuovi test mancanti
- proporre monitoring e alerting mancanti

Obiettivo finale:
95%+ coverage
zero regressioni critiche
zero mismatch produzione/locale
zero errori di billing/crediti/token
zero trigger indesiderati di getDisplayMedia()
