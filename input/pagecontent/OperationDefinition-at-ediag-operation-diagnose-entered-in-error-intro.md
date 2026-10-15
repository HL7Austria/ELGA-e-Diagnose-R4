### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA einen Eintrag in der e-Diagnose Fachanwendung stornieren, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Der zu stornierende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Der Eintrag (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID in der e-Diagnose Fachanwendung storniert.
  1. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[practitioner]` wird durch die e-Diagnose Fachanwendung der GDA, der die Stornierung durchführt, dokumentiert.
  2. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[datetime]` wird  durch die e-Diagnose Fachanwendung das Datum und die Uhrzeit der Stornierung dokumentiert.
  3. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[reason]` wird der Grund für die Stornierung, der vom GDA angegeben werden **kann**, festgehalten.
2. Alle weiteren Informationen des Eintrags bleiben unverändert erhalten.
3. Ist der Eintrag Teil der jeweiligen Summary-Liste, wird er aus der Summary-Liste entfernt.

### Validierung / Fehlerbehandlung

- Der zu stornierende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.