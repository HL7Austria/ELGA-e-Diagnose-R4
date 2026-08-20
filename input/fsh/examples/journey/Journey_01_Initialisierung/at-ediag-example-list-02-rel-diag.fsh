Instance: ListExample02
InstanceOf: AtEdiagList
Title: "e-Diagnose-Liste mit einer relevanten Diagnose"
Usage: #example

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:list-02"

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-01T00:00:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(DiagnoseCurrentlyRelevantExample)