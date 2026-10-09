Instance: ProcedureListWrite01
InstanceOf: Parameters
Title: "Parameters für $write der Procedure-Summary-Liste (Version 2)"
Description: "Beispiel der Eingabeparameter der $write-Operation, mit der Dr. Musterärztin die Koloskopie in die Procedure-Summary-Liste aufnimmt."
Usage: #example

// POST /List/$write  ·  If-Match: W/"1"  (Ergebnis: Version 2)
* parameter[0].name = "code"
* parameter[=].valueCode = #47519-4

* parameter[+].name = "list"
* parameter[=].resource = ProcedureList01Request

// Übermittelte Summary-Liste: ohne meta.versionId, die neue Version wird von der e-Diagnose-Fachanwendung vergeben.
// Die zugrundeliegende Version wird per If-Match-Header übergeben.
Instance: ProcedureList01Request
InstanceOf: AtEdiagList
Usage: #inline
* id = "ProcedureList01"
* status = #current
* mode = #working

* code = $cs-loinc#47519-4

* subject
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* date = "2026-03-09T10:00:00+00:00"

* source
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* entry[0].item = Reference(ProcedureEntry01)

