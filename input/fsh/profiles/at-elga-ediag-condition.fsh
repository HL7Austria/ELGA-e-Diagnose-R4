Profile: AtEdiagCondition
Parent: Condition
Id: at-elga-ediag-condition
Title: "AT e-Diagnose Condition"
Description: "Dieses Condition-Profil passt die Condition-Resource für die Anforderungen der e-Diagnose an."

* ^status = #active
* . ^short = "AT e-Diagnose Condition"

* obeys condition-status-combination

* implicitRules 0..0

* insert AtEDiagAsserterRuleSet

* extension contains AtEdiagExtReported named reported 0..1 MS
* extension[reported] ^short = "True wenn diese Diagnose fremdberichtet ist."

* extension contains AtEdiagExtEnteredInError named entered-in-error 0..1 MS
* extension[entered-in-error] ^short = "Dokumentation des GDA der den Eintrag storniert hat."

* modifierExtension 0..0

* insert AtEDiagIdentifierRuleSet

* clinicalStatus 1..1 MS
* clinicalStatus from AtEdiagConditionClinicalStatus (required)
* clinicalStatus ^short = "Status der Diagnose; mögliche Codes: active | inactive."

* verificationStatus 0..1 MS
* verificationStatus from AtEdiagConditionVerificationStatus (required)
* verificationStatus ^short = "Verifizierungsstatus der Diagnose, mögliche Codes: provisional | differential | refuted."

* category 0..0
* category ^short = "Diagnosen werden dadurch kategorisiert, ob eine Diagnose Teil der Summary-Liste ist oder nicht."

* code 1..1 MS
* code from AtEDiagConditionCode (required)
* code ^short = "Diagnosecode (Codierservice); Freitext ist nicht zulässig."
* code.text 0..0
* code.text ^short = "Die ursprüngliche textuelle Eingabe soll im Feld note.text dokumentiert werden."

* subject 1..1 MS
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Person, auf die sich die Diagnose bezieht."

* encounter 0..0
* encounter ^short = "In e-Diagnose werden keine Behandlungskontakte dokumentiert."

* onset[x] 0..1 MS
* onset[x] only dateTime 
* onset[x] ^short = "Beginn der Erkrankung bzw. Diagnosezeitpunkt."

* abatement[x] 0..1 MS
* abatement[x] only dateTime 
* abatement[x] ^short = "Ende der Erkrankung."

* recordedDate 1..1 MS
* recordedDate ^short = "Zeitpunkt der Dokumentation der Diagnose."

* recorder 1..1 MS
* recorder only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
)
* recorder ^short = "GDA, der die Diagnose in der e-Diagnose erfasst bzw. dokumentiert hat."

* asserter 0..1 MS
* asserter only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
    or HL7ATCorePatient
    or AtEdiagRelatedPerson
)
* asserter ^short = "Quelle der Information zur Diagnose, z. B. Patient, behandelnde Person oder Dritter."

* evidence 0..* MS
* evidence ^short = "Verweis auf e-Befunde als medizinische Evidenz."
  * detail 1..* MS
  * detail only Reference(MinimalDocumentReference)
    * ^short = "Verweis auf e-Befunde als medizinische Evidenz."

* note 0..1 MS
* note ^short = "Freitext zur Diagnose als Zusatzinformation."
* note.author[x] 0..0
* note.author[x] ^short = "Wird über recorder abgebildet."
* note.time 0..0
* note.time ^short = "Wird über recordedDate abgebildet."
* note.text 1..1 MS
* note.text ^maxLength = 500

// Erlaubte Kombinationen clinicalStatus/verificationStatus
Invariant: condition-status-combination
Description: "Erlaubte Kombinationen von clinicalStatus und verificationStatus: active mit provisional, differential oder ohne verificationStatus; inactive mit refuted oder ohne verificationStatus."
Severity: #error
Expression: "verificationStatus.exists() implies ((verificationStatus.coding.exists(code = 'provisional' or code = 'differential') and clinicalStatus.coding.exists(code = 'active')) or (verificationStatus.coding.exists(code = 'refuted') and clinicalStatus.coding.exists(code = 'inactive')))"
