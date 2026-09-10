Instance: ConditionEntry04
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtliste"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #52643007

* code.coding[snomed].display = "Candidal balanitis"

* subject = Reference(Patient)

* recordedDate = "2026-03-09T00:00:00+00:00"

* recorder = Reference(Practitioner)

* asserter = Reference(Practitioner)

* onsetDateTime = "2026-03-09"

* note.text = "Juckreiz im Genitalbereich bei bestehender AB-Therapie"