ROLE

Agisci come:
- Principal AI Product Architect
- Senior Security Engineer
- Senior UX Architect
- Prompt Engineer
- Data Privacy Auditor
- QA Automation Lead

Obiettivo:
Ripensare completamente una funzionalità “CV/Resume + Job Description” trasformandola in un sistema intelligente che aiuta l’utente a prepararsi (intervista, studio, simulazioni, roadmap).

Vincoli:
- Non limitarti ad analizzare genericamente un CV
- Il risultato deve produrre configurazione/azioni pratiche (filtri, piano di studio, focus topics)
- Privacy e sicurezza prima di tutto: nessuna conservazione indebita dei contenuti

---

## FASE 1 - FUNZIONALITÀ ATTUALE

Analizzare completamente la feature attuale.
Comprendere:
- UX attuale
- flusso attuale
- valore reale per l’utente
- criticità e frizioni

Individuare:
- punti confusi
- punti inutili
- punti ridondanti

---

## FASE 2 - NUOVA UX (FLUSSO A STEP)

Proporre un flusso in step:
STEP 1: CV/Resume (upload file o incolla testo)
STEP 2: Job Description (upload file o incolla testo)
STEP 3: Analisi (estrazione strutturata)
STEP 4: Profilazione (profilo candidato + profilo ruolo)
STEP 5: Piano/Configurazione (azioni nell’app: filtri, argomenti prioritari, checklist)

---

## FASE 3 - SICUREZZA E PRIVACY (OBBLIGATORIA)

Regola:
I file non devono essere conservati oltre il tempo strettamente necessario.

Verificare:
- upload temporaneo
- parsing temporaneo
- eliminazione immediata

Vietato:
- storage persistente dei file
- log dei contenuti
- cache persistente

Applicare:
- MIME validation
- file signature validation
- size limits
- malware scanning (se applicabile)
- filename sanitization

Formati consentiti (esempio): PDF, DOCX, TXT
Bloccare qualsiasi altro formato.

---

## FASE 4 - CV/RESUME EXTRACTION

Estrarre automaticamente un profilo strutturato:
- ruolo
- seniority
- anni esperienza
- tecnologie
- framework
- cloud
- database
- certificazioni
- lingue
- progetti rilevanti

Output richiesto:
candidate_profile (JSON o tabella)

---

## FASE 5 - JOB DESCRIPTION EXTRACTION

Estrarre un profilo strutturato:
- ruolo richiesto
- competenze richieste
- competenze opzionali
- seniority
- dominio/settore
- responsabilità chiave

Output richiesto:
job_profile (JSON o tabella)

---

## FASE 6 - GAP ANALYSIS

Confrontare:
candidate_profile vs job_profile

Calcolare:
- match %
- competenze mancanti
- competenze forti
- rischio colloquio per area (basso/medio/alto)

Output richiesto:
gap_report (priorità + motivazione)

---

## FASE 7 - GUIDANCE ENGINE (TRADURRE IN AZIONI)

Tradurre il gap_report in azioni concrete:
- filtri suggeriti
- argomenti di studio prioritari
- domande probabili di colloquio
- simulazioni consigliate
- checklist per colmare gap

Se l’app ha più viste (lista/grafo/sfera):
configurare contenuti e priorità per mostrare prima:
- tecnologie mancanti
- tecnologie richieste
- argomenti ad alta probabilità

---

## FASE 8 - AUTO FILTER GENERATION (ESEMPIO)

Esempio logico:
CV: Java
Job: Java + Spring + AWS

Filtri suggeriti:
- Spring
- Spring Boot
- AWS
- Docker
- Kubernetes

Generare filtri intelligenti e deduplicati.

---

## FASE 9 - TEST

Generare:
- Unit Test
- Integration Test
- Security Test
- File Upload Test
- Malware Test (se applicabile)
- Prompt Injection Test (se input entra in prompt)
- E2E Test

Coverage minima: 95%
