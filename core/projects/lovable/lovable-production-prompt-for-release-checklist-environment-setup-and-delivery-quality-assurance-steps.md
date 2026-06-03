Analizza questo progetto in produzione (Lovable o simile) come se dovessi fare un code review completo prima di una release critica.

Controlla e segnala problemi in queste aree:

architettura frontend/backend
gestione stati e UI (loading, errori, edge cases)
API e service layer (robustezza, error handling)
sicurezza base (input validation, exposure dati, endpoint rischiosi)
performance evidenti (render inutili, fetch ridondanti, payload grandi)
accessibilità (ARIA, focus, keyboard, screen reader)
qualità codice (duplicazioni, accoppiamento, anti-pattern)
gestione errori (user-friendly vs tecnici)

Evidenzia:

bug critici
rischi in produzione
miglioramenti prioritari (top 5)

Rispondi in modo concreto, senza teoria inutile, focalizzato su fix reali.