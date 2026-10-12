### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA eine Diagnose in der e-Diagnose Fachanwendung stornieren, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Die zu stornierende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Die Diagnose (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID in der e-Diagnose Fachanwendung storniert.
  1. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[practitioner]` wird von der e-Diagnose Fachanwendung der GDA, der die Stornierung durchführt, dokumentiert.
  2. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[datetime]` wird von der e-Diagnose Fachanwendung das Datum und die Uhrzeit der Stornierung dokumentiert.
  3. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[reason]` wird der Grund für die Stornierung, der vom GDA angegeben werden kann, festgehalten.
2. Alle weiteren Informationen der Diagnose bleiben unverändert erhalten.
3. Ist die Diagnose Teil der jeweiligen Summary-Liste, wird sie aus der Summary-Liste entfernt.

### Validierung / Fehlerbehandlung

- Die zu stornierende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.