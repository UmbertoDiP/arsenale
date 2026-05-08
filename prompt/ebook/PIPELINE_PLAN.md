# Piano Operativo — Conversione Prompt → Contratti JSON + Orchestrazione

Ingresso:
- INGRESSO_PROMPT.md

## Deliverable (modulari)
- contracts\prompt-contract.schema.json
- state\state.schema.json + state\state.example.json
- contracts\content-gap.contract.json + contracts\content-gap.output.schema.json
- MASTER_ORCHESTRATOR_PROMPT.md
- HOW_IT_WORKS.md (spiegazione) collegato a INGRESSO_PROMPT.md

## Convenzioni (rigide)
- Un contratto = un file JSON.
- Output degli agenti = JSON-only (nessun Markdown).
- Versionamento contratti: semver nel campo version.
- Tutti gli identificatori: kebab-case (es. content-gap, scan-ai-pdf).

## Modello di stato (state)
Lo state è l’unico contenitore di verità tra i nodi:
- project: titolo, nicchia, lingua, tono, persona
- artifacts: percorsi e nomi canonici (md, pdf, cover, preview)
- quality: score e severity (ultimo ciclo) + storico
- workflow: fase attuale, blocchi, soglie

Soglie iniziali consigliate:
- criticThresholdScore: 8.0
- blockSeverities: ["CRITICO","ALTO"]

## DAG (Directed Iterative Graph)
Nodi:
1) INGESTION → produce canonical_md
2) ARCHITECT → produce kdp_ready_md
3) CRITIC(content-gap) → produce findings + score
4) FIXER → riscrive sezioni target in base ai findings
5) CRITIC(scan-ai-pdf) → produce report artefatti
6) EXPORT & DESIGN → genera PDF + cover + preview assets

Regola loop:
- Se CRITIC(content-gap) blocca → FIXER → CRITIC(content-gap) (ripeti fino a score>=soglia e severity non bloccante)

## Strategia di conversione prompt
Per ogni prompt esistente in prompt\ebook\:
1) “Freeze” del prompt sorgente (.txt/.md) come riferimento immutabile
2) Creazione del contract JSON che:
   - inserisce input espliciti
   - impone output JSON rigido
   - include esempi minimi (input/output)
3) Creazione schema output JSON
4) Test manuale: eseguire il prompt su un documento campione e validare JSON

## Estensione (step successivi)
- Convertire scan-ai-pdf.txt in contract (CRITIC #2)
- Convertire estrai-conversazione-md.txt in contract (INGESTION)
- Convertire NOTEBOOKLM_MERGE_EBOOK_KDP_PROMPT.md in contract (ARCHITECT)
- Convertire agent-role-cover-design.txt e aggiorna-ebook.txt in contract (EXPORT & DESIGN)

