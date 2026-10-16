Instance: AllergyListEmpty
InstanceOf: AtEdiagList
Title: "Allergy-Summary-Liste (notstarted)"
Description: "Initiale Summary-Liste ohne Summary-Einträge (Allergy)."
Usage: #example

* meta.versionId = "1"

* status = #current
* mode = #working
// Problem List / general clinical items
* code = $cs-loinc#48765-2
* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="
* date = "2026-03-03T08:00:00+00:00"
* source = Reference(DeviceExample)
* emptyReason = $cs-list-empty-reason#notstarted "Not Started"