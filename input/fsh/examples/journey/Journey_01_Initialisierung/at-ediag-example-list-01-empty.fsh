Instance: ListExample01
InstanceOf: AtEdiagList
Title: "Beispiel einer leeren e-Diagnose-Liste"
Description: "Initiale e-Diagnose-Liste ohne Diagnosen, Prozeduren oder Allergien."
Usage: #example

* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#11450-4
* subject = Reference(PatientExample)
* date = "2026-03-01T08:00:00+00:00"
* source = Reference(PractitionerExample)
* emptyReason = $cs-list-empty-reason#notstarted