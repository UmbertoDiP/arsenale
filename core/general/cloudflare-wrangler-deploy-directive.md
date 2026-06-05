# 🌩 CLOUDFLARE WRANGLER DIRECT DEPLOY DIRECTIVE

## SCOPO E CONTESTO
Per evitare colli di bottiglia e pipeline CI/CD bloccate o non reattive, **ogni qualvolta l'utente richiede un test in produzione su Cloudflare Pages o lamenta un mancato aggiornamento del codice**, l'Agente deve bypassare la dipendenza dai Webhook di GitHub ed eseguire il deploy forzato da terminale usando **Wrangler CLI**.

## SEQUENZA OPERATIVA OBBLIGATORIA
Non attendere le build automatiche. Procedi istantaneamente con questo stack di comandi:

```powershell
ipconfig /flushdns
npm run build
git add .
git commit -m "chore: manual deploy"
git push origin master:main
npx wrangler pages deploy dist --project-name <NOME_PROGETTO> --branch <NOME_BRANCH> --commit-dirty=true
```

*(Modifica i percorsi di `dist` e i nomi di `<NOME_PROGETTO>` a seconda del contesto in cui ti trovi).*

## REGOLA DI AUTONOMIA
Esegui la procedura in modo completamente trasparente. A lavoro finito, mostra all'utente l'URL finale generato dall'output di Wrangler. Non chiedere l'autorizzazione per utilizzare Wrangler: l'account è già autenticato e operativo.
