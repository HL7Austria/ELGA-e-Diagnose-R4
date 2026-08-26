Instance: ProcedureExample
InstanceOf: AtEdiagProcedure 
Title: "Beispiel Prozedur"
Description: "Beispielinstanz einer Prozedur"
Usage: #example

* meta.tag[diagnosisType] = AtEdiagDiagnosisType#relevant "currently relevant"

* extension[reported].valueBoolean = false

* status = #completed


// Coloskopie 
* code = http://snomed.info/sct#73761001 "Coloskopie"

* subject
  * identifier[0].system = "urn:oid:1.2.40.0.10.2.1.1.149"
  * identifier[=].value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
  * type = #Patient

* performedDateTime = "2026-04-20T09:30:00+02:00"

* recorder
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* asserter
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* note.text = "Diagnostische Coloskopie. Histologiebefund ausständig"