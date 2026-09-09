Instance: ConditionGesamtlisteExample4
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Summary"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #34000006

* code.coding[snomed].display = "Crohn's disease"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2010-01-01"

* note.text = "Seit 2010"