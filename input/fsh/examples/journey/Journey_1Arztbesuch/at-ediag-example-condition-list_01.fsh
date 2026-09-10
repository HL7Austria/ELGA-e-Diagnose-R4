Instance: ConditionList01
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Erster Arztbesuch)"
Description: "Beispiel der Condition-Summary-Liste nach dem ersten Arztbesuch."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(Patient)

* date = "2026-03-03T00:00:00+00:00"

* source = Reference(Practitioner)

* entry[0].item = Reference(ConditionEntry01)