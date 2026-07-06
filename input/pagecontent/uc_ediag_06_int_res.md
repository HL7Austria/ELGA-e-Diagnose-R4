{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, das Abrufen und die Stornierung dieser Ressourcen. Bestehende Ressourcen werden weder bearbeitet noch gelöscht; fachliche Änderungen erfolgen durch das Anlegen neuer Ressourcen.
<!-- Interaktionen mit fachlichen Einzelressourcen  -->
### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
Mittels POST und meta.tag = notrelevant
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Ablauf

<div>{% include_relative plantuml/diagram_uc_06_10.svg %}</div>

### Diagnosen, Prozeduren sowie Allergien und Intoleranzen lesen
ToDo: Klären, ob hier oder in einen eigenen UC-lesen, weil hier schreiben ist? 



### Diagnosen, Prozeduren sowie Allergien und Intoleranzen löschen


### Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in ausblenden (löschen) 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?