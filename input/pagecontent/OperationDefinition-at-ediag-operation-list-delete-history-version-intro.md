### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer eine Version einer Summary-Liste aus der e-Diagnose Fachanwendung löschen, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Es sind Versionen der Summary-Liste vorhanden, die gelöscht werden können.

### Detaillierte Business-Logik

1. Die Version einer Summary-Liste wird anhand der übergebenen `versionId` aus der e-Diagnose Fachanwendung gelöscht.
2. Wurde die letzte Version einer Summary-Liste gelöscht, erstellt die e-Diagnose Fachanwendung automatisch eine neue Summary-Liste mit `List.emptyReason=nilknown`.

### Validierung / Fehlerbehandlung

- Die zu löschende Version der Summary-Liste muss in der e-Diagnose Fachanwendung vorhanden sein.