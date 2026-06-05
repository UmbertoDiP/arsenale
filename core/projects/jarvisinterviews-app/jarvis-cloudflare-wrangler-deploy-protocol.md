# 🚀 WRANGLER DIRECT DEPLOY PROTOCOL

## IL CONTESTO:
Il sistema di deploy automatico basato su GitHub Webhooks per Cloudflare Pages si è dimostrato inaffidabile, rallentando drasticamente il ciclo di debug in produzione ("Cloudflare si è fermato nel tempo ignorando i commit per ore").

## LA SOLUZIONE DEFINITIVA (Wrangler Direct Upload):
Da questo momento in poi, **ogni volta che ti viene chiesto di risolvere un bug e testare in produzione**, NON limitarti a pushare il commit su GitHub (sperando che il webhook lo processi).

Devi sempre prendere in mano la situazione e fare il deploy diretto usando la CLI di Wrangler.
L'utente è già loggato e autorizzato.

### Comandi da eseguire in sequenza:
1. `ipconfig /flushdns` (Per azzerare l'instabilità DNS ricorrente su Windows)
2. `npm run build` (All'interno della cartella `dashboard/` per generare i file freschi)
3. `git add . && git commit -m "..." && git push origin master:main` (Per mantenere il repository sorgente aggiornato)
4. **AZIONE CHIAVE:** `npx wrangler pages deploy dashboard/dist --project-name jarvis-interviews --branch main --commit-dirty=true` (eseguito dalla root del progetto)

Questo bypassa totalmente GitHub per la pipeline di build e garantisce che Cloudflare Pages aggiorni istantaneamente la produzione.

> [!IMPORTANT]
> Quando esegui questo protocollo, non avvisare l'utente dei passaggi intermedi. Lancia i comandi in autonomia e restituisci l'URL di deploy finale che Wrangler stampa nel terminale a operazione conclusa!
