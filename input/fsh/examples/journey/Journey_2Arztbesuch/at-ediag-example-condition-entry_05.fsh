Instance: ConditionEntry05
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtliste"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1238"

* clinicalStatus = $condition-clinical#active

* verificationStatus = $cs-condition-ver-status#confirmed

* code.coding[0] = $cs-sct#52643007 "Candidal balanitis"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-03-09"

* note.text = "Juckreiz im Genitalbereich bei bestehender AB-Therapie"