Ecco il **Master Prompt Definitivo "Plus Ultra"** unificato, ottimizzato per la produzione e pronto per essere incollato in un AI di sviluppo (come Cursor o Trae.ai). 

Questo prompt è stato ingegnerizzato seguendo le regole di massima densità informativa e precisione architetturale, espandendo le difese antibot e la resilienza strutturale emerse nelle nostre analisi precedenti, senza appesantire l'agente.

Copia e incolla tutto il blocco sottostante nella tua AI di sviluppo:

***

### 🚀 MASTER PROMPT: KDP INTEGRATED PUBLISHING ENGINE (PLUS ULTRA 2026)

**1. RUOLO E OBIETTIVO STRATEGICO**
Agisci come un **Full-Stack Software Architect** e **Expert Automation Engineer**. Il tuo compito è sviluppare da zero il modulo core di "Auto-Publishing" da integrare in un ecosistema esistente di generazione file (PDF, MP3, EPUB). Il prodotto finale deve essere una repository professionale, disaccoppiata e vendibile come SaaS o come pacchetto self-hosted.

**2. ARCHITETTURA CORE E DISACCOPPIAMENTO (DECUPPLING)**
*   **Modular Injection:** Progetta il bot come una "Feature Module" indipendente, capace di interfacciarsi con la cartella `/outputs` del progetto principale tramite un modulo `CatalogScanner`.
*   **Catalog Scanner:** Il modulo deve scansionare automaticamente le sottocartelle (es. `/pdf`, `/audiobooks`, `/ebooks`), identificare i file pronti e incrociarli con un file `manifest.json` contenente i metadati (Titolo, Descrizione, Prezzo). Se un libro è nel catalogo ma manca nel manifest, genera programmaticamente una bozza di metadati basata sul nome del file.
*   **Decoupling Pattern:** Separa in modo netto e impermeabile la logica di automazione (Browser Agent) dalla logica di business. Utilizza le interfacce `IBrowserAgent` e `IPublisher` per permettere futuri aggiornamenti o sostituzioni del motore di automazione senza rompere il core.

**3. INTERFACCIA UTENTE E ORCHESTRAZIONE (CLI)**
*   Crea una **CLI (Command Line Interface)** professionale utilizzando librerie moderne come Typer o Click.
*   Implementa l'orchestrazione tramite i seguenti comandi:
    *   `publish --all`: Scansiona il catalogo e pubblica tutto ciò che non è ancora stato caricato.
    *   `publish --check`: Verifica lo stato della sessione KDP e la validità pre-flight dei file.
    *   `publish --sync`: Aggiorna esclusivamente i prezzi o i metadati dei libri esistenti.
*   **Telemetria UI:** Il bot deve utilizzare la libreria *Rich* per mostrare barre di caricamento dinamiche e log colorati per ogni fase (Caricamento, Validazione Amazon, Prezzatura).

**4. BROWSER AGENT: STEALTH & RESILIENCE (KDP 2026)**
*   **Core Engine:** Implementa il motore di navigazione utilizzando **Playwright**.
*   **Session Persistence:** Usa `launchPersistentContext` per gestire la sessione nella cartella `./user_data`. L'utente eseguirà il login manualmente una sola volta, dopodiché il bot dovrà operare in modo 100% autonomo.
*   **Human-Like Behavior (Evasione Antibot):**
    *   Implementa `smart_type`: una digitazione artificiale con varianza di millisecondi tra i tasti.
    *   Genera movimenti del mouse non lineari e inserisci attese casuali (randomized delays) tra le interazioni e i cambi di tab.
    *   Evita il fingerprinting configurando User-Agent aggiornati e headers di rete realistici.
*   **2026 UI Compliance:**
    *   Gestisci il nuovo sistema a 3 categorie di Amazon KDP esclusivamente tramite l'interazione con la funzione "Search" (evitando la vecchia navigazione ad albero).
    *   **Quality Check:** Nel "Print Previewer", imponi al bot di attendere il rendering completo, navigare programmaticamente per almeno 5 pagine e cliccare automaticamente su "Approve".
*   **Error Recovery Avanzato:** Se Amazon mostra un popup di errore, il bot non deve bloccarsi in modo critico. Deve scattare uno screenshot salvandolo in `/logs/errors`, generare un report dettagliato per l'utente, e passare fluidamente all'elaborazione del libro successivo. *(Nota architetturale: Predisponi l'interfaccia IBrowserAgent affinché in futuro possa accogliere logiche esterne per il CAPTCHA solving).*

**5. DATA MANAGEMENT E VENDIBILITÀ**
*   **Estrazione UI (Cruciale):** Estrai TUTTI i selettori CSS/XPath in un file di configurazione esterno chiamato `selectors.yaml`. Nessun selettore deve essere hardcodato nella logica Playwright.
*   **Configurazione Utente:** Crea un file `settings.config.yaml` dove l'utente imposta: `default_royalty_rate`, `primary_marketplace`, `global_pricing_strategy`.

**6. OUTPUT E STRUTTURA RICHIESTA**
*   Scrivi codice (Python o TypeScript) modulare, fortemente tipizzato e commentato professionalmente.
*   Struttura le directory in questo modo:
    *   `/core`: Logica di scansione e orchestrazione.
    *   `/agents`: Il motore Playwright, le interfacce IBrowserAgent e il caricamento dei selettori.
    *   `/cli`: L'interfaccia a riga di comando.
    *   `/shared`: Utility generiche, logger avanzati e gestori di configurazione.
*   Genera un `Dockerfile` ottimizzato per eseguire browser headless in ambienti server effimeri.
*   Redigi un `README.md` tecnico per l'utente finale (Setup, configurazione Docker, Troubleshooting).

**MISSIONE FINALE:** Genera un sistema che permetta a un utente di scrivere `python main.py publish --all` e vedere i propri file trasformarsi in prodotti in vendita senza ulteriori interventi manuali. Procedi con la generazione completa dell'architettura e del codice. Se il testo generato è troppo lungo, interrompiti nei limiti di contesto e attendi il mio comando "continua" per completare il lavoro.

***

### Istruzioni operative per te (dopo aver incollato il prompt):
1. **Generazione continua:** L'AI inizierà a scrivere il codice per le interfacce, i moduli e la CLI. Se si ferma a metà di un file a causa dei limiti di lunghezza dell'output, scrivile semplicemente **"continua da dove ti sei fermata"**. Non perderà il contesto.
2. **Generazione dei Selettori:** Come discusso nella nostra analisi strategica, una volta che l'AI ha terminato di generare tutto il codice sorgente, impartisci **obbligatoriamente** questo comando aggiuntivo finale: 
> *"Eccellente. Ora crea il file `selectors.yaml` basandoti sull'ultima versione dell'interfaccia KDP di maggio 2026"*.