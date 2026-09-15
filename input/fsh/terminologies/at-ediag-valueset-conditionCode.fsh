ValueSet: AtEDiagConditionCode
Id: at-ediag-condition-code
Title: "AT e-Diagnose Condition Code"
Description: "Value-Set für die Codierung von Diagnosen."
* ^status = #active
* ^experimental = true
* include codes from system http://snomed.info/sct
    where concept is-a #404684003
