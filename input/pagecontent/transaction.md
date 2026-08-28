{% include styleheader.md %}

<!-- Transaktionen -->

Im Folgenden werden standardisierte Interaktionen für den lesenden und schreibenden Zugriff auf die Diagnosenliste eines Patienten bzw. einer Patientin erläutert, die für alle technischen Use Cases relevant sind.

Für alle Transaktionen wird vorausgesetzt, dass entsprechend der [FHIR RESTful API](https://hl7.org/fhir/R4/http.html) ein `[base]` bekannt ist und für alle Interaktionen verwendet werden kann.

<div class="dragon" markdown="1">
Aktuell ist noch nicht geklärt, wie der Patientenkontext in den Transaktionen sichergestellt werden kann. Eine Möglichkeit bietet eventuell die Verwendung des [Patient Compartment](https://hl7.org/fhir/R4/compartmentdefinition-patient.html). Ein Aufruf würde in so einem Fall folgendermaßen aussehen:

```
VERB [base]/Patient/[id]/[type]
```

Nachdem die Umsetzung noch unklar ist, werden alle Requests ab dem `/[type]` dargestellt.
</div>

<div>{% include_relative plantuml/interaction_overview.svg %}</div>





