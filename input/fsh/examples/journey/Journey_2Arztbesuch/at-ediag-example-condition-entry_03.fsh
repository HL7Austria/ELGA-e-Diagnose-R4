Instance: ConditionEntry03
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Summary"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1236"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#34486009 "Hyperthyroidism"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2010-01-01"

* note.text = "Seit 2010"
