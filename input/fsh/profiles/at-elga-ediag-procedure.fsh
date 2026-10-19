Profile: AtEdiagProcedure
Parent: Procedure
Id: at-elga-ediag-procedure
Title: "AT ELGA e-Diagnose Procedure"
Description: "Dieses Procedure-Profil passt die Procedure-Resource für die Anforderungen der e-Diagnose an."

* ^status = #active
* . ^short = "AT e-Diagnose Procedure"

* implicitRules 0..0

* insert AtEDiagAsserterRuleSet

* extension contains AtReported named reported 0..1 MS
* extension[reported] ^short = "True wenn diese Prozedur fremdberichtet ist."

* extension contains AtElgaEdiagExtEnteredInError named entered-in-error 0..1 MS
* extension[entered-in-error] ^short = "Dokumentation des GDA der den Eintrag storniert hat."

* extension contains ExtensionProcedure_Recorded named recordedDate 1..1 MS
* extension[recordedDate] ^short = "Zeitpunkt der Dokumentation der Prozedur."

* modifierExtension 0..0

* insert AtEDiagIdentifierRuleSet

* basedOn 0..0
* basedOn ^short = "Anforderungen werden in der e-Diagnose nicht dokumentiert."

* partOf 0..0
* partOf ^short = "Hierarchische Dokumentation von Prozeduren werden in der e-Diagnose nicht unterstützt."

* status 1..1 MS
* status = #completed (exactly)
* status ^short = "Nur tatsächlich durchgeführte (completed) Prozeduren werden in der e-Diagnose dokumentiert."

* statusReason 0..0
* statusReason ^short = "Begründung für den Status der Prozedur nicht relevant."

* category 0..0
* category ^short = "Kategorisierungen von Prozeduren werden in der e-Diagnose nicht angewendet."

* code 1..1 MS
* code from AtEDiagProcedureCode (required)
* code ^short = "Prozedurencode der durchgeführten Prozedur; Freitext ist nicht zulässig."
* code.text 0..0
* code.text ^short = "Die ursprüngliche textuelle Eingabe soll im Feld note.text dokumentiert werden."
 
* subject 1..1 MS
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Person, auf die sich die Prozedur bezieht."

* encounter 0..0
* encounter ^short = "In e-Diagnose werden keine Behandlungskontakte dokumentiert."

* performed[x] 0..1 MS
* performed[x] only dateTime
* performed[x] ^short = "Zeitpunkt der Durchführung."

* recorder 1..1 MS
* recorder only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
)
* recorder ^short = "GDA, der die Prozedur in der e-Diagnose erfasst bzw. dokumentiert hat."

* asserter 0..1 MS
* asserter only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
    or HL7ATCorePatient
    or AtEdiagRelatedPerson
)
* asserter ^short = "Quelle der Information zur Prozedur, z. B. Patient, behandelnde Person oder Dritter."

* reasonCode 0..0
* reasonCode ^short = "Begründung für Prozedur wird nicht codiert erfasst."

* reasonReference 0..0
* reasonReference ^short = "Begründung für Prozedur in Form von Referenzen wird in e-Diagnose nicht unterstützt."

* report 0..* MS
* report ^short = "Verweis auf e-Befunde als medizinische Evidenz."
* report only Reference(MinimalDocumentReference)

* complication 0..0
* complication ^short = "Komplikation sollen in e-Diagnose nicht dokumentiert werden."

* complicationDetail 0..0
* complicationDetail ^short = "Komplikationen in Form von Referenzen werden in e-Diagnose nicht unterstützt."

* note 0..1 MS
* note ^short = "Freitext zur Diagnose als Zusatzinformation."
* note.author[x] 0..0
* note.author[x] ^short = "Wird über recorder abgebildet."
* note.time 0..0
* note.time ^short = "Wird über die recordedDate-Extension abgebildet."
* note.text 1..1 MS
* note.text ^maxLength = 500