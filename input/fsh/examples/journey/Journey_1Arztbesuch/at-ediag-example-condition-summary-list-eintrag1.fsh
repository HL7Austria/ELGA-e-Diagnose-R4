Instance: ConditionSummaryExample1
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Summary-Liste"
Description: "Beispiel einer dauerhaften Diagnose"
Usage: #example

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #38341003
* code.coding[snomed].display = "Hypertensive disorder, systemic arterial"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Hypertonie seit 2024, Lisinopril 10mg 1-0-0."