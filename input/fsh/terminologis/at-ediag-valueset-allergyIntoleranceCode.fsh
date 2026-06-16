ValueSet: AtEdiagAllergyIntoleranceCodes
Id: at-ediag-allergyintolerance-codes
Title: "AT e-Diagnose AllergyIntolerance Value Set"
Description: "ValueSet mit Codes für Substanzen und Stoffe, die als Auslöser von Allergien oder Intoleranzen erfasst werden."
* ^status = #active
* ^experimental = true

// https://hl7.org/fhir/R4/valueset-substance-code.html

* include codes from system http://snomed.info/sct 
    where concept is-a #105590001 "(Substance)"
