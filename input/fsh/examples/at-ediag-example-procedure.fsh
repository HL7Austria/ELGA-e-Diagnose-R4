Instance: ProcedureExample
InstanceOf: AtEdiagProcedure
Title: "Beispiel Prozedur"
Description: "Beispielinstanz einer Prozedur"
Usage: #example

* meta.profile = "http://example.org/fhir/StructureDefinition/at-ediag-procedure"

* meta.tag[diagnosisType].system = "http://hl7.org/fhir/CodeSystem/at-ediag-diagnose-type"
* meta.tag[diagnosisType].code = #relevant
* meta.tag[diagnosisType].display = "currently relevant"

* extension[reported].valueBoolean = false

* status = http://hl7.org/fhir/event-status#completed

// Coloskopie 
* code = http://snomed.info/sct#73761001 "Coloskopie"

* subject = Reference(PatientExample)

* performedDateTime = "2026-04-20T09:30:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* note.text = "Diagnostische Coloskopie. Histologiebefund ausständig"