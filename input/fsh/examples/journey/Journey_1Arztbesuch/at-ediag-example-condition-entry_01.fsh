Instance: ConditionEntry01
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Summary-Liste"
Description: "Beispiel einer dauerhaften Diagnose"
Usage: #example

* extension[reported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1234"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#38341003 "Hypertensive disorder, systemic arterial"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* onsetDateTime = "2022-06-01"

* note.text = "Patient berichtet über bekannte Hypertonie seit 2022, Lisinopril 10mg 1-0-0."