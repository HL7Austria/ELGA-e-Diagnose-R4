# Lesen
> UC-01 
<br> 

Dieses Kapitel beschreibt die lesenden Zugriffe der e-Diagnose-Fachanwendung auf Listen, Gesamtansicht sowie auf die Einträge in den Einzelressourcen. Je nach Anwendungsfall stehen unterschiedliche Interaktionen zur Verfügung.


## Interaktionen auf Listenressourcen

### Vergangene Versionen einer Summary-Liste abrufen (List-History-Read)  
> Sub:UC_01_01 
<br> 

History Read dient ausschließlich der Anzeige historischer Versionen der Summary-Liste. Die Fachanwendung stellt bereits persistierte historische Search-Bundles unverändert bereit. Der Zugriff erfolgt lesend und ermöglicht keine nachfolgende Bearbeitung der Summary-Liste.
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
* **Aktuelle Summary-Listenversion** der Summary-Einträge (Conditions) mit dem Suchparameter Patient abrufen: `GET [base]/Patient/[id]/List?_include=List:patient&_include=List:source&_include:iterate=List:item&_count=1&_sort=-date&code=http://loinc.org|11450-4`
* **Alle Summary-Listenversionen** der Summary-Einträge (Procedures) mit dem Suchparameter Patient abrufen: `GET [base]/Patient/[id]/List?_include=List:patient&_include=List:source&_include:iterate=List:item&_sort=-date&code=http://loinc.org|47519-4`  

### Summary-Liste und zugehörige Ressourcen abrufen (List-Read)
> Sub:UC_01_02  
<br> 

List Read dient dem **Abruf der Summary-Liste und der Vorbereitung einer nachfolgenden Änderung**.


#### Ablauf

1. Der GDA führt einen **POST $list-read** aus. 
2. Die Fachanwendung **prüft auf Existenz** der Summary-Liste/n.
3. Ist keine Summary-Liste vorhanden, wird dieser erstellt und eine leere Summary-Liste mit dem emptyReason notstarted wird zurückgeliefert. 
4. Existiert bereits eine Summary-Liste, stellt die Fachanwendung ein Search-Bundle einschließlich aller referenzierten Ressourcen zur Auslieferung bereit. 
* Falls der vorherige GDA neue Summary-Einträge hinzugefügt hat (List.entry.flag hat den Wert **new**), werden diese auf **unchanged** gesetzt.<br>
* Falls der vorherige GDA Summary-Einträge beendet hat (deren List.entry.flag haben den Wert **removed**), werden diese Einträge aus der Liste **entfernt**, siehe [Workflowmanagement](workflowmanagement.html#auswirkung-derzugriffsart-auf-list-entry-flag).<br>
* Falls der vorherige GDA **alle vorhandenen Summary-Einträge** mit removed gekennzeichnet hat, wird List.emptyReason mit *nilknown* zurückgeliefert, um nachfolgenden GDA zu signalisieren, dass die Person zum Zeitpunkt des letzten Schreibens keine Einträge hatte.<br>
5. Die Fachanwendung liefert an den GDA die Summary-Liste inkl. ETag für [Optimistic Locking](https://hl7.org/fhir/http.html#concurrency) und alle referenzierten Ressourcen.
6. Die zurückgelieferte Summary-Liste bildet die Grundlage für nachfolgende Änderungsoperationen.

#### Sequenzdiagramm 
<br>
<div>{% include_relative plantuml/read.svg %}</div>
<br> 



## Interaktionen auf Einzelressourcen

### Einträge als Einzelressource abrufen 
> Sub:UC_01_03 
<br> 

Read ermöglicht den lesenden Zugriff auf alle Einträge von Diagnosen, Prozeduren sowie Allergien und Intoleranzen eines Patienten jeweils als Gesamtansicht, siehe Abbildung. 

[![diagram](ediag_kategorie.png){: style="width: 60%"}](ediag_kategorie.png)

Die Interaktion liefert standardmäßig die letzten 30 Einträge, absteigend nach Datum sortiert zurück. Die Fachanwendung stellt die vorhandenen Ressourcen des gewählten Ressourcentyps als Search-Bundle bereit. Der Zugriff erfolgt ausschließlich lesend; Änderungen an Status, Inhalten oder Listenzuordnungen werden durch diese Interaktion nicht durchgeführt.

#### Ablauf

1. Der GDA oder ELGA-Teilnehmer wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA oder ELGA-Teilnehmer führt ein **GET** auf /Patient/[id]/Condition/, /Patient/[id]/Procedure/ und/oder /Patient/[id]/AllergyIntolerance/ aus, siehe [Transaktionen](transaction.html#Transaktionen).
3. **Optional** kann der Abfrageparameter **_count** angegeben werden um die Treffermenge einzustellen. Standarmäßig werden die letzten 30 Einträge, absteigend nach Datum sortiert zurück gegebenen.  
4. Die Fachanwendung liefert ein Search-Bundle mit den gefundenen Einträgen zurück.
5. Sind keine Ressourcen vorhanden bzw. entsprechen keine Ressourcen den Suchkriterien, wird ein Search-Bundle ohne Einträge zurückgeliefert.

