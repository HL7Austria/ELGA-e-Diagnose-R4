Instance: AllergyEntry01Request
InstanceOf: AtEdiagAllergyIntolerance
Title: "Request: Allergie erfassen (POST /AllergyIntolerance)"
Description: "Beispiel der Allergie, wie sie die Client-Anwendung per POST an die e-Diagnose-Fachanwendung übermittelt: Patient und GDA werden als logische Referenzen (Reference.identifier) angegeben. Gespeicherte Fassung mit aufgelösten Referenzen: [AllergyEntry01](AllergyIntolerance-AllergyEntry01.html). Siehe [Designentscheidungen](design_choices.html#logische-referenzen)."
Usage: #example

// POST /AllergyIntolerance
// Übermittelte Allergie: Patient und GDA als logische Referenzen.
// Die e-Diagnose-Fachanwendung löst diese auf und speichert die Allergie als AllergyEntry01.
* extension[reported].valueBoolean = true

* clinicalStatus = $cs-allergyintolerance-clinical#active

* verificationStatus = $cs-allergyintolerance-verification#confirmed

* code.coding.system = $cs-sct
* code.coding.code = #372687004
* code.coding.display = "Amoxicillin"

* patient
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* reaction.manifestation[0].coding.system = $cs-sct
* reaction.manifestation[0].coding.code = #271807003
* reaction.manifestation[0].coding.display = "Exanthem"

* reaction.manifestation[1].coding.system = $cs-sct
* reaction.manifestation[1].coding.code = #422400008
* reaction.manifestation[1].coding.display = "Emesis"

* reaction.extension[AtEdiagReactionTime].valueCodeableConcept = AtEdiagReactionTimeCS#lt6h "<6 Stunden"

* reaction.note.text = "Hautausschlag und Erbrechen nach Penicillin-Einnahme"

* reaction.onset = "1983-03-01"
