Instance: ProcedureEntry01
InstanceOf: AtEdiagProcedure 
Title: "Beispielinstanz einer Prozedur für die Summary-Liste"
Description: "Beispiel einer Prozedur"
Usage: #example

* extension[reported].valueBoolean = true

* extension[recordedDate].valueDateTime = "2026-03-09T09:53:00+00:00"

* identifier[0].system = Canonical(AtEdiagBusinessIdentifierCS)
* identifier[=].value = "1337"

* status = #completed

// Partial resection of colon
* code = $cs-sct#43075005 "Partial resection of colon"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* performedDateTime = "2025-09-23T09:30:00+02:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

