{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, das Abrufen und die Stornierung dieser Ressourcen. Bestehende Ressourcen werden weder bearbeitet noch gelöscht; fachliche Änderungen erfolgen durch das Anlegen neuer Ressourcen.

ToDo: Lesen - Standardoperation plan.read - get.search mit suchparameter? Wir brauchen einen Standardfall lesen und ich habe den Fall dass ich einen tiefgang machen möchte und diese lesen will. 
Lesen der Gesamtliste
Lesen/Suchen nach bestimmten Diagnosen

###  Read der Gesamtliste

### Read/Search bestimmte Ressourcen (Diagnosen)

### Sub_UC_eDiag_06_07 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer löschen 

Der ELGA-Teilnehmer kann via ELGA-Portal einzelne oder alle Diagnosen unwiderruflich löschen. Dabei ist es irrelevant, ob eine zu löschende Diagnose als relevant gekennzeichnet ist oder nicht. Die Inhalte der zu löschenden Diagnose werden durch die Fachanwendung entfernt und die Diagnose als "gelöscht" markiert.

Sollte die Diagnose als relevant gekennzeichnet gewesen sein, kann nur ein GDA diese aus der Liste der relevanten Einträge entfernen (siehe [Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen](uc_ediag_06_int_list.md#sub_uc_ediag_06_05---einträge-aus-einer-liste-entfernen)).

#### Ablauf

- Um einen Eintrag zu löschen, führt der ELGA-Teilnehmer über das Portal ein `$list-read` oder ein `GET` auf die Gesamtmenge der Diagnosen aus und markiert die zu löschenden Einträge.
- Durch Bestätigung wird die `$delete`-Operation ausgeführt.
- Die Fachanwendung bearbeitet die zu löschende Diagnose folgendermaßen:
  -  Alle optionalen Felder `0..` werden geleert.
  -  Alle verpflichtenden Felder `1..` werden
     -  mit der [data-absent-reason-Extension](http://hl7.org/fhir/StructureDefinition/data-absent-reason) und dem Wert `unknown` versehen
     -  im Fall von den folgenden codierten Elementen mit `required` Bindings auf folgende Werte gesetzt
        -  `AllergyIntolerance.clinicalStatus = inactive`
        -  `AllergyIntolerance.verificationStatus = unconfirmed`
        -  `Condition.clinicalStatus = inactive`
        -  `Condition.verificationStatus = unconfirmed`
        -  `Procedure.status = completed`

[![overview](patient_delete.drawio.svg){: style="width: 60%"}](patient_delete.drawio.svg)

### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
Mittels POST und meta.tag = notrelevant
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Ablauf

<div>{% include_relative plantuml/diagram_uc_06_10.svg %}</div>


### Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in löschen


