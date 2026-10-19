Instance: RelatedPersonMotherInline
InstanceOf: AtEdiagRelatedPerson
Usage: #inline

* id = "mutter"
* active = true
* patient = Reference(PatientExample)
* relationship.text = "Mutter"
* name.text = "Maria Musterfrau"

Instance: ConditionEntryContainedRelatedPerson
InstanceOf: AtEdiagCondition
Title: "Beispielinstanz einer Diagnose mit eingebetteter Bezugsperson"
Description: "Beispiel Diagnose, deren Information von einer Bezugsperson (Mutter) stammt, die als contained RelatedPerson eingebettet ist."
Usage: #example

* contained[0] = RelatedPersonMotherInline

* extension[reported].valueBoolean = true

* identifier[0].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[=].value = "1240"

* clinicalStatus = $condition-clinical#active

* code.coding[0] = $cs-sct#10351008 "Suppurative tonsillitis"

* subject = Reference(PatientExample)
  * identifier[0]
    * system = "urn:oid:1.2.40.0.10.2.1.1.149"
    * value = "GH:oeLdSEb0l+8kSdJWjOYyYmnYki0="

* recordedDate = "2026-03-03T08:08:00+00:00"

* recorder = Reference(PractitionerExample)
  * identifier[0]
    * system = "urn:ietf:rfc:3986"
    * value = "urn:oid:1.2.40.0.34.99.4613.4"

* asserter = Reference(mutter)

* onsetDateTime = "2026-02-28"
