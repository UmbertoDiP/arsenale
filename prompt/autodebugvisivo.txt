Ecco un prompt separato per la strategia di auto-debug visivo:
Prompt: Strategia Auto-Debug Visivo
STRATEGIA AUTO-DEBUG VISIVO per bug "Ricomincia"

TOOL PRINCIPALE: test-single-discard.cjs (Puppeteer visual test)

CARATTERISTICHE:
✅ Browser VISIBILE (headless: false) - vedi cosa succede in tempo reale
✅ Console filtering - solo log rilevanti (profileManager, cvDataReady, etc.)
✅ Browser resta APERTO dopo test - puoi ispezionare manualmente
✅ Screenshot automatici salvati in screenshots/
✅ Cache disabilitata - forza caricamento codice fresco

WORKFLOW:
1. Modifica codice (aggiungi console.log strategici)
2. Riavvia server: taskkill //F //IM node.exe && npm run dev
3. Esegui: node test-single-discard.cjs
4. Guarda browser aprirsi e test eseguirsi
5. Console mostra log filtrati in real-time
6. Browser resta aperto - apri DevTools (F12) per ispezionare stato
7. Screenshot salvati automaticamente in screenshots/

CONSOLE LOG FILTRATI:
- profileManager (tutti i riferimenti)
- Ricarico, cvDataReady, forcePrecompile
- Step, HANDLER, Dati profilo, populateForm

CHECKPOINTS VERIFICATI:
✅ window.profileManager exists
✅ Has loadProfileLanguage method
✅ Form Name vs Preview Name
✅ Form Role vs Preview Role

VANTAGGI:
- Vedi ESATTAMENTE dove il codice si blocca
- Nessun loop multiplo confuso (1 solo test chiaro)
- Browser aperto = ispezione manuale DOM/console
- Screenshot = prova visiva prima/dopo

QUANDO USARE:
- Ogni volta aggiungi debug logging
- Per verificare se fix funziona
- Per confrontare form popolato vs preview vuoto
Comandi Quick Reference
# Full workflow
taskkill //F //IM node.exe
npm run dev
# Aspetta "Ready on http://127.0.0.1:8787"
node test-single-discard.cjs

# Se test si blocca
Ctrl+C per killare
Chiudi browser manualmente se necessario

# Vedere screenshot
cd screenshots
dir /O:D  # Più recenti per ultimi
Questa strategia ti permette di vedere IN REAL-TIME cosa succede senza dover indovinare dai log!