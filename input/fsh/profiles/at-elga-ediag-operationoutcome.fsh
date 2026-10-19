Profile: AtEdiagOperationOutcome
Parent: OperationOutcome
Id: at-elga-ediag-operationoutcome
Title: "AT e-Diagnose OperationOutcome"
Description: "Dieses Profil gibt vor, welche Details im Rahmen der e-Diagnose im Fehlerfall an den Client zurückgegeben werden."

* ^status = #active
* . ^short = "AT ELGA e-Diagnose OperationOutcome"

* issue
  * details from AtEdiagOperationOutcomeDetails (required)