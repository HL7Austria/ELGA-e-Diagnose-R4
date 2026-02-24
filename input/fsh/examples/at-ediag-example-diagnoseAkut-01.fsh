Instance: GrippeDiagnoseAkut
InstanceOf: AtEdiagCondition
Title: "Beispiel Akutdiagnose Grippe"
Description: "Beispielinstanz einer akuten Grippe-Diagnose nach AT e-Diagnose Condition-Profil."

* meta.tag[0].system = "http://example.org/fhir/CodeSystem/ATDiagType"
* meta.tag[0].code = #acute
* meta.tag[0].display = "Akutdiagnose"


* subject = Reference(PatientExample)
* asserter = Reference(PractitionerExample)
* recorder = Reference(PractitionerExample)

* code.coding[0].system = "http://snomed.info/sct"
* code.coding[0].code = #6142004
* code.coding[0].display = "Influenza (Grippe)"

* clinicalStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"

* verificationStatus.coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* verificationStatus.coding[0].code = #provisional
* verificationStatus.coding[0].display = "Provisional"

* onsetDateTime = 2026-02-20T08:00:00Z
* abatementDateTime = 2026-02-28T18:00:00Z

* recordedDate = 2026-02-24T10:00:00Z

* note[0].text = "Patient zeigt typische akute Grippesymptome. Hohes Fieber über 39 Grad. Blutkulturen wurden abgenommen."