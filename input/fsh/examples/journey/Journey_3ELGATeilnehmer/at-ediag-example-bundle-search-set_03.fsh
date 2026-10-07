Instance: ConditionSearchSet03
InstanceOf: Bundle
Title: "SearchSet-Bundle der Diagnosen eines Patienten"
Description: "Beispiel eines SearchSet-Bundles mit mehreren Condition-Ressourcen eines Patienten"
Usage: #example

* type = #searchset
* total = 5

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/Condition?patient=Patient/PatientExample"

* entry[0].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[0].resource = ConditionEntry01

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry02"
* entry[=].resource = ConditionEntry02

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry03"
* entry[=].resource = ConditionEntry03EnteredInError

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry04"
* entry[=].resource = ConditionEntry04

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry06"
* entry[=].resource = ConditionEntry06

