Extension: AtEdiagEvidence
Id: at-elga-ediag-ext-evidence
Title: "AT ELGA Evidenz (e-Befund)"
Description: "Verweis auf e-Befunde (z. B. Laborbefund, Entlassungsbrief) als medizinische Evidenz, analog zu Condition.evidence.detail."
Context: AtEdiagAllergyIntolerance

* value[x] 1..1
* value[x] only Reference(MinimalDocumentReference)
* value[x] ^short = "Verweis auf ELGA-Befunde als medizinische Evidenz."
