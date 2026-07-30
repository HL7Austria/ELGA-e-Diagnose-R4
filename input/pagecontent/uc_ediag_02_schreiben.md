# Schreiben
> UC-02 
<br> 

Dieses Kapitel beschreibt die Schreiboperationen der e-Diagnose-Fachanwendung. Im Mittelpunkt stehen die Aktualisierung von Listen sowie die Erfassung, Zuordnung, Entfernung, Stornierung und Löschung von Diagnosen, Prozeduren oder Allergien und Intoleranzen.

## Interaktionen auf Listenressourcen

<!--$PatientWrite wäre das Löschen der gesamten Ressource (nicht nur die Listenbeteiligung) und das $PatientDelete wäre das Löschen der Ressource in der Historie -->

### Leere Liste fachlich bestätigen
> Sub:UC_02_01 
<br> 

Dieser Ablauf beschreibt die fachliche Bestätigung einer initialisierten, leeren Liste durch den GDA und die anschließende Speicherung des bestätigten Zustands in der Fachanwendung. Eine leere Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von relevanten Einträgen und ist von einer noch nicht befüllten Liste **emptyReason = notstarted** zu unterscheiden.

#### Ablauf

1. Der GDA führt einen **POST $list-read** aus.
2. Die Fachanwendung prüft die angeforderte Liste und stellt fest, dass keine List.entry vorhanden sind.
3. Ist **List.emptyReason = notstarted**, handelt es sich um eine initialisierte, aber noch nicht fachlich bestätigte leere Liste.
4. Bestätigt der GDA, dass für die Person aktuell keine Einträge dokumentiert werden müssen, setzt er **List.emptyReason = nilknown**.
5. Der GDA führt anschließend einen **POST $list-write** mit der aktualisierten Liste durch, um den bestätigten Zustand zu speichern.
6. Die Fachanwendung speichert die aktualisierte Liste inkl. ETag für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) zurück.

#### Sequenzdiagramm
<div>{% include_relative plantuml/02_01.svg %}</div>


### Liste aktualisieren (List-Write)
> Sub:UC_02_02 
<br> 

