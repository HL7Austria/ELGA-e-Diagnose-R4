{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, das Abrufen und die Stornierung dieser Ressourcen. Bestehende Ressourcen werden weder bearbeitet noch gelöscht; fachliche Änderungen erfolgen durch das Anlegen neuer Ressourcen.

###  Interaktionen mit fachlichen Einzelressourcen
ToDo: Lesen - Standardoperation plan.read - get.search mit suchparameter? Wir brauchen einen Standardfall lesen und ich habe den Fall dass ich einen tiefgang machen möchte und diese lesen will. 
Lesen der Gesamtliste
Lesen/Suchen nach bestimmten Diagnosen

### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
Mittels POST und meta.tag = notrelevant
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Ablauf

<div>{% include_relative plantuml/diagram_uc_06_10.svg %}</div>


### Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in löschen


