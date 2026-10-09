Instance: ConditionEntry01Request
InstanceOf: AtEdiagCondition
Title: "Request: Diagnose erfassen (POST /Condition)"
Description: "Beispiel der Diagnose, wie sie die Client-Anwendung per POST an die e-Diagnose-Fachanwendung übermittelt: Patient und GDA werden als logische Referenzen (Reference.identifier) angegeben. Gespeicherte Fassung mit aufgelösten Referenzen: [ConditionEntry01](Condition-ConditionEntry01.html). Siehe [Designentscheidungen](design_choices.html#logische-referenzen)."
Usage: #example

// POST /Condition
// Übermittelte Diagnose: Patient und GDA als logische Referenzen.
// Die e-Diagnose-Fachanwendung löst diese auf und speichert die Diagnose als ConditionEntry01.
* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1234"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#38341003 "Hypertensive disorder, systemic arterial"

* subject
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

* onsetDateTime = "2022-06-01"

* note.text = "Patient berichtet über bekannte Hypertonie seit 2022, Lisinopril 10mg 1-0-0."
