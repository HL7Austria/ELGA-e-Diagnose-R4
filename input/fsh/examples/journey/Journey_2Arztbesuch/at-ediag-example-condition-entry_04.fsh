Instance: ConditionEntry04
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtliste"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1237"

* clinicalStatus = $condition-clinical#active


* code.coding[0] = $cs-sct#428867008 "Diarrhea caused by drug"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-03-09"

* note.text = "Wässrige Durchfälle bei bestehender AB-Therapie"