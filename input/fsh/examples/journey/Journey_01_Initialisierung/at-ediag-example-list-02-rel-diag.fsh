Instance: ListExample02
InstanceOf: AtEdiagList
Title: "e-Diagnose-Liste mit einer relevanten Diagnose"
Usage: #example

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:list-02"

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject
  * identifier[0].system = "urn:oid:1.2.40.0.10.2.1.1.149"
  * identifier[=].value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
  * type = #Patient

* date = "2026-03-01T00:00:00+00:00"

* source
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* entry[0].flag = ElgaListEntryFlagCS#new
* entry[0].item = Reference(DiagnoseCurrentlyRelevantExample)