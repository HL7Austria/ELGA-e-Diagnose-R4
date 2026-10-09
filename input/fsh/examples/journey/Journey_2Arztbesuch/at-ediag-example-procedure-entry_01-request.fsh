Instance: ProcedureEntry01Request
InstanceOf: AtEdiagProcedure
Title: "Request: Prozedur erfassen (POST /Procedure)"
Description: "Beispiel der Prozedur, wie sie die Client-Anwendung per POST an die e-Diagnose-Fachanwendung übermittelt: Patient und GDA werden als logische Referenzen (Reference.identifier) angegeben. Gespeicherte Fassung mit aufgelösten Referenzen: [ProcedureEntry01](Procedure-ProcedureEntry01.html). Siehe [Designentscheidungen](design_choices.html#logische-referenzen)."
Usage: #example

// POST /Procedure
// Übermittelte Prozedur: Patient und GDA als logische Referenzen.
// Die e-Diagnose-Fachanwendung löst diese auf und speichert die Prozedur als ProcedureEntry01.
* extension[reported].valueBoolean = true

* status = #completed

// Coloskopie
* code = $cs-sct#73761001 "Colonoscopy"

* subject
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* performedDateTime = "2025-09-23T09:30:00+02:00"

* recorder
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
