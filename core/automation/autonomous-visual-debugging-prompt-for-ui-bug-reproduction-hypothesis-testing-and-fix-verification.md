# 🧠 CLAUDE SKILL — AUTO VISUAL MODAL DEBUG (PLAYWRIGHT)

## VERSIONE
v1.1 — Generica, riutilizzabile, project-agnostic

---

## 🎯 SCOPO DELLA SKILL
Eseguire **debug visivo automatico brute-force** su componenti UI (modali, carousel, contenuti paginati o dinamici) per individuare **bug di rendering reali** che non emergono da test funzionali o assertion DOM.

La skill:
- verifica **ciò che è realmente visibile a schermo**
- correla screenshot + stato DOM
- identifica autonomamente la root cause
- applica fix strutturali
- itera fino a risoluzione completa

> Principio guida:  
> **Se il contenuto non è visibile, il sistema è rotto anche se il DOM è corretto.**

---

## 🧩 AMBITO DI APPLICAZIONE
- Modali Bootstrap / custom
- Carousel Bootstrap o custom
- UI con `<template>` + `cloneNode`
- Contenuti JS dinamici
- Nested carousel / componenti annidati
- Bug “DOM presente ma UI vuota”
- Disallineamento tra test E2E e rendering reale

---

## ⚙️ INPUT ATTESI
```yaml
project_root: "path locale del progetto"
base_url: "http://localhost:XXXX"
trigger_selector: "selettore che apre il modale / UI target"
carousel_root_selector: "root del carousel o contenitore paginato"
carousel_next_selector: "pulsante next / navigazione avanti"
expected_pages: numero totale di pagine/slide previste
screenshot_dir: "directory output screenshot"
transition_delay_ms: 600   # default Bootstrap-safe
🔁 STRATEGIA OPERATIVA (AUTONOMA)
FASE 0 — PRECHECK
Verifica che base_url sia raggiungibile

Verifica che trigger_selector esista

Crea screenshot_dir se non presente

Avvia Playwright in modalità headed

FASE 1 — VISUAL CRAWL SEQUENZIALE
Per i = 1 → expected_pages:

Apri base_url

Attiva UI target (trigger_selector)

Attendi stabilizzazione layout

Screenshot VISIVO

exp-i.png

Click su carousel_next_selector

Attendi transition_delay_ms + overhead

Continua

Output atteso:

lua
Copia codice
debug-screenshots/
 ├─ exp-1.png
 ├─ exp-2.png
 ├─ ...
 └─ exp-N.png
FASE 2 — ANALISI VISIVA SCREENSHOT
Per ogni screenshot:

✅ PASS

Testo leggibile

Immagini visibili

Layout coerente

❌ FAIL

Area bianca / grigia

Contenuto invisibile

Placeholder vuoti

Conteggia:

visible_pages

blank_pages

FASE 3 — DOM DEBUG BRUTE FORCE (IN-MEMORY)
Dopo ogni navigazione, esegui una valutazione DOM completa:

js
Copia codice
{
  totalItems,
  activeIndex,
  activeHTMLPreview,
  activeTextLength,
  activeClasses,
  allItemsClasses,
  hasMeaningfulContent
}
Indicatori chiave:

activeHTMLPreview === ""

activeTextLength < soglia

più .active contemporanei

.active che non cambia

contenuto presente ma nascosto

FASE 4 — PATTERN MATCHING → ROOT CAUSE
Associa automaticamente sintomi a cause probabili:

Sintomo osservato	Root Cause
Solo prima pagina visibile	clone incompleto / init parziale
innerHTML vuoto	cloneNode(false) o template errato
DOM pieno, UI vuota	CSS display:none, opacity:0, height:0
.active bloccato	doppia init carousel
più .active	cleanup mancante
nested carousel vuoti	init prima del mount
funziona nei test ma non visivamente	test basati solo su DOM

FASE 5 — FIX AUTONOMO
La skill:

individua la causa primaria

applica un fix strutturale

evita workaround temporali

evita hack basati su timing se non necessari

Possibili azioni:

correzione cloneNode(true)

cleanup classi .active

init Bootstrap post-mount

rimozione CSS bloccanti

defer init nested componenti

FASE 6 — LOOP DI VERIFICA
scss
Copia codice
APPLICA FIX
→ RERUN VISUAL CRAWL
→ NUOVI SCREENSHOT
→ ANALISI
→ (SE FAIL → NUOVO FIX)
Il loop termina solo quando tutte le pagine sono visivamente corrette.

✅ SUCCESS CRITERIA (OBBLIGATORI)
100% screenshot con contenuto reale visibile

Navigazione completa senza pagine bianche

Coerenza tra screenshot e verifica manuale browser

Nessuna dipendenza esclusiva da assertion DOM

📤 OUTPUT FINALE DELLA SKILL
Restituire solo:

Screenshot chiave pre-fix (OK vs FAIL)

Log DOM critici che hanno rivelato il bug

Fix applicato (diff o codice completo)

Screenshot post-fix (tutte le pagine OK)

Nessuna narrazione superflua.
Nessuna richiesta di conferma.
Nessun output intermedio.

🚫 VINCOLI OPERATIVI
Non fidarsi dei test automatici esistenti

Non assumere che “DOM presente” = “UI visibile”

Non fermarsi al primo fix

Non chiedere input durante l’esecuzione

Non produrre output parziali

🧠 FILOSOFIA DELLA SKILL
Visual correctness > test assertions

I bug critici di UI vivono tra DOM, CSS, JS e lifecycle,
non nei report verdi dei test.

🧩 RIUTILIZZABILITÀ
Questa skill è:

agnostica dal progetto

applicabile a qualsiasi UI dinamica

esportabile e riutilizzabile in contesti multipli

compatibile con debug manuale e CI visuale

FINE SKILL

Copia codice






