Instance: ProcedureExample1
InstanceOf: AtEdiagProcedure 
Title: "Beispielinstanz einer Prozedur für die Summary-Liste"
Description: "Beispiel einer Prozedur"
Usage: #example

* extension[reported].valueBoolean = false

* status = #completed

// Coloskopie 
* code = http://snomed.info/sct#73761001 "Coloskopie"

* subject = Reference(PatientExample)

* performedDateTime = "2025-09-23T09:30:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

