Instance: DiabetesDauerDiagnose
InstanceOf: AtEdiagConditionDauer
Title: "Dauerdiagnose Diabetes mellitus Typ 2"
Description: "Beispielinstanz einer Dauerdiagnose nach AT e-Diagnose Condition Dauerdiagnose-Profil."

* subject = Reference(PatientExample)
* asserter = Reference(PractitionerExample)

* clinicalStatus = #active
* verificationStatus = #confirmed
* category = $cs-condition-category#problem-list-item

* code = $cs-sct#44054006 "Diabetes mellitus type 2 (disorder)"

* onsetDateTime = "2026-01-22"

