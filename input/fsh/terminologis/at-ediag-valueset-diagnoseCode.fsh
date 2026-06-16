ValueSet: AtEDiagDiagnosenCodes
Id: at-ediag-diagnosen-codes
Title: "AT e-Diagnose Diagnosen Value Set"
Description: "Value-Set für die Codierung von Diagnosen."
* ^status = #active
* ^experimental = true
* include codes from system http://snomed.info/sct
    where concept is-a #404684003