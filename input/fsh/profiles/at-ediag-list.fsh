Profile: AtEdiagList
Parent: AtElgaCoreList
Id: at-ediag-list
Title: "AT e-Diagnose List"
Description: "Das AT e-Diagnose List-Profil leitet sich von der FHIR-Ressource List ab und dient der strukturierten Listung von Dauerdiagnosen gemäß der ärztlichen Priorisierung."
* ^status = #active
* . ^short = "AT e-Diagnose List"

* identifier 1..1 MS
* identifier ^short = "Logischer Identfier der Liste zur Integritätsprüfung beim Schreibvorgang."

* status 1..1 MS
* status from ElgaListStatusVS (required)
* status ^short = "Status des Liste."

* mode 1..1 MS
* mode = #working (exactly)
* mode ^short = "Die Liste ist ein laufend gepflegtes Dokument. Fixer Wert: working."
* mode ^definition = """Für die Liste wird der Modus "working" verwendet, weil sie laufend gepflegt wird. Insofern gibt es keine abgeschlossenen Versionen der Liste."""

* title 0..0
* title ^short = "Titel der Liste"

* code 1..1 MS
* code from ElgaListCodeVS (required)
* code ^short = "Code, der den Typ der Liste beschreibt. TODO: es wird noch ein Code für die Kombiliste benötigt, weil nur ein Code angegeben werden kann."

* subject 1..1 MS
* subject only Reference(AtApsPatient)
* subject ^short = "Patient, für den die Liste erstellt werden soll, der über den Zentralen Patientenindex identifizierbar und Teilnehmer von ELGA e-Diagnose ist."

* encounter 0..0
* encounter ^short = "Patientenkontakt"

* date 1..1 MS
* date ^short = "Letzte Aktualisierung der Liste."

* source 1..1 MS
* source only Reference(AtApsPractitioner or AtApsPractitionerRole or AtApsDevice or AtApsPatient)
* source ^short = "Arzt oder Ärztin, die die Liste erstellt und für den Inhalt verantwortlich ist. Eindeutig identifiziert über den GDA-Index und berechtigt auf die ELGA e-Diagnose des Patienten zuzugreifen. Device nur für initiale Erstellung durch die Fachanwendung. Patient nur nachdem er Einträge gelöscht hat."

* orderedBy 0..0
* orderedBy ^short = "Die Reihenfolge der Einträge in der Liste."

* note 0..0 
* note ^short = "Freitextliche Anmerkungen zur Liste."

// --- Entries ---
* entry 0..* MS

// new, unchanged, changed oder removed kann angegeben werden. 
* entry.flag 1..1 MS
* entry.flag from ElgaListEntryFlagVS (required)
* entry.flag ^short = "Kennzeichnet die Art der Änderung des Eintrags"

* entry.deleted 0..0 
* entry.deleted ^short = "Gibt an, ob der referenzierte Eintrag zur Entfernung markiert wurde. Wird durch Flag 'removed' gelöst."

* entry.date 0..0
* entry.date ^short = "Datum der Aufnahme des Eintrags in die Liste."

// müssen wir uns noch fachlich anschauen, ob es 5 Profile sind---
* entry.item 1..1 MS
//* entry.item only Reference(AtEmedMRPlaneintrag)
* entry.item ^short = "Referenz auf einen Eintrag. Zu klären: reicht ein List-Profil oder braucht es jeweils eines für die integren Listen, die Gesamtliste, Liste für Allergien, Alerts?"

// es gibt nur 2 Gründe, fraglich wenn der Bürger die letzten 3 Versionen löscht, bin ich dann wieder notstarted (gesund) 
* emptyReason 0..1 MS
* emptyReason from ElgaListEmptyReasonVS (required)
* emptyReason ^short = "Begründung, warum der Medikationsplan leer ist. Mögliche Ausprägungen: [notstarted |  nilknown] Bedeutung: notstarted: Intitalzustand - noch nie befüllt | nilknown: Für Patient gibt es zurzeit keine Einträge"