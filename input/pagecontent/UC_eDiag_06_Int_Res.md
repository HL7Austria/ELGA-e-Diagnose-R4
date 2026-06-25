{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, fachliche Bearbeitung, Korrektur, Stornierung und Löschung dieser Ressourcen
<!-- Interaktionen mit fachlichen Einzelressourcen  -->
### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen bearbeiten
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_10.svg %}</div>

### Sub_UC_eDiag_06_11 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_11.svg %}</div>

### Sub_UC_eDiag_06_12 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen löschen
ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt

### Sub_UC_eDiag_06_13 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in ausblenden (ToDo: fachliche Entscheidung) 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?