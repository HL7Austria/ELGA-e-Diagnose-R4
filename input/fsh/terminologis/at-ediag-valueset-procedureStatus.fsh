ValueSet: AtEdiagProcedureStatus
Id: at-ediag-procedure-status
Title: "AT e-Diagnose Status der Prozedur"
Description: "Dieses Value-Set legt fest, ob eine Prozedur durchgeführt wurde oder irrtümlich dokumentiert wurde"
* ^status = #active
* ^experimental = true
* http://hl7.org/fhir/event-status#completed "abgeschlossen"
* http://hl7.org/fhir/event-status#entered-in-error "irrtümlich eingegeben"