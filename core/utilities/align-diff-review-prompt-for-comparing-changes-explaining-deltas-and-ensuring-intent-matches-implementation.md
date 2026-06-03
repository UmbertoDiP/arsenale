Skill: Clean Git Diff Formatting
Nome Skill
git-clean-diff o format-preserve-changes

Descrizione
Riformatta file modificati per mostrare solo le modifiche sostanziali nel git diff, preservando esattamente la formattazione originale (spazi, tab, line endings) per eliminare rumore nei diff.

Quando Usare
Git diff mostra troppe modifiche di whitespace/formattazione
Vuoi vedere solo le modifiche funzionali nel code review
Hai modificato un file ma il diff include cambi di tab→spazi o spazi→tab
Line endings misti (CRLF/LF) generano diff confusi
Formatter/linter ha modificato formattazione non intenzionalmente
Procedura Step-by-Step
Step 1: Identifica Modifiche Reali

# Analizza il diff corrente
git diff <file-path>

# Identifica quali righe contengono modifiche SOSTANZIALI
# vs quali sono solo whitespace/formattazione
Output atteso: Lista righe con modifiche funzionali (es: URL cambiati, valori modificati, logica alterata)

Step 2: Estrai Versione Originale

# Salva versione originale da git
git show HEAD:<file-path> > /tmp/original_file

# Su Windows usa percorso temporaneo accessibile
git show HEAD:<file-path> > original_file.tmp
Nota: Se file non ancora committato, usa git show HEAD~1:<file-path> o hash commit specifico

Step 3: Analizza Caratteri Invisibili

# Verifica tab vs spazi nell'originale
cat -A original_file.tmp | head -30

# Output:
# ^I = TAB
# $ = fine riga (LF)
# ^M$ = fine riga Windows (CRLF)
Mappa formattazione:

Conta spazi indentazione per livello
Identifica pattern tab (dove, quanti)
Verifica line endings (LF vs CRLF)
Rileva trailing whitespace intenzionale
Step 4: Applica Solo Modifiche Funzionali
Due metodi:

Metodo A: Sed/Awk (per sostituzioni semplici)

# Parti dall'originale
cp original_file.tmp <file-path>

# Applica SOLO modifiche sostanziali
sed -i 's|OLD_VALUE|NEW_VALUE|g' <file-path>
sed -i 's|ldaps://|ldap://|g' <file-path>
sed -i 's|:636|:389|g' <file-path>

# Esempio: sostituisci URL specifici
sed -i 's|https://old-domain.com|https://new-domain.com|' config.json
Metodo B: Edit Tool (per modifiche complesse)

# Leggi originale
with open('original_file.tmp', 'r') as f:
    lines = f.readlines()

# Applica modifiche SOLO su righe specifiche
lines[15] = lines[15].replace('ldaps://', 'ldap://').replace(':636', ':389')
lines[24] = lines[24].replace('ldaps://', 'ldap://').replace(':636', ':389')

# Scrivi preservando tutto il resto
with open('<file-path>', 'w') as f:
    f.writelines(lines)
Step 5: Verifica Diff Pulito

# Controlla nuovo diff
git diff <file-path>

# Deve mostrare SOLO righe con modifiche funzionali
# Nessuna riga verde/rossa per whitespace

# Conta righe modificate
git diff --numstat <file-path>
# Output: 4 4 <file-path> = 4 inserzioni, 4 rimozioni
Criteri successo:

✅ Diff mostra solo righe modificate funzionalmente
✅ Nessun cambio di indentazione visibile
✅ Nessun cambio tab↔spazi
✅ Line endings invariati
✅ Trailing whitespace preservato
Step 6: Verifica Bit-per-Bit (opzionale)

# Estrai solo righe NON modificate e confronta
git show HEAD:<file-path> | head -10 > original_snippet.txt
head -10 <file-path> > current_snippet.txt

