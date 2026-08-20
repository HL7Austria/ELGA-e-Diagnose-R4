Instance: DiagnoseCurrentlyRelevantExample
InstanceOf: AtEdiagCondition
Title: "Beispiel Diagnose currently relevant"
Description: "Beispielinstanz einer Diagnose - currently relevant"
Usage: #example

* meta.tag[diagnosisType] = AtEdiagDiagnosisType#relevant "currently relevant"

* extension[AtReported].valueBoolean = false



* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #40930008
* code.coding[snomed].display = "Hypothyroidism"

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

* onsetDateTime = "2024-06-01"

* note.text = "Patient berichtet über bekannte Schilddrüsenerkrankung seit 2024, aktuell gut eingestellt."