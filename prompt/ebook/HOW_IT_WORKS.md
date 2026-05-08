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
- CRITIC: auditing e scoring (content-gap + scan-ai-pdf)
- FIXER: riscrittura guidata dai finding del CRITIC
- EXPORT & DESIGN: rigenerazione artefatti (PDF, cover, preview images) tramite tool locali

## Contratti JSON
Ogni prompt diventa un “Prompt Contract”:
- definisce il ruolo (es. CRITIC)
- dichiara input e output (schema)
- impone vincoli di formato: output JSON-only

Schema del contratto:
- contracts\prompt-contract.schema.json

Primo contratto pronto:
- contracts\content-gap.contract.json
- output schema: contracts\content-gap.output.schema.json

## Stato (state)
Lo stato è un singolo oggetto JSON che viaggia tra i nodi:
- identità del progetto (titolo, nicchia, lingua, tono)
- risultati di qualità (score, severità, findings)
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
  - altrimenti → Scan-AI → Export/Design

## Pronto per Trae.ai (orchestratore)
Master prompt operativo:
- MASTER_ORCHESTRATOR_PROMPT.md

## Piano di evoluzione
Roadmap tecnica e criteri di completamento:
- PIPELINE_PLAN.md

