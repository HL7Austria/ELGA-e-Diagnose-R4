Instance: ConditionEntry02
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtansicht (Eitrige Angina)"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[reported].valueBoolean = false

* identifier[0].system = Canonical(AtEdiagBusinessIdentifierCS)
* identifier[=].value = "1235"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#10351008 "Suppurative tonsillitis"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-03T08:06:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Schmerzen beim Schlucken"