Instance: ProcedureListEmpty
InstanceOf: AtEdiagList
Title: "Procedure-Summary-Liste (notstarted)"
Description: "Initiale Summary-Liste ohne Summary-Einträge (Procedure)."
Usage: #example

* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#47519-4
* subject = Reference(PatientExample)
* date = "2026-03-03T08:00:00+00:00"
* source = Reference(DeviceExample)
* emptyReason = $cs-list-empty-reason#notstarted "Not Started"