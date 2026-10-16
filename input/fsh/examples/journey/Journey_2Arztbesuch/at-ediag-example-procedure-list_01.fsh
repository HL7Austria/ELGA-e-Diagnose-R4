Instance: ProcedureList01
InstanceOf: AtEdiagList
Title: "Procedure Summary-Liste mit einem Summary-Eintrag"
Description: "Beispiel einer Summary-Liste mit einem Eintrag, der auf eine Prozedur verweist."
Usage: #example

* meta.versionId = "2"

* status = #current
* mode = #working

* code = $cs-loinc#47519-4

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* date = "2026-03-09T10:00:00+00:00"

* source = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* entry[0].item = Reference(ProcedureEntry01)

