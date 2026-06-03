SYSTEM INITIALIZATION

Virtual Skill Load via skills.sh abstraction: npx skills install @kdpify/prequel-extractor-and-generator
Environment: Technical Absolute Mode. Nessun meta-testo. Nessun commento dell'AI.
Input Context: Ebook principale e/o fonti allegate nella chat.

OBIETTIVO PRINCIPALE

Analizzare approfonditamente l'ebook (o i documenti) allegato alla conversazione e generare un ebook "Prequel" (o "Volume 0" / "Crash Course Fondazionale") completo e "production-ready" in un singolo file Markdown.
Il tuo compito NON è riassumere l'ebook allegato, ma fare Reverse-Engineering Didattico: devi individuare tutti i concetti avanzati, le terminologie, i pattern e le tecnologie che nel testo principale sono dati per scontati, e generare un libro che spieghi da zero quei fondamenti (es. se il testo allegato parla di "Race Condition e Lock in Java", tu devi spiegare cos'è la memoria, cos'è un Thread, cos'è il multithreading e come funziona la JVM).

PROTOCOLLO ANTI-TOKEN LIMIT (AUTO-PAGINAZIONE)

Se la mole di testo generata rischia di superare il tuo limite di token di output, NON riassumere, NON accelerare la conclusione e NON omettere alcun dettaglio o esempio.
Applica questa regola ferrea:

Interrompi la generazione in modo netto (anche a metà di una frase o di una parola).

Non aggiungere alcuna scusa, spiegazione o frase di chiusura.

Attendi il mio comando esatto: "stampa".

Al ricevimento del comando "stampa", riprendi la generazione esattamente dall'ultimo carattere emesso, senza ripetere nulla e continuando il flusso come se non ci fosse stata alcuna interruzione.

VINCOLI NON NEGOZIABILI E LOGICA DI ESTRAZIONE

Scansione del Gap: Cerca nel documento allegato ogni acronimo non spiegato, ogni architettura menzionata di passaggio, ogni pre-requisito implicito. Questi formano l'indice del nuovo libro.

Tone of Voice: Divulgativo ma tecnicamente ineccepibile. Stai preparando il lettore ad affrontare un testo complesso (l'ebook principale).

Zero Placeholder: Niente TODO, TBD, [...], "inserisci qui". Ogni sezione deve essere scritta per intero.

Nessun taglio: Riorganizza se serve, ma espandi sempre con esempi pratici ed analogie chiare.

Output rigorosamente e solamente in Markdown.

STRUTTURA MINIMA OBBLIGATORIA DELL'OUTPUT

Devi produrre il documento seguendo esattamente questa sequenza gerarchica e formale:

# <Titolo Definitivo del Prequel> (unico h1 in tutto il file, es. "I Fondamenti di [Argomento]")

## <Sottotitolo> (es. "Tutto ciò che devi sapere prima di affrontare l'architettura avanzata")

<Autore>

\pagebreak

## Copyright (Tutti i diritti riservati. © 2026 )

\pagebreak

BLOCCO ASSET KDP (TESTO ESATTO E OBBLIGATORIO)

## ASSET FINALI PER LA PUBBLICAZIONE AMAZON KDP
Titolo Definitivo: <Titolo>
Sottotitolo: <Sottotitolo>
Autore: <Autore>
Categorie KDP Suggerite:
- <Cat 1>
- <Cat 2>
Backend Search Terms
- <keyword 1>
- <keyword 2>
- <keyword 3>
## Descrizione KDP (HTML Ready)
```html
<p>Descrizione ottimizzata per la SEO di Amazon KDP. Sottolinea che questo libro è il punto di partenza ideale per principianti assoluti prima di passare a concetti avanzati...</p>


\pagebreak

## Indice (elenco puntato nidificato con capitoli e paragrafi numerati es: 1.1, 1.2)

\pagebreak

CORPO DEL LIBRO (IL "CRASH COURSE")

## Introduzione: Perché questo libro? (Spiega che prepara il terreno per concetti avanzati).

## Capitolo 1 — I Mattoni Fondamentali (Inserisci \pagebreak prima di ogni nuovo capitolo. Qui spieghi i concetti di base 0 assoluto emersi dall'analisi).

### 1.1 <Concetto Base 1> (es. Cos'è un Thread).

## Capitolo N — <Titolo> (Affronta progressivamente tutti i prerequisiti trovati nelle fonti).

## Conclusione: Sei pronto per il livello successivo

\pagebreak

## Glossario di transizione (Definizioni base che fungeranno da ponte verso l'ebook principale).

\pagebreak

## Un ultimo favore (Call to action per lasciare una recensione su Amazon e invito a leggere il Volume successivo).

\pagebreak

APPENDICE Q&A "DUBBI DA PRINCIPIANTE" (BLOCCO OBBLIGATORIO)

## Appendice: Q&A - Le domande che non hai osato fare

Formula almeno 10-15 domande da neofita assoluto, basate sugli argomenti complessi del documento principale. Mettiti nei panni di chi si blocca alla riga 1.

Rispondi a ciascuna in modo empatico, usando metafore semplici ma tecnicamente corrette. L'obiettivo è distruggere la "sindrome dell'impostore" del lettore.

INIZIA ORA L'ANALISI DEI DOCUMENTI ALLEGATI E LA GENERAZIONE DEL FILE MARKDOWN SEGUENDO LE DIRETTIVE.

-------> fonte principale ebook: Java Multithreading e Concorrenza Avanzata La Guida Definitiva per Sviluppatori Enterprise.pdf

generami l'appendice da inserire  all'inzioi ebook per psiegare le cose che si sono date per scontato e prosegui