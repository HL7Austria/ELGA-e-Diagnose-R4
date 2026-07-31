Instance: AllergyExample
InstanceOf: AtEdiagAllergyIntolerance
Title: "Beispiel Allergie"
Description: "Beispielinstanz einer bestätigten Allergie"

* meta.tag[diagnosisType] = AtEdiagDiagnosisType#relevant "currently relevant"

* extension[reported].valueBoolean = false



* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#refuted


* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #294505008
* code.coding.display = " Amoxicillin-Allergie"


* patient = Reference(PatientExample)


* recordedDate = "2026-04-20T10:00:00+02:00"


* recorder = Reference(PractitionerExample)


* asserter = Reference(PractitionerExample)


* reaction.manifestation[0].coding.system = "http://snomed.info/sct"
* reaction.manifestation[0].coding.code = #271807003
* reaction.manifestation[0].coding.display = "Exanthem"

* reaction.manifestation[1].coding.system = "http://snomed.info/sct"
* reaction.manifestation[1].coding.code = #422400008
* reaction.manifestation[1].coding.display = "Emesis"

* reaction.extension[AtEdiagReactionTime].valueCodeableConcept =
  https://fhir.hl7.at/elga/ediag/r4/CodeSystem/at-ediag-reaction-time-cs#lt6h "<6 Stunden"

* reaction.note.text = "Hautausschlag und Erbrechen nach Penicillin-Einnahme"

* reaction.onset = "2025-03-15"