Profile: AtEdiagCondition
Parent: AtApsCondition
Id: at-ediag-condition
Title: "AT e-Diagnose Condition Diagnosen"
Description: "Das AT APS-Profil für die Condition-Ressource Diagnosen berücksichtigt zum einen die österreichischen Vorgaben (z.B. Patient und zu verwendende Value-Sets) und stellt andererseits die Konformität gegenüber dem IPS-Profil sicher, indem die so genannte [`imposeProfile`](http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile)-Erweiterung verwendet wird."
* ^status = #active
* . ^short = "AT e-Diagnose Condition Diagnosen"
* subject 1..1
* subject only Reference(AtEdiagPatient)
* subject ^short = "Der Patient, auf den sich die Diagnose bezieht."

* code 1..1 
* code only CodeableConcept
* code ^short = "Diagnosecode (Codierservice)."

* verificationStatus 1..1 
* verificationStatus only CodeableConcept
* verificationStatus ^short = "Status der Diagnose: vorläufig, differential, falsch. Beschreibt, ob die Diagnose bestätigt wurde oder nicht."

* onset[x] 0..1
* onset[x] only dateTime or Age or Period or Range or string
* onset[x] ^short = "Beginn der Erkrankung / Diagnosezeitpunkt. Optional, falls bekannt."

* abatement[x] 0..1
* abatement[x] only dateTime or Age or Period or Range or string 
* abatement[x] ^short = "Ende der Erkrankung. Optional, akut/dauer differenziert."

* recordedDate 1..1
* recordedDate only dateTime
* recordedDate ^short = "Zeitpunkt der Dokumentation der Diagnose."

* recorder 0..1
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* recorder ^short = "Person, die die Symptome/Diagnose wahrgenommen hat. Kann Patient oder medizinisches Personal sein."

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Verantwortliche Person für die Diagnosestellung."

* note 0..*
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
* meta.tag[diagnosisType] from AtEdiagDiagnosisType (required)