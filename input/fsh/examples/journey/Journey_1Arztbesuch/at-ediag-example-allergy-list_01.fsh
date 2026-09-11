Instance: AllergyList01
InstanceOf: AtEdiagList
Title: "Allergie Summary-Liste mit einem Summary-Eintrag"
Description: "Beispiel einer Summary-Liste mit einem Eintrag, der auf eine Allergie verweist."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#48765-2

* subject = Reference(PatientExample)

* date = "2026-03-03T00:00:00+00:00"

* source = Reference(Practitioner)

* entry[0].item = Reference(AllergyEntry01) 