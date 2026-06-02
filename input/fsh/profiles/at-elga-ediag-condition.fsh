Profile: AtEdiagCondition
Parent: Condition
Id: at-elga-ediag-condition
Title: "AT e-Diagnose Condition Diagnosen"
Description: "Das AT e-Diagnose Condition-Profil leitet sich vom Condition-Profil ab und passt dieses für die Anforderungen der e-Diagnose an."
* ^status = #active
* . ^short = "AT e-Diagnose Condition Diagnosen"

// EHE einfach überall eine extension für reported mit boolean
// ob es sich um eine Fremddiagnose handelt wird durch extension für reported mit boolean gelöst
* extension contains AtReported named reported 0..1

// für meta.tag neues template angelegt - ruleSet-at-ediag-meta-tag.fsh
* insert MetaTagDiagnosisType

* identifier 0..0
* identifier ^short = "Zuordnung der Diagnose in einem internem Dokumentationssystem"

// 2026_05_18_Begriff: Klinischer Status der Diagnose- bei Änderungen Anja Schwab Bescheid geben!!!
* clinicalStatus 1..1 MS
* code only CodeableConcept
* clinicalStatus ^short = "Klinischer Status der Diagnose (wie:Status post), 
mögliche Codes: active | recurrence | relapse | inactive | remission | resolved"

* verificationStatus 1..1 MS
* verificationStatus only CodeableConcept
* verificationStatus ^short = "Status der Diagnose, mögliche Codes: unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"

* category 0..0
* category ^short = "Differenzierung nach Kontext - wird meta.tag gelöst"

* severity 0..0
* severity ^short = "Schweregrad der Erkrankung"


//"Condition.code.text wird 0..0 (es soll keinen Freitext zum Code geben)
// Condition.code.coding wird 1..2
// Condition.code.coding[1].system wird auf snomed fixiert
// Condition.code.coding[2].system wird auf orphanet fixiert
// https://hl7.org/fhir/R4/datatypes.html#CodeableConcept"
* code 1..1 MS
* code only CodeableConcept
* code ^short = "Diagnosecode (Codierservice), Text verboten, Codesystem 1.SNOMED 2.Orphanet"

* code.text 0..0

* code.coding 1..2

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #closed
* code.coding ^slicing.ordered = false

* code.coding contains
    snomed 1..1 and
    orphanet 0..1

* code.coding[snomed].system 1..1
* code.coding[snomed].system = "http://snomed.info/sct" (exactly)
* code.coding[snomed].code 1..1

* code.coding[orphanet].system 1..1
* code.coding[orphanet].system = "http://www.orpha.net/ORDO" (exactly)
* code.coding[orphanet].code 1..1

* bodySite 0..0
* bodySite ^short = "Zuordnung der Diagnose der Körper-Lokalisation"

* subject 1..1 MS
* subject only Reference(AtElgaCorePatient)
* subject ^short = "Person, auf die sich die Diagnose bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

// dateTime
* onset[x] 0..1
* onset[x] only dateTime 
* onset[x] ^short = "Beginn der Erkrankung/Diagnosezeitpunkt"

// dateTime
* abatement[x] 0..1
* abatement[x] only dateTime 
* abatement[x] ^short = "Ende der Erkrankung"

* recordedDate 1..1 MS
* recordedDate only dateTime
* recordedDate ^short = "Zeitpunkt der Diagnosendokumentation"

* recorder 1..1 MS
* recorder only Reference (
    AtElgaCorePractitioner
    or AtElgaCorePractitionerRole
)
* recorder ^short = "Ansonsten Gesundheitsdiensteanbieter, der die Diagnose eingetragen hat"


* asserter 0..1
* asserter only Reference (

    AtElgaCorePractitioner
    or AtElgaCorePractitionerRole
    or AtElgaCorePatient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Quelle der Information zur Diagnose (z. B. behandelnde Person, Patient oder Dritter)"

* stage 0..0
* stage ^short = "Stadium der Erkrankung"

// muss profiliert werden für .detail (Reference) als Link auf 
// ELGA-Befunde = Metadaten werden eingetragen
// verlinkte entlassbriefe könnten ggf. mal nicht mehr erreichbar sein (20 jahre aufbehaltungspflicht)
// ToDo; muss noch erarbeitet werden

* evidence 0..*
//* evidence.detail only Reference(ELGABefund)
* evidence ^short = "Verweis auf ELGA-Befunde als medizinische Evidenz"


// https://www.hl7.org/fhir/elementdefinition-definitions.html#ElementDefinition.maxLength
// * note.text ^maxLength = 500
// 2026_04_23 500 ausreichend. Es ist eine Freitextergänzung zum SNOMED Textes (schlecht eingestellter - zur Ergänzung zu DD) nicht * sondern nur 1 bei Bedarf
* note 0..1
* note.author[x] 0..0
* note.time 0..0
* note ^short = "Freitext zur Diagnose für Zusatzinformation"