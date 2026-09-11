Instance: ProcedureList01
InstanceOf: AtEdiagList
Title: "Procedure Summary-Liste mit einem Summary-Eintrag"
Description: "Beispiel einer Summary-Liste mit einem Eintrag, der auf eine Prozedur verweist."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-01T00:00:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ProcedureEntry01)

