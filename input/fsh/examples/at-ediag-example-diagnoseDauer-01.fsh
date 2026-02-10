Instance: DiabetesDiagnoseDauer
InstanceOf: AtEdiagCondition
Title: "Beispiel Dauerdiagnose Diabetes mellitus Typ 2"
Description: "Beispielinstanz einer Dauerdiagnose nach AT e-Diagnose Condition-Profil."

* meta.tag[0].system = $ATDiagType
* meta.tag[0].code = #chronic
* meta.tag[0].display = "Dauerdiagnose"

* subject = Reference(PatientExample)
* asserter = Reference(PractitionerExample)

* code.coding[0].system = $cs-sct
* code.coding[0].code = #44054006
* code.coding[0].display = "Diabetes mellitus Typ 2"

* clinicalStatus.coding[0].system = $condition-clinical
* clinicalStatus.coding[0].code = #active
* clinicalStatus.coding[0].display = "Active"

