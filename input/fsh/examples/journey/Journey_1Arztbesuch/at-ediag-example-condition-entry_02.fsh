Instance: ConditionEntry02
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtliste"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code = #10351008

* code.coding[snomed].display = "Suppurative tonsillitis"

* subject = Reference(Patient)

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder = Reference(Practitioner)

* asserter = Reference(Practitioner)

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Schmerzen beim Schlucken"