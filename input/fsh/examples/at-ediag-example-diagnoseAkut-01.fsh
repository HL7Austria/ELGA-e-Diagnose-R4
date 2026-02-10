Instance: GrippeDiagnoseAkut
InstanceOf: AtEdiagCondition
Title: "Beispiel Akutdiagnose Grippe"
Description: "Beispielinstanz einer akuten Grippe-Diagnose nach AT e-Diagnose Condition-Profil."

* meta.tag[0].system = $ATDiagType
* meta.tag[0].code = #acute
* meta.tag[0].display = "Akutdiagnose"

* subject = Reference(PatientExample)
* asserter = Reference(PractitionerExample)

* code.coding[0].system = $cs-sct
* code.coding[0].code = #6142004
* code.coding[0].display = "Influenza (Grippe)"

* clinicalStatus.coding[0].system = $condition-clinical
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"