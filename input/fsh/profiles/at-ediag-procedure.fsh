Profile: AtEdiagProcedure
Parent: AtApsProcedure
Id: at-ediag-procedure
Title: "AT e-Diagnose Procedure"
Description: "Das AT e-Diagnose Procedure-Profil leitet sich vom AT APS Procedure-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose Procedure"
 
// EHE einfach überall eine extension für reported mit boolean
* extension contains AtReported named reported 0..1

* identifier 0..0
* identifier ^short = "Zuordnung der Diagnose in einem internem Dokumentationssystem"

* instantiatesCanonical 0..0
* instantiatesCanonical ^short = "Verweis auf eine standardisierte FHIR-Ressource, ein Template oder einen Leitfaden, der beschreibt, wie die Prozedur durchgeführt werden soll"

* instantiatesUri 0..0
* instantiatesUri ^short = "Verweis auf ein externes Dokument"

* basedOn 0..0
* basedOn ^short = "Verweis auf eine Anforderung"

* partOf 0..0
* partOf ^short = "Verweis der Ressource auf eine andere, übergreordnete Ressource"

// es wird kein workflow abgebildet
// bei therapien, die inprogress sein könnten - potentiell eher nicht
// abgrenzung zu behandlungsplan / physiotherapie
// es sollen stattgefundene procedures abgebildet werden
// --> completed, entered-in-error

//SGR: die Einschränkung erfolgt über ein eigenes ValueSet (procedure-status) und required binding
* status 1..1 MS
* status from AtEdiagProcedureStatus (required)
* status ^short = "Nur tatsächlich durchgeführte (completed) oder irrtümlich dokumentierte (entered-in-error) Prozeduren"

// korrekturvermerk ist noch in abstimmung in digimed, wird von dort dann übernommen
// was ist korrigieren, stornieren, fachlich korrekturvermerk
* statusReason 0..1
* statusReason ^short = "ToDo: Korrekturvermerk wird von digimed übernommen, ist noch in Abstimmung"

// wäre überkategorie von code, 
* category 0..0
* category ^short = "Kategorisierung nach Verfahren"

// IPS Free Set enthält nur 983 konzepte
// eigenes value set, um alle procedures abzudecken (mit ausnahme derer, die in IPS entfernt wruden)

// SGR: die Einschränkung erfolgt über ein eigenes ValueSet (procedure-codes) und required binding

// Display-text des synonyms soll jedenfalls als display übernommen werden. nicht nur FSN
// validierung von synonymen prüfen (in zusammenhang mit austrian extension)

// SGR: Das nicht nur der FSN übernommen werden kann, kann ich nicht im Profil lösen?

* code 1..1 MS
* code from AtEDiagProzedurenCodes (required)
* code ^short = "Prozedurencode der durchgeführten Prozedur"

* subject 1..1 MS
* subject only Reference(AtEdiagPatient)
* subject ^short = "Person, auf die sich die Prozedur bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

// es kann sein, dass man es nicht mehr weiß
* performed[x] 0..1
* performed[x] only dateTime
* performed[x] ^short = "Zeitpunkt der Durchführung ToDo, es kann sein, dass man es nicht mehr weiß, mögliche: dateTime | Period | string | Age | Range"

// recorder kann nur GDA sein
// SGR: Erweiterung auf Organisation?
* recorder 1..1 MS
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
)
* recorder ^short = "Gesundheitsdiensteanbieter, der die Prozedur eingetragen/dokumentiert hat ToDo: Erweiterung auf Organisation"

// fremddiagnose
// reported in R6 dazugekommen
// forward extension -> EHE einfach überall eine extension für reported mit boolean

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Quelle der Information zur Prozedur (z. B. behandelnde Person, Patient oder Dritter)"

// soll erst in einer neuen version von e-diagnose berücksichtigt werden
// in erster version noch nicht relevant
* performer 0..0
* performer ^short = "Diese Person hat die Prozedur durchgeführt"

// soll erst in einer neuen version von e-diagnose berücksichtigt werden (e-befund neu)
// in erster version noch nicht relevant
* location 0..0
* location ^short = "Durchführungsort"

// potential für unbegrenzte komplexität
* reasonCode 0..0
* reasonCode ^short = "Code, des med. Grundes für die Durchführung der Prozedur"

// potential für unbegrenzte komplexität
* reasonReference 0..0
* reasonReference ^short = "Begründung dass die Prozedur durchgeführt worden ist - Verweis auf eine andere R. wie Condition, Observation,..."

// grundsätzlich interessant
// potentielle überdeckung mit dem code
// ggf. konsistenzproblem (code, bodysite), wenn mans codiert ists kompliziert
// außer es kommen konkrete anforderungen; sonst als freitext
* bodySite 0..0
* bodySite ^short = "Betroffene Körperstelle"

* outcome 0..0
* outcome ^short = "Ergebnis der Prozedur"

// vergleichbar mit evidence in condition
// verlinkte entlassbriefe könnten ggf. mal nicht mehr erreichbar sein (20 jahre aufbehaltungspflicht)
* report 0..*
* report ^short = "fachlich klären; ToDo: Klären bzgl. Aufbewahrungspflicht von Entlassungsbriefe, könnten ggf. mal nicht erreichbar sein"

// e-diagnose ist keine op-berichts-dokumentationssystem
* complication 0..0
* complication ^short = "Komplikation/en während dem Eingriff"

* complicationDetail 0..0
* complicationDetail ^short = "Eine Diagnose die durch die durchgeführte Prozedur entstanden ist"

* followUp 0..0
* followUp ^short = "Nachkontrolle (Code)"

* note 0..1
// note.autor und .time werden 0..0
// note.text soll eine Zeichenbeschränkung bekommen (TBD)
* note.author[x] 0..0
* note.time 0..0
* note.text ^maxLength = 500
* note ^short = "Freitext zur Prozedur für Zusatzinformation (ohne Autor und Zeitstempel)"

* focalDevice 0..0
* focalDevice ^short = "Prozedurendurchführendes Gerät"

* usedReference 0..0
* usedReference ^short = "Verweis auf verwendete Materialien während der Prozedur (z.b. Medikamente)"

* usedCode 0..0
* usedCode ^short = "Code der Materialien, die während der Prozedur verwendetet wurden"