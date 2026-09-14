<!--Löschen von Einträgen bzw. Versionen der Summary-Liste-->

### Interaktionen auf Einzelressourcen

#### Eintrag löschen

> Sub:UC_03_01

Ein ELGA-Teilnehmer kann via ELGA-Portal einzelne oder alle Einträge unwiderruflich löschen. Dabei ist es irrelevant, ob ein zu löschender Eintrag Teil der jeweiligen Summary-Liste ist oder nicht. Sollte der Eintrag in der aktuellen Summary-Liste referenziert sein, erstellt die Fachanwendung eine neue Version der Summary-Liste ohne den gelöschten Eintrag.

##### Ablauf

- Um einen Eintrag zu löschen, führt der ELGA-Teilnehmer über das Portal die [`$delete`-Operation](OperationDefinition-at-ediag-operation-diagnose-delete.html) auf den zu löschenden Eintrag aus.
- Die Fachanwendung löscht den entsprechenden Eintrag.
- Die Fachanwendung erstellt eine neue Version der Summary-Liste ohne den gelöschten Eintrag, sollte der zu löschende Eintrag Teil der aktuellen Summary-Liste gewesen sein.

##### Custom Operation

[`$delete`](OperationDefinition-at-ediag-operation-diagnose-delete.html)

### Interaktionen auf Listenressourcen

#### Eine Summary-Listenversion löschen 

> Sub:UC_03_02 

Ein ELGA-Teilnehmer kann einzelne Versionen einer Summary-Liste unwiderruflich löschen. Gelöschte Summary-Listenversionen werden nicht mehr in der Historie angezeigt. Sind keine Summary-Listenversionen mehr vorhanden, liefert ein nachfolgender Abruf eine leere Summary-Liste mit `List.emptyReason = nilknown` zurück.

##### Ablauf

1. Der ELGA-Teilnehmer ruft [alle Versionen einer Summary-Liste](uc_ediag_01_lesen.html#versionen-einer-summary-liste-abrufen) ab.
2. Um eine Version der Summary-Liste zu löschen, führt der ELGA-Teilnehmer über das Portal die [`$delete-history-version`-Operation](OperationDefinition-at-ediag-operation-list-delete-history-version.html) auf die zu löschende Summary-Listenversion aus.
3. Die Fachanwendung löscht die entsprechende Summary-Listenversion.
4. Wird die letzte Summary-Listenversion gelöscht, legt die e-Diagnose Fachanwendung eine neue Summary-Liste mit `List.emptyReason = nilknown` an.
 
##### Custom Operation

[`$delete-history-version`](OperationDefinition-at-ediag-operation-list-delete-history-version.html)
