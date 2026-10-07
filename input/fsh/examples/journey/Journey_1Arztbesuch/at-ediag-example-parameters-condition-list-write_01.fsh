Instance: ConditionListWrite01
InstanceOf: Parameters
Title: "Parameters für $write der Condition-Summary-Liste (Version 2)"
Description: "Beispiel der Eingabeparameter der $write-Operation, mit der Dr. Musterärztin die Hypertonie in die Condition-Summary-Liste aufnimmt."
Usage: #example

// POST /List/$write  ·  If-Match: W/"1"  (Ergebnis: Version 2)
* parameter[0].name = "code"
* parameter[=].valueCode = #11450-4

* parameter[+].name = "list"
* parameter[=].resource = ConditionList01Request

// Übermittelte Summary-Liste: ohne meta.versionId, die neue Version wird von der e-Diagnose-Fachanwendung vergeben.
// Die zugrundeliegende Version wird per If-Match-Header übergeben.
Instance: ConditionList01Request
InstanceOf: AtEdiagList
Usage: #inline
* id = "ConditionList01"
* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-03T08:10:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionEntry01)