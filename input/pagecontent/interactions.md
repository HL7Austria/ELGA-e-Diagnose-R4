{% include styleheader.md %}

<!-- Transaktionen -->

Im Folgenden werden standardisierte Interaktionen für den lesenden und schreibenden Zugriff auf die Diagnosenliste eines Patienten bzw. einer Patientin erläutert, die für alle technischen Use Cases relevant sind.

<br>
[![diagram](ediag_api.png){: style="width: 100%"}](ediag_api.png)
<br>

ToDo: Grafik ändern - keine Kombiliste und Alerts
ToDo: Wording Liste, eDiagnosenliste,...
ToDo: Images der Sequenzdiagramme anpassen!!!!


### List History Read  
Der History Read dient ausschließlich der Anzeige historischer Versionen einer Liste. Die Fachanwendung stellt bereits persistierte historische Collection Bundles unverändert bereit. Der Zugriff erfolgt lesend und ermöglicht keine nachfolgende Bearbeitung der Liste.

#### Ablauf

1. Der GDA fürht ein **GET** auf das Collection Bunlde der Liste aus.
2. Die Fachanwendung prüft, on eine Liste vorhanden ist.
3. Ist keine List-Version vorhanden, wird ein leeres Ergebnis zurückgeliefert.
4. Ist eine Liste vorhanden, wird das aktuelle oder angeforderte historische **Collection Bundle** zurückgeliefert. <br>
Das **Collection Bundle** enthält:
* die List-Ressource <br>
* alle referenzierten Ressourcen 

Beim List History Read erfolgt **keine Veränderung** von Flags, Status oder Inhalten durch die Fachanwendung.<br>
Der Zugriff dient ausschließlich der Anzeige bzw. Informationsabfrage von aktueller oder historischer Listversionen.<br>

#### Sequenzdiagramm List History Read

<br>
<div>{% include_relative plantuml/diagram_planhistoryread.svg %}</div>
<br> 


**Beispiele für Zugriffe mittels Suchparameter:**
* **Aktuelle Listversion** mit dem Suchparameter Patient abrufen: GET [base]/Bundle?type=collection&_count=1&_sort=-timestamp&list.subject={bPK-GH}
* **Alle Listversionen** mit dem Suchparameter Patient abrufen: GET [base]/Bundle?type=collection&_sort=-timestamp&list.subject={bPK-GH}

### List Read

List Read dient dem **Abruf der Liste und der Vorbereitung einer nachfolgenden Änderung**.


#### Ablauf

1. Der GDA führt einen **POST $ListRead** auf das Collection Bundle aus, dass die Liste mit allen zugehörigen relevanten Ressourcen enthält. 
2. Die Fachanwendung **prüft auf Existenz** der Liste für die angegebene Patientin bzw. den angegebenen Patienten.
3. Ist keine Liste vorhanden, wird dieser erstellt (siehe Sub_UC_eDiag_06_01 - Liste initialisieren) und 
4. eine leere Liste mit dem emptyReason notstarted wird zurückgeliefert.
5. Existiert bereits eine Liste, wird von der Fachanwendung aus diesem ein Collection Bundle zur Auslieferung bereitgestellt. Die Inhalte werden von der Fachanwendung wie folgt aufbereitet: 
* Falls der vorherige GDA neue Listeneinträge hinzugefügt oder bestehende geändert hat (List.entry.flag haben den Wert **new** oder **changed**), werden diese auf **unchanged** gesetzt.<br>
* Falls der vorherige GDA Listenneinträge beendet hat (deren List.entry.flag haben den Wert **removed**), werden diese Einträge aus der Liste **entfernt**.<br>
* Falls der vorherige GDA **alle vorhandenen Einträge** mit removed gekennzeichnet hat, wird List.emptyReason mit *nilknown* zurückgeliefert, um nachfolgenden GDA zu signalisieren, dass der Patient zum Zeitpunkt des letzten Schreibens keine Einträge hatte.<br>
6. Die Fachanwendung liefert an den GDA die Liste und alle referenzierten Ressourcen.
7. Ziel ist ein neutraler, weiterbearbeitbarer Zustand für den abrufenden GDA.

#### Sequenzdiagramm List Read
<br>
<div>{% include_relative plantuml/diagram_read.svg %}</div>
<br> 



### List Write

List Write ist eine eigenständige Operation, die ausschließlich im Kontext eines **zuvor ausgeführten** [List-Read](interactions.html#list-read) erfolgen darf.
Der beim List Read erhaltene **List.identifier** dient als Versionsreferenz für den nachfolgenden Schreibvorgang. <br>

#### Ablauf

1. Der GDA übermittelt via **POST $ListWrite** die aktualisierte Liste als **Transaction Bundle**:
* alle **neuen und geänderten und zu entfernenden Ressourcen** sind **inline** im Bundle enthalten,
* alle **unveränderten Ressourcen** werden nur **referenziert**.
2. Die Fachanwendung prüft, ob der übermittelte **List.identifier** mit dem List.identifier der temporär gespeicherten Listenversion **übereinstimmt** (d.h. es wurde zwischenzeitlich kein anderer Schreibvorgang durchgeführt).
3. Stimmt der List.identifier nicht überein, lehnt die Fachanwendung das Speichern ab.
Es muss erneut ein List Read ausgeführt werden. Die Änderungen sind anschließend auf Basis der aktuellen Listversion erneut vorzunehmen und zu speichern. 
4. Ist die Prüfung erfolgreich, validiert die Fachanwendung die neue Liste und stellt sicher, dass keine unzulässigen Zustandsübergänge vorgenommen wurden.
5. Bei erfolgreicher Validierung:
* werden die übermittelten Änderungen in die Ressourcen übernommen,
* und auf Basis der aktualisierten Ressource erstellt die Fachanwendung ein neues Collection Bundle, das als **neue Lsite persistiert** wird. 
6. Der GDA erhält eine Meldung, dass die Liste erfolgreich aktualisiert wurde.


#### Sequenzdiagramm List Write
<br>
<div>{% include_relative plantuml/diagram_write.svg %}</div>
<br>



#### Abgelehnter List Write

#### Ablauf


1. **GDA 1** führt einen **POST $ListRead** auf die Liste einer Patientin bzw. eines Patienten durch.
2. Die Fachanwendung prüft, ob eine Liste existiert.
3. Die Fachanwendung liefert die aktuelle Liste als **Collection Bundl** mit dem aktuellen **List.identifier** „123" an GDA 1 aus.
4. **GDA 1** beginnt mit der **fachlichen Bearbeitung** der Liste.
5. Währenddessen führt **GDA 2** ebenfalls ein **List Read** auf dieselbe Liste durch.
6. Die Fachanwendung liefert auch an GDA 2 die aktuelle Liste mit dem List.identifier „123" aus.
7. GDA 2 bearbeitet die Liste.
8. GDA 2 sendet zuerst mittels **POST $ListWrite** ein Transaction Bundle mit den vorgenommenen Änderungen.
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
20. GDA 1 muss erneut einen **POST $ListRead** durchführen, die zwischenzeitlich vorgenommenen Änderungen prüfen und gegebenenfalls in die aktuelle Version übernehmen, bevor ein neuer Schreibvorgang erfolgen kann.


#### Sequenzdiagramm Abgelehnter List Write
<br>
<div>{% include_relative plantuml/diagram_write_error.svg %}</div>
<br>


