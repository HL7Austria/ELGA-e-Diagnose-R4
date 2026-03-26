Profile: AtEdiagAllergyIntolerance
Parent: AtApsAllergyIntolerance
Id: at-ediag-allergyintolerance
Title: "AT e-Diagnose AllergyIntolerance"
Description: "Das AT e-Diagnose AllergyIntolerance-Profil leitet sich vom AT APS AllergyIntolerance-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose AllergyIntolerance"

* identifier 0..0
* identifier ^short = "Zuordnung der Allergie in einem internem Dokumentationssystem"

* clinicalStatus 0..1
* code only CodeableConcept
* clinicalStatus ^short = "Ist eine Allergie aktiv, inaktiv,.. - werden vergangene Allergien festgehalten, fachlich klären"

* verificationStatus 1..1 
* verificationStatus only CodeableConcept
* verificationStatus ^short = "Ist die Allergie bestätigt, unbestätigt, widerlegt"

* type 0..0
* type ^short = "Identifikation ob es eine Allergie oder Intoleranz ist"

* category 0..0
* category ^short = "Differenzierung nach Kontext - Medikamente, Lebensmittel, Umwelt,.. - falls nur med. rele. dann ist es nicht notwendig, fachlich klären"

* criticality 0..0
* criticality ^short = "Einschätzung der Schwere (Anaphylaxie)"

* code 1..1
* code only CodeableConcept
* code ^short = "Allergiecode, Text verboten"

* code.text 0..0

* code.coding 1..1

* patient 1..1
* patient only Reference(AtEdiagPatient)
* patient ^short = "Person, auf die sich die Allergie bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

* onset[x] 0..1
* onset[x] only dateTime 
* onset[x] ^short = "Erstes Aufzeichnungsdatum der Allergie(symptomatik)"

* recordedDate 1..1
* recordedDate ^short = "Dokumentationsdatum"

* recorder 1..1
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* recorder ^short = "Person, die die Allergie eingetragen hat"

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Person (fachliche Quelle), die die Allergie bestätigt"

* lastOccurrence 0..0
* lastOccurrence ^short = "Letztes Auftreten der Symptomatik - siehe manifestation"

* note 0..0
* note only Annotation
* note ^short = "Zusätzliche Informationen oder Freitext zur Allergie wird in reaction.description beschrieben oder ist ein zweites Textfeld nötig - fachlich klären"

* reaction 1..1
* reaction ^short = "Details über die Allergiereaktion, verlinkt zum Auslöser/Substanz -  bestätigt das Vorhandensein einer Allergie"

* reaction.substance 0..0
* reaction.substance ^short = "Spezifische Substanz die zur Allergie führt, wird in reaction gelöst"

* reaction.manifestation 1..*
* reaction.manifestation only CodeableConcept
* reaction.manifestation ^short = "Aufgezeichnete klinische allergische Symptome"

* reaction.extension contains AtEdiagReactionTime named reactionTime 0..1
* reaction.extension[reactionTime] ^short = "Zeitlicher Verlauf der Manifestation"

* reaction.description 0..1
* reaction.description = "Textbasierte Zusammenfassung der allergischen Reaktion"

* reaction.severity 0..0
* reaction.severity ^short = "Beschreibt ob die Reaktion mild, moderat,... war"

* reaction.exposureRoute 0..0
* reaction.exposureRoute ^short = "Art der Exposition der betroffenen Person gegenüber der Substanz"






