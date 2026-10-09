Instance: ConditionEntry01
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Summary-Liste"
Description: "Beispiel einer dauerhaften Diagnose"
Usage: #example

* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1234"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#38341003 "Hypertensive disorder, systemic arterial"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PatientExample)

* onsetDateTime = "2022-06-01"

* note.text = "Patient berichtet über bekannte Hypertonie seit 2022, Lisinopril 10mg 1-0-0."