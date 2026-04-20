Profile: AtEdiagList
Parent: List
Id: at-ediag-list
Title: "AT e-Diagnose List"
Description: "Das AT e-Diagnose List-Profil leitet sich von der FHIR-Ressource List ab und dient der strukturierten Listung von Dauerdiagnosen gemäß der ärztlichen Priorisierung."
* ^status = #active
* . ^short = "AT e-Diagnose List"

* identifier 0..1 MS
* identifier ^short = "Logischer Identfier der Liste."

* status 1..1 MS
//* status = #current  
* status ^short = "Verpflichtende Angabe: current | retired | entered-in-error. https://hl7.org/fhir/R4/valueset-list-status.html"

* mode 1..1 MS
//* mode = #working
* mode ^short = "Verpflichtende Angabe: working | snapshot | changes. https://hl7.org/fhir/R4/valueset-list-mode.html
Die Listen im Rahmen von e-Diagnose werden laufend gepflegt - Vorschlag: working"

* title 0..0
* title ^short = "Titel der Liste. Verwendung zu prüfen."

* code 1..1 MS
* code ^short = "Code, der den Typ der Liste beschreibt. https://hl7.org/fhir/R4/valueset-list-example-codes.html. Zu prüfen, welche Codes für die e-Diagnose Listen in Frage kämen. 37341000000109 (Alert), 722446000 (Allergy), 404684003 (Clinical Finding), 71388002 (Procedure) oder LOINC-Codes (z.B. von IPS)"
* code = $cs-sct#736378000 "Medikationsplan"

* subject 1..1 MS
//* subject only Reference(HL7ATCorePatient)
* subject ^short = "Patient, für den der Medikationsplan erstellt werden soll, der über den 
Zentralen Patientenindex identifizierbar und Teilnehmer von ELGA e-Medikation ist."

* encounter 0..0
* encounter ^short = "Verwendung zu prüfen."

* date 1..1 MS
* date ^short = "Letzte Aktualisierung des Medikationsplans."

* source 1..1 MS
//* source only Reference(HL7ATCorePractitioner or HL7ATCorePractitionerRole or Device or HL7ATCorePatient)
* source ^short = "Arzt oder Ärztin, die den Medikationsplans erstellt und für den Inhalt verantwortlich ist. 
Eindeutig identifiziert über den GDA-Index und berechtigt auf die ELGA e-Medikation 
des Patienten zuzugreifen. Device nur für initiale Erstellung durch die Fachanwendung. Patient nur zur Änderung der Reihenfolge der Planeinträge oder nachdem er Einträge gelöscht hat."

* orderedBy 1..1 MS
* orderedBy from http://hl7.org/fhir/ValueSet/list-order 
* orderedBy = #user
* orderedBy ^short = "Die Reihenfolge der Einträge im Medikationsplan ist fachlich relevant und wird durch den Ersteller vorgegeben. 
Mögliche Codes: user | system | event-date | entry-date| priority | alphabetic | category | patient (TODO: nur user oder andere Reihenfolge ermöglichen?)"

// note: Mögliches Kommentar auf Ebene des Medikationsplans
* note 0..* MS
* note ^short = "Freitextliche Anmerkungen zum Medikationsplan. TODO: prüfen, ob fachlich sinnvoll."

// --- Entries ---
* entry 0..* MS

* entry.flag 1..1 MS
* entry.flag from http://hl7.org/fhir/ValueSet/list-item-flag
* entry.flag ^short = "Kennzeichnet die Art der Änderung des Medikationsplaneintrags: zB Unchanged | Changed | Cancelled | Prescribed | Ceased | Suspended."

* entry.deleted 0..1 MS
* entry.deleted ^short = "Gibt an, ob der referenzierte Medikationsplaneintrag zur Entfernung markiert wurde. Unklar, ob Löschen so abgebildet werden soll oder einfach der Eintrag nicht mehr enthalten ist."

* entry.date 0..1 MS
* entry.date ^short = "Datum der Aufnahme des Medikationsplaneintrags. Fachlich zu klären."

* entry.item 1..1 MS
//* entry.item only Reference(AtEmedMRPlaneintrag)
* entry.item ^short = "Referenz auf einen Medikationsplaneintrag."

* emptyReason 0..1 MS
//* emptyReason from MedikationsplanEmptyReasonVS
* emptyReason ^short = "Begründung, warum der Medikationsplan leer ist: 
https://hl7.org/fhir/R4/valueset-list-empty-reason.html eingeschränkt auf: <vbr>
    - notstarted: Intitalzustand <br>
    - nilknown: Patient nimmt derzeit keine Medikamente ein"