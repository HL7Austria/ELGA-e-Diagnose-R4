Instance: ListExample
InstanceOf: AtEdiagList
Title: "Beispiel einer leeren e-Diagnose-Liste"
Description: "Initiale e-Diagnose-Liste ohne Diagnosen, Prozeduren Allergien oder Alerts."
Usage: #example

* identifier.value = "123"
* status = #current
* mode = #working
* code = $cs-sct#736378000
* subject = Reference(PatientExample)
* date = "2026-03-01T08:00:00+00:00"
* source = Reference(PractitionerExample)
* emptyReason = $cs-list-empty-reason#notstarted