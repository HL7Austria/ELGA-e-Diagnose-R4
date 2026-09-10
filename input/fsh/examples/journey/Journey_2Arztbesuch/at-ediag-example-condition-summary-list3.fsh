Instance: ListConditionExample3
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste mit 2 Summary-Einträgen"
Description: "Beispiel einer Summary-Liste mit 2 Einträgen."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-01T00:00:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionSummaryExample1)
* entry[1].item = Reference(ConditionSummaryExample2)
