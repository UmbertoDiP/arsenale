Trovato! Ho recuperato tutte le informazioni sul nuovo **Antigravity 2.0**, su come gestisce il comando `/browser` tramite Chrome DevTools (CDP) e su come funziona il formato `SKILL.md` (compatibile con `skills.sh`).

Ho anche identificato il vero problema che sta affliggendo la tua installazione su Windows (è un bug noto che impedisce al motore Playwright interno di trovare la cartella dell'utente, mandandolo in tilt).

### Come funziona la soluzione (in breve)

Su Windows, il motore interno ad Antigravity spesso non riesce a lanciare Chrome perché non trova la variabile d'ambiente `HOME`. Inoltre, il sistema anti-bot potrebbe bloccare l'agente.
Questo prompt crea uno **Skill** (un modulo di addestramento on-demand) che istruisce l'agente ad auto-ripararsi: prima fissa il bug del sistema Windows, poi uccide i processi rimasti bloccati (zombie) e infine lancia il browser in modalità invisibile, agganciandosi correttamente.

---

### Il Master Prompt (Copia e Incolla)

Copia l'intero blocco di testo qui sotto e incollalo direttamente nella chat di Antigravity:

```markdown
Crea un file chiamato `SKILL.md` all'interno della cartella `.agent/skills/browser-debugger/` del mio progetto (crea le directory se non esistono). Inserisci esattamente il seguente contenuto nel file:

---
name: agy-browser-stealth-debug
description: Esegue un audit profondo del comando /browser in Antigravity, risolve il bug della variabile HOME su Windows, pulisce i processi orfani e inietta opzioni stealth per bypassare i blocchi di automazione.
---

# Inizializzazione Skill: Debugger Browser Antigravity
Il comando `/browser` attualmente non riesce ad avviare Chrome o va in timeout in background. Esegui un audit tecnico del workspace e del sistema seguendo questi step esatti nell'ordine indicato:

1. **Risoluzione Bug Playwright Windows (Priorità 1):**
   Il fallimento è spesso dovuto alla mancanza della variabile d'ambiente `$HOME` su Windows, necessaria a Playwright.
   - Esegui un comando nel terminale per impostare permanentemente la variabile (es. tramite PowerShell: `[System.Environment]::SetEnvironmentVariable('HOME', "$env:USERPROFILE", 'User')`).
   - *Importante:* Se esegui questa modifica, avvisami che dovrò riavviare l'IDE Antigravity affinché abbia effetto.

2. **Port & Process Cleanup:** 
   Esegui uno script per trovare e terminare (killare) forzatamente tutti i processi `chrome` e `chromedriver` rimasti in sospeso. Assicurati che la porta CDP (9222) sia completamente libera per evitare conflitti.

3. **Patch dei Parametri di Avvio (Stealth Mode):** 
   Quando tenti di utilizzare il comando `/browser` o di lanciare un'istanza, assicurati che vengano passate rigorosamente queste flag a Chrome DevTools Protocol per bypassare il rilevamento anti-bot:
   - `--excludeSwitches=enable-automation` (Nasconde la barra gialla)
   - `--disable-blink-features=AutomationControlled` (Nasconde il flag navigator.webdriver)
   - `--remote-debugging-port=9222`

4. **Verifica Finale:** 
   Dopo aver eseguito i passaggi precedenti (e dopo il riavvio, se necessario), utilizza il comando `/browser` per navigare su una pagina neutra come `example.com`, estrai il tag `<title>` e stampalo in console per confermare che il ponte CDP funziona correttamente.

Procedi immediatamente con il punto 1 e forniscimi un resoconto strutturato.

```