# Devono essere identici byte-per-byte
diff -u original_snippet.txt current_snippet.txt
# (solo righe modificate devono differire)
Template Script Automazione

#!/bin/bash
# git-clean-diff.sh

FILE_PATH="$1"
SEARCH_PATTERN="$2"
REPLACE_PATTERN="$3"

# Step 1: Backup originale
git show HEAD:"$FILE_PATH" > /tmp/git_clean_diff_original.tmp

# Step 2: Applica modifiche preservando formattazione
sed -i "s|$SEARCH_PATTERN|$REPLACE_PATTERN|g" /tmp/git_clean_diff_original.tmp

# Step 3: Sovrascrivi file
mv /tmp/git_clean_diff_original.tmp "$FILE_PATH"

# Step 4: Mostra diff pulito
git diff "$FILE_PATH"

echo "✅ Clean diff applicato. Verifica modifiche sopra."
Uso:


./git-clean-diff.sh resources/config.json "ldaps://.*:636" "ldap://\1:389"
Casi d'Uso Comuni
Caso 1: JSON con Tab Misti

// Originale (tab=\t, spazi=·)
{
\t"url":·"old-value",
····"port":·8080
}

// Modificato (tutto diventato spazi)
{
····"url":·"new-value",
····"port":·8080
}
Soluzione:


# Ripristina da git e modifica solo URL
git show HEAD:config.json > config.json
sed -i 's|old-value|new-value|' config.json
Caso 2: Line Endings CRLF→LF

# File Windows (CRLF) modificato su Linux (LF)
git diff mostra tutte le righe cambiate

# Soluzione: preserva line endings
git show HEAD:file.txt | unix2dos > file.txt  # Se Windows
sed -i 's|OLD|NEW|' file.txt
Caso 3: Formatter Auto-Run

# VSCode/Prettier ha riformattato tutto
git diff mostra 200 righe modificate

# Soluzione: ripristina e applica solo cambio necessario
git checkout HEAD -- file.js
# Modifica manualmente SOLO la riga necessaria
# Oppure usa sed su riga specifica:
sed -i '42s|oldValue|newValue|' file.js
Checklist Validazione
Prima di committare, verifica:

 git diff mostra solo righe con modifiche funzionali
 Nessuna riga verde/rossa per solo whitespace
 git diff --check non segnala trailing whitespace nuovi
 git diff --word-diff conferma solo parole cambiate
 File compila/valida senza errori
 Modifiche testate funzionalmente
Note Importanti
Attenzione a:

File con encoding misto (UTF-8, Latin1): usa file -i <file> per verificare
Line endings automatici Git (core.autocrlf): può interferire
.gitattributes con * text=auto: forza normalizzazione
Formatter/linter hooks: disabilitali temporaneamente se necessario
Best Practices:

Committa modifiche funzionali PRIMA di reformattare
Usa commit separati per "refactor formatting" vs "logic change"
Documenta in commit message se formattazione è intenzionale
Per file critici, verifica diff manualmente riga per riga
Comandi Quick Reference

# Mostra solo modifiche non-whitespace
git diff -w <file>

# Mostra solo parole cambiate
git diff --word-diff <file>

# Conta modifiche reali
git diff --numstat <file>

# Verifica trailing whitespace
git diff --check

# Ripristina formattazione originale
git show HEAD:<file> > <file>

# Applica singola modifica preservando tutto
sed -i 'NUMEROs|OLD|NEW|' <file>
Esportabilità
Questa skill è utilizzabile in:

✅ Qualsiasi progetto Git
✅ Qualsiasi linguaggio (JSON, XML, YAML, Java, Python, etc.)
✅ Qualsiasi IDE/editor
✅ CI/CD pipelines (pre-commit checks)
✅ Code review workflows
Per esportare:

Salva come git-clean-diff.md nella documentazione progetto
Crea script scripts/git-clean-diff.sh con template sopra
Aggiungi a .git/hooks/pre-commit per verifica automatica
Condividi con team come best practice