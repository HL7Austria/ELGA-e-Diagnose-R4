Profile: AtEdiagProcedure
Parent: AtApsProcedure
Id: at-ediag-procedure
Title: "AT e-Diagnose Procedure"
Description: "Das AT e-Diagnose Procedure-Profil leitet sich vom AT APS Procedure-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose Procedure"

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

* status 1..1
* status ^short = "fachlich klären, welcher Status benötigt wird"

* statusReason 1..1
* statusReason ^short = "fachlich klären, welcher Status benötigt wird"

* category 0..0
* category ^short = "Kategorisierung nach Verfahren"

* code 1..1
* code ^short = "Prozedurencode - klären - Text?"

* subject 1..1
* subject only Reference(AtEdiagPatient)
* subject ^short = "Person, auf die sich die Prozedur bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

* performed[x] 0..1
* performed[x] only dateTime
* performed[x] ^short = "Zeitpunkt der Durchführung"

* recorder 1..1
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* recorder ^short = "Person, die die Prozedur eingetragen hat"

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Person (fachliche Quelle), die die Prozedur bestätigt"

* performer 0..1
* performer ^short = "Diese Person hat die Prozedur durchgeführt"

* location 0..1
* location ^short = "Durchführungsort"

* reasonCode 0..0
* reasonCode ^short = "Code, des med. Grundes für die Durchführung der Prozedur"

* reasonReference 0..0
* reasonReference ^short = "Begründung dass die Prozedur durchgeführt worden ist - Verweis auf eine andere R. wie Condition, Observation,..."

* bodySite 0..0
* bodySite ^short = "Betroffene Körperstelle"

* outcome 0..0
* outcome ^short = "Ergebnis der Prozedur"

* report 0..1
* report ^short = "fachlich klären, ob OP Berichte angehängt werden sollen"

* complication 0..0
* complication ^short = "Komplikation/en während dem Eingriff"

* complicationDetail 0..0
* complicationDetail ^short = "Eine Diagnose die durch die durchgeführte Prozedur entstanden ist"

* followUp 0..0
* followUp ^short = "Nachkontrolle (Code)"

* note 0..1
* note only Annotation
* note ^short = "Zusätzliche Informationen oder Freitext zur Prozedur"

* focalDevice 0..0
* focalDevice ^short = "Prozedurendurchführendes Gerät"

* usedReference 0..0
* usedReference ^short = "Verweis auf verwendete Materialien während der Prozedur (z.b. Medikamente)"

* usedCode 0..0
* usedCode ^short = "Code der Materialien, die während der Prozedur verwendetet wurden"