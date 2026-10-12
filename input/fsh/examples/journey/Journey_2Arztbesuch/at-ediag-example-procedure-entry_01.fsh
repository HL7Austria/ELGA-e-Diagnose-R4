Instance: ProcedureEntry01
InstanceOf: AtEdiagProcedure 
Title: "Beispielinstanz einer Prozedur für die Summary-Liste"
Description: "Beispiel einer Prozedur"
Usage: #example

* extension[reported].valueBoolean = true

* status = #completed

// Partial excision of large intestine
* code = $cs-sct#27010001 "Partial excision of large intestine"

* subject = Reference(PatientExample)

* performedDateTime = "2025-09-23T09:30:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PatientExample)

