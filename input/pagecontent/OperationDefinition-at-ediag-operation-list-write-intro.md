### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA die Summary-Liste für eine bestimmte Art von Einträgen (z.B. Allergien, Diagnosen, Prozeduren) aktualisieren (Einträge werden hinzugefügt/entfernt)
oder möchte der GDA die Reihenfolge der Einträge ändern, so muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Der GDA hat durch einen vorangeganenen Abruf (siehe Definition vom Abruf der aktuellen Summary-Liste) die aktuelle `versionId` der Summary-Liste ermittelt. Diese muss beim Aufruf dieser Operation als `If-Match`-Header mitgeschickt werden.

### Detaillierte Business-Logik

1. Nach erfolgreicher Validierung wird die Summary-Liste gespeichert.

### Validierung / Fehlerbehandlung

* Die übermittelte List-Ressource wird laut Profil geprüft.
* `List.code` muss mit dem `code` der Operation übereinstimmen.
* `List.subject` muss mit dem im Token enthaltenen Patienten übereinstimmen.
* `List.source` muss mit dem im Token enthaltenen GDA übereinstimmen.
* Der übermittelte `If-Match`-Header stimmt mit der `versionId` der Ressource am Server überein.
* Für die List-Ressource gilt außerdem `entry.item.empty() implies emptyReason.coding.exists(system='http://terminology.hl7.org/CodeSystem/list-empty-reason' and code='nilknown')`.