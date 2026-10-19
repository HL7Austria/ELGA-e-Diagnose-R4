ValueSet: AtEdiagConditionClinicalStatus
Id: at-ediag-condition-clinical-status
Title: "AT e-Diagnose Condition Clinical Status"
Description: "Value-Set mit den für e-Diagnose zulässigen Ausprägungen von Condition.clinicalStatus (siehe Workflowmanagement: Erlaubte Kombinationen für Condition)."
* ^status = #draft
* ^experimental = false

* $condition-clinical#active "Active"
* $condition-clinical#inactive "Inactive"
