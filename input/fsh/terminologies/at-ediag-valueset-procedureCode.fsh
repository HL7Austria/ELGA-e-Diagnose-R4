ValueSet: AtEDiagProcedureCode
Id: at-ediag-procedure-code
Title: "AT e-Diagnose Procedure Code"
Description: "Value-Set für die Codierung von Prozeduren."
* ^status = #draft
* ^experimental = true

* include codes from system $cs-sct
    where constraint = "< 416940007 |History of procedure (situation)| . 363589002 |Associated procedure (attribute)|"
