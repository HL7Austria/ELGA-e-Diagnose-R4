Instance: ListExample01
InstanceOf: AtEdiagList
Title: "Beispiel einer leeren Summary-Liste für Conditions"
Description: "Initiale Summary-Liste ohne Summary-Einträge (Condition)."
Usage: #example

* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#11450-4
* subject = Reference(PatientExample)
* date = "2026-03-03T08:00:00+00:00"
* source = Reference(DeviceExample)
* emptyReason = $cs-list-empty-reason#notstarted "notstarted"