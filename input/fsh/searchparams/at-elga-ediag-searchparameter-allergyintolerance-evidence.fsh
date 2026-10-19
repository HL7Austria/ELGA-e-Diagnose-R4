Instance: AllergyIntoleranceEvidence
InstanceOf: SearchParameter
Title: "AllergyIntolerance Evidence"
Usage: #definition
* id = "at-elga-ediag-searchparameter-allergyintolerance-evidence"
* name = "AllergyIntoleranceEvidence"
* status = #active
* description = "Erlaubt die Suche nach Verweisen auf e-Befunde als medizinische Evidenz."
* code = #evidence
* base = #AllergyIntolerance
* type = #reference
* expression = "AllergyIntolerance.extension('https://fhir.hl7.at/elga/ediag/r4/StructureDefinition/at-elga-ediag-ext-evidence').value.ofType(Reference)"