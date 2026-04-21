Instance: DiagnoseExample
InstanceOf: AtEdiagCondition
Title: "Beispiel Diagnose"
Description: "Beispielinstanz einer Diagnose"
Usage: #example

* meta.profile = "http://example.org/fhir/StructureDefinition/at-ediag-condition"

* meta.tag[diagnosisType] = http://example.org/fhir/CodeSystem/at-ediag-diagnose-type#relevant "currently relevant"

* extension[AtReported].valueBoolean = true

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #44054006
* code.coding[snomed].display = "Diabetes mellitus type 2"

* subject = Reference(PatientExample)

* recordedDate = "2026-04-20T10:15:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Stoffwechselerkrankung seit 2024, aktuell gut eingestellt."