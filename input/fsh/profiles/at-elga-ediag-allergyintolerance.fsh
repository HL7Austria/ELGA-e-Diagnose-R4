Profile: AtEdiagAllergyIntolerance
Parent: AllergyIntolerance
Id: at-elga-ediag-allergyintolerance
Title: "AT ELGA e-Diagnose AllergyIntolerance"
Description: "Dieses AllergyIntolerance-Profil passt die AllergyIntolerance-Resource für die Anforderungen der e-Diagnose an."

* ^status = #active
* . ^short = "AT e-Diagnose AllergyIntolerance"

* obeys allergy-status-combination

* implicitRules 0..0

* extension contains AtReported named reported 0..1 MS
* extension[reported] ^short = "True wenn diese Allergie fremdberichtet ist."

* extension contains AtElgaEdiagExtEnteredInError named entered-in-error 0..1 MS
* extension[entered-in-error] ^short = "Dokumentation des GDA der den Eintrag storniert hat."

// referenz auf befund, laborbefund, etc. - analog zu Condition.evidence.detail
* extension contains AtEdiagEvidence named evidence 0..* MS
* extension[evidence] ^short = "Verweis auf e-Befunde als medizinische Evidenz."

* modifierExtension 0..0

* insert AtEDiagIdentifierRuleSet

* clinicalStatus 1..1 MS
* clinicalStatus from AtEdiagAllergyIntoleranceClinicalStatusVS (required)
* clinicalStatus ^short = "Status der Allergie; mögliche Codes: active | resolved."

* verificationStatus 1..1 MS
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

* onset[x] 0..0
* onset[x] ^short = "Für e-Diagnose ist insbesondere der Beginn der Reaktion relevant."

* recordedDate 1..1 MS
* recordedDate ^short = "Dokumentationsdatum"

* recorder 1..1 MS
* recorder only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
)
* recorder ^short = "GDA, der die Allergie in der e-Diagnose erfasst bzw. dokumentiert hat."

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

// https://hub.kbv.de/spaces/ALDOK1X0X0/pages/375456332/Weitere+m%C3%B6gliche+Inhalte#Weiterem%C3%B6glicheInhalte-ArtderReaktion%2FzeitlicherVerlaufderReaktion
// codes noch aktualisieren/anders benennen
// extension soll verpflichtend ausgefüllt werden
* reaction.extension contains AtEdiagReactionTime named reactionTime 1..1 MS
* reaction.extension[reactionTime] ^short = "Zeitlicher Verlauf der Manifestation."

* reaction.modifierExtension 0..0

* reaction.substance 0..0
* reaction.substance ^short = "Wird über code abgebildet."

* reaction.manifestation 1..* MS
* reaction.manifestation from AtEDiagConditionCode
* reaction.manifestation ^short = "Aufgezeichnete klinische Symptome der allergischen Reaktion."

* reaction.description 0..0
* reaction.description ^short = "Weitere textuelle Eingaben sollen im Feld reaction.note.text dokumentiert werden."

* reaction.onset 0..1 MS
* reaction.onset ^short = "Beginn der Reaktion."

* reaction.note 0..1 MS
* reaction.note ^short = "Freitext zu Allergie und Intoleranzen als Zusatzinformation."
* reaction.note.author[x] 0..0
* reaction.note.author[x] ^short = "Wird über recorder abgebildet."
* reaction.note.time 0..0
* reaction.note.time ^short = "Wird über recordedDate abgebildet."
* reaction.note.text 1..1 MS
* reaction.note.text ^maxLength = 500

// Erlaubte Kombinationen clinicalStatus/verificationStatus
Invariant: allergy-status-combination
Description: "Erlaubte Kombinationen von clinicalStatus und verificationStatus: active mit unconfirmed, presumed oder confirmed; resolved mit refuted."
Severity: #error
Expression: "(clinicalStatus.coding.exists(code = 'active') and verificationStatus.coding.exists(code = 'unconfirmed' or code = 'presumed' or code = 'confirmed')) or (clinicalStatus.coding.exists(code = 'resolved') and verificationStatus.coding.exists(code = 'refuted'))"
