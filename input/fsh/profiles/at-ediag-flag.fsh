Profile: AtEdiagAFlagAlert
Parent: AtApsFlagAlert
Id: at-ediag-flaglert
Title: "AT e-Diagnose FlagAlert"
Description: "Das AT e-Diagnose FlagAlert-Profil leitet sich vom AT APS FlagAlert-Profil ab und passt dieses für die Anforderungen der e-Diagnose an. Die IPS-Konformität bleibt über das abgeleitete Profil erhalten."
* ^status = #active
* . ^short = "AT e-Diagnose FlagAlert"

* identifier 0..0
* identifier ^short = "Zuordnung des Alerts in einem internem Dokumentationssystem"

* status 1..1
* status ^short = "Ist der Alert aktiv, inaktiv,..."

* category 0..0
* category ^short = "Differenzierung nach Kontext - nach klinisch, administrativ"

* code 1..1
* code ^short = "Codiert oder Textinhalt des Alerts"

* subject 1..1
* subject only Reference(AtEdiagPatient)
* subject ^short = "Person, auf die sich der Alert bezieht"

* period 0..1
* period ^short = "Periode, in der der Alert aktiv ist"

* encounter 0..0
* encounter ^short = "Behandlungskontakt, fachlich kären, ob dieses Feld benötigt wird (z.b. Durchgangssyndrom aufgrund eines Narkoseverfahrens)"

* author 1..1
* author ^short = "Person, die diese Besonderheit (Alert) dokumentiert hat"



