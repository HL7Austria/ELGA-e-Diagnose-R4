# Lesen

> UC-01 

Dieses Kapitel beschreibt die lesenden Zugriffe der e-Diagnose-Fachanwendung auf einzelne Einträge sowie Summary-Listen. Je nach Anwendungsfall stehen unterschiedliche Interaktionen zur Verfügung.

## Interaktionen auf Einzelressourcen

### Einzelne Einträge abrufen 

> Sub:UC_01_01 

Dieser Use-Case ermöglicht den lesenden Zugriff auf jeweils alle Einträge von Diagnosen, Prozeduren sowie Allergien und Intoleranzen eines Patienten als Gesamtansicht.

Die Interaktion liefert standardmäßig die 30 zuletzt erstellten Einträge, absteigend nach Erstellungsdatum sortiert, zurück. Da eine fachliche Bearbeitung eines Eintrags die Erstellung einer neuen Ressource impliziert, entspricht das Erstellungsdatum dem Zeitpunkt der letzten fachlichen Bearbeitung. Die Fachanwendung stellt die vorhandenen Einträge des gewählten Ressourcentyps als SearchSet-Bundle bereit.

#### Ablauf

1. Der GDA oder ELGA-Teilnehmer wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) der abzurufenden Einträge aus.
1. Der GDA oder ELGA-Teilnehmer führt ein `GET` auf `/Condition`, `/Procedure` und/oder `/AllergyIntolerance` aus, siehe [Transaktionen](transaction.html#transaktionen).
3. **Optional** kann der Abfrageparameter `_count` angegeben werden, um die Anzahl der zurückgelieferten Ressourcen festzulegen. Standardmäßig werden die 30 zuletzt erstellten Ressourcen, absteigend nach Erstellungsdatum sortiert, zurückgeliefert.
4. Die Fachanwendung liefert ein SearchSet-Bundle mit den gefundenen Einträgen zurück.
5. Sind keine Ressourcen vorhanden bzw. entsprechen keine Ressourcen den Suchkriterien, wird ein leeres SearchSet-Bundle zurückgeliefert.

## Interaktionen auf Listenressourcen

### Vergangene Versionen einer Summary-Liste abrufen (List-History-Read)  

**TODO: Unklar, ob Historie von Listen geführt wird (siehe https://github.com/HL7Austria/ELGA-e-Diagnose-R4/issues/13)**
**TODO: Falls Historie von Listen: Entscheiden, ob bei jeder $write-Operation eine neue Liste angelegt wird, oder ob _history verwendet wird. Davon ist abhängig, ob Search (`GET`) verwendet werden kann oder eine Custom Operation für die Sucher innerhalb der _history erforderlich ist.**

> Sub:UC_01_02 

History Read dient ausschließlich der Anzeige historischer Versionen der Summary-Liste. Die Fachanwendung stellt bereits persistierte historische Summary-Listen unverändert bereit. Der Zugriff erfolgt lesend und ermöglicht keine nachfolgende Bearbeitung der jeweiligen Summary-Liste.
Vorversionen der Summary-Listen können in chronologischer Reihenfolge dargestellt werden – absteigend nach Erstellungsdatum, d.h. die jüngste Version zuerst.  

#### Ablauf

1. Der GDA fürht ein **GET** (Suche) auf den List-Typ aus.
2. Die Fachanwendung führt die Suche anhand der angegebenen Suchparameter durch.
3. Werden keine Summary-Listen gefunden, wird ein leeres Ergebnis zurückgeliefert.
4. Wird zumindest eine Summary-Liste gefunden, liefert die Fachanwendung ein **Search-Bundle** zurück. <br>
Dieses **Search-Bundle** enthält:
* die List-Ressource <br>
* alle referenzierten Ressourcen (Patient, Practitioner, Condition, Procedure, AllergyIntolerance)

Beim List History Read erfolgt **keine Veränderung** von Flags, Status oder Inhalten durch die Fachanwendung.<br>
Der Zugriff dient ausschließlich der Anzeige bzw. Informationsabfrage von aktueller oder historischer Summary-Listversionen.<br>

#### Sequenzdiagramm 

<br>
<div>{% include_relative plantuml/historyread.svg %}</div>
<br> 

<!-- TODO: Es muss noch definiert werden, wie zwischen den Listen von Conditions, Procedures, AllergyIntolerances unterschieden wird. -->
**Beispiele für Zugriffe mittels Suchparameter:**
* **Aktuelle Summary-Listenversion** der Summary-Einträge (Conditions) mit dem Suchparameter Patient abrufen: `GET /List?_include=List:patient&_include=List:source&_include:iterate=List:item&_count=1&_sort=-date&code=http://loinc.org|11450-4`
* **Alle Summary-Listenversionen** der Summary-Einträge (Procedures) mit dem Suchparameter Patient abrufen: `GET /List?_include=List:patient&_include=List:source&_include:iterate=List:item&_sort=-date&code=http://loinc.org|47519-4`  

### Aktuelle Summary-Liste abrufen

> Sub:UC_01_03  

Diese Abfrage dient dem Abruf der aktuellen Summary-Liste für eine Art von Einträgen.

#### Ablauf

1. Der GDA führt ein `GET /List?code=[code]&_sort=-date&_count=1&include=*` aus. 
2. Die Fachanwendung liefert als Ergebnis ein SearchSet-Bundle, das die Summary-Liste inklusive aller referenzierter Ressourcen enthält, an den GDA. Die Information für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) ist in `List.meta.versionId`.
3. Die zurückgelieferte Summary-Liste bildet die Grundlage für nachfolgende Änderungsoperationen.

##### Alternativer Ablauf

1. Es kann auch `GET /List?code=[code]&_sort=-date&_count=1` ausgeführt werden, um die Summary-Liste OHNE referenzierte Ressourcen abzurufen.

#### Sequenzdiagramm 
<br>
<div>{% include_relative plantuml/read.svg %}</div>
<br> 





