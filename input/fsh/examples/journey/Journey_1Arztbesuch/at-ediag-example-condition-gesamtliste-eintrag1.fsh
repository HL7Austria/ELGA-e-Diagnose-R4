Instance: ConditionGesamtlisteExample1
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

* subject = Reference(PatientExample)

* recordedDate = "2026-03-01T00:00:00+00:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* onsetDateTime = "2026-02-28"

* note.text = "Temperatur >38.5, Gliederschmerzen"