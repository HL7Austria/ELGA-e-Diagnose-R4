Instance: AllergyListSearchSet01
InstanceOf: Bundle
Title: "SearchSet-Bundle der Allergy-Summary-Liste (Version 2)"
Description: "Beispiel eines SearchSet-Bundles mit der Allergy-Summary-Liste nach dem ersten Arztbesuch inklusive der referenzierten Allergie."
Usage: #example

* type = #searchset
// total zählt nur die Treffer (search.mode = match), nicht die inkludierten Ressourcen
* total = 1

* link[0].relation = #self
* link[0].url = "https://example.org/fhir/List?patient=Patient/PatientExample&code=http://loinc.org|48765-2&_include=*"

* entry[0].fullUrl = "https://example.org/fhir/List/AllergyList01"
* entry[=].resource = AllergyList01
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://example.org/fhir/AllergyIntolerance/AllergyEntry01"
* entry[=].resource = AllergyEntry01
* entry[=].search.mode = #include
