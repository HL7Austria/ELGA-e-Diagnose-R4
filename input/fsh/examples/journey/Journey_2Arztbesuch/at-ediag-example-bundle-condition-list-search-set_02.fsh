Instance: ConditionListSearchSet02
InstanceOf: Bundle
Title: "SearchSet-Bundle der Condition-Summary-Liste (Version 3)"
Description: "Beispiel eines SearchSet-Bundles mit der Condition-Summary-Liste während des zweiten Arztbesuchs inklusive der referenzierten Diagnosen, darunter der fehlerhaft codierte Eintrag."
Usage: #example

* type = #searchset
// total zählt nur die Treffer (search.mode = match), nicht die inkludierten Ressourcen
* total = 1

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/List?patient=Patient/PatientExample&code=http://loinc.org|11450-4&_include=*"

* entry[0].fullUrl = "https://example.org/fhir/List/ConditionList02"
* entry[=].resource = ConditionList02
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[=].resource = ConditionEntry01
* entry[=].search.mode = #include

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry03"
* entry[=].resource = ConditionEntry03
* entry[=].search.mode = #include
