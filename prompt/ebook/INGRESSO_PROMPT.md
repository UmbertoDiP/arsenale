# INGRESSO (WORKSPACE) — KDP MULTI-AGENT PIPELINE

Repo:
- C:\Users\umber\Documents\MyProjects\arsenale

Cartella pipeline:
- C:\Users\umber\Documents\MyProjects\arsenale\prompt\ebook

Obiettivo:
- Trasformare prompt “isole” in moduli orchestrabili (DAG iterativo) con I/O JSON rigido.
- Standardizzare lo stato (state) e le regole di transizione (Critic → Fixer loop).

File chiave:
- Come funziona (overview): HOW_IT_WORKS.md
- Piano operativo (dettagliato): PIPELINE_PLAN.md
- Master prompt orchestratore: MASTER_ORCHESTRATOR_PROMPT.md
- Stato: state\state.schema.json + state\state.example.json
- Contratti prompt (JSON): contracts\
  - prompt-contract.schema.json
  - content-gap.contract.json
  - content-gap.output.schema.json

Primo modulo già contrattualizzato:
- CRITIC: content-gap (audit lacune + score + findings JSON)

Comando mentale (regola di base):
- Se CRITIC restituisce severità CRITICO/ALTO oppure score < soglia → FIXER → CRITIC (loop).
- Se score >= soglia e nessun CRITICO/ALTO → passa a Scan-AI → Export/Design.

Chiusura conversazione (standard operativo):
- Aggiorna sempre: INGRESSO_PROMPT.md + HOW_IT_WORKS.md (se cambia la pipeline).
- Se ci sono cambi repo: git add -A → commit (master) → push → tag → push tag.
- Ultimo messaggio in chat deve includere:
  - link al file INGRESSO_PROMPT.md
  - blocco copiabile con path assoluto del file INGRESSO_PROMPT.md
  - stato corrente (1–4 bullet) + next step (1–4 bullet) + comandi ready-to-use (max 6)

