Instance: ProcedureExample
InstanceOf: AtEdiagProcedure
Title: "Beispiel Prozedur"
Description: "Beispielinstanz einer Prozedur"
Usage: #example

* meta.profile = "https://fhir.hl7.at/elga/ediag/r4/StructureDefinition/at-ediag-procedure"

* meta.tag[diagnosisType] = https://fhir.hl7.at/elga/ediag/r4/CodeSystem/at-ediag-diagnose-type#relevant "currently relevant"

* extension[reported].valueBoolean = false

* status = #completed


// Coloskopie 
* code = http://snomed.info/sct#73761001 "Coloskopie"

* subject = Reference(PatientExample)

* performedDateTime = "2026-04-20T09:30:00+02:00"

* recorder = Reference(PractitionerExample)

* asserter = Reference(PractitionerExample)

* note.text = "Diagnostische Coloskopie. Histologiebefund ausständig"