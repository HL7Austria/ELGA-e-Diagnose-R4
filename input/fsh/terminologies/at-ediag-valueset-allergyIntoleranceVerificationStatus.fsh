ValueSet: AtEdiagAllergyIntoleranceVerificationStatusVS
Id: at-ediag-allergyintolerance-verification-status-vs
Title: "AT e-Diagnose AllergyIntolerance Verification Status"
Description: "Value-Set mit den für e-Diagnose zulässigen Ausprägungen von AllergyIntolerance.verificationStatus (siehe Workflowmanagement: Erlaubte Kombinationen für AllergyIntolerance)."
* ^status = #draft
* ^experimental = true

* $cs-allergyintolerance-verification#unconfirmed "Unconfirmed"
* $cs-allergyintolerance-verification#presumed "Presumed"
* $cs-allergyintolerance-verification#confirmed "Confirmed"
* $cs-allergyintolerance-verification#refuted "Refuted"
