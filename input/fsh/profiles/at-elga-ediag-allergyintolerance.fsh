Profile: AtEdiagAllergyIntolerance
Parent: AllergyIntolerance
Id: at-elga-ediag-allergyintolerance
Title: "AT ELGA e-Diagnose AllergyIntolerance"
Description: "Dieses AllergyIntolerance-Profil passt die AllergyIntolerance-Resource für die Anforderungen der e-Diagnose an."

* ^status = #active
* . ^short = "AT e-Diagnose AllergyIntolerance"

* implicitRules 0..0
* modifierExtension 0..0

* obeys allergy-status-combination

// EHE einfach überall eine extension für reported mit boolean
* extension contains AtReported named reported 0..1 MS

* extension contains AtElgaEdiagExtEnteredInError named entered-in-error 0..1 MS

* insert AtEDiagIdentifierRuleSet

// erfolgreiche desensibilisierung dokumentieren? oder selbst weggegangene allergien?
// löschen von bereits dokumentierten eher nicht, sondern status setzen
// invarianten in zshg mit verificationstatus sobald fachlich geklärt

// SGR: invariante-Bsp siehe Ende Profil
// 2026_04_29_ Status 1..1 gesetzt, synchrone zur Condition
* clinicalStatus 1..1 MS
* code only CodeableConcept
* clinicalStatus from AtEdiagAllergyIntoleranceClinicalStatusVS (required)
* clinicalStatus ^short = "Status der Allergie; mögliche Codes: active | resolved."

// "presumed" in R5 ist großer wunsch von MBU - wie könnte das abgebildet werden? MBU redet mit allergologen, ob wirklich notwendig
// um das abzubilden, müssten wir unconfirmed auswählen und zusätzlich presumed um das abzubilden
// "refuted" ist laut MBU auch relevant
// kardinalität von clinicalStatus & verificationStatus muss noch erarbeitet werden
// siehe https://jira.hl7.org/browse/FHIR-54914

// 2026_04_23: MBU ist nicht geklärt. Wir machen R4 und keine andere Version. Wir glauben nicht der erfassenden Person, sondern zwingen sie zu einer genaueren Doku durch reaction
// eigenen Termin zur Statustabelle - Anforderung geht an die Anwenungsmanager
// 2026-06_ToDo: Klären der Kardinalität? Optional?
* verificationStatus 1..1 MS
* verificationStatus only CodeableConcept
* verificationStatus from AtEdiagAllergyIntoleranceVerificationStatusVS (required)
* verificationStatus ^short = "Verifizierungsstatus der Allergie; mögliche Codes: unconfirmed | presumed | confirmed | refuted."

* type 0..0
* type ^short = "Unterscheidung zwischen Allergie und Intoleranz fachlich oft nicht einfach. Für die e-Diagnose insofern nicht relevant."

* category 0..0
* category ^short = "Unterscheidung zwischen Kategorien wird über den code abgebildet. Für die e-Diagnose insofern nicht relevant."

* criticality 0..0
* criticality ^short = "Value-Set mit beschränkter Aussagekraft. Für die e-Diagnose insofern nicht relevant."

* code 1..1 MS
* code from AtEDiagAllergyIntoleranceCode (required)
* code ^short = "Allergiecode"
* code.text 0..0
* code.text ^short = "Die ursprüngliche textuelle Eingabe soll im Feld reaction.note.text dokumentiert werden."

* patient 1..1 MS
* patient only Reference(HL7ATCorePatient)
* patient ^short = "Betroffene Person, auf die sich die Allergie bezieht."

* encounter 0..0
* encounter ^short = "In e-Diagnose werden keine Behandlungskontakte dokumentiert."

// beginn der allergie wohl nicht bekannt
// beginn der reaction kann sehr wohl bekannt sein, wird deshalb nur reaction.onset dokumentiert
* onset[x] 0..0
* onset[x] ^short = "Für e-Diagnose ist insbesondere der Beginn der Reaktion relevant."

* recordedDate 1..1 MS
* recordedDate only dateTime 
* recordedDate ^short = "Dokumentationsdatum."

// analog zu procedure, kein patient keine related person
* recorder 1..1 MS
* recorder only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
)
* recorder ^short = "GDA, der die Allergie im System erfasst bzw. dokumentiert hat."

* asserter 0..1 MS
* asserter only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
    or HL7ATCorePatient
    or RelatedPerson
)
* asserter ^short = "Quelle der Information zur Allergie, z. B. Patient, behandelnde Person oder Dritter."

* lastOccurrence 0..0
* lastOccurrence ^short = "Es wird nur eine Reaktion dokumentiert, weshalb dieses Datum gleichbedeutend mit reaction.onset ist."

* note 0..0
* note ^short = "Weitere textuelle Eingaben sollen im Feld reaction.note.text dokumentiert werden."

* reaction 1..1 MS
* reaction ^short = "Details zur allergischen Reaktion."

* reaction.modifierExtension 0..0

* reaction.substance 0..0
* reaction.substance ^short = "Wird über code abgebildet."

// ggf. pflicht in snomed
* reaction.manifestation 1..* MS
* reaction.manifestation only CodeableConcept
* reaction.manifestation ^short = "Aufgezeichnete klinische Symptome der allergischen Reaktion."

// https://hub.kbv.de/spaces/ALDOK1X0X0/pages/375456332/Weitere+m%C3%B6gliche+Inhalte#Weiterem%C3%B6glicheInhalte-ArtderReaktion%2FzeitlicherVerlaufderReaktion
// codes noch aktualisieren/anders benennen
// extension soll verpflichtend ausgefüllt werden
* reaction.extension contains AtEdiagReactionTime named reactionTime 1..1 MS
* reaction.extension[reactionTime] ^short = "Zeitlicher Verlauf der Manifestation."


* reaction.description 0..0
* reaction.description ^short = "Weitere textuelle Eingaben sollen im Feld reaction.note.text dokumentiert werden."

* reaction.onset 0..1 MS
* reaction.onset only dateTime 
* reaction.onset ^short = "Beginn der Reaktion."

* reaction.note 0..1 MS
* reaction.note ^short = "Freitext zu Allergie und Intoleranzen als Zusatzinformation."
* reaction.note.author[x] 0..0
* reaction.note.author[x] ^short = "Wird über recorder abgebildet."
* reaction.note.time 0..0
* reaction.note.time ^short = "Wird über recordedDate abgebildet."
* reaction.note.text 1..1 MS
* reaction.note.text ^maxLength = 500

// referenz auf befund, laborbefund, etc. - analog zu Condition.evidence.detail
* extension contains AtEdiagEvidence named evidence 0..* MS
* extension[evidence] ^short = "Verweis auf e-Befunde als medizinische Evidenz."

// Erlaubte Kombinationen clinicalStatus/verificationStatus, siehe workflowmanagement.md
Invariant: allergy-status-combination
Description: "Erlaubte Kombinationen von clinicalStatus und verificationStatus: active mit unconfirmed, presumed oder confirmed; resolved mit refuted."
Severity: #error
Expression: "(clinicalStatus.coding.exists(code = 'active') and verificationStatus.coding.exists(code = 'unconfirmed' or code = 'presumed' or code = 'confirmed')) or (clinicalStatus.coding.exists(code = 'resolved') and verificationStatus.coding.exists(code = 'refuted'))"
