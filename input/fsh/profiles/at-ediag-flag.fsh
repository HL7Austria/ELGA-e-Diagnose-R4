Profile: AtEdiagAFlagAlert
Parent: AtApsFlagAlert
Id: at-ediag-flagalert
Title: "AT e-Diagnose FlagAlert"
Description: "Das AT e-Diagnose FlagAlert-Profil leitet sich vom AT APS FlagAlert-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose FlagAlert"

// EHE einfach überall eine extension für reported mit boolean
* extension contains AtReported named reported 0..1

* identifier 0..0
* identifier ^short = "Zuordnung des Alerts in einem internem Dokumentationssystem"

* status 1..1 MS
* status ^short = "Möglicher Statuscode; active | inactive | entered-in-error "

* category 0..0
* category ^short = "Differenzierung nach Kontext - nach klinisch, administrativ"

// codiert, damit es zu keinen verschiebungseffekten kommt (condition)
// codierbar lassen
// mehrwert codierung fraglich
// für europäische patient summary, übersetzungen wäre es natürlich interessant zu codieren, für übersetzungen
// wenn nur freitext, wäre eine limitierung ggf erforderlich?

// 2026_04_23 nur Text!! Kein ValueSet dass das abdeckt. Kein Coding
* code 1..1
* code ^short = "Textinhalt des Alerts"

* subject 1..1 MS
* subject only Reference(AtEdiagPatient)
* subject ^short = "Person, auf die sich der Alert bezieht"


// hat keinen mehrwert
* period 0..0
* period ^short = "Periode, in der der Alert aktiv ist"

// kontext von alert wird im freitext dokumentiert
* encounter 0..0
* encounter ^short = "Behandlungskontakt, fachlich kären, ob dieses Feld benötigt wird (z.b. Durchgangssyndrom aufgrund eines Narkoseverfahrens)"


* author 1..1
* author only Reference(
    at-ediag-practitioner
    or at-aps-practitionerrole
)
* author ^short = "Gesundheitsdiensteanbieter, die den Alert dokumentiert hat"


