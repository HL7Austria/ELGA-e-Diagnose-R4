Profile: AtEdiagOperationOutcome
Parent: OperationOutcome
Id: at-elga-ediat-operationoutcome
Title: "AT ELGA e-Diagnose OperationOutcome"
Description: "Dieses Profil gibt vor, welche Details im Rahmen der e-Diagnose im Fehlerfall..."
* ^status = #active
* . ^short = "AT ELGA e-Diagnose OperationOutcome"

* issue
  * details from AtEdiagOperationOutcomeDetailsVS (required)