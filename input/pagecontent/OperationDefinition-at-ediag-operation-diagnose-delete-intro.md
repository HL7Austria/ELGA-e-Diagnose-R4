### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer einen Eintrag aus der e-Diagnose Fachanwendung löschen, muss diese Operation ausgeführt werden.

### Anwendungskontext

Die Teilnehmerrechte können – abgesehen vom Widerspruch über die ELGA-Widerspruchstelle (WIST) und der Unterstützung durch die ELGA-Ombudsstelle (OBST) – ausschließlich über das Zugangsportal gemäß § 23 Abs. 1 GTelG 2012 ausgeübt werden.

### Voraussetzung für den Aufruf

- Der zu löschende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Der Eintrag (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID aus der e-Diagnose Fachanwendung gelöscht.
2. Ist der Eintrag Teil der jeweiligen Summary-Liste, wird er auch aus der Summary-Liste entfernt.
  1. Als `List.source` wird in diesem Fall der Patient angegeben.

### Validierung / Fehlerbehandlung

- Der zu löschende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.