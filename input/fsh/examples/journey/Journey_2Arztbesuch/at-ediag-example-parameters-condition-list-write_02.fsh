Instance: ConditionListWrite02
InstanceOf: Parameters
Title: "Parameters für $write der Condition-Summary-Liste (Version 3)"
Description: "Beispiel der Eingabeparameter der $write-Operation, mit der Dr. Musterärztin die (fehlerhaft codierte) Diagnose Morbus Crohn in die Condition-Summary-Liste aufnimmt."
Usage: #example

// POST /List/$write  ·  If-Match: W/"2"  (Ergebnis: Version 3)
* parameter[0].name = "code"
* parameter[=].valueCode = #11450-4

* parameter[+].name = "list"
* parameter[=].resource = ConditionList02Request

// Übermittelte Summary-Liste: ohne meta.versionId, die neue Version wird von der e-Diagnose-Fachanwendung vergeben.
// Die zugrundeliegende Version wird per If-Match-Header übergeben.
Instance: ConditionList02Request
InstanceOf: AtEdiagList
Usage: #inline
* id = "ConditionList02"
* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* date = "2026-03-09T08:00:00+00:00"

* source
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* entry[0].item = Reference(ConditionEntry01)
* entry[1].item = Reference(ConditionEntry03)
