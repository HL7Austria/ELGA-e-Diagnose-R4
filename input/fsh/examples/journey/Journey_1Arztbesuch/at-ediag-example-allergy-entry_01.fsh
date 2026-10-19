Instance: AllergyEntry01
InstanceOf: AtEdiagAllergyIntolerance
Title: "Beispielinstanz einer Allergie für die Summary-Liste"
Description: "Beispiel einer bestätigten Allergie"
Usage: #example

* extension[reported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "4711"

* clinicalStatus = $cs-allergyintolerance-clinical#active

* verificationStatus = $cs-allergyintolerance-verification#presumed

* code.coding.system = $cs-medikation-ages-wirkstoffe
* code.coding.code = #1708923
* code.coding.display = "AMOXICILLIN"

* patient = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-03T08:07:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* reaction.manifestation[0].coding.system = $cs-sct
* reaction.manifestation[0].coding.code = #271807003
* reaction.manifestation[0].coding.display = "Exanthem"

* reaction.manifestation[1].coding.system = $cs-sct
* reaction.manifestation[1].coding.code = #422400008
* reaction.manifestation[1].coding.display = "Emesis"

* reaction.extension[reactionTime].valueCodeableConcept = AtEdiagReactionTimeCS#lt6h "<6 Stunden"

* reaction.note.text = "Hautausschlag und Erbrechen nach Penicillin-Einnahme"

* reaction.onset = "1983-03-01"