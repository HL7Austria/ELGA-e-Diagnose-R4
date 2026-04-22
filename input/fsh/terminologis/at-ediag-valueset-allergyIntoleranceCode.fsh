ValueSet: AtEdiagAllergyIntoleranceCodes
Id: at-ediag-allergyintolerance-codes
Title: "AT e-Diagnose Allergie und Intoleranz Codes"
Description: "Umfasst bestimmte Substanzen von Allergien oder Unverträglichkeiten"
* ^status = #active
* ^experimental = true
// https://hl7.org/fhir/R4/valueset-allergyintolerance-code.html

* include codes from system http://snomed.info/sct 
    where concept is-a #420134006
