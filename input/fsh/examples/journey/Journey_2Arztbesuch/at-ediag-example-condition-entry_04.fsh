Instance: ConditionEntry04
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtansicht"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[reported].valueBoolean = false

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1237"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#428867008 "Diarrhea caused by drug"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* onsetDateTime = "2026-03-09"

* note.text = "Wässrige Durchfälle bei bestehender AB-Therapie"