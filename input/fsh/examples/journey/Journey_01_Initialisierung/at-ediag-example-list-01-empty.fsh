Instance: ListExample01
InstanceOf: AtEdiagList
Title: "Beispiel einer leeren e-Diagnose-Liste"
Description: "Initiale e-Diagnose-Liste ohne Diagnosen, Prozeduren oder Allergien."
Usage: #example

* identifier.value = "123"
* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#11450-4

* subject
  * identifier[0].system = "urn:oid:1.2.40.0.10.2.1.1.149"
  * identifier[=].value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
  * type = #Patient

* date = "2026-03-01T08:00:00+00:00"

* source
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* emptyReason = $cs-list-empty-reason#notstarted