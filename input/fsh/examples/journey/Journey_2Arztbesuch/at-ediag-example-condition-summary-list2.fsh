Instance: ListConditionExample2
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Zweiter Arztbesuch - fehlerhafter Eintrag)"
Description: "Beispiel einer Summary-Liste während des zweiten Arztbesuchs. Eine neue Diagnose wurde erfasst.Zusätzlich ist ein Eintrag enthalten, der irrtümlich erfasst wurde."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-09T08:00:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionSummaryExample1)
* entry[1].item = Reference(ConditionSummaryExample2)
* entry[2].item = Reference(ConditionSummaryExample3)