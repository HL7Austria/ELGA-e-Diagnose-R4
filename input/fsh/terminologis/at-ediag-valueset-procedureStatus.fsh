ValueSet: AtEdiagProcedureStatus
Id: at-ediag-procedure-status
Title: "AT e-Diagnose Procedure Status Value Set"
Description: "ValueSet zur Kennzeichnung, ob eine Prozedur durchgeführt oder irrtümlich dokumentiert wurde."
* ^status = #active
* ^experimental = true

* include http://hl7.org/fhir/event-status#completed
* include http://hl7.org/fhir/event-status#entered-in-error
