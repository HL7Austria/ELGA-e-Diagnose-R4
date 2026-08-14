Extension: AtElgaEdiagExtEnteredInError
Id: at-elga-ediag-ext-entered-in-error
Title: "AT ELGA Entered In Error"
Description: "Kennzeichnet, ob eine Information fehlerhaft eingegeben wurde."
Context: AtEdiagCondition, AtEdiagProcedure, AtEdiagAllergyIntolerance

* value[x] 0..0
* extension contains 
  practitioner 1..1 and
  datetime 1..1 and
  reason 0..1
* extension[practitioner] only Extension
* extension[practitioner].value[x] 1..
* extension[practitioner].value[x] only AtEdiagReference
* extension[practitioner].value[x] only Reference(HL7ATCorePractitioner)
* extension[datetime] only Extension
* extension[datetime].value[x] 1..
* extension[datetime].value[x] only dateTime
* extension[reason] only Extension
* extension[reason].value[x] only string
