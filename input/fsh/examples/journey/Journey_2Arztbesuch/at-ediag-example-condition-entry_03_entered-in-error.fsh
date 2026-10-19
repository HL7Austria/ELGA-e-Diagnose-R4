Instance: ConditionEntry03EnteredInError
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer stornierten Diagnose"
Description: "Beispiel einer Diagnose nach Durchführung der $entered-in-error-Operation durch einen GDA"
Usage: #example

// Version 2 von ConditionEntry03 nach $entered-in-error.
// Eigene ID, da IG-Beispiele eindeutige IDs benötigen.
* meta.versionId = "2"

* extension[reported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1236"

* extension[entered-in-error].extension[practitioner].valueReference = Reference(PractitionerExample)
* extension[entered-in-error].extension[datetime].valueDateTime = "2026-03-09T10:30:00+00:00"
* extension[entered-in-error].extension[reason].valueString = "Falscher Code ausgewählt"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#34486009 "Hyperthyroidism"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* onsetDateTime = "2010-01-01"

* note.text = "Seit 2010"
