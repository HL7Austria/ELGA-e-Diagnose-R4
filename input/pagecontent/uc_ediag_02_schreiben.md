# Schreiben
> UC-02 
<br> 

Dieses Kapitel beschreibt die Schreiboperationen der e-Diagnose-Fachanwendung. Im Mittelpunkt stehen die Aktualisierung von Summary-Listen sowie die Erfassung, Zuordnung, Entfernung, Stornierung und Löschung von medizinischen Einzeleinträgen (Ressourcen).

## Interaktionen auf Listenressourcen

<!--$PatientWrite wäre das Löschen der gesamten Ressource (nicht nur die Listenbeteiligung) und das $PatientDelete wäre das Löschen der Ressource in der Historie -->

### Leere Summary-Liste fachlich bestätigen
> Sub:UC_02_01 
<br> 

Dieser Ablauf beschreibt die fachliche Bestätigung einer initialisierten, leeren Summary-Liste durch den GDA und die anschließende Speicherung des bestätigten Zustands in der Fachanwendung. Eine leere Summary-Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine Summary-Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von Summary-Einträgen und ist von einer noch nicht befüllten Liste **emptyReason = notstarted** zu unterscheiden.

#### Ablauf

1. Der GDA führt einen **POST $list-read** aus.
2. Die Fachanwendung prüft die angeforderte Summary-Liste und stellt fest, dass kein List.entry vorhanden ist.
3. Ist **List.emptyReason = notstarted**, handelt es sich um eine initialisierte, aber noch nicht fachlich bestätigte leere Summary-Liste.
4. Bestätigt der GDA, dass für die Person aktuell keine Summary-Einträge dokumentiert werden müssen, setzt er **List.emptyReason = nilknown**.
5. Der GDA führt anschließend einen **POST $list-write** mit der aktualisierten Summary-Liste durch, um den bestätigten Zustand zu speichern.
6. Die Fachanwendung speichert die aktualisierte Summary-Liste inkl. ETag für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) zurück.

#### Sequenzdiagramm
<div>{% include_relative plantuml/02_01.svg %}</div>


### Summary-Liste aktualisieren (List-Write)
> Sub:UC_02_02 
<br> 

