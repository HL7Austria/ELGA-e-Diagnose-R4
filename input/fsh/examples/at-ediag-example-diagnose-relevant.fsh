Instance: DiagnoseCurrentlyRelevantExample
InstanceOf: AtEdiagCondition
Title: "Beispiel Diagnose currently relevant"
Description: "Beispielinstanz einer Diagnose - currently relevant"
Usage: #example

* meta.profile = "http://example.org/fhir/StructureDefinition/at-ediag-condition"

* meta.tag[diagnosisType] = https://fhir.hl7.at/elga/ediag/r4/CodeSystem/at-ediag-diagnose-type#relevant "currently relevant"

* extension[AtReported].valueBoolean = false

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #40930008
* code.coding[snomed].display = "Hypothyreose"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-01T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Stoffwechselerkrankung seit 2024, aktuell gut eingestellt."