Instance: ProcedureListSearchSet01
InstanceOf: Bundle
Title: "SearchSet-Bundle der Procedure-Summary-Liste (Version 2)"
Description: "Beispiel eines SearchSet-Bundles mit der Procedure-Summary-Liste nach dem zweiten Arztbesuch inklusive der referenzierten Prozedur."
Usage: #example

* type = #searchset
// total zählt nur die Treffer (search.mode = match), nicht die inkludierten Ressourcen
* total = 1

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/List?patient=Patient/PatientExample&code=http://loinc.org|47519-4&_include=*"

* entry[0].fullUrl = "https://example.org/fhir/List/ProcedureList01"
* entry[=].resource = ProcedureList01
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://example.org/fhir/Procedure/ProcedureEntry01"
* entry[=].resource = ProcedureEntry01
* entry[=].search.mode = #include
