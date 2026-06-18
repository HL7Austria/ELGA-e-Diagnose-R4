Instance: DiagnoseNotCurrentlyRelevantExample
InstanceOf: AtEdiagCondition
Title: "Beispiel Diagnose not currently relevant"
Description: "Beispielinstanz einer Diagnose - not currently relevant"
Usage: #example

* meta.tag[diagnosisType] = AtEdiagDiagnosisType#notrelevant "not currently relevant"

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #719590007

* code.coding[snomed].display = "Saisonale Grippe"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-01T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Gliederschmerzen"