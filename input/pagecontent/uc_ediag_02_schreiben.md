> UC-02 

Dieses Kapitel beschreibt die Schreiboperationen der e-Diagnose-Fachanwendung. Im Mittelpunkt stehen die Aktualisierung von Summary-Listen sowie die Erfassung, Zuordnung, Entfernung, Stornierung und Löschung von medizinischen Einzeleinträgen (Ressourcen).

### Interaktionen auf Einzelressourcen

#### Eintrag erfassen

> Sub:UC_02_01

Der GDA erfasst einen neuen Eintrag über die e-Diagnose-Fachanwendung. Ein neuer Eintrag ist standardmäßig nicht Teil der Summary-Liste, kann aber in Folge durch Sub:UC_02_03 zur Summary-Liste hinzugefügt werden.<br>

##### Ablauf

1. Der GDA wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA erstellt einen neuen Eintrag und erfasst die erforderlichen fachlichen Informationen.
3. Der GDA führt ein **POST** auf
`/Condition`,
`/Procedure` oder
`/AllergyIntolerance`
aus und übermittelt die neue Ressource an die e-Diagnose Fachanwendung.
4. Die **Fachanwendung** validiert die übermittelte Ressource.
5. Ist die Validierung erfolgreich, wird die neue Ressource gespeichert und dem GDA eine erfolgreiche Erstellung mittels **HTTP 201 Created** bestätigt. Ist die Validierung nicht erfolgreich, wird die Ressource nicht gespeichert. Die Fachanwendung liefert ein **OperationOutcome** mit den aufgetretenen Validierungsfehlern zurück.

##### Sequenzdiagramm 

<div>{% include_relative plantuml/02_1.svg %}</div>

#### Eintrag stornieren

> Sub:UC_02_02 

Der GDA kann eine oder mehrere Einträge aufgrund einer falschen Eingabe stornieren. Dabei ist es irrelevant, ob ein zu stornierender Eintrag in der Summary-List referenziert wird oder nicht. Im Zuge der Stornierung kann der GDA einen Vermerk festhalten.

##### Ablauf

1. Um einen Eintrag zu stornieren, führt der GDA die [`$entered-in-error`-Operation](OperationDefinition-at-ediag-operation-diagnose-entered-in-error.html) auf den zu stornierenden Eintrag aus.
2. Optional kann der GDA einen Grund für die Stornierung angeben, der durch die Fachanwendung in den zu stornierenden Eintrag übernommen wird.
3. Für den zu stornierenden Eintrag speichert die Fachanwendung, welcher GDA den Eintrag storniert hat sowie den Zeitpunkt der Stornierung.
4. Sollte der zu stornierende Eintrag Teil der aktuellen Summary-Liste gewesen sein, erstellt die Fachanwendung eine neue Version der Summary-Liste ohne den stornierten Eintrag.

#### Eintrag bearbeiten in der Gesamtansicht

Der GDA kann über die Gesamtansicht bestehende Einträge fachlich "bearbeiten".

Dabei ist es wichtig hervorzuheben, dass Daten bestehender Einträge nicht im Sinne eines Updates verändert werden können. Die Daten können nur in einen neuen Eintrag übernommen und vor dem Speichern in der e-Diagnose Fachanwendung angepasst werden.

Im Unterschied zur Bearbeitung innerhalb einer Summary-Liste erfolgt die Änderung hier unabhängig von der aktuellen Zuordnung in eine Summary-Liste. Die Bearbeitung betrifft die referenzierte medizinische Ressource.

##### Ablauf

