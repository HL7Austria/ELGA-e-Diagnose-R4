Instance: ConditionListSearchSet01
InstanceOf: Bundle
Title: "SearchSet-Bundle der Condition-Summary-Liste (Version 2)"
Description: "Beispiel eines SearchSet-Bundles mit der Condition-Summary-Liste nach dem ersten Arztbesuch inklusive der referenzierten Diagnose."
Usage: #example

* type = #searchset
// total zählt nur die Treffer (search.mode = match), nicht die inkludierten Ressourcen
* total = 1

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/List?code=http://loinc.org|11450-4&_include=*"

* entry[0].fullUrl = "https://example.org/fhir/List/ConditionList01"
* entry[=].resource = ConditionList01
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[=].resource = ConditionEntry01
* entry[=].search.mode = #include
