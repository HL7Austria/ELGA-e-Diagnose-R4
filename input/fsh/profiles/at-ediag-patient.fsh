Profile: AtEdiagPatient
Parent: AtApsPatient
Id: at-ediag-patient
Title: "AT e-Diagnose Patient"
Description: "Das AT APS-Profil für die Patient-Ressource berücksichtigt zum einen die österreichischen Vorgaben (z.B. Patient und zu verwendende Value-Sets) und stellt andererseits die Konformität gegenüber dem IPS-Profil sicher, indem die so genannte [`imposeProfile`](http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile)-Erweiterung verwendet wird."
* ^status = #active
* . ^short = "AT e-Diagnosen Patient"
* name.family 1..1
* name.given 1..*
* birthDate 1..1
* identifier[localPatientId] 1..1