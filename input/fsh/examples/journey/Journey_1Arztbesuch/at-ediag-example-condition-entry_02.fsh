Instance: ConditionEntry02
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose für die Gesamtliste"
Description: "Beispiel Diagnose, aktuelle Beschwerden des Patienten"
Usage: #example

* extension[AtReported].valueBoolean = true

* clinicalStatus = $condition-clinical#active

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* code.coding[0] = http://snomed.info/sct#10351008 "Suppurative tonsillitis"

* subject = Reference(PatientExample)

* recordedDate = "2026-03-03T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Schmerzen beim Schlucken"