[List-Write](https://build.fhir.org/ig/HL7Austria/ELGA-Core-R4/branches/main/interactions.html#list-write) ist eine eigenständige Operation, die ausschließlich im Kontext eines **zuvor ausgeführten** [List-Read](uc_ediag_01_lesen.html#list-read) erfolgen darf.
Nach dem Erfassen einer neuen medizinischen Ressource, siehe [Einträge erfassen](uc_ediag_02_schreiben.html#einträge-erfassen), kann diese in einer Summary-Liste aufgenommen werden. Die Fachanwendung kennzeichnet die Ressource anschließend als relevant (meta.tag = relevant). 

ToDo: Patient Compartment für die Endpunkte
`GET [base]/Patient/[id]/Condition/`,
`GET [base]/Patient/[id]/Procedure/` oder 
`GET [base]/Patient/[id]/AllergyIntolerance/`

<!-- #### Ablauf

1. Der GDA übermittelt via **POST $list-write** die aktualisierte Liste als **List Bundle** inkl. ETag für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency):
* alle **neuen und geänderten und zu entfernenden Ressourcen** sind **inline** im Bundle enthalten,
* alle **unveränderten Ressourcen** werden nur **referenziert**.
2. Die Fachanwendung prüft anhand des im HTTP-Header übermittelten **ETag**, ob die vom GDA bearbeitete Listenversion noch der aktuellen Version entspricht.
3. Stimmen die ETags nicht überein, lehnt die Fachanwendung den Schreibvorgang ab, siehe [Abgelehntes Write](https://build.fhir.org/ig/HL7Austria/ELGA-Core-R4/branches/main/interactions.html#abgelehntes-plan-write). 
   Der GDA muss erneut ein $list-read durchführen und seine Änderungen auf Basis der aktuellen Listversion erneut vornehmen. 
4. Ist die Prüfung erfolgreich, validiert die Fachanwendung die neue Liste und stellt sicher, dass keine unzulässigen Zustandsübergänge vorgenommen wurden.
5. Bei erfolgreicher Validierung:
* werden die übermittelten Änderungen in die Ressourcen übernommen,
* und auf Basis der aktualisierten Ressource erstellt die Fachanwendung ein neue Version der Liste als eigene List-Instanz, die als **neue Liste persistiert** wird. 
6. Der GDA erhält eine Meldung, dass die Liste erfolgreich aktualisiert wurde.


<!--

#### Alternativ - Abgelehnter List Write

#### Ablauf

1. **GDA 1** führt ein **POST $list-read** auf die Liste einer Person aus.
2. Die Fachanwendung prüft, ob eine Liste existiert.
3. Die Fachanwendung liefert die aktuelle Liste als **List Bundle** mit dem aktuellen **ETag** „123" an GDA 1 aus.
4. **GDA 1** beginnt mit der **fachlichen Bearbeitung** der Liste.
5. Währenddessen führt **GDA 2** ebenfalls ein **List-Read** auf dieselbe Liste durch.
6. Die Fachanwendung liefert auch an GDA 2 die aktuelle Liste mit dem ETag „123" aus.
7. GDA 2 bearbeitet die Liste.
8. GDA 2 sendet zuerst mittels **POST $list-write** ein Transaction Bundle mit den vorgenommenen Änderungen.
9. Die Fachanwendung prüft, ob der im Transaction Bundle enthaltene **List.identifier** mit dem aktuellen List.identifier der zuletzt gespeicherten Liste übereinstimmt.
10. Die Prüfung verläuft erfolgreich, da beide den Wert „123" besitzen.
11. Die Fachanwendung validiert die übermittelten Änderungen und prüft insbesondere, ob keine unzulässigen Zustandsübergänge vorliegen.
12. Die Änderungen werden übernommen und eine neue Version der Liste wird persistiert.
13. Dabei wird ein neuer List.identifier erzeugt, beispielsweise „124".
14. GDA 2 erhält eine Meldung, dass die Aktualisierung erfolgreich durchgeführt wurde.
15. Anschließend sendet GDA 1 mittels **POST $ListWrite** seine ebenfalls auf Basis des ursprünglichen List.identifier „123" vorgenommenen Änderungen.
16. Die Fachanwendung prüft erneut den übermittelten List.identifier gegen die aktuell persistierte Diagnosenliste.
17. Die Prüfung schlägt fehl, da die aktuelle Liste mittlerweile den List.identifier „124" besitzt.
18. Die Fachanwendung lehnt das Speichern ab.
19. GDA 1 erhält eine Fehlermeldung, dass zwischenzeitlich eine neuere Version der Liste gespeichert wurde.
20. GDA 1 muss erneut einen **POST $list-read** durchführen, die zwischenzeitlich vorgenommenen Änderungen prüfen und gegebenenfalls in die aktuelle Version übernehmen, bevor ein neuer Schreibvorgang erfolgen kann.
-->


### Eintrag zur Summary-Liste hinzufügen
> Sub:UC_02_03 
Der GDA verfasst einen neuen Eintrag, siehe [Eintrag erfassen](uc_ediag_02_schreiben.html#ressource-erfassen) oder möchte einen bestehenden Eintrag in die Summary-Liste aufnehmen. Die Fachanwendung kennzeichnet diesen Eintrag anschließend als relevant (meta.tag = relevant). 

#### Ablauf

1. Der GDA führt ein **POST $list-read** aus und erhält das aktuelle Search-Bundle.
2. Der GDA wählt die bestehende Ressource aus 
3. Der GDA fügt die Ressource als List.entry in die Liste ein.
* **List.entry.flag = new**
* **List.entry.item** referenziert die bestehende Ressource. 
6. Der GDA führt ein **POST $list-write** aus und übermittelt die aktualisierte Liste an die Fachanwendung.
7. Die Fachanwendung kennzeichnet die referenzierte Ressource mit **meta.tag = relevant**, wodurch ihre Zugehörigkeit zur Summary-Liste gekennzeichnet wird.

#### Sequenzdiagramm
<div>{% include_relative plantuml/02_03.svg %}</div>



### Eintrag aus Summary-Liste entfernen
> Sub:UC_02_04 
<!--FHIR Spezifikation über Historie - nachlesen, wie die Regel ist! Was bedeutet eine Aktualisierung auf eine historische Version?
-->

<!--Nur entfernen, das weitere Vorgehen wird hier nicht beschrieben. Stornieren kann als Folge durchgeführt werden. 
Die Referenz auf die Ressource wird aus der Summary-Liste entfernt (removed). Die referenzierte Ressource bleibt unverändert bestehen. Die Fachanwendung entfernt die Kennzeichnung als relevant (meta.tag = relevant).

ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt Ausblenden und Löschen? Löscht der Teilnehmer einen Eintrag, muss die Historienversion mitgelöscht werden? Betsehende Referenzen auf gelöschte Ressourcen. Lösche ich C, sage ich such mir alle List-Versionen mit C, und lösch mir alle C. Wie weit greifen, muss ich mich als Bürger durch alle Vorversionen durchklicken. -->
Ein bestehender Eintrag kann aus der Summary-Liste entfernt werden, ohne dass die Ressource selbst gelöscht oder geändert wird. Hierzu wird die Referenz auf die Ressource aus der Summary-Liste entfernt. Die Fachanwendung hebt anschließend die Kennzeichnung der Ressource als relevant (meta.tag = relevant) auf. Die Ressource bleibt weiterhin verfügbar und kann zu einem späteren Zeitpunkt erneut in die Summary-Liste aufgenommen werden.

#### Ablauf

1. Der GDA führt ein **POST $list-read** aus und erhält das aktuelle Search-Bundle.
2. Der GDA wählt den zu entferndenen Eintrag oder die Einträge aus der Summary-Liste aus.
3. Der GDA kennzeichnet die entsprechenden List.entry mit **List.entry.flag = removed**.
4. Der GDA führt ein **POST list-write** aus und übermittelt die aktuelle Summary-Liste.
5. Die Fachanwendung entfernt die mit List.entry.flag = removed gekennzeichneten Einträge aus der Summary-Liste und entfernt bei den referenzierten Ressourcen die Kennzeichnung meta.tag = relevant.


### Reihenfolge der Einträge in der Summary-Liste ändern
> Sub:UC_02_05 
<br> 
<!--Der GDA kann die Reihenfolge der Summary-Einträge ändern. Die Einträge selbst bleiben dabei unverändert. 
ToDo: Evtl. auch in den ELGA Core mitnehmen. -->
Der GDA kann die Reihenfolge der Einträge innerhalb einer Summary-Liste ändern. Dabei werden ausschließlich die Listeneinträge neu angeordnet; die referenzierten Ressourcen und deren fachliche Inhalte bleiben unverändert. Durch das Speichern entsteht eine neue Version der Summary-Liste.

#### Ablauf

1. Der GDA führt ein **POST $list-read** aus und erhält das aktuelle Search-Bundle.
2. Der GDA ordnet die Einträge der Summary-Liste in die gewünschte Reihenfolge.
3. Der GDA führt einen POST $list-write aus und übermittelt die aktualisierte Summary-Liste.
4. Die Fachanwendung speichert die neue Reihenfolge als aktuelle Version der Summary-Liste. Die referenzierten Ressourcen bleiben unverändert.

### Einträge in der Summary-Liste bearbeiten
> Sub:UC_02_06 
<br> 
Dieser Sub-UC beschreibt die fachliche Bearbeitung von Einträgen einer Summary-Liste. Die tatsächliche Reihenfolge der Bearbeitungsschritte kann je nach Anwendungsfall variieren. Es ist nicht notwendigerweise vorgesehen, dass $list-read am Anfang und $list-write am Ende des Ablaufs stehen.
Durch die Verwendung eines bereits bestehenden Business-Identifier wird bei der Bearbeitung die Zuordnung einer alten Version zu einer neuen Version einer Ressource ermöglicht. Dadurch bleibt die Verbindung zwischen den Versionen erhalten.

<!--Bestehende Einträge fachlich bearbeiten 
TODo: Dieser UC setzt sich zusammen aus mehreren anderen und wird zur besseren verständnis hier nochmals beschrieben. 
Der GDA kann Einträge in einer Liste fachlich bearbeiten - stimmt nicht mehr? 1. Schritt, ich erstelle eine neue 2 Schritt: Will ich sie verknüpfen, muss ich auf die bestehenden Ressourcen zugreifen mit dem Identifier 123, der muss vom Client zwischengespeichert werden, damit dieser an die FA mitgesendet werden kann. Änderungen eines Eintrags werden referenziert und sind somit nachverfolgbar.-->

#### Ablauf

1. Der GDA führt einen POST $list-read aus und erhält das aktuelle Search-Bundle..
2. Der GDA wählt die fachlich zu bearbeitenden Summary-Einträge aus.
3. Der GDA führt die erforderlichen Bearbeitungsschritte für den jeweiligen Anwendungsfall aus. Dazu gehört beispielsweise:
    * Übernahme des bestehenden Business-Identifier für die neue Version einer Ressource.
    * Erfassung einer neuen bzw. fachlich geänderten Ressource gemäß Sub – Eintrag erfassen.
5. Der GDA führt einen POST $list-write aus und übermittelt die aktualisierte Summary-Liste an die Fachanwendung. Die fachlich geänderte Ressource wird dabei neu angelegt und erhält durch die Übernahme des Business-Identifier die Verbindung zur bisherigen Ressource.

#### Sequenzdiagramm
<div>{% include_relative plantuml/02_06.svg %}</div>


## Interaktionen auf Einzelressourcen


### Eintrag erfassen
> Sub:UC_02_07
<br> 

Der GDA erfasst einen neuen Eintrag über die e-Diagnose Fachanwendung, die nicht Teil der Summary-Liste ist. Dieser Eintrag kann in Folge durch eine Änderung, siehe Sub:UC_02_03 zur Liste hinzugefügte werden.<br>

#### Ablauf
1. Der GDA wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA erstellt einen neuen Eintrag und erfasst die erforderlichen fachlichen Informationen.
3. Der GDA führt ein **POST** auf
/Patient/[id]/Condition/,
/Patient/[id]/Procedure/ oder
/Patient/[id]/AllergyIntolerance/
aus und übermittelt die neue Ressource an die e-Diagnose Fachanwendung.
4. Die **Fachanwendung** validiert die übermittelte Ressource.
5. Ist die Validierung erfolgreich, wird die neue Ressource gespeichert und dem GDA eine erfolgreiche Erstellung mittels **HTTP 201 Created** bestätigt. Ist die Validierung nicht erfolgreich, wird die Ressource nicht gespeichert. Die Fachanwendung liefert ein **OperationOutcome** mit den aufgetretenen Validierungsfehlern zurück.

#### Sequenzdiagramm 
<div>{% include_relative plantuml/02_07.svg %}</div>


### Eintrag stornieren
> Sub:UC_02_08 
<br> 
<!--ToDo: Kläre, ob die GDA-OID durch den Request automatisch mitkommt!-->

Der GDA kann eine oder mehrere Einträge aufgrund einer falschen Eingabe stornieren. Dabei ist es irrelevant, ob ein zu stornierender Eintrag in der Summary-List referenziert wird oder nicht.
Im Zuge der Stornierung kann der GDA einen Vermerk festhalten. 
Die OID des GDA´s und der Stornierungszeitpunkt wird durch die Fachanwendung gesetzt.


#### Ablauf

1. Um einen Eintrag zu stornieren, führt der GDA ein `$list-read` oder ein `GET` auf die Gesamtmenge der Diagnosen aus (siehe 
[Read/Search von Diagnosen, Prozeduren sowie Allergien und Intoleranzen](uc_ediag_01_lesen.md#einträge-als-einzelressource-abrufen))
und markiert die zu stornierenden Einträge.
2. Optional kann der GDA einen Grund für die Stornierung angeben.
3. Durch Bestätigung wird die `$storno`-Operation ausgeführt.
4. Die Fachanwendung bearbeitet den zu stornierenden Eintrag folgendermaßen:
  *  `AllergyIntolerance.verificationStatus = entered-in-error`
  *  `Condition.verificationStatus = entered-in-error`
  *  `Procedure.status = entered-in-error`
5. Die Fachanwendung speichert den Zeitpunkt der Stornierung ab und übernimmt ursprünglichen Wert des verification.Status bzw. status

### Eintrag bearbeiten in der Gesamtansicht
Der GDA kann über die Gesamtansicht bestehende Einträge suchen, auswählen und fachlich bearbeiten.

Im Unterschied zur Bearbeitung innerhalb einer Summary-Liste erfolgt die Änderung hier unabhängig von der aktuellen Listenzuordnung. Die Bearbeitung betrifft die referenzierte medizinische Ressource.

#### Ablauf
