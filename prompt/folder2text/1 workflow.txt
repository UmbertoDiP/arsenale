✅ BUILD SYSTEM AGGIORNATO
Ho completato l'aggiornamento del sistema di build automation di Folder2Text. Ora hai 3 modi per eseguire build complete con installazione automatica in AppData.

📋 File Aggiornati
1. BUILD_PROMPT.md (Root Project)
Percorso: BUILD_PROMPT.md

Contenuto: Documentazione completa di tutti gli step per build locale/inno/msix con:

Istruzioni dettagliate per l'assistente (esecuzione automatica senza conferme)
Script PowerShell completi copiabili
Step-by-step con verifica e troubleshooting
Success criteria chiari
Uso: Copia/incolla in nuova chat Claude per build automatica

2. /build Slash Command
Percorso: .claude/commands/build.md

Contenuto: Slash command attivo per build rapida

Uso:


/build locale   # Build + install in AppData + context menu
/build inno     # Build Inno Setup installer
/build msix     # Build MSIX (non implementato)
Comportamento: Esecuzione automatica completa senza domande intermedie

3. Script PowerShell Standalone
Percorso: scripts/build-locale.ps1

Contenuto: Script PowerShell eseguibile autonomamente

Uso:


cd c:\Users\umber\Documents\MyProjects\FolderTextMerger
PowerShell -ExecutionPolicy Bypass -File "scripts\build-locale.ps1"
Output: Build completa con report finale dettagliato

🎯 Step Automatici (Build Locale)
Quando esegui build locale (qualsiasi metodo sopra), vengono eseguiti automaticamente:

✅ Clean - Rimozione build artifacts precedenti
✅ Build PyInstaller - Genera dist\Folder2Text.exe
✅ Install AppData - Copia exe in %LOCALAPPDATA%\Folder2Text\
✅ Copy Resources - Copia icon + config in AppData
✅ Register Context Menu - Registry entry per right-click folder
✅ Restart Explorer - Applica modifiche Registry
✅ Verify Installation - Check finale con report ✅/❌
📦 Output Atteso (Build Locale)

✅ BUILD LOCALE COMPLETATA

📦 Executable Built:
   - dist\Folder2Text.exe (199 MB)
   - PyInstaller 6.18.0
   - Python 3.13.5

📁 Installation:
   - Location: C:\Users\umber\AppData\Local\Folder2Text\
   - Folder2Text.exe: ✅ Installed
   - app_icon.ico: ✅ Installed
   - supported-extensions.json: ✅ Installed

🔧 Context Menu:
   - Registry: ✅ Registered
   - Icon: ✅ Configured
   - Command: "...\Folder2Text.exe" "%V"

🔄 Windows Explorer: ✅ Restarted

✅ Ready to test! Right-click any folder to verify.
🚀 Quick Start
Prossima volta che vuoi fare build locale:

Opzione A - In questa chat:


/build locale
Opzione B - Nuova chat:

Apri BUILD_PROMPT.md
Copia tutto
Incolla in nuova chat Claude Code
Rispondi: locale
Opzione C - PowerShell diretto:


.\scripts\build-locale.ps1
🔧 Configurazione Attuale Build
Spec file: Folder2Text.spec (root)
Entry point: src\Folder2Text.py
Output dist: dist\Folder2Text.exe (199 MB con tutte le deps)
Install path: C:\Users\umber\AppData\Local\Folder2Text\
Context menu: HKCU:\Software\Classes\Directory\shell\Folder2Text
Il sistema è pronto per la prossima build senza domande ripetitive!






-------------






Comando "mela" - Diagnostics completo:

Svuota log debug precedente (diagnostics.log)
Legge registro Windows (winreg.OpenKey) da HKEY_CURRENT_USER\Software\Classes\
Verifica 4 chiavi:
Directory, Directory\Background, Drive (expected)
* con AppliesTo (conditional v5.2.3)
AllFilesystemObjects (forbidden)
Controlla valori: Label, Icon, Position, MultiSelectModel, Command, AppliesTo
Calcola Health Score: 0-100 basato su chiavi OK/mancanti/errate
Salva JSON report: menu_status.json con timestamp, dettagli, score
Output: Log testuale + JSON strutturato


----------------


c:\Users\umber\Documents\MyProjects\FolderTextMerger\BUILD-GUIDE.md

