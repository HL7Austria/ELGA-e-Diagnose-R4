### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA die Summary-Liste für eine bestimmte Art von Einträgen (Diagnosen, Prozeduren, Allergien) aktualisieren (Einträge werden hinzugefügt/entfernt)
oder möchte der GDA die Reihenfolge der Einträge ändern, so muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Der GDA hat durch einen [vorangegangenen Abruf](use_case_read.html#aktuelle-summary-liste-abrufen) die aktuelle `versionId` der Summary-Liste ermittelt. Diese muss beim Aufruf dieser Operation als `If-Match`-Header mitgeschickt werden.

### Detaillierte Business-Logik

1. Als `List.subject` wird durch die e-Diagnose Fachanwendung der Patient dokumentiert.
2. Als `List.source` wird  durch die e-Diagnose Fachanwendung der GDA, der die Änderung durchführt, dokumentiert.
3. Als `List.date` wird durch die e-Diagnose Fachanwendung das Datum und die Uhrzeit der Änderung dokumentiert.
4. Nach erfolgreicher Validierung wird die Summary-Liste gespeichert.

### Validierung / Fehlerbehandlung

* Die übermittelte List-Ressource wird laut Profil geprüft.
* Der übermittelte `If-Match`-Header stimmt mit der `versionId` der Ressource am Server überein.
* Für die List-Ressource gilt außerdem `entry.item.empty() implies emptyReason.coding.exists(system='http://terminology.hl7.org/CodeSystem/list-empty-reason' and code='nilknown')`.