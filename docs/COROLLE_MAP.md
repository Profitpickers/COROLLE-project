// Struttura delle cartelle (PC locale – C.O.R.O.L.L.E. Personal)

/* 

C:\COROLLE\ (o ~/COROLLE)
├── task_organizer.py          # script principale
├── docs/
│   ├── todo.md
│   ├── PRIORITIES.md
│   └── COROLLE_MAP.md         # QUESTO FILE (sincronizzato su GitHub)
├── config/
│   ├── active_commands.json
│   ├── voice_color.json
│   ├── voice_gender.json
│   ├── mic_config.json
│   └── suggeritore_triggers.json
├── backups/                   # backup automatici delle configurazioni
└── logs/                      # eventuali log vocali o eventi


*/

Versioni di C.O.R.O.L.L.E.
Versione	Destinazione	Caratteristiche
Personal	BOSS IACOBELLIX	Trigger personali, rispetto, comandi vocali completi, backup locale
Lite / AI Coach Master	Pubblico / vendita	Sottoinsieme di funzioni, senza trigger personali, UI semplificata
Tecnologie previste
Python – Task Organizer, WebSocket server, integrazione vocale (speech_recognition, pyttsx3 o edge-tts)

WebSocket – websockets libreria Python, localhost:8765

LLM locale remoto – Ollama su VPS Contabo (modello TinyLlama o Phi-2)

Frontend – React/Next.js su Vercel per Accordly AI

Database – Supabase (solo Accordly AI)

Packaging – PyInstaller (eseguibile), Inno Setup (installer)

Prossimi passi operativi (Fase 1)
Salvare task_organizer.py sul PC locale.

Generare eseguibile con PyInstaller (--onefile --noconsole).

Creare installer con Inno Setup.

Implementare WebSocket server nel task organizer.

Testare comunicazione con browser (pagina HTML di test).

Fine della mappa – da mantenere aggiornata ad ogni evoluzione del progetto.
