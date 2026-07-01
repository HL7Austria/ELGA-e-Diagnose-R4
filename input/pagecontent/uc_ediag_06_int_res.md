{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, fachliche Bearbeitung, Korrektur, Stornierung und Löschung dieser Ressourcen
<!-- Interaktionen mit fachlichen Einzelressourcen  -->
### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
Mittels POST und meta.tag = notrelevant
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_11.svg %}</div>


### Diagnosen, Prozeduren sowie Allergien und Intoleranzen bearbeiten
Kein update - nur STORNO
#### Ablauf

### Diagnosen, Prozeduren sowie Allergien und Intoleranzen löschen
Kein delete - nur STORNO

### Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in ausblenden (ToDo: fachliche Entscheidung) 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?