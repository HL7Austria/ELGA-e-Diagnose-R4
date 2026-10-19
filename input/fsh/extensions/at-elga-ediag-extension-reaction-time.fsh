Extension: AtEdiagExtReactionTime
Id: at-elga-ediag-reaction-time
Title: "AT e-Diagnose Reaktionszeit"
Description: "Zeitlicher Verlauf der Manifestation (<6h, 6-24h, >24h, unknown)"

* ^status = #active
* ^context.type = #element
* ^context.expression = "AllergyIntolerance.reaction"

* value[x] only CodeableConcept
* value[x] from AtEdiagReactionTime