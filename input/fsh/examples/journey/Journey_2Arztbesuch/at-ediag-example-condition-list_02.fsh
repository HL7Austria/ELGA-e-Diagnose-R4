Instance: ConditionList02
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Zweiter Arztbesuch - fehlerhafter Eintrag)"
Description: "Beispiel einer Summary-Liste während des zweiten Arztbesuchs. Eine neue Diagnose wurde erfasst, die allerdings fehlerhaft ist und daher storniert werden muss."
Usage: #example

* meta.versionId = "3"

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* date = "2026-03-09T09:58:00+00:00"

* source = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* entry[0].item = Reference(ConditionEntry01)
* entry[1].item = Reference(ConditionEntry03)
