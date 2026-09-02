Instance: DiagnoseEnteredInErrorExample
InstanceOf: AtEdiagCondition
Title: "Beispiel stornierte Diagnose"
Description: "Beispielinstanz einer stornierten Diagnose"
Usage: #example

* extension[AtReported].valueBoolean = false
* extension[AtElgaEdiagExtEnteredInError].extension[practitioner].valueReference = Reference(PractitionerExample)
* extension[AtElgaEdiagExtEnteredInError].extension[datetime].valueDateTime = "2026-09-02"
* extension[AtElgaEdiagExtEnteredInError].extension[reason].valueString = "Fehlerhafte Eingabe"

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #40930008
* code.coding[snomed].display = "Hypothyroidism"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-01T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Schilddrüsenerkrankung seit 2024, aktuell gut eingestellt."