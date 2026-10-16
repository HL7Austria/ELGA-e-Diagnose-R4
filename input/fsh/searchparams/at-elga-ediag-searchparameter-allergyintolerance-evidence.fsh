Instance: at-elga-ediag-searchparameter-allergyintolerance-evidence
InstanceOf: SearchParameter
Usage: #definition
* name = "AllergyIntolerance Evidence"
* status = #active
* description = "Erlaubt die Suche nach Verweisen auf e-Befunde als medizinische Evidenz."
* code = #evidence
* base = #AllergyIntolerance
* type = #reference
* expression = "AllergyIntoleranceAllergyIntolerance.extension('https://fhir.hl7.at/elga/ediag/r4/StructureDefinition/at-elga-ediag-ext-evidence').valueReference."