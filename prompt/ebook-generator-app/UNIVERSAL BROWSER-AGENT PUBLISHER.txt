🚀 MASTER PROMPT: UNIVERSAL BROWSER-AGENT PUBLISHER (CORE ENGINE 2026)
Persona: Agisci come Principal Software Architect. Devi progettare un modulo di pubblicazione automatizzata universale e "Platform-Agnostic" da integrare come feature premium in un ecosistema di generazione contenuti (Ebook, PDF, MP3). Il sistema deve essere basato su un'architettura a Plugin/Adapter per supportare qualsiasi sito web tramite configurazione.

1. ARCHITETTURA "PLUGIN-BASED" (ESTENSIBILITÀ)
Agnostic Core: Il core non deve sapere dove sta pubblicando. Deve limitarsi a orchestrare il flusso: Scan Catalogo -> Carica Driver Sito -> Esegui Sequenza Azioni.

Site Adapters: Crea una cartella /adapters dove ogni file JSON/YAML definisce la "Ricetta" per un sito specifico (es: gumroad.yaml, wordpress.json).

Action Mapping: Ogni "Ricetta" deve mappare i dati del catalogo (Titolo, File, Prezzo) ai selettori CSS del sito target e definire l'ordine delle operazioni (es: 1. Login, 2. Upload, 3. Metadata, 4. Publish).

2. INTEGRAZIONE CON IL CATALOGO (INTELLIGENT SCANNER)
Il bot deve iniettarsi nel progetto esistente e monitorare la cartella /dist o /outputs.

Dependency Injection: Deve leggere un file registry.db (o un JSON globale) per sapere quali file sono "Pronti per la pubblicazione" e quali sono già stati pubblicati, evitando duplicati.

Media Handling: Deve essere in grado di gestire diversi MIME-type (Audio per MP3, Documenti per PDF/EPUB) e associarli correttamente ai campi di upload del sito target.

3. BROWSER AGENT: IL "GHOST OPERATOR"
Engine: Playwright con supporto per Multi-Profile Management. Ogni sito target deve poter avere una sessione isolata in /sessions/{site_name}.

Universal Stealth Suite:

Simulazione di impronte digitali (Fingerprinting) reali.

Gestione dei Proxy dinamica (opzionale tramite config).

Human-Flow: Implementa movimenti del mouse basati su curve di Bézier e digitazione con errori e correzioni simulate per evitare i sistemi anti-bot (Cloudflare/DataDome).

Visual Debugger: Implementa una modalità "Shadow" dove il bot mostra a video cosa sta facendo con un overlay testuale per l'utente, utile per il debug durante la vendita.

4. CLI INTERFACE (OPERATORE DI COMANDO)
Sviluppa una CLI potente con i seguenti comandi:

agent deploy --target [site_name]: Avvia la pubblicazione su un sito specifico.

agent status: Mostra un grafico o una tabella della copertura distributiva (es. "Libro A: Pubblicato su Amazon, In attesa su Gumroad").

agent learn: Una modalità guidata in cui l'utente naviga sul sito e il bot "registra" i selettori per creare un nuovo Adapter automaticamente.

5. OUTPUT RICHIESTO (REQUISITI TECNICI)
Linguaggio: Python o TypeScript (pulito e tipizzato).

File Structure:

/engine: Logica di automazione pura.

/adapters: Le configurazioni dei siti target.

/vault: Gestione sicura delle credenziali (criptate o via .env).

/cli: Punto di ingresso per l'utente.

Documentazione: Genera un file DOCUMENTATION.md che spieghi come un utente può creare un nuovo "Adapter" per un sito non supportato in meno di 5 minuti.

MISSIONE: Crea un sistema "Plug & Play" che trasformi una cartella di file multimediali in un impero distributivo automatizzato. Il codice deve essere così modulare da poter essere venduto come "Framework di Automazione Web" indipendente dal prodotto ebook.

Perché questo prompt è un salto di qualità (Plus Ultra):
Valore Commerciale: Non stai più vendendo un "bot per KDP" (che Amazon potrebbe rompere). Stai vendendo una piattaforma di automazione che l'utente può usare per qualsiasi cosa.

Resilienza: Se un sito cambia grafica, l'utente non deve aspettare che tu aggiorni il codice. Può aggiornare il file adapter.yaml da solo.

Scalabilità: Puoi vendere "pacchetti di siti" separatamente (es. "Modulo Social", "Modulo Store Digitali", "Modulo Piattaforme Ebook").

Professionalità: L'uso di un sistema a Plugin è lo standard dell'industria per i software enterprise.

Consiglio tecnico per Trae.ai: Quando lanci questo prompt, chiedi a Trae di implementare una funzione di "Auto-Healing". Se il bot non trova un pulsante, deve provare a cercarlo usando l'Intelligenza Artificiale (analizzando il DOM e cercando il testo più simile come "Upload" o "Carica") invece di crashare subito.