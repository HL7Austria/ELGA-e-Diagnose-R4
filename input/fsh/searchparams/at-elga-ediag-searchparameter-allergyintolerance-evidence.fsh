Instance: AllergyIntoleranceEvidence
InstanceOf: SearchParameter
Title: "AllergyIntolerance Evidence"
Usage: #definition
* id = "at-elga-ediag-searchparameter-allergyintolerance-evidence"
* status = #active
* description = "Erlaubt die Suche nach Verweisen auf e-Befunde als medizinische Evidenz."
* code = #evidence
* base = #AllergyIntolerance
* type = #reference
* expression = "AllergyIntoleranceAllergyIntolerance.extension('https://fhir.hl7.at/elga/ediag/r4/StructureDefinition/at-elga-ediag-ext-evidence').valueReference."