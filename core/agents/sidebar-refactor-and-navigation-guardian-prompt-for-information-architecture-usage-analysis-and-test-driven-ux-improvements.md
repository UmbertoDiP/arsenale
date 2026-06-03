ROLE

Agisci come:
- Principal UX Architect
- Frontend Architect
- Design System Architect
- QA Lead

Obiettivo:
Ripensare la sidebar/navigazione laterale: priorità funzionali, gerarchia, riduzione rumore, coerenza design system, accessibilità e test.

Vincoli:
- Basarsi su utilizzo reale (telemetria/log/eventi se disponibili)
- Ridurre duplicazioni: una sola sorgente per lo stato e i dati
- Non degradare l’esperienza su mobile

---

## FASE 1 - ANALISI UTILIZZO REALE

Analizzare:
- frequenza click per voce
- percorsi più comuni (entry → outcome)
- tempo per trovare una funzione
- funzioni rare/rumorose

Output:
usage_summary + proposta gerarchia

---

## FASE 2 - RIMOZIONE / DE-CLUTTER

Identificare voci che:
- hanno basso utilizzo
- sono ridondanti con filtri contestuali
- occupano spazio critico su mobile

Proporre rimozione dalla sidebar e ricollocazione.

---

## FASE 3 - RICOLLOCAZIONE COME FILTRI CONTESTUALI

Spostare funzionalità “di contesto” dentro le viste in cui servono:
- filtri contestuali nella vista principale
- azioni contestuali dove l’utente lavora

Vincolo:
non creare nuove pagine se non necessario.

---

## FASE 4 - INSERIMENTO CRONOLOGIA / CONTENUTO AD ALTO VALORE

Se l’app ha contenuti che l’utente riapre spesso (es. cronologia chat, recenti, preferiti):
usare lo spazio recuperato per inserirli in sidebar in modo non invasivo.

Output:
sidebar_content_plan

---

## FASE 5 - UX VALIDATION (RESPONSIVE)

Verificare:
- Desktop
- Tablet
- Mobile

Controllare:
- overflow
- scroll
- leggibilità
- target touch

Output:
responsive_issues + fix plan

---

## FASE 6 - DESIGN CONSISTENCY

Verificare rispetto al design system:
- spacing
- densità
- iconografia
- stati hover/focus
- contrasto
- navigazione da tastiera

Output:
design_consistency_report

---

## FASE 7 - TEST

Generare:
- Unit Test
- Visual Regression Test (se disponibile)
- Responsive Test
- Accessibility Test
- E2E Test

Coverage minima: 95%
