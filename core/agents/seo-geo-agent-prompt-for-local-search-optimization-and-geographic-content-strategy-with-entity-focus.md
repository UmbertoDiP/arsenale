Per un uso commerciale, robusto e senza vincoli di licenza, la scelta migliore è puntare su repository open-source con licenza **MIT** o **Apache 2.0**.

Attualmente, per il protocollo MCP legato a Google Search Console, il repository di riferimento più solido e facilmente integrabile in ambienti Node.js è **`ahonn/mcp-server-gsc`** (o in alternativa, far generare all'agente un server custom basato sull'SDK ufficiale `@modelcontextprotocol/sdk` unito al pacchetto `googleapis`). Entrambe le strade sono 100% free for commercial use.

Se utilizzi agenti come Claude Code o Trae.ai nel tuo terminale, il prompt deve essere un vero e proprio "copione di esecuzione" (Runbook). L'AI non deve solo scrivere codice, ma eseguire comandi di sistema, scaricare file, creare chiavi e testare il loop.

Ecco il Master Prompt definitivo per la produzione. Copialo e incollalo direttamente nel tuo AI Agent.

---

### [INIZIO MASTER PROMPT PER L'AI AGENT]

**Ruolo e Missione**
Sei un Senior DevOps e Full Stack Architect. Il tuo obiettivo è installare, configurare, testare e mettere in produzione un server MCP (Model Context Protocol) per Google Search Console e Analytics, integrandolo con la nostra Single Page Application (SPA) in React.
L'obiettivo finale è creare un loop automatizzato e autonomo di "SEO & GEO Auto-Fixing".

**Fase 1: Setup dell'Infrastruttura (Scarica e Installa)**

1. Inizializza una nuova directory chiamata `seo-mcp-autofix` nella root del progetto.
2. Clona il repository open-source MIT: esegui `git clone https://github.com/ahonn/mcp-server-gsc.git` (o in alternativa, inizializza un progetto Node.js vuoto e installa `@modelcontextprotocol/sdk` e `googleapis` per creare un bridge custom da zero, scegli tu l'opzione più stabile).
3. Entra nella directory e lancia `npm install` o `pnpm install` per risolvere le dipendenze.

**Fase 2: Gestione Credenziali e Sicurezza (Google Cloud)**

1. Crea un file `.env` e inseriscilo in `.gitignore`.
2. Chiedimi (all'utente) di fornirti il JSON del Service Account di Google Cloud. **Fermati e attendi il mio input.**
3. Una volta ricevuto, salva il contenuto in un file `gcp-service-account.json` e mappa il percorso nel file `.env` (es. `GOOGLE_APPLICATION_CREDENTIALS=./gcp-service-account.json`).
4. Ricordami esplicitamente di andare sulla dashboard di Google Search Console e aggiungere l'email del Service Account come "Utente Delegato".

**Fase 3: Implementazione della Skill (Il Loop di Auto-Fix)**

1. Configura il file MCP settings del mio editor/ambiente in modo che esponga i tools di GSC (es. `gsc_inspect_url`, `gsc_get_errors`).
2. Crea uno script Node.js chiamato `seo-auditor.js`. Questo script dovrà:
* Leggere la `sitemap.xml` della nostra SPA React.
* Inviare in batch (rispettando il rate-limiting di Google) gli URL all'MCP tool `gsc_inspect_url`.
* Se un URL restituisce errori (Soft 404, indicizzazione fallita, o problemi Core Web Vitals), lo script deve catturare il JSON dell'errore.


3. Integra una funzione di "Auto-Patching": se l'errore è relativo al codice (es. Meta tag mancanti, canonical errati), lo script deve aprire il file React corrispondente (es. la view del router), applicare la modifica tramite manipolazione AST o regex sicure, e salvare il file.

**Fase 4: Testing Rigoroso (Test Driven DevOps)**
Non diamo nulla per scontato. Esegui questi test sequenziali nel terminale:

1. **Test di Autenticazione:** Lancia uno script di ping verso le API di Google per confermare che il Service Account sia valido. Se fallisce, esegui il debug dell'errore.
2. **Test di Lettura:** Ispeziona la homepage dell'app tramite l'MCP. Stampa l'output JSON in console.
3. **Test di Scrittura (Dry Run):** Simula un errore SEO su un file fittizio `TestComponent.tsx`. Fai in modo che il tuo script `seo-auditor.js` lo corregga e verifica che il file sia stato modificato correttamente senza rompere la sintassi React.

**Fase 5: Autorefresh e Produzione**

1. Genera un file bash `seo-cron.sh` o una GitHub Action (a seconda della mia infrastruttura) che avvii `seo-auditor.js` ogni 24 ore o ad ogni nuovo deploy.
2. Alla fine dell'intero processo, forniscimi un log chiaro: "Setup completato. MCP attivo. Pipeline di Auto-Fix pronta in produzione."

**Esecuzione:** Inizia ora dalla Fase 1 e procedi passo dopo passo. Fermati e chiedimi conferme solo dove esplicitamente richiesto.

### [FINE MASTER PROMPT]

---

### Un'ultima verifica

Questo prompt trasforma l'AI da un semplice "generatore di codice" a un operatore di sistema che clona, installa e testa l'infrastruttura.

Per la Fase 5 (Autorefresh), hai già in mente come vuoi far girare questo processo in background? Preferisci che venga integrato in una pipeline CI/CD (come GitHub Actions o GitLab CI) ad ogni push, oppure vuoi impostare un cron job su un tuo server/VPS locale che controlli tutto ogni notte?