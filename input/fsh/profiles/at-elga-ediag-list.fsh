Profile: AtEdiagList
Parent: List
Id: at-elga-ediag-list
Title: "AT ELGA e-Diagnose Summary-Liste"
Description: "Dieses List-Profil passt die List-Resource für die Anforderungen der e-Diagnose an."

* ^status = #active
* . ^short = "AT e-Diagnose List"

* obeys list-integrity
* obeys list-emptyreason-required

* implicitRules 0..0

* modifierExtension 0..0

* identifier 0..0
* identifier ^short = "Es gibt keinen logischen Identifier für die Summary-Liste."

* status 1..1 MS
* status = #current (exactly)
* status ^short = "Status der Liste."

* mode 1..1 MS
* mode = #working (exactly)
* mode ^short = "Die Liste wird laufend gepflegt und hat daher den festen Wert: working."

* title 0..0
* title ^short = "Die Liste hat keinen Titel."

* code 1..1 MS
* code from AtEdiagListCodeVS (required)
* code ^short = "Code, der den Typ der Liste beschreibt."

* subject 1..1 MS
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Patient, für den die Summary-Liste geführt wird."

* encounter 0..0
* encounter ^short = "In e-Diagnose werden keine Behandlungskontakte dokumentiert."

* date 1..1 MS
* date ^short = "Datum der letzten Aktualisierung der Summary-Liste."

* source 1..1 MS
* source only Reference(HL7ATCorePractitioner or HL7ATCorePractitionerRole or HL7ATCorePatient or Device)
* source ^short = "Person, die die Summary-Liste erstellt hat und für den Inhalt verantwortlich ist. Für die Fälle, in denen die e-Diagnose-Fachanwendung die Summary-Liste aktualisiert, ist ein Device zu referenzieren."

* orderedBy 0..0
* orderedBy ^short = "Die Reihenfolge der Einträge wird über die List.entries durch den Ersteller vorgegeben."

* note 0..0 
* note ^short = "Keine Freitext-Anmerkungen auf Listenebene."

// --- Entries ---
* entry 0..* MS
* entry ^short = "Die Reihenfolge der Listeneinträge kann in die Fachanwendung zurückgeschrieben werden. Gleichzeitig kann die Sortierung in lokalen Systemen erfolgen."

* entry.flag 0..0
* entry.flag ^short = "Kennzeichnung des Status entsprechend eines Workflows ist für die e-Diagnose nicht relevant."

* entry.deleted 0..0 
* entry.deleted ^short = "Eine Kennzeichnung des Eintrags als gelöscht ist nicht zulässig."

* entry.date 0..0
* entry.date ^short = "Das Datum der Aufnahme des Eintrags in die Summary-Liste wird nicht dokumentiert, da die Liste laufend gepflegt wird. Dokumentiert wird das Datum der letzten Aktualisierung der Summary-Liste (List.date)."

* entry.item 1..1 MS
* entry.item ^short = "Referenz auf einen Eintrag."
* entry.item only Reference(AtEdiagCondition or AtEdiagProcedure or AtEdiagAllergyIntolerance)
* entry.item.reference 1..1

* emptyReason 0..1 MS
* emptyReason from AtEdiagListEmptyReasonVS (required)
* emptyReason ^short = "Begründung, warum die Summary-Liste leer ist."

Invariant: list-integrity
Description: "Die Liste darf nur Referenzen (List.entry.item) enthalten, die dem Code der Liste (List.code) entsprechen."
Severity: #error
Expression: "(code.coding.exists(system='http://loinc.org' and code='11450-4') implies entry.item.all(reference.matches('(^|/)Condition/'))) and (code.coding.exists(system='http://loinc.org' and code='47519-4') implies entry.item.all(reference.matches('(^|/)Procedure/'))) and (code.coding.exists(system='http://loinc.org' and code='48765-2') implies entry.item.all(reference.matches('(^|/)AllergyIntolerance/')))"

Invariant: list-emptyreason-required
Description: "Begründung für leere Liste ist erforderlich."
Severity: #error
Expression: "entry.empty() implies emptyReason.exists()"