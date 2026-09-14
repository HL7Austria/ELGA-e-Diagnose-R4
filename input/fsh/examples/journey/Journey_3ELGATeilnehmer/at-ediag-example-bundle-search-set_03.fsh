Instance: ConditionSearchSet03
InstanceOf: Bundle
Title: "SearchSet-Bundle der Diagnosen eines Patienten"
Description: "Beispiel eines SearchSet-Bundles mit mehreren Condition-Ressourcen eines Patienten"
Usage: #example

* type = #searchset
* total = 4

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/Condition?patient=Patient/example"

* entry[0].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[0].resource = ConditionEntry01

* entry[1].fullUrl = "https://example.org/fhir/Condition/ConditionEntry02"
* entry[1].resource = ConditionEntry02

* entry[2].fullUrl = "https://example.org/fhir/Condition/ConditionEntry03"
* entry[2].resource = ConditionEntry03

* entry[3].fullUrl = "https://example.org/fhir/Condition/ConditionEntry04"
* entry[3].resource = ConditionEntry04