List Write, siehe [List-Write](https://build.fhir.org/ig/HL7Austria/ELGA-Core-R4/branches/main/interactions.html#list-write) ist eine eigenständige Operation, die ausschließlich im Kontext eines **zuvor ausgeführten** [List-Read](uc_ediag_01_lesen.html#list-read) erfolgen darf.
Nach dem Erfassen einer neuen medizinischen Ressource, siehe [Diagnose erfassen](uc_ediag_02_schreiben.html#diagnose-erfassen), kann diese in einer Summary-Liste aufgenommen werden. Die Fachanwendung kennzeichnet die Ressource anschließend als relevant (meta.tag = relevant). 

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



### Einträge zur Liste hinzufügen
> Sub:UC_02_03 
Nach dem Erfassen einer neuen medizinischen Ressource [Ressource erfassen](uc_ediag_02_schreiben.html#ressource-erfassen) kann dieser Eintrag in eine Liste aufgenommen werden. Die Fachanwendung kennzeichnet die Ressource anschließend als relevant (meta.tag = relevant). 

#### Ablauf
1. Der GDA legt eine neue (Condition, Procedure oder AllergyIntolerance), siehe [Ressource erfassen](uc_ediag_02_schreiben.html#ressource-erfassen) an oder eine bestehende Ressource, die in die Liste aufgenommen werden soll.
2. Dafür führt der GDA ein **POST $list-read** aus und erhält das aktuelle Search-Bundle der ausgewählten List-Ressource.
3. Der GDA wählt die bestehende Ressource aus und fügt sie als neuen List.entry in die Liste ein.
* **List.entry.flag = new**
* **List.entry.item** referenziert die bestehende Ressource. 
6. Der GDA führt ein **POST $list-write** aus und übermittelt die aktualisierte Liste an die Fachanwendung.
7. Die Fachanwendung kennzeichnet die referenzierte Ressource mit **meta.tag = relevant**, wodurch ihre Zugehörigkeit zur Liste gekennzeichnet wird.

#### Sequenzdiagramm
<div>{% include_relative plantuml/02_03.svg %}</div>



### Einträge aus einer Liste entfernen
> Sub:UC_02_04 
Nur entfernen, das weitere Vorgehen wird hier nicht beschrieben. Stornieren kann als Folge durchgeführt werden. 
Die Referenz auf die Ressource wird aus der Summary-Liste entfernt (removed). Die referenzierte Ressource bleibt unverändert bestehen. Die Fachanwendung entfernt die Kennzeichnung als relevant (meta.tag = relevant).

ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt Ausblenden und Löschen? Löscht der Teilnehmer einen Eintrag, muss die Historienversion mitgelöscht werden? Betsehende Referenzen auf gelöschte Ressourcen. Lösche ich C, sage ich such mir alle List-Versionen mit C, und lösch mir alle C. Wie weit greifen, muss ich mich als Bürger durch alle Vorversionen durchklicken. 
<!--FHIR Spezifikation über Historie - nachlesen, wie die Regel ist! Was bedeutet eine Aktualisierung auf eine historische Version?-->


### Reihenfolge der Listeneinträge ändern
> Sub:UC_02_05 
<br> 

Der GDA kann die gemeinsame Reihenfolge der Summary-Listeinträge ändern. Die Einträge selbst bleiben dabei unverändert. 
ToDo: Evtl. auch in den ELGA Core mitnehmen. 

### Diagnose in der Liste bearbeiten
> Sub:UC_02_06 
<br> 

Dieser Sub-UC ist eine Kombination aus einzelnen Schritte. Es fasst die zur fachlichen Bearbeitung einer bestehenden Ressource erforderlichen Einzelschritte zusammen. Die Reihenfolge der Schritte kann variieren. Bearbeitung erfolgt durch Stornierung der bestehenden Ressource und Erfassung einer neuen fachlich korrigierten Ressource.
Dadurch bleiben Änderungen nachvollziehbar und versioniert.

<!--Bestehende Einträge fachlich bearbeiten 
TODo: Dieser UC setzt sich zusammen aus mehreren anderen und wird zur besseren verständnis hier nochmals beschrieben. 
Der GDA kann Einträge in einer Liste fachlich bearbeiten - stimmt nicht mehr? 1. Schritt, ich erstelle eine neue 2 Schritt: Will ich sie verknüpfen, muss ich auf die bestehenden Ressourcen zugreifen mit dem Identifier 123, der muss vom Client zwischengespeichert werden, damit dieser an die FA mitgesendet werden kann. Änderungen eines Eintrags werden referenziert und sind somit nachverfolgbar.-->

#### Ablauf
1. **GDA** führt ein **POST $list-read** gemäß List-Read
2. Die Fachanwendung liefert die aktuelle Summary-Liste inkl. ETag für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) und alle referenzierten Ressourcen.
3. **GDA** wählt die fachlich zu bearbeitende(n) Ressourcen aus und übernimmt den Business-Identifier der bestehenden Ressource.
    * GDA storniert die bestehende Ressource gemäß Sub:UC_02_08 – Diagnose stornieren.
    * GDA erfasst die fachlich geänderte Ressource gemäß Sub:UC_02_07 – Diagnose erfassen und übernimmt dabei den Identifier der stornierten Ressource.
5. übernhame des Identifier der bisherigenb Ressource
6. **GDA** führt ein **POST $list-write** gemäß List-Write durch und übermittelt die aktualisierte Summary-Liste.



#### Sequenzdiagramm
<div>{% include_relative plantuml/diagram_uc_06_03.svg %}</div>


## Interaktionen auf Einzelressourcen


### Diagnose erfassen
> Sub:UC_02_07
<br> 

Der GDA erfasst einen neuen Eintrag über die e-Diagnose Fachanwendung, die nicht Teil der Summary-Liste ist. Dieser Eintrag kann in Folge durch eine Änderung, siehe Sub:UC_02_03 zur Liste hinzugefügte werden.<br>

#### Ablauf
1. Der GDA wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA erstellt eine neue Ressource und erfasst die erforderlichen fachlichen Informationen.
3. Der GDA führt ein **POST** auf
/Patient/[id]/Condition/,
/Patient/[id]/Procedure/ oder
/Patient/[id]/AllergyIntolerance/
aus und übermittelt die neue Ressource an die e-Diagnose Fachanwendung.
4. Die **Fachanwendung** validiert die übermittelte Ressource.
5. Ist die Validierung erfolgreich, wird die neue Ressource gespeichert und dem GDA eine erfolgreiche Erstellung mittels **HTTP 201 Created** bestätigt. Ist die Validierung nicht erfolgreich, wird die Ressource nicht gespeichert. Die Fachanwendung liefert ein **OperationOutcome** mit den aufgetretenen Validierungsfehlern zurück.

#### Sequenzdiagramm 
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>


### Diagnose stornieren
> Sub:UC_02_08 
<br> 
ToDo: GDA OID angeben? Oder ob sie aus dem Request ausgelesen werden kann?

Der GDA kann einen oder mehrere Diagnosen aufgrund einer falschen Eingabe stornieren. Dabei ist es irrelevant, ob eine zu stornierende Diagnose in der Summary-List referenziert wird oder nicht.

Sollte die Diagnose als relevant gekennzeichnet gewesen sein und will sie der GDA nach der Stornierung nicht mehr in der Liste der relevanten Einträge haben, muss die Diagnose aus der Liste der relevanten Einträge entfernt werden, siehe Einträge aus einer Liste entfernen.
In Ergänzung müssen der GDA, der die Stornierung durchgeführt hat, den Stornierungszeitpunkt und den Vermerk festhalten.

#### Ablauf

- Um einen Eintrag zu stornieren, führt der GDA ein `$list-read` oder ein `GET` auf die Gesamtmenge der Diagnosen aus (siehe 
[Read/Search von Diagnosen, Prozeduren sowie Allergien und Intoleranzen](uc_ediag_06_int_list.md#read-search-von-diagnosen-prozeduren-sowie-allergien-und-intoleranzen)) und markiert die zu stornierenden Einträge.
- Optional kann der GDA einen Grund für die Stornierung angeben.
- Durch Bestätigung wird die `$storno`-Operation ausgeführt.
- Die Fachanwendung bearbeitet die zu stornierende Diagnose folgendermaßen:
  -  `AllergyIntolerance.verificationStatus = entered-in-error`
  -  `Condition.verificationStatus = entered-in-error`
  -  `Procedure.status = entered-in-error`
- Die Fachanwendung speichert den Zeitpunkt der Stornierung ab und übernimmt ursprünglichen Wert des verification.Status bzw. status

### Einträge bearbeiten in der Gesamtansicht