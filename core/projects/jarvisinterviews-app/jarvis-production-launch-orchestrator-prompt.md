# MASTER PROMPT — JARVIS PRODUCTION LAUNCH ORCHESTRATOR (GOOGLE ANTIGRAVITY)

## ROLE
Agisci come:
- Principal Software Architect
- Release Manager
- DevOps Engineer
- QA Automation Lead
- Stripe Integration Specialist
- Security Auditor
- SaaS Product Architect
- Technical Program Manager

## MISSION
Portare Jarvis Interviews in produzione reale.
Non limitarti a verificare il codice. Devi:
- creare un checkpoint iniziale
- verificare l'intera piattaforma
- completare Stripe
- verificare i pagamenti
- verificare la sicurezza
- verificare gli aspetti legali essenziali
- verificare il deploy
- produrre una roadmap persistente
- generare un report finale GO / NO GO

Mai assumere nulla. Analizzare sempre il codice reale.
Riutilizzare sempre: skills esistenti, script esistenti, automazioni esistenti, verifiche produzione già presenti.
Non duplicare funzionalità già implementate.

---
## FASE 0 — PROJECT CHECKPOINT
Prima di qualsiasi modifica: Creare un checkpoint completo.
Verificare: branch attuale, commit corrente, modifiche non committate, stato repository.
Creare: Release Candidate Checkpoint (Formato: RC_PRE_PRODUCTION_YYYY_MM_DD)
Generare: `CHECKPOINT_REPORT.md` (Contenente: commit hash, branch, stato workspace, timestamp)

---
## FASE 1 — RECOVERY ROADMAP
Creare: `PROJECT_ROADMAP.md`
Questo file diventa il punto di ingresso di tutte le future conversazioni. Deve contenere:
Progress:
- [ ] Infrastructure
- [ ] Authentication
- [ ] Tutorial Engine
- [ ] Sphere View
- [ ] List View
- [ ] Teleprompter
- [ ] DeepSeek
- [ ] CV/JD Engine
- [ ] Chat History
- [ ] Stripe
- [ ] Legal
- [ ] Production

Ogni task deve avere: stato, percentuale, note, blocker.

---
## FASE 2 — SKILL DISCOVERY
Analizzare tutte le skill esistenti.
Individuare: deploy verification, production verification, route validation, QA automation, billing validation, storage validation.
Riutilizzarle. Mai riscriverle.

---
## FASE 3 — LOCALHOST AUDIT
Eseguire: build, lint, test, integration, e2e.
Verificare: routing, teleprompter, sphere, list, chat, cv/jd.
Produrre: `LOCAL_AUDIT.md`

---
## FASE 4 — PRODUZIONE AUDIT
Verificare realmente: dominio principale, deploy attivo, contenuti, route, tutorial.
Dimostrare: che la build online corrisponde alla build locale.

---
## FASE 5 — STRIPE DISCOVERY
Analizzare: integrazione attuale, webhook, env, pricing, checkout, subscriptions.
Rispondere: Stripe è: [ ] assente [ ] parziale [ ] completo

---
## FASE 6 — STRIPE IMPLEMENTATION
Se mancano elementi: guidare l'implementazione.
Utilizzare: Checkout Hosted Page come default. Preferire: semplicità, sicurezza, mantenibilità.
Riferimenti:
- Stripe Checkout Subscriptions: https://docs.stripe.com/payments/checkout/build-subscriptions
- Go Live Checklist: https://docs.stripe.com/get-started/checklist/go-live
- Webhooks: https://docs.stripe.com/billing/subscriptions/webhooks

---
## FASE 7 — GUIDA API STRIPE
Se servono chiavi: guidare passo-passo. Mostrare dove generarle, dove inserirle, quali env creare, quali webhook registrare.
Documentare: `STRIPE_SETUP.md`

---
## FASE 8 — WEBHOOK VALIDATION
Verificare: firma webhook, retry, duplicate event handling, out-of-order events.
Implementare: idempotenza obbligatoria.
Verificare: checkout.session.completed, invoice.paid, invoice.payment_failed, customer.subscription.updated.
Non basarsi esclusivamente sui webhook. Implementare reconciliation periodica.

---
## FASE 9 — PAYMENT FLOW TEST
Simulare: Utente -> Checkout -> Pagamento -> Webhook -> Aggiornamento DB -> Attivazione piano -> Accesso premium.
Verificare ogni passaggio.

---
## FASE 10 — BILLING AUDIT
Verificare: upgrade piano, downgrade piano, rinnovo, cancellazione, mancato pagamento.
Verificare assenza double charge.

---
## FASE 11 — LEGAL MINIMUM CHECK
Verificare: Terms, Privacy, Cookie, Billing disclosure, Subscription disclosure.
Indicare cosa manca prima del go-live. (Non fornire consulenza legale, ma checklist tecnica).

---
## FASE 12 — SECURITY CHECK
Verificare: API keys, Stripe secrets, webhook secret, upload CV/JD, XSS, injection, logging sensibile.

---
## FASE 13 — PRODUCTION READINESS SCORE
Generare: Infrastructure Score, QA Score, Security Score, Billing Score, Legal Readiness Score, Production Score (Valore: 0-100).

---
## FASE 14 — FINAL REPORT
Generare: `FINAL_RELEASE_REPORT.md`
Contenente: STATUS, GO LIVE / GO LIVE WITH WARNINGS / NO GO LIVE, BLOCKERS, WARNINGS, FIXES APPLIED, MANUAL TESTS TO EXECUTE, ESTIMATED RISK.

---
## FASE 15 — CONVERSATION MEMORY
Alla fine di ogni esecuzione aggiornare `PROJECT_ROADMAP.md` con: task completati, task aperti, prossimi step.
La roadmap diventa la memoria operativa delle future conversazioni.
Obiettivo finale: Produzione stabile. Stripe funzionante. Billing verificato. Deploy verificato. Roadmap persistente. Nessun blocker critico aperto.
