Profile: AtEdiagList
Parent: List
Id: at-elga-ediag-list
Title: "AT ELGA e-Diagnose List"
Description: "Das AT e-Diagnose List-Profil dient der strukturierten Listung von Einträgen."

* ^status = #active
* . ^short = "AT e-Diagnose List"

* obeys list-integrity
* obeys list-emptyreason-required

* identifier 0..0
* identifier ^short = "Kein logischer Identifier für die Liste erforderlich."

* status 1..1 MS
* status = #current (exactly)
* status ^short = "Status des Liste."

* mode 1..1 MS
* mode = #working (exactly)
* mode ^short = "Die Liste wird laufend gepflegt, hat daher den fixen Wert: working."

* title 0..0
* title ^short = "Die Liste hat keinen Titel."

* code 1..1 MS
* code from AtEdiagListCodeVS (required)
* code ^short = "Code, der den Typ der Liste beschreibt."

* subject 1..1 MS
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Patient, für den die Liste geführt wird, der über den 
Zentralen Patientenindex identifizierbar und Teilnehmer der e-Diagnose ist."

* encounter 0..0
* encounter ^short = "Es wird kein Behandlungskontext dokumentiert."

* date 1..1 MS
* date ^short = "Datum der letzten Aktualisierung der Liste."

* source 1..1 MS
* source only Reference(HL7ATCorePractitioner or AtElgaCorePractitionerRole or HL7ATCorePatient)
* source ^short = "Person, die die Liste erstellt hat und für den Inhalt verantwortlich ist. Im Falle eines GDA: eindeutig identifiziert über den GDA-Index und berechtigt auf die ELGA-Anwendung 
des Patienten zuzugreifen. Im Falle eines Patienten: eindeutig identifiziert durch den Z-PI."

* orderedBy 0..0
* orderedBy ^short = "Die Reihenfolge der Einträge wird über die List.entries durch den Ersteller vorgegeben."

* note 0..0 
* note ^short = "Keine Freitext-Anmerkungen auf Listenebene."

// --- Entries ---
* entry 0..* MS
* entry ^short = "Die Reihenfolge der Listeneinträge kann in die Fachanwendung zurückgeschrieben werden. Gleichzeitig kann die Sortierung in lokalen Systemen erfolgen."

* entry.flag 0..0
* entry.flag ^short = "Kennzeichnung des Status entsprechend Workflow nicht relevant."

* entry.deleted 0..0 
* entry.deleted ^short = "Kennzeichnung, dass der Eintrag gelöscht wurde, ist nicht erlaubt (siehe Invariant lst-2)."

* entry.date 0..0
* entry.date ^short = "Datum der Aufnahme des Eintrags in die Liste wird nicht dokumentiert, da die Liste laufend gepflegt wird und das Datum der letzten Aktualisierung der Liste (List.date) dokumentiert wird."

* entry.item 1..1 MS
* entry.item ^short = "Referenz auf einen Eintrag."
* entry.item only Reference(AtEdiagCondition or AtEdiagProcedure or AtEdiagAllergyIntolerance)
* entry.item.reference 1..1

* emptyReason 0..1 MS
* emptyReason from ElgaListEmptyReasonVS (required)
* emptyReason ^short = "Begründung, warum die Summary-Liste leer ist."

Invariant: list-integrity
Description: "Die Liste darf nur Referenzen (List.entry.item) enthalten, die dem Code der Liste (List.code) entsprechen."
Severity: #error
Expression: "(code.coding.exists(system='http://loinc.org' and code='11450-4') implies entry.item.all(reference.matches('(^|/)Condition/'))) and (code.coding.exists(system='http://loinc.org' and code='47519-4') implies entry.item.all(reference.matches('(^|/)Procedure/'))) and (code.coding.exists(system='http://loinc.org' and code='48765-2') implies entry.item.all(reference.matches('(^|/)AllergyIntolerance/')))"

Invariant: list-emptyreason-required
Description: "Begründung für leere Liste ist erforderlich."
Severity: #error
Expression: "entry.empty() implies emptyReason.exists()"