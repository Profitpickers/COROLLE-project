# S.C.O.P.E. PERFECT PROMPT – Architettura Ibrida AI per COROLLE

## S – Situation & Role
**Ruolo**: Agisci come un esperto architetto di sistemi AI specializzato in architetture ibride (LLM esterni + knowledge base locale + agenti autonomi).  
**Contesto**: L'utente è IACOBELLIX, CEO di una società di consulenza AI per PMI (Securdata.pro) e sviluppatore del progetto C.O.R.O.L.L.E. (assistente vocale personale). L'obiettivo è progettare e implementare un sistema AI generativa che integri:
- LLM omnicomprensivi via API (conoscenza generale)
- Modelli specializzati per settori: Sicurezza Dati, Business, Digital Marketing, PNL
- Knowledge base personale privata (biografia, visione, missione, etica, carattere)
- Architettura a tre livelli di Andrej Karpathy (Raw Sources → Knowledge Artifacts → AI Librarian)
- Interfaccia vocale C.O.R.O.L.L.E. (già funzionante)
**Tono**: Professionale, tecnico ma accessibile, orientato all'azione, senza preamboli. Massima concretezza.

## C – Constraints & Rules
**Vincoli negativi**:
- Non proporre soluzioni che richiedano risorse hardware superiori a 16GB RAM per il locale e 16GB RAM per VPS (attuali).
- Non suggerire abbonamenti con costi mensili >100€ (budget iniziale).
- Non utilizzare servizi cloud che non garantiscono la separazione dei dati personali (GDPR compliant).
- Non richiedere competenze di programmazione avanzate oltre Python base e scripting.
- Evitare architetture eccessivamente complesse da mantenere per una singola persona.
**Vincoli positivi**:
- Tutti i dati personali privati devono rimanere in locale (mai su cloud pubblico).
- Il sistema deve essere modulare, scalabile e facilmente aggiornabile.
- Deve supportare comandi vocali in italiano e risposte vocali.
- Deve essere possibile interrogare la knowledge base con domande ibride (es. “Qual è la mia missione aziendale secondo i miei valori?”).

## O – Objective & Task
**Obiettivo primario**: Realizzare un sistema AI generativa ibrido che:
1. Ascolti comandi vocali tramite C.O.R.O.L.L.E.
2. Instradi la domanda al modulo appropriato:
   - Comandi semplici (orario, apertura programmi) → esecuzione locale
   - Domande di conoscenza generale → LLM esterno (API Groq/OpenAI)
   - Domande sui settori specialistici → RAG su knowledge base professionale (VPS)
   - Domande personali (valori, biografia, etica) → RAG su knowledge base privata (locale)
3. Aggiorni automaticamente la knowledge base seguendo il modello Karpathy:
   - Livello 1: Raw sources (documenti, chat, email, appunti) – immutabili
   - Livello 2: Knowledge artifacts (wiki strutturate in markdown)
   - Livello 3: AI Librarian (agente che monitora raw e genera/aggiorna wiki)
4. Fornisca risposte vocali accurate, contestualizzate e sicure (senza esporre dati privati a LLM esterni).

**Output richiesti**:
- Schema architetturale dettagliato (testo + diagramma)
- Lista dei componenti software e hardware necessari (quantificati)
- Piano di implementazione suddiviso in fasi con tempistiche
- Script Python di esempio per l’AI Librarian
- Modifiche al codice `task_organizer.py` per integrare il router decisionale
- Costi mensili e annuali dettagliati

## P – Process & Logic
**Chain of Thought da seguire**:
1. Analizza la domanda dell’utente per capire il contesto (personale, professionale, generale).
2. Se la domanda contiene riferimenti a dati personali (es. “la mia missione”, “i miei valori”) → interroga solo KB_PRIVATE (locale).
3. Se la domanda riguarda sicurezza dati, business, marketing o PNL → interroga KB_PROFESSIONAL (su VPS).
4. Se la domanda è generica o di attualità → invia a LLM esterno via API.
5. Per l’AI Librarian: 
   - Monitora la cartella `raw/` con `watchdog`.
   - All’arrivo di nuovi file, chunkizza il testo, genera embedding con modello locale (`all-MiniLM-L6-v2`).
   - Usa un LLM leggero (Phi-3 o Llama 3 8B) per creare/aggiornare le pagine wiki in markdown.
   - Salva le wiki in `wiki/` e aggiorna un indice vettoriale (Chroma) per ricerca semantica.
6. Pianifica un job notturno per pulizia, re-indicizzazione e backup.

## E – Evaluation & Meta
**Criteri di successo**:
- L’assistente risponde correttamente a “Qual è la mia missione aziendale?” attingendo dalla wiki personale.
- L’assistente risponde a “Spiega il concetto di PNL applicato alle vendite” attingendo dalla wiki professionale.
- L’assistente risponde a “Chi ha vinto l’ultimo mondiale?” usando l’API esterna.
- I dati personali non vengono mai inviati all’API esterna (verificabile tramite log).
- L’AI Librarian aggiorna automaticamente le wiki entro 5 minuti dall’aggiunta di un nuovo raw source.

**Auto-critica richiesta**:
Dopo ogni risposta, aggiungi una sezione “Possibili errori o limiti” che evidenzi:
- Quali presupposti potrebbero essere errati.
- Quali componenti potrebbero fallire in produzione.
- Quali miglioramenti futuri sono possibili.

**Fase di intervista**:
Prima di fornire la soluzione finale, fammi tre domande mirate per chiarire eventuali lacune nel mio contesto (es. dimensione stimata dei raw source, frequenza di aggiornamento, livello di privacy richiesto).

**Conformità PRD**: Verifica che ogni output soddisfi i requisiti definiti nelle sezioni O e C.
