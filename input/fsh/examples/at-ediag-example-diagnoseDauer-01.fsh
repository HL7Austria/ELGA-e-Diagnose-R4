Instance: DiabetesDiagnoseDauer
InstanceOf: AtEdiagCondition
Title: "Beispiel Dauerdiagnose Diabetes mellitus Typ 2"
Description: "Beispielinstanz einer Dauerdiagnose nach AT e-Diagnose Condition-Profil."

* meta.tag[0].system = "http://example.org/fhir/CodeSystem/ATDiagType"
* meta.tag[0].code = #chronic
* meta.tag[0].display = "Dauerdiagnose"

* subject = Reference(PatientExample)
* asserter = Reference(PractitionerExample)
* recorder = Reference(PractitionerExample)

* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #44054006
* code.coding[0].display = "Diabetes mellitus Typ 2"

* clinicalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"

* verificationStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* verificationStatus.coding[0].code = #confirmed
* verificationStatus.coding[0].display = "Confirmed"

* onsetDateTime = 2015-01-15T08:00:00Z

* recordedDate = 2026-02-24T10:00:00Z

* note[0].text = "Patient seit Jahren bekannt mit Diabetes mellitus Typ 2, aktuell stabil unter Therapie."