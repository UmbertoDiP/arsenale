🔥 Prompt Fase 4 – Audit Tecnico Preventivo (Hard Mode)
🎯 Obiettivo

Eseguire un’analisi tecnica completa e senza tolleranza per lacune prima di qualsiasi generazione di codice.
Questa fase serve a smontare, verificare e validare il sistema prima della costruzione.

Se l’analisi è incompleta, la fase è da considerarsi FALLITA.

🚨 Regole non negoziabili
Vietato scrivere codice.
Vietato “assumere” dettagli non esplicitati.
Vietato procedere con ambiguità irrisolte.
Vietato usare descrizioni generiche o vaghe.
Ogni affermazione deve essere giustificata o dichiarata come ipotesi.
Se mancano informazioni, devono essere esplicitamente elencate come GAP CRITICI.
🧠 1. Decompressione totale del problema (no sintesi)
Riscrivi il problema scomponendolo in tutte le sue implicazioni operative.
Identifica:
obiettivo reale del sistema (non quello dichiarato superficialmente)
casi d’uso espliciti e impliciti
edge case evidenti e nascosti
Se il problema è ambiguo → bloccalo e segnala ambiguità.
🧩 2. Decomposizione architetturale obbligatoria

Scomponi il sistema in componenti atomici.

Per ogni componente:

responsabilità unica e NON sovrapposta
input/output precisi
dipendenze upstream e downstream
failure modes possibili
impatto di un malfunzionamento

⚠️ Se due componenti hanno responsabilità sovrapposte → segnalarlo come errore architetturale.

🧪 3. Analisi competenze (Skill Audit reale)

Non elencare tecnologie. Elenca competenze reali richieste per costruire il sistema:

competenze backend avanzate
architettura software
database design e scaling
sicurezza applicativa
concurrency / async / event handling
deployment & infrastructure
debugging e observability

Per ogni skill:

livello richiesto (base / medio / avanzato / esperto)
rischio se skill mancante

⚠️ Evidenzia i “single points of failure umani”.

🏗️ 4. Architettura proposta (con stress test mentale)
Proponi un’architettura coerente.
Poi attaccala:
cosa succede sotto 10x traffico?
cosa si rompe per primo?
dove si accumulano colli di bottiglia?
cosa non scala?

Se l’architettura non regge lo stress test → dichiararlo esplicitamente.

🔌 5. Stack tecnologico (solo se giustificato)

Per ogni tecnologia proposta:

motivazione tecnica concreta
alternative equivalenti
rischio di lock-in o complessità inutile

⚠️ Vietato “stack di default”.

⚠️ 6. Risk Analysis obbligatoria (senza filtro)

Identifica:

rischi tecnici
rischi architetturali
rischi di performance
rischi di sicurezza
rischi di mantenibilità
rischi di scalabilità
rischi organizzativi (skill gap team)

Per ogni rischio:

impatto
probabilità
mitigazione concreta
🧱 7. Gap Analysis brutale

Elenca senza pietà:

informazioni mancanti critiche
decisioni architetturali non prese
requisiti vaghi o contraddittori
dipendenze esterne non definite

⚠️ Se esistono GAP CRITICI → il progetto NON è pronto.

🧾 8. Checklist finale di idoneità (go/no-go)

Rispondi chiaramente:

READY FOR DEVELOPMENT: Sì / No

Condizioni per “Sì”:

nessun gap critico aperto
architettura coerente e stress-tested
responsabilità dei moduli non sovrapposte
rischi principali identificati e mitigati

Se anche una condizione fallisce → output = NO.

🧨 Output richiesto

Un documento tecnico strutturato, severo, senza ambiguità, con mentalità da:

“sto revisionando un sistema che sta per andare in produzione e deve sopravvivere al mondo reale”

Se vuoi, posso anche fare una versione ancora più estrema tipo:

“
pre-mortem analysis (what will kill this system in production)”
oppure 
versione ottimizzata per agent AI autonomi con validazione iterativa

Dimmi solo il contesto d’uso (SaaS, AI agent, backend API, ecc.).