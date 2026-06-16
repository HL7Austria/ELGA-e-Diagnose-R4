ValueSet: AtEDiagProzedurenCodes
Id: at-ediag-prozeduren-codes
Title: "AT e-Diagnose Procedures Value Set"
Description: "ValueSet mit SNOMED CT Prozeduren (is-a Procedure). Dient als vollständige Alternative zum eingeschränkten IPS ValueSet."
* ^status = #active
* ^experimental = true
// https://build.fhir.org/ig/HL7/fhir-ips/en/ValueSet-procedures-uv-ips.html
// https://github.com/HL7/fhir-ips/blob/master/input/fsh/valuesets/ProceduresUvIps.fsh

* include codes from system http://snomed.info/sct
    where concept descendent-of #71388002 "Procedure (procedure)"
* include codes from system http://snomed.info/sct
    where concept is-a #787480003 "No known procedures (situation)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #14734007 "Administrative procedure (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #59524001 "Blood bank procedure (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #389067005 "Community health procedure (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #442006003 "Determination of information related to transfusion (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #225288009 "Environmental care procedure (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #308335008 "Patient encounter procedure (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #710135002 "Promotion (procedure)"
* exclude codes from system http://snomed.info/sct
    where concept is-a #389084004 "Staff related procedure (procedure)"