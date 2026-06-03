# KDP Multi-Agent Pipeline — Come Funziona

Ingresso:
- INGRESSO_PROMPT.md

## Obiettivo
Trasformare prompt testuali in moduli componibili con:
- input esplicito (JSON)
- output deterministico (JSON validabile)
- regole di transizione (DAG iterativo)

## Moduli (ruoli nel grafo)
- INGESTION: da materiale grezzo a Markdown strutturato (es. estrai-conversazione-md)
- ARCHITECT: merge fonti e struttura libro KDP-ready (es. NOTEBOOKLM_MERGE_EBOOK_KDP_PROMPT)
- CRITIC: auditing e scoring (content-gap, privacy-scan, scan-ai-pdf, assets-gate)
- FIXER: riscrittura guidata dai finding del CRITIC
- EXPORT & DESIGN: rigenerazione artefatti (PDF, cover, preview images) tramite tool locali

## Contratti JSON
Ogni prompt diventa un “Prompt Contract”:
- definisce il ruolo (es. CRITIC)
- dichiara input e output (schema)
- impone vincoli di formato: output JSON-only

Schema del contratto:
- contracts\prompt-contract.schema.json

Contratti già pronti:
- contracts\content-gap.contract.json
- output schema: contracts\content-gap.output.schema.json
- contracts\privacy-scan.contract.json
- output schema: contracts\privacy-scan.output.schema.json
- contracts\scan-ai-pdf.contract.json
- output schema: contracts\scan-ai-pdf.output.schema.json
- contracts\assets-gate.contract.json
- output schema: contracts\assets-gate.output.schema.json

## Stato (state)
Lo stato è un singolo oggetto JSON che viaggia tra i nodi:
- identità del progetto (titolo, nicchia, lingua, tono)
- risultati di qualità (score, severità, findings)
- gates + blocks + approvals (copertine/immagini) per readiness produzione
- puntatori ai file canonici e agli artefatti

Schema + esempio:
- state\state.schema.json
- state\state.example.json

## Regole di transizione (core)
- CRITIC produce:
  - score 0..10
  - severità globale: OK | BASSO | MEDIO | ALTO | CRITICO
  - findings strutturati + top10 + piano step-by-step
- Decisione:
  - se severità ∈ {CRITICO, ALTO} oppure score < soglia → FIXER
  - altrimenti → Privacy Scan → Export/Design → Scan-AI → Assets Gate

## Privacy Scan (prima della generazione finale)
Nodo CRITIC aggiuntivo:
- privacy-scan: individua PII/dati sensibili reali e restituisce JSON con snippet mascherati
- Gate:
  - se overallSeverity ∈ {CRITICO, ALTO} → blocca Export/Design finché il testo non è anonimizzato
  - altrimenti → continua verso Export/Design

## Scan-AI (post export)
Nodo CRITIC aggiuntivo (consigliato su testo estratto dal PDF stabile):
- scan-ai-pdf: individua artefatti tipici da LLM/prompt non revisionati
- Gate:
  - se overallSeverity ∈ {CRITICO, ALTO} → blocca la release e richiede fix editoriale

## Assets Gate (manuale + review umana)
Nodo CRITIC finale:
- assets-gate: verifica che gli asset richiesti alla pubblicazione esistano
- Se mancano cover/immagini: la pipeline entra in stato BLOCCATO finché non vengono generati manualmente (Gemini) e approvati da revisione umana

## Pronto per Trae.ai (orchestratore)
Master prompt operativo:
- MASTER_ORCHESTRATOR_PROMPT.md

## Piano di evoluzione
Roadmap tecnica e criteri di completamento:
- PIPELINE_PLAN.md
