Profile: AtEdiagProcedure
Parent: Procedure
Id: at-elga-ediag-procedure
Title: "AT ELGA e-Diagnose Procedure"
Description: "Das AT e-Diagnose Procedure-Profil leitet sich vom Procedure-Profil ab und passt dieses für die Anforderungen der e-Diagnose an."
* ^status = #active
* . ^short = "AT e-Diagnose Procedure"
 
// EHE einfach überall eine extension für reported mit boolean
// fremddiagnose
// reported in R6 dazugekommen
// forward extension -> EHE einfach überall eine extension für reported mit boolean
* extension contains AtReported named reported 0..1

* extension contains AtElgaEdiagExtEnteredInError named entered-in-error 0..1

* identifier 0..* 
* identifier ^short = "Zuordnung der Diagnose in einem internen Dokumentationssystem."

* instantiatesCanonical 0..0
* instantiatesCanonical ^short = "Verweis auf eine standardisierte FHIR-Ressource, ein Template oder einen Leitfaden, der beschreibt, wie die Prozedur durchgeführt werden soll."

* instantiatesUri 0..0
* instantiatesUri ^short = "Verweis auf ein externes Dokument."

* basedOn 0..0
* basedOn ^short = "Verweis auf eine Anforderung."

* partOf 0..0
* partOf ^short = "Verweis der Ressource auf eine andere, übergeordnete Ressource."

* status 1..1 MS
* status = #completed (exactly)
* status ^short = "Nur tatsächlich durchgeführte (completed) Prozeduren werden in der e-Diagnose dokumentiert."

* statusReason 0..0
* statusReason ^short = "Begründung für den Status der Prozedur nicht relevant."

// wäre überkategorie von code
* category 0..0
* category ^short = "Kategorisierung nach Verfahren."

* code 1..1 MS
* code from AtEDiagProcedureCode (required)
* code ^short = "Prozedurencode der durchgeführten Prozedur."
* code.text 0..0
 
* subject 1..1 MS
* subject only Reference(HL7ATCorePatient)
* subject ^short = "Person, auf die sich die Prozedur bezieht."

* encounter 0..0
* encounter ^short = "Behandlungskontakt."

// Was ist wenn es der Patient nicht genau weiß? https://build.fhir.org/ig/hl7-eu/base/StructureDefinition-procedure-eu-core.html
// Procedure (EU core) - HL7 Europe Base and Core FHIR IG v2.0.0
// SGR: 2026_04_23_wir belassen es optional und schauen uns bis zum Ballot an, was die EU zu dem Zeitpunkt vorgibt
* performed[x] 0..1
* performed[x] only dateTime
* performed[x] ^short = "Zeitpunkt der Durchführung."

* recorder 1..1 MS
* recorder only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
)
* recorder ^short = "GDA, der die Prozedur eingetragen bzw. dokumentiert hat."


* asserter 0..1
* asserter only Reference(
    HL7ATCorePractitioner
    or HL7ATCorePractitionerRole
    or HL7ATCorePatient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Quelle der Information zur Prozedur (z. B. behandelnde Person, Patient oder Dritter)."

// soll erst in einer neuen version von e-diagnose berücksichtigt werden
// in erster version noch nicht relevant
* performer 0..0
* performer ^short = "Person, die die Prozedur durchgeführt hat."

// soll erst in einer neuen version von e-diagnose berücksichtigt werden (e-befund neu)
// in erster version noch nicht relevant
* location 0..0
* location ^short = "Durchführungsort."

// potential für unbegrenzte komplexität
* reasonCode 0..0
* reasonCode ^short = "Code des medizinischen Grundes für die Durchführung der Prozedur."

// potential für unbegrenzte komplexität
* reasonReference 0..0
* reasonReference ^short = "Begründung für die Durchführung der Prozedur; Verweis auf eine andere Ressource wie z.B. Condition oder Observation."

// grundsätzlich interessant
// potentielle überdeckung mit dem code
// ggf. konsistenzproblem (code, bodysite), wenn mans codiert ists kompliziert
// außer es kommen konkrete anforderungen; sonst als freitext
* bodySite 0..0
* bodySite ^short = "Betroffene Körperstelle."

* outcome 0..0
* outcome ^short = "Ergebnis der Prozedur."

// vergleichbar mit evidence in condition
// verlinkte entlassbriefe könnten ggf. mal nicht mehr erreichbar sein (20 jahre aufbehaltungspflicht)
// 2026_04_23_MBU URL, um einen Mehrwert zu haben. Damit der pdf-Friedhof aufhört, sondern eine saubere Lösung mittels URL, auf genau die DokuementenID 
// ToDo: Wie macht man das?
* report 0..*
* report ^short = "Verweis auf ELGA-Befunde als medizinische Evidenz."

// e-diagnose ist keine op-berichts-dokumentationssystem
* complication 0..0
* complication ^short = "Komplikation während dem Eingriff."

* complicationDetail 0..0
* complicationDetail ^short = "Diagnose, die durch die durchgeführte Prozedur entstanden ist."

* followUp 0..0
* followUp ^short = "Nachkontrolle (Code)."

* note 0..1
// note.autor und .time werden 0..0
// note.text soll eine Zeichenbeschränkung bekommen (TBD)
// 2026_04_23 500 ausreichend. Es ist eine Freitextergänzung zum SNOMED Textes (schlecht eingestellter - zur Ergänzung zu DD) nicht * sondern nur 1 bei Bedarf
* note.author[x] 0..0
* note.time 0..0
// https://www.hl7.org/fhir/elementdefinition-definitions.html#ElementDefinition.maxLength
// * note.text ^maxLength = 500
* note ^short = "Freitext zur Prozedur als Zusatzinformation."

* focalDevice 0..0
* focalDevice ^short = "Gerät, das zur Durchführung der Prozedur verwendet wurde."

* usedReference 0..0
* usedReference ^short = "Verweis auf während der Prozedur verwendete Materialien, z. B. Medikamente."

* usedCode 0..0
* usedCode ^short = "Code der während der Prozedur verwendeten Materialien."