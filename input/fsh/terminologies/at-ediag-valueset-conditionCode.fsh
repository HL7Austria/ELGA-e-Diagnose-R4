ValueSet: AtEDiagConditionCode
Id: at-ediag-condition-code
Title: "AT e-Diagnose Condition Code"
Description: "Value-Set für die Codierung von Diagnosen."
* ^status = #draft
* ^experimental = true

* include codes from system $cs-sct
    where concept is-a #404684003
