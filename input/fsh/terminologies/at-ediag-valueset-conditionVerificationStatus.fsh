ValueSet: AtEdiagConditionVerificationStatusVS
Id: at-ediag-condition-verification-status-vs
Title: "AT e-Diagnose Condition Verification Status"
Description: "Value-Set mit den für e-Diagnose zulässigen Ausprägungen von Condition.verificationStatus (siehe Workflowmanagement: Erlaubte Kombinationen für Condition). Gesicherte Diagnosen (active) sowie Zustand nach (inactive) werden ohne verificationStatus erfasst."
* ^status = #draft
* ^experimental = true

* $cs-condition-ver-status#provisional "Provisional"
* $cs-condition-ver-status#differential "Differential"
* $cs-condition-ver-status#refuted "Refuted"
