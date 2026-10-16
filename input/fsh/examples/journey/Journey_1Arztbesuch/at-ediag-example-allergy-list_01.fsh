Instance: AllergyList01
InstanceOf: AtEdiagList
Title: "Allergie Summary-Liste mit einem Summary-Eintrag"
Description: "Beispiel einer Summary-Liste mit einem Eintrag, der auf eine Allergie verweist."
Usage: #example

* meta.versionId = "2"

* status = #current
* mode = #working

* code = $cs-loinc#48765-2

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* date = "2026-03-03T08:10:00+00:00"

* source = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* entry[0].item = Reference(AllergyEntry01) 