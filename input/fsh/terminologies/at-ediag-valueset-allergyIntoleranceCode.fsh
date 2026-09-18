ValueSet: AtEDiagAllergyIntoleranceCode
Id: at-ediag-allergyintolerance-code
Title: "AT e-Diagnose AllergyIntolerance Code"
Description: "Value-Set für die Codierung von Allergien und Intoleranzen."
* ^status = #active
* ^experimental = true

* include codes from valueset $vs-elga-wirkstoffe-ages
* include codes from system $cs-sct
    where concept is-a #105590001 "Substance"
