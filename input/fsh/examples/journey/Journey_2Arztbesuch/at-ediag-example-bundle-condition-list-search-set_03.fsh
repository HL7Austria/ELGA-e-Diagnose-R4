Instance: ConditionListSearchSet03
InstanceOf: Bundle
Title: "SearchSet-Bundle der Condition-Summary-Liste (Version 4)"
Description: "Beispiel eines SearchSet-Bundles mit der Condition-Summary-Liste, nachdem die e-Diagnose-Fachanwendung den stornierten Eintrag entfernt hat, inklusive der referenzierten Diagnose."
Usage: #example

* type = #searchset
// total zählt nur die Treffer (search.mode = match), nicht die inkludierten Ressourcen
* total = 1

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/List?patient=Patient/PatientExample&code=http://loinc.org|11450-4&_include=*"

* entry[0].fullUrl = "https://example.org/fhir/List/ConditionList03"
* entry[=].resource = ConditionList03
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[=].resource = ConditionEntry01
* entry[=].search.mode = #include
