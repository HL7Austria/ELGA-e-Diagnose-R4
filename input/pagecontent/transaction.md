

<!-- Transaktionen -->

Im Folgenden werden standardisierte Interaktionen für den lesenden und schreibenden Zugriff auf die Summary-Listen eines Patienten erläutert, die für alle technischen Use Cases relevant sind.

Für alle Transaktionen wird vorausgesetzt, dass entsprechend der [FHIR RESTful API](https://hl7.org/fhir/R4/http.html) ein `[base]` bekannt ist und für alle Interaktionen verwendet werden kann.

<div class="note-to-balloters" markdown="1">
Die Umsetzung des Patientenkontakts in den Transaktionen ist nicht Teil des Ballots. Der konkrete Zugriff wird in der Lösungsarchitektur beschrieben. 

In diesem IG werden daher alle Requests ab dem `/[type]` dargestellt.
</div>

<div>{% include_relative plantuml/interaction_overview.svg %}</div>





