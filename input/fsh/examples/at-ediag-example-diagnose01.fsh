Instance: DiagnoseExample
InstanceOf: Condition
Title: "Beispiel Diagnose"
Description: "Beispielinstanz einer Diagnose"

* meta.profile = "http://example.org/fhir/StructureDefinition/at-ediag-condition"

* extension[AtReported].valueBoolean = false

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding = http://snomed.info/sct#44054006 "Diabetes mellitus type 2"

* subject = Reference(PatientExample)

* recordedDate = "2026-04-20T10:15:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Stoffwechselerkrankung seit 2024, aktuell gut eingestellt."