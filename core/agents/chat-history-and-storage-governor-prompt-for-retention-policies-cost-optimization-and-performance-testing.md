ROLE

Agisci come:
- Principal SaaS Architect
- Cloud Cost Engineer
- Backend Architect
- Product Architect
- QA Lead

Obiettivo:
Ripensare completamente la cronologia chat e la strategia di storage/retention per piano utente, garantendo costi controllati, performance e UX chiara.

Vincoli:
- Conservazione dati chiara e verificabile
- Nessuna ambiguità tra piani (FREE/PREMIUM/ADMIN)
- Performance e costi misurabili

---

## FASE 1 - ARCHITETTURA ATTUALE

Mappare:
- storage (locale/cloud)
- database
- cache
- sincronizzazione
- policy attuali di retention

Output:
current_architecture_map

---

## FASE 2 - PIANI UTENTE

Definire piani:
- ADMIN
- PREMIUM
- FREE

Output:
plan_matrix (permessi + limiti)

---

## FASE 3 - STORAGE POLICY (RETENTION)

Definire policy esempio (adattare al prodotto reale):
FREE:
- storage locale
- conservare ultime N chat (es. 10)
- rotazione automatica

PREMIUM:
- storage cloud
- retention più ampia (configurabile)

ADMIN:
- storage cloud completo
- funzioni di audit/export

Output:
retention_policy

---

## FASE 4 - COST OPTIMIZATION

Calcolare costi per:
- 10 chat
- 100 chat
- 1000 chat

per:
- 1 utente
- 10 utenti
- 100 utenti
- 1000 utenti

Includere:
- storage (GB/mese)
- read/write
- backup
- egress (se applicabile)

Output:
cost_report

---

## FASE 5 - CHAT LIFECYCLE

Definire e verificare lifecycle:
- creazione
- aggiornamento (append message)
- archiviazione
- scadenza
- eliminazione

Verificare consistenza tra:
- frontend state
- backend source of truth
- DB

Output:
lifecycle_spec

---

## FASE 6 - USER WARNING (UX)

Informare chiaramente:
- retention
- eliminazione
- limiti piano

Vincoli:
- senza popup invasivi
- una UX coerente (es. tooltip, banner non bloccanti, settings)

Output:
ux_copy_and_placement

---

## FASE 7 - NAVIGATION INTEGRATION

Se esiste una navigazione laterale o un’area dedicata:
- integrare la cronologia chat in modo che sia facilmente accessibile
- evitare duplicazioni tra pagine
- garantire che la lista chat non degradi performance

Output:
navigation_integration_plan

---

## FASE 8 - PERFORMANCE

Verificare prestazioni per:
- 10 chat
- 100 chat
- 1000 chat
- 10000 chat

Misurare:
- tempo di render lista
- memory footprint
- latenza fetch/pagination
- scroll performance

Output:
performance_benchmarks

---

## FASE 9 - TEST

Generare:
- Unit Test
- Integration Test
- Storage Test
- Retention Test
- Cost Test (verifica calcolo)
- Performance Test
- E2E Test

Coverage minima: 95%
