Profile: AtEdiagCondition
Parent: AtApsCondition
Id: at-ediag-condition
Title: "AT e-Diagnose Condition Diagnosen"
Description: "Das AT APS-Profil für die Condition-Ressource Diagnosen berücksichtigt zum einen die österreichischen Vorgaben (z.B. Patient und zu verwendende Value-Sets) und stellt andererseits die Konformität gegenüber dem IPS-Profil sicher, indem die so genannte [`imposeProfile`](http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile)-Erweiterung verwendet wird."
* ^status = #active
* . ^short = "AT e-Diagnose Condition Diagnosen"
* identifier 0..0
* identifier ^short = "Zuordnung der Diagnose in einem internem Dokumentationssystem"

* clinicalStatus 1..1
* code only CodeableConcept
* clinicalStatus ^short = "Klinischer Status der Diagnose - Status post"

* verificationStatus 1..1 
* verificationStatus only CodeableConcept
* verificationStatus ^short = "Status der Diagnose: vorläufig, differential,..."

* category 0..0
* category ^short = "Differenzierung nach Kontext - wird meta.tag gelöst"

* severity 0..0
* severity ^short = "Schweregrad der Erkrankung"

* code 1..1
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

* subject 1..1
* subject only Reference(AtEdiagPatient)
* subject ^short = "Person, auf die sich die Diagnose bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

* onset[x] 0..1
* onset[x] only dateTime 
* onset[x] ^short = "Beginn der Erkrankung/Diagnosezeitpunkt"

* abatement[x] 0..1
* abatement[x] only dateTime 
* abatement[x] ^short = "Ende der Erkrankung"

* recordedDate 1..1
* recordedDate only dateTime
* recordedDate ^short = "Zeitpunkt der Diagnosendokumentation"

* recorder 1..1
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* recorder ^short = "Person, die die Diagnose eingetragen hat"

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Person (fachliche Quelle), die die Diagnose bestätigt"

* stage 0..0
* stage ^short = "Stadium der Erkrankung"

* evidence 0..1
* evidence ^short = "Medizinischer Nachweis (Ergebnis, Labor, Befund)"

* note 0..1
* note only Annotation
* note ^short = "Zusätzliche Informationen oder Freitext zur Diagnose."

* meta.tag ^slicing.discriminator[+].type = #value
* meta.tag ^slicing.discriminator[=].path = "$this"
* meta.tag ^slicing.rules = #open
//code -> required pattern
//code.coding -> fixed value
//code.coding.system-> fixed value
//code.coding.code -> fixed value
* meta.tag contains diagnosisType 1..1
* meta.tag[diagnosisType] from AtEdiagDiagnosisTypeVS (required)