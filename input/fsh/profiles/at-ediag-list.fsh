Profile: AtEdiagList
Parent: List
Id: at-ediag-list
Title: "AT e-Diagnose List"
Description: "Das AT e-Diagnose List-Profil leitet sich von der FHIR-Ressource List ab und dient der strukturierten Listung von Dauerdiagnosen gemäß der ärztlichen Priorisierung."
* ^status = #active
* . ^short = "AT e-Diagnose List"

* identifier 0..1 MS
* identifier ^short = "Logischer Identfier der Liste."

// 
* status 1..1 MS
//* status = #current  
* status ^short = "Verpflichtende Angabe: current | retired | entered-in-error. https://hl7.org/fhir/R4/valueset-list-status.html"

// ist immer ein working-mode, weil sie immer im Bearbeitungsmode ist
* mode 1..1 MS
//* mode = #working
* mode ^short = "Verpflichtende Angabe: working | snapshot | changes. https://hl7.org/fhir/R4/valueset-list-mode.html
Die Listen im Rahmen von e-Diagnose werden laufend gepflegt - Vorschlag: working"

// 
* title 0..0
* title ^short = "Titel der Liste. Verwendung zu prüfen."

// 
* code 1..1 MS
* code ^short = "TODO: Code, der den Typ der Liste beschreibt. Zu prüfen, welche Codes für die e-Diagnose Listen in Frage kämen."
* code from ElgaListCodeVS (required)


* subject 1..1 MS
* subject only Reference(AtApsPatient)
* subject ^short = "Patient, für den die Liste erstellt werden soll, der über den 
Zentralen Patientenindex identifizierbar und Teilnehmer von ELGA e-Diagnose ist."

// 
* encounter 0..0
* encounter ^short = "Verwendung zu prüfen."

// 
* date 1..1 MS
* date ^short = "Letzte Aktualisierung der Liste."

// Arzt oder Ärztin die mit der writeoperation auf der liste geschrieben hat. Patient kann nur Einträge löschen
// über Device nachdenken, ob?
* source 1..1 MS
//* source only Reference(HL7ATCorePractitioner or HL7ATCorePractitionerRole or Device or HL7ATCorePatient)
* source ^short = "Arzt oder Ärztin, die die Liste erstellt und für den Inhalt verantwortlich ist. 
Eindeutig identifiziert über den GDA-Index und berechtigt auf die ELGA e-Diagnose 
des Patienten zuzugreifen. Device nur für initiale Erstellung durch die Fachanwendung. Patient nur zur Änderung der Reihenfolge der Einträge oder nachdem er Einträge gelöscht hat."

// eine Reihung muss immer mitgegeben werden. Wir geben die Vorgabe weg per USER
* orderedBy 1..1 MS
* orderedBy from http://hl7.org/fhir/ValueSet/list-order 
//* orderedBy = #user
* orderedBy ^short = "Die Reihenfolge der Einträge ist fachlich relevant und wird durch den Ersteller vorgegeben. 
Mögliche Codes: user | system | event-date | entry-date| priority | alphabetic | category | patient (TODO: nur user oder andere Reihenfolge ermöglichen?)"

// note: Mögliches Kommentar auf Ebene der Liste
* note 0..0 MS
* note ^short = "Freitextliche Anmerkungen zur Liste. TODO: prüfen, ob fachlich sinnvoll."

// --- Entries ---
* entry 0..* MS

// new, unchanged, changed oder removed kann angegeben werden. 
* entry.flag 1..1 MS
* entry.flag from ElgaListEntryFlagVS (required)
* entry.flag ^short = "Kennzeichnet die Art der Änderung des Eintrags"

// wird durch removed gelöst
* entry.deleted 0..0 
* entry.deleted ^short = "Gibt an, ob der referenzierte Eintrag zur Entfernung markiert wurde. Unklar, ob Löschen so abgebildet werden soll oder einfach der Eintrag nicht mehr enthalten ist."

// duplikat zu date oben - Andrea kurzschließen, ob wir was übersehen, da emed drinnen
* entry.date 0..0
* entry.date ^short = "Datum der Aufnahme des Eintrags. Fachlich zu klären."

// müssen wir uns noch fachlich anschauen, ob es 5 Profile sind---
* entry.item 1..1 MS
//* entry.item only Reference(AtEmedMRPlaneintrag)
* entry.item ^short = "Referenz auf einen Eintrag. Zu klären: reicht ein List-Profil oder braucht es jeweils eines für die integren Listen, die Gesamtliste, Liste für Allergien, Alerts?"

// es gibt nur 2 Gründe, fraglich wenn der Bürger die letzten 3 Versionen löscht, bin ich dann wieder notstarted (gesund) 
* emptyReason 0..1 MS
* emptyReason from ElgaListEmptyReasonVS (required)
* emptyReason ^short = "Begründung, warum der Medikationsplan leer ist. Mögliche Ausprägungen: [notstarted |  nilknown] Bedeutung: notstarted: Intitalzustand - noch nie befüllt | nilknown: Für Patient gibt es zurzeit keine Einträge"