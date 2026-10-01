Profile: AtEdiagRelatedPerson
Parent: RelatedPerson
Id: at-elga-ediag-relatedperson
Title: "AT ELGA e-Diagnose RelatedPerson"
    Description: "Das AT e-Diagnose RelatedPerson-Profil leitet sich vom RelatedPerson-Profil ab und passt dieses für die Anforderungen der e-Diagnose an."
* ^status = #active
* . ^short = "AT e-Diagnose RelatedPerson"

* identifier 0..0
* active 1..1 MS
* active = true (exactly)
  * ^short = "Für den jeweiligen Eintrag der e-Diagnose ist diese Bezugsperson als aktiv zu kennzeichnen."

* relationship 1..1 MS
  * coding 0..0
  * text 1..1 MS
    * ^short = "Beziehung der Bezugsperson zum Patienten (z. B. Mutter, Vater, Ehepartner)."

* name 1..1 MS
  * ^short = "Name der Bezugsperson."

* telecom 0..0
* gender 0..0
* birthDate 0..0
* address 0..0
* photo 0..0
* period 0..0
* communication 0..0