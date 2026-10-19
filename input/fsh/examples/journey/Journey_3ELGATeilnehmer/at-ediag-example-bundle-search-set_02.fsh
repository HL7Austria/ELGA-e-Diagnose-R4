Instance: ConditionSearchSet02
InstanceOf: Bundle
Title: "SearchSet-Bundle der Diagnosen eines Patienten (mit Pilzinfektion)"
Description: "Beispiel eines SearchSet-Bundles mit mehreren Condition-Ressourcen eines Patienten"
Usage: #example

* type = #searchset
* total = 6

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/Condition"

// Sortierung absteigend nach Erstellungsdatum (zuletzt erstellter Eintrag zuerst)
* entry[0].fullUrl = "https://example.org/fhir/Condition/ConditionEntry06"
* entry[0].resource = ConditionEntry06

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry05"
* entry[=].resource = ConditionEntry05

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry04"
* entry[=].resource = ConditionEntry04

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry03EnteredInError"
* entry[=].resource = ConditionEntry03EnteredInError

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry02"
* entry[=].resource = ConditionEntry02

* entry[+].fullUrl = "https://example.org/fhir/Condition/ConditionEntry01"
* entry[=].resource = ConditionEntry01