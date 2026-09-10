Instance: ConditionSummaryExample3

InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer stornierten Diagnose"
Description: "Beispiel einer Diagnose nach Durchführung der $entered-in-error-Operation durch einen GDA"
Usage: #example

* extension[AtReported].valueBoolean = true

* extension[entered-in-error].extension[practitioner].valueReference = Reference(PractitionerExample)
* extension[entered-in-error].extension[datetime].valueDateTime = "2026-03-09T10:30:00+01:00"
* extension[entered-in-error].extension[reason].valueString = "Diagnose irrtümlich erfasst"

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #34486009

* code.coding[snomed].display = "Hyperthyroidism"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-02-28"

