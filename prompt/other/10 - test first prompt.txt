Abbiamo individuato un bug nella funzionalità {descrizione_del_problema}. Voglio che applichi il metodo “test‑first” per riprodurre il difetto prima di correggerlo.

1. **Obiettivo del test:** definisci un caso di test usando pytest che isoli la problematica emersa e verifichi il comportamento desiderato. Il test deve fallire con l’implementazione attuale, dimostrando l’esistenza del bug.
2. **Ambiente:** usa le stesse fixture e il contesto di test già presenti nel progetto (es. `temp_workspace`, `mock_settings_pro`, ecc.) per mantenere coerenza con la suite esistente. Non introdurre dipendenze esterne inutili.
3. **Esecuzione:** assicurati che il test sia autonomo, riproducibile e che effettui asserzioni chiare su input e output. Ad esempio, se il problema riguarda il mancato filtraggio di file binari, crea file di prova con estensioni binarie e verifica che vengano esclusi.
4. **Verifica:** esegui il test nella codebase attuale; l’output deve evidenziare il fallimento. Solo dopo aver osservato il fallimento potrai modificare il codice per risolvere la problematica.
5. **Non modificare il codice prima:** il focus di questa richiesta è la scrittura del test. Le modifiche alla codebase avverranno in un secondo momento dopo che avremo confermato il comportamento errato.

Rispondi con il codice completo del nuovo test, comprensivo di eventuali import, fixture necessarie e assert, senza parti mancanti. Mantieni lo stile dei test esistenti (nomi descrittivi e messaggi d’errore chiari). Se hai bisogno di chiarimenti sul problema o sul contesto, chiedi prima di procedere.
