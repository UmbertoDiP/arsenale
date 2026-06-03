# SYSTEM INITIALIZATION
> Virtual Skill Load via skills.sh abstraction: `npx skills install @kdpify/one-shot-generator`
> Environment: Technical Absolute Mode. Nessun meta-testo. Nessun commento dell'AI.


## OBIETTIVO PRINCIPALE
Generare un ebook completo e "production-ready" in un singolo file Markdown, nativamente compatibile con la pipeline `kdpify`, includendo in coda un'appendice esaustiva di Domande e Risposte (Q&A) per azzerare qualsiasi necessità di iterazione o prompt di follow-up successivi. La generazione deve essere esaustiva, massiva e definitiva ("One-Shot Generation").

## PROTOCOLLO ANTI-TOKEN LIMIT (AUTO-PAGINAZIONE)
Se la mole di testo generata rischia di superare il tuo limite di token di output, **NON riassumere, NON accelerare la conclusione e NON omettere alcun dettaglio o esempio**. 
Applica questa regola ferrea:
1. Interrompi la generazione in modo netto (anche a metà di una frase o di una parola).
2. Non aggiungere alcuna scusa, spiegazione o frase di chiusura.
3. Attendi il mio comando esatto: `"stampa"`.
4. Al ricevimento del comando `"stampa"`, riprendi la generazione **esattamente dall'ultimo carattere emesso**, senza ripetere nulla e continuando il flusso come se non ci fosse stata alcuna interruzione.

## VINCOLI NON NEGOZIABILI
- **Zero Placeholder**: Niente `TODO`, `TBD`, `[...]`, "inserisci qui". Ogni sezione deve essere scritta per intero.
- **Nessun taglio**: Riorganizza se serve, ma espandi sempre. Il codice o gli script (se presenti) devono essere completi, robusti e senza omissioni.
- Output rigorosamente e solamente in **Markdown**.

## STRUTTURA MINIMA OBBLIGATORIA DELL'OUTPUT
Devi produrre il documento seguendo **esattamente** questa sequenza gerarchica e formale:

1) `# <Titolo Definitivo>` (unico h1 in tutto il file)
2) `## <Sottotitolo>` (se esiste)
3) `**<Autore>**`
4) `\pagebreak`
5) `## Copyright` (Tutti i diritti riservati. © 2026 <Autore>)
6) `\pagebreak`

7) **BLOCCO ASSET KDP (TESTO ESATTO E OBBLIGATORIO)**
```markdown
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
<p>Descrizione ottimizzata per la SEO di Amazon KDP...</p>

8) `\pagebreak`
9) `## Indice` (elenco puntato nidificato con capitoli e paragrafi numerati es: 1.1, 1.2)
10) `\pagebreak`

11) **CORPO DEL LIBRO**
    - `## Prefazione` / `## Introduzione`
    - `## Capitolo N — <Titolo>` (Inserisci `\pagebreak` prima di ogni nuovo capitolo).
    - `### N.M <Sottoparagrafo>`
    - `## Conclusione`

12) `\pagebreak`
13) `## Legenda` (Raggruppa e definisci in ordine alfabetico tutti i termini tecnici, tecnologie e pattern citati nel testo).

14) `\pagebreak`
15) `## Un ultimo favore` (Call to action per lasciare una recensione su Amazon).

16) `\pagebreak`
17) **APPENDICE Q&A "ONE-SHOT" (NUOVO BLOCCO OBBLIGATORIO)**
    - `## Appendice: Q&A Avanzate`
    - Invece di aspettare che io ti faccia domande sulle fonti o sugli argomenti trattati, formula tu stesso almeno **10-15 domande complesse e specifiche** che un lettore esigente ti farebbe.
    - Rispondi a ciascuna in modo tecnico, prolisso e definitivo. Usa questa sezione per inserire tutti i dettagli, gli edge-case o gli approfondimenti che non hanno trovato spazio nel corpo principale. L'obiettivo è saturare completamente l'argomento.

**INIZIA ORA LA GENERAZIONE DEL FILE MARKDOWN SEGUENDO LE DIRETTIVE.**