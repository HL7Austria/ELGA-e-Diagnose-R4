Instance: ConditionEntry03EnteredInError
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer stornierten Diagnose"
Description: "Beispiel einer Diagnose nach Durchführung der $entered-in-error-Operation durch einen GDA"
Usage: #example

* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1236"

* extension[entered-in-error].extension[practitioner].valueReference = Reference(PractitionerExample)
* extension[entered-in-error].extension[datetime].valueDateTime = "2026-03-09T10:30:00+01:00"
* extension[entered-in-error].extension[reason].valueString = "Falscher Code ausgewählt"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#34486009 "Hyperthyroidism"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2010-01-01"

* note.text = "Seit 2010"
