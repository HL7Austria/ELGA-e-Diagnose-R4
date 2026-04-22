Profile: AtEdiagAllergyIntolerance
Parent: AtApsAllergyIntolerance
Id: at-ediag-allergyintolerance
Title: "AT e-Diagnose AllergyIntolerance"
Description: "Das AT e-Diagnose AllergyIntolerance-Profil leitet sich vom AT APS AllergyIntolerance-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose AllergyIntolerance"

// EHE einfach überall eine extension für reported mit boolean
* extension contains AtReported named reported 0..1

* identifier 0..0
* identifier ^short = "Zuordnung der Allergie in einem internem Dokumentationssystem"

// erfolgreiche desensibilisierung dokumentieren? oder selbst weggegangene allergien?
// löschen von bereits dokumentierten eher nicht, sondern status setzen
// invarianten in zshg mit verificationstatus sobald fachlich geklärt

// SGR: invariante-Bsp siehe Ende Profil
* clinicalStatus 0..1
* code only CodeableConcept
* clinicalStatus ^short = "ToDo: erfolgreiche desensibilisierung dokumentieren? oder selbst weggegangene allergien? Möglicher Status; active | inactive | resolved"

// "presumed" in R5 ist großer wunsch von MBU - wie könnte das abgebildet werden? MBU redet mit allergologen, ob wirklich notwendig
// "refuted" ist laut MBU auch relevant
// kardinalität von clinicalStatus & verificationStatus muss noch erarbeitet werden
* verificationStatus 1..1 MS
* verificationStatus only CodeableConcept
* verificationStatus ^short = "ToDo; kardinalität von clinicalStatus & verificationStatus muss noch erarbeitet werden. Möglicher Status; unconfirmed | confirmed | refuted | entered-in-error"


// ungenaue unterscheidung
* type 0..0
* type ^short = "Identifikation ob es eine Allergie oder Intoleranz ist"

// 
* category 0..0
* category ^short = "Differenzierung nach Kontext - Medikamente, Lebensmittel, Umwelt,.. - falls nur med. rele. dann ist es nicht notwendig, fachlich klären"

// 
* criticality 0..0
* criticality ^short = "Einschätzung der Schwere (Anaphylaxie)"

// kein text wird zugelassen, wie bei condition/procedure/etc.
// substanz wird dokumentiert
// konkrete medikamente findet man nicht, man muss nach substanzen suchen (ggf. könnte man auch ASP-Liste durchsuchbar machen)

* code 1..1 MS
* code only CodeableConcept
* code ^short = "Allergiecode, Text verboten"

* code.text 0..0

* code.coding 1..1 
//* code.coding from AspListe (required)

* patient 1..1 MS
* patient only Reference(AtEdiagPatient)
* patient ^short = "Betroffene Person, auf die sich die Allergie bezieht"

* encounter 0..0
* encounter ^short = "Behandlungskontakt"

// beginn der allergie wohl nicht bekannt
// beginn der reaction kann sehr wohl bekannt sein, wird deshalb nur reaction.onset dokumentiert
* onset[x] 0..0
* onset[x] ^short = "Erstes Aufzeichnungsdatum der Allergie(symptomatik)"

* recordedDate 1..1 MS
* recordedDate only dateTime 
* recordedDate ^short = "Dokumentationsdatum"

// analog zu procedure, kein patient keine related person
* recorder 1..1 MS
* recorder only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
)
* recorder ^short = "Gesundheitsdiensteanbieter, die die Allergie ins System erfasst/dokumentiert"

* asserter 0..1
* asserter only Reference (
    at-ediag-practitioner
    or at-aps-practitionerrole
    or at-ediag-patient
    or http://hl7.org/fhir/StructureDefinition/RelatedPerson
)
* asserter ^short = "Person (fachliche Quelle + related Person oder Patient selbst), die/der die Allergie bestätigt"

* lastOccurrence 0..0
* lastOccurrence ^short = "Letztes Auftreten der Symptomatik - siehe manifestation"

* note 0..0
* note ^short = "Zusätzliche Informationen oder Freitext zur Allergie wird in reaction beschrieben"

* reaction 1..1 MS
* reaction ^short = "Details über die Allergiereaktion"

* reaction.substance 0..0
* reaction.substance ^short = "Spezifische Substanz die zur Allergie führt, wird in reaction gelöst"

// ggf. pflicht in snomed
* reaction.manifestation 1..*
* reaction.manifestation only CodeableConcept
* reaction.manifestation ^short = "ToDo: fragliches Pflichtfeld? Aufgezeichnete klinische allergische Symptome"

// https://hub.kbv.de/spaces/ALDOK1X0X0/pages/375456332/Weitere+m%C3%B6gliche+Inhalte#Weiterem%C3%B6glicheInhalte-ArtderReaktion%2FzeitlicherVerlaufderReaktion
// codes noch aktualisieren/anders benennen
// extension soll verpflichtend ausgefüllt werden
* reaction.extension contains AtEdiagReactionTime named reactionTime 1..1
* reaction.extension[reactionTime] ^short = "Zeitlicher Verlauf der Manifestation"

// Gedanken GLE: vielleicht reaction.note anstatt reaction.description, weil man in Annotation-Datentyp markdown hat anstatt nur string?
* reaction.description 0..1
* reaction.description ^short = "Textbasierte Zusammenfassung der allergischen Reaktion"

* reaction.onset 0..1
* reaction.onset only dateTime 
* reaction.onset ^short = "Beginn der Reaktion"

* reaction.severity 0..0
* reaction.severity ^short = "Beschreibt ob die Reaktion mild, moderat,... war"

* reaction.exposureRoute 0..0
* reaction.exposureRoute ^short = "Art der Exposition der betroffenen Person gegenüber der Substanz"

* reaction.note 0..0
* reaction.note ^short = "ToDo: Fraglich, ob wie bei den anderen es über note festgehalten wird, statt über reaction.description?"

// referenz auf befund, laborbefund, etc wäre noch interessant - extension!
// SGR: Siehe condition - evidence 

// SGR verificationStatus = refuted dann clinicalStatus = inaktiv
Invariant: allergy-verification-refuted-means-inactive
Severity: #error
Description: "Wenn der verificationStatus 'refuted' ist, muss der clinicalStatus 'inactive' sein."
Expression: "verificationStatus.coding.where(code = 'refuted').exists() implies clinicalStatus.coding.where(code = 'inactive').exists()"


