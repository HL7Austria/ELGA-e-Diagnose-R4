Instance: ConditionList03
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Zweiter Arztbesuch - korrigiert)"
Description: "Beispiel einer Summary-Liste nachdem ein Eintrag storniert wurde."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-09T10:00:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionSummaryExample1)
* entry[1].item = Reference(ConditionSummaryExample2)