2. Der GDA ruft [alle Einträge](uc_ediag_01_lesen.html#alle-einträge-abrufen) oder [einen einzelnen Eintrag](uc_ediag_01_lesen.html#einzelnen-eintrag-abrufen) ab.
3. Der GDA wählt den fachlich zu bearbeitenden Eintrag aus.
3. Der GDA übernimmt die Daten in einen neuen Eintrag.
4. Der GDA ändert die Daten entsprechend.
   1. Möchte der GDA den alten und den neuen Eintrag miteinander verknüpfen, übernimmt er den Business Identifier aus dem alten Eintrag.
5. Der GDA [erfasst den neuen Eintrag](#eintrag-erfassen) in der e-Diagnose Fachanwendung.

### Interaktionen auf Listenressourcen

#### Leere Summary-Liste fachlich bestätigen

> Sub:UC_02_03 

Dieser Use-Case beschreibt die fachliche Bestätigung einer initialisierten, leeren Summary-Liste durch den GDA und die anschließende Speicherung in der e-Diagnose Fachanwendung. 

Eine leere Summary-Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine Summary-Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von Summary-Einträgen und ist von einer noch nicht befüllten Liste **emptyReason = notstarted** zu unterscheiden.

##### Ablauf

1. Der GDA ruft die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) ab.
3. Ist `List.emptyReason = notstarted`, handelt es sich um eine initialisierte, aber noch nicht fachlich bestätigte leere Summary-Liste.
4. Bestätigt der GDA, dass für die Person aktuell keine Summary-Einträge dokumentiert werden müssen, setzt er `List.emptyReason = nilknown`.
5. Der GDA führt die [`$write`-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) aus und übermittelt die aktualisierte Liste an die Fachanwendung.

##### Sequenzdiagramm

<div>{% include_relative plantuml/02_3.svg %}</div>

#### Summary-Liste aktualisieren ($write)

> Sub:UC_02_04 

Die `$write`-Operation ist eine eigenständige Operation, die allerdings einen **zuvor ausgeführten** [Abruf der aktuellen Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) voraussetzt.

##### Ablauf

1. Der GDA übermittelt via `POST /List/$write` die aktualisierte Summary-Liste.
2. Die Fachanwendung [validiert](OperationDefinition-at-ediag-operation-list-write.html#validierung--fehlerbehandlung) die empfangenen Daten entsprechend.
3. Nach erfolgreicher Validierung wird die Summary-Liste persistiert.

###### Alternativer Ablauf: Abgelehnte $write-Operation

1. Der GDA ruft die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) ab.
2. Die Fachanwendung liefert das SearchSet-Bundle zurück. Die in `List.meta.versionId` entspricht dem `ETag` für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) mit dem Wert `123`.
3. **GDA 1** macht **fachliche Änderungen** an der Summary-Liste.
4. Währenddessen ruft **GDA 2** ebenfalls die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen). 
5. Die Fachanwendung liefert das SearchSet-Bundle zurück. Auch in diesem Fall hat `List.meta.versionId` den Wert `123`.
6. **GDA 2** macht **fachliche Änderungen** an der Summary-Liste.
7. **GDA 2** aktualisiert zuerst mittels [$write-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) die Summary-Liste.
8. Im Rahmen der Validierung der übermittelten Summary-Liste prüft die Fachanwendung, ob der mitgeschickte `If-Match`-Header mit der aktuellen `versionId` der Summary-Liste übereinstimmt.
9.  Die Prüfung verläuft erfolgreich, weil beide den Wert `123` haben. Die Änderungen werden übernommen und die neue Version der Summary-Liste wird persistiert. Dabei erhält die Summary-Liste die neue `List.meta.version` mit dem Wert `124`.
12. **GDA 2** erhält die Meldung, dass die Aktualisierung erfolgreich durchgeführt wurde.
13. Anschließend will **GDA 1** mittels [$write-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) ebenfalls seine Version der Summary-Liste speichern.
14. Die Fachanwendung validiert erneut die übermittelte Summary-Liste. Die Prüfung schlägt fehl, weil die aktuelle Summary-Liste in der Fachanwendung mittlerweile die `List.meta.versionId` mit dem Wert `124` besitzt. Die Fachanwendung lehnt das Speichern ab.
17. **GDA 1** erhält eine Fehlermeldung, dass zwischenzeitlich eine Version der Liste gespeichert wurde.
18. **GDA 1** muss erneut die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) abrufen, die zwischenzeitlich vorgenommenen Änderungen prüfen und gegebenenfalls seine Änderungen erneut durchführen, bevor ein neuer Schreibvorgang erfolgen kann.

##### Custom Operations

[$write](OperationDefinition-at-ediag-operation-list-write.html)

##### Sequenzdiagramm

<div>{% include_relative plantuml/write.svg %}</div>

###### Alternativer Ablauf: Abgelehnte $write-Operation

<div>{% include_relative plantuml/diagram_write_error.svg %}</div>

#### Eintrag zur Summary-Liste hinzufügen

> Sub:UC_02_05 

Der GDA möchte einen bestehenden Eintrag in die Summary-Liste aufnehmen.

##### Ablauf

1. Der GDA ruft die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) ab und erhält das entsprechende SearchSet-Bundle.
2. Der GDA wählt den bestehenden Eintrag aus. 
3. Der GDA fügt den Eintrag als `List.entry` in die Liste ein.
* **`List.entry.item`** referenziert den bestehenden Eintrag. 
1. Der GDA führt die [`$write`-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) aus und übermittelt die aktualisierte Liste an die Fachanwendung.

##### Sequenzdiagramm

<div>{% include_relative plantuml/02_5.svg %}</div>

#### Eintrag aus Summary-Liste entfernen

> Sub:UC_02_06 

<!--FHIR Spezifikation über Historie - nachlesen, wie die Regel ist! Was bedeutet eine Aktualisierung auf eine historische Version?
-->

