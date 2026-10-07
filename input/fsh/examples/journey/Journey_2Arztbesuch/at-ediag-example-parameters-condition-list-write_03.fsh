Instance: ConditionListWrite03
InstanceOf: Parameters
Title: "Parameters für $write der Condition-Summary-Liste (Version 5)"
Description: "Beispiel der Eingabeparameter der $write-Operation, mit der Dr. Musterärztin die korrekt codierte Diagnose Morbus Crohn in die Condition-Summary-Liste aufnimmt."
Usage: #example

// POST /List/$write  ·  If-Match: W/"4"  (Ergebnis: Version 5)
* parameter[0].name = "code"
* parameter[=].valueCode = #11450-4

* parameter[+].name = "list"
* parameter[=].resource = ConditionList04Request

// Übermittelte Summary-Liste: ohne meta.versionId, die neue Version wird von der e-Diagnose-Fachanwendung vergeben.
// Die zugrundeliegende Version wird per If-Match-Header übergeben.
Instance: ConditionList04Request
InstanceOf: AtEdiagList
Usage: #inline
* id = "ConditionList04"
* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-09T10:35:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionEntry01)
* entry[1].item = Reference(ConditionEntry06)
