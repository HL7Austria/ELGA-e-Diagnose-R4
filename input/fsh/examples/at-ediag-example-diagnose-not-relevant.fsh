Instance: DiagnoseNotCurrentlyRelevantExample
InstanceOf: AtEdiagCondition
Title: "Beispiel Diagnose not currently relevant"
Description: "Beispielinstanz einer Diagnose - not currently relevant"
Usage: #example


* meta.tag[diagnosisType] = AtEdiagDiagnosisType#notrelevant "not currently relevant"

* extension[AtReported].valueBoolean = true


* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #719590007

* code.coding[snomed].display = "Saisonale Grippe"

* subject
  * identifier[0].system = "urn:oid:1.2.40.0.10.2.1.1.149"
  * identifier[=].value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
  * type = #Patient

* recordedDate = "2026-03-01T00:00:00+00:00"

* recorder
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* asserter
  * identifier[0].system = "urn:ietf:rfc:3986"
  * identifier[=].value = "urn:oid:1.2.40.0.34.99.4613.4"
  * type = #Practitioner

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Gliederschmerzen"