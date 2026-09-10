Instance: AllergyListEmpty
InstanceOf: AtEdiagList
Title: "Allergy-Summary-Liste (notstarted)"
Description: "Initiale Summary-Liste ohne Summary-Einträge (Allergy)."
Usage: #example

* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#48765-2
* subject = Reference(Patient)
* date = "2026-03-03T08:00:00+00:00"
* source = Reference(Device)
* emptyReason = $cs-list-empty-reason#notstarted "Not Started"