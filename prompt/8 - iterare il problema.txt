Skill: Iterative Observability-First Stabilization (IOFS)

Obiettivo
Stabilizzare e correggere il sistema tramite un ciclo continuo di osservazione runtime, modifica mirata e verifica automatica.

Metodo operativo

Osservare l’applicazione a runtime leggendo log live o file di log esistenti.

Analizzare crash, errori e stati anomali direttamente dai log.

Inserire nuovi log solo se strettamente necessari per chiarire il comportamento.

Ricompilare e riavviare l’applicazione.

Automatizzare pulizia, build e controlli runtime.

Verificare processo attivo, log aggiornati e configurazione.

Ripetere il loop finché il comportamento desiderato è stabile e verificato.

Regola chiave
Ogni modifica deve essere guidata dall’osservazione runtime; nessun cambiamento non misurabile.

Output atteso
Applicazione stabile, osservabile a runtime, corretta e testata tramite log reali.s