<!--Nur entfernen, das weitere Vorgehen wird hier nicht beschrieben. Stornieren kann als Folge durchgeführt werden. 
Die Referenz auf die Ressource wird aus der Summary-Liste entfernt (removed). Die referenzierte Ressource bleibt unverändert bestehen. Die Fachanwendung entfernt die Kennzeichnung als relevant (meta.tag = relevant).

ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt Ausblenden und Löschen? Löscht der Teilnehmer einen Eintrag, muss die Historienversion mitgelöscht werden? Bestehende Referenzen auf gelöschte Ressourcen. Lösche ich C, sage ich such mir alle List-Versionen mit C, und lösch mir alle C. Wie weit greifen, muss ich mich als Bürger durch alle Vorversionen durchklicken. -->
Ein bestehender Eintrag kann aus der Summary-Liste entfernt werden, ohne dass die Ressource selbst gelöscht oder geändert wird. Hierzu wird die Referenz auf die Ressource aus der Summary-Liste entfernt. Die Ressource bleibt weiterhin verfügbar und kann zu einem späteren Zeitpunkt erneut in die Summary-Liste aufgenommen werden.

##### Ablauf

1. Der GDA ruft die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) ab und erhält das entsprechende SearchSet-Bundle.
2. Der GDA entfernt den Eintrag oder die Einträge aus der Summary-Liste. Das bedeutet, dass der entsprechende `List.entry` entfernt wird.
1. Der GDA führt die [`$write`-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) aus und übermittelt die aktualisierte Liste an die Fachanwendung.

##### Sequenzdiagramm

<div>{% include_relative plantuml/02_6.svg %}</div>

#### Reihenfolge der Einträge in der Summary-Liste ändern

> Sub:UC_02_07 

<!--Der GDA kann die Reihenfolge der Summary-Einträge ändern. Die Einträge selbst bleiben dabei unverändert. 
ToDo: Evtl. auch in den ELGA Core mitnehmen. -->
Der GDA kann die Reihenfolge der Einträge innerhalb einer Summary-Liste ändern. Dabei werden ausschließlich die Listeneinträge neu angeordnet; die referenzierten Ressourcen und deren fachliche Inhalte bleiben unverändert. Durch das Speichern entsteht eine neue Version der Summary-Liste.

##### Ablauf

1. Der GDA führt ein **POST $list-read** aus und erhält das aktuelle Search-Bundle.
2. Der GDA ordnet die Einträge der Summary-Liste in die gewünschte Reihenfolge.
3. Der GDA führt einen POST $list-write aus und übermittelt die aktualisierte Summary-Liste.
4. Die Fachanwendung speichert die neue Reihenfolge als aktuelle Version der Summary-Liste. Die referenzierten Ressourcen bleiben unverändert.

#### Eintrag in der Summary-Liste bearbeiten

> Sub:UC_02_08 

Dieser Use-Case beschreibt die fachliche Bearbeitung von Einträgen einer Summary-Liste.  Ein berechtigter GDA kann alle bestehenden (eigene und fremde) Einträge "bearbeiten". 

Dabei ist es wichtig hervorzuheben, dass Daten bestehender Einträge nicht im Sinne eines Updates verändert werden können. Die Daten können nur in einen neuen Eintrag übernommen und vor dem Speichern in der e-Diagnose Fachanwendung angepasst werden.

Durch die Verwendung eines bereits bestehenden Business-Identifier wird bei der Bearbeitung die Zuordnung einer alten Version zu einer neuen Version einer Ressource ermöglicht. Dadurch bleibt die Verbindung zwischen den Einträgen erhalten.

> Die tatsächliche Reihenfolge der Bearbeitungsschritte kann variieren.

##### Ablauf

1. Der GDA ruft die [aktuelle Summary-Liste](uc_ediag_01_lesen.html#aktuelle-summary-liste-abrufen) ab.
2. Der GDA wählt den fachlich zu bearbeitenden Summary-Einträge aus.
3. Der GDA übernimmt die Daten in einen neuen Eintrag.
4. Der GDA ändert die Daten entsprechend.
   1. Möchte der GDA den alten und den neuen Eintrag miteinander verknüpfen, übernimmt er den Business Identifier aus dem alten Eintrag.
5. Der GDA [erfasst den neuen Eintrag](#eintrag-erfassen) in der e-Diagnose Fachanwendung.
6. Der GDA entfernt den alten Eintrag aus der Summary-Liste.
7. Der GDA fügt den neuen Eintrag zur Summary-Liste hinzu.
8. Der GDA führt die [`$write`-Operation](uc_ediag_02_schreiben.html#summary-liste-aktualisieren-write) aus und übermittelt die aktualisierte Liste an die Fachanwendung.

##### Sequenzdiagramm

<div>{% include_relative plantuml/02_8.svg %}</div>
