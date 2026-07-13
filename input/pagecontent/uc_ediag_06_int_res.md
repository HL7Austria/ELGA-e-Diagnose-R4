{% include styleheader.md %}
Fachliche Einzelressourcen repräsentieren die medizinischen Inhalte der e-Diagnose. Hierzu zählen insbesondere Diagnosen (Condition), Prozeduren (Procedure) sowie Allergien und Intoleranzen (AllergyIntolerance). Die nachfolgenden Sub-Use-Cases beschreiben die Erfassung, das Abrufen und die Stornierung dieser Ressourcen. Bestehende Ressourcen werden weder bearbeitet noch gelöscht; fachliche Änderungen erfolgen durch das Anlegen neuer Ressourcen.

ToDo: Lesen - Standardoperation plan.read - get.search mit suchparameter? Wir brauchen einen Standardfall lesen und ich habe den Fall dass ich einen tiefgang machen möchte und diese lesen will. 
Lesen der Gesamtliste
Lesen/Suchen nach bestimmten Diagnosen

###  Read der Gesamtliste
Ein Read der Gesamtliste dient der Anzeige einer aggregierten Gesamtansicht aller Diagnosen. Die Fachanwendung stellt hierfür die vorhandenen List-Ressourcen einschließlich der referenzierten fachlichen Einzelressourcen bereit. Der Zugriff erfolgt ausschließlich lesend und ermöglicht keine Veränderung der List-Ressourcen oder der enthaltenen Einträge.

#### Ablauf

1. Der GDA fürht ein **GET** auf /Patient/[id]/List/ aus, siehe [Transaktionen](transaction.md#Transaktionen).
2. Die Fachanwendung ermittelt die vorhandene List-Ressource des Patienten.
3. Die in der List-Ressource referenzierte fachliche Einzelressource wird mittels `_include` und `_include:iterate` aufgelöst.
4. Die Fachanwendung liefert eine Gesamtansicht aller Diagnosen zurück.
5. Der ELGA-Teilnehmer oder GDA kann aus der Gesamtansicht einzelne Einträge für nachfolgende Operationen (z. B. $delete oder $storno) auswählen.


### Read/Search von Diagnosen, Prozeduren sowie Allergien und Intoleranzen
Read/Search ermöglicht die gezielte Suche und Anzeige von Patientendiagnosen, Prozeduren sowie Allergien und Intoleranzen. Die Fachanwendung greift ausschließlich lesend auf die gewählten Ressourcen zu; Änderungen an Status oder Inhalten sind nicht möglich. Die gefundenen Ressourcen können für nachfolgende Operationen (z. B. $delete oder $storno) ausgewählt werden.

#### Ablauf
1. Der GDA oder ELGA-Teilnehmer wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA oder ELGA-Teilnehmer führt ein **GET** auf /Patient/[id]/Condition/, /Patient/[id]/Procedure/ oder /Patient/[id]/AllergyIntolerance/ aus, siehe [Transaktionen](transaction.md#Transaktionen).
3. Optional können Suchparameter angegeben werden, um die Treffermenge einzuschränken.
4. Die Fachanwendung prüft, ob Ressourcen des gewählten Typs vorhanden sind.
5. Sind keine Ressourcen vorhanden, wird ein leeres Ergebnis zurückgeliefert. Sind Ressourcen vorhanden, werden die passenden Ressourcen als Searchset Bundle zurückgeliefert.


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
Der GDA erfasst neue Diagnosen, Prozeduren sowie Allergien und Intoleranzen über die e-Diagnose Fachanwendung.
ToDo: meta.tag = notrelevant - setzen?

#### Ablauf
1. Der GDA wählt den gewünschten Ressourcentyp (Condition, Procedure oder AllergyIntolerance) aus.
2. Der GDA erstellt eine neue Ressource und erfasst die erforderlichen fachlichen Informationen.
3. Der GDA führt ein **POST** auf
/Patient/[id]/Condition/,
/Patient/[id]/Procedure/ oder
/Patient/[id]/AllergyIntolerance/
aus und übermittelt die neue Ressource an die e-Diagnose Fachanwendung.
4. Die **Fachanwendung** validiert die übermittelte Ressource.
5. Ist die Validierung erfolgreich, wird die neue Ressource gespeichert und dem GDA eine erfolgreiche Erstellung mittels **HTTP 201 Created** bestätigt. Ist die Validierung nicht erfolgreich, wird die Ressource nicht gespeichert. Die Fachanwendung liefert ein **OperationOutcome** mit den aufgetretenen Validierungsfehlern zurück.

#### Sequenzdiagramm Eintrag erfassen
<div>{% include_relative plantuml/diagram_uc_06_09.svg %}</div>

### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
Der GDA kann einen oder mehrere Diagnosen aufgrund einer falschen Eingabe stornieren. Dabei ist es irrelevant, ob eine zu stornierende Diagnose als relevant gekennzeichnet ist oder nicht.

Sollte die Diagnose als relevant gekennzeichnet gewesen sein und will sie der GDA nach der Stornierung nicht mehr in der Liste der relevanten Einträge haben, muss die Diagnose aus der Liste der relevanten Einträge entfernt werden (siehe [Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen](uc_ediag_06_int_list.md#sub_uc_ediag_06_05---einträge-aus-einer-liste-entfernen)).

#### Ablauf

- Um einen Eintrag zu stornieren, führt der GDA ein `$list-read` oder ein `GET` auf die Gesamtmenge der Diagnosen aus und markiert die zu stornierenden Einträge.
- Durch Bestätigung wird die `$storno`-Operation ausgeführt.
- Die Fachanwendung bearbeitet die zu stornierende Diagnose folgendermaßen:
  -  `AllergyIntolerance.verificationStatus = entered-in-error`
  -  `Condition.verificationStatus = entered-in-error`
  -  `Procedure.status = entered-in-error`


