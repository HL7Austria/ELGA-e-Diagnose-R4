Profile: AtEdiagCondition
Parent: AtApsCondition
Id: at-ediag-condition
Title: "AT e-Diagnose Condition Diagnosen"
Description: "Das AT APS-Profil für die Condition-Ressource Diagnosen berücksichtigt zum einen die österreichischen Vorgaben (z.B. Patient und zu verwendende Value-Sets) und stellt andererseits die Konformität gegenüber dem IPS-Profil sicher, indem die so genannte [`imposeProfile`](http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile)-Erweiterung verwendet wird."
* ^status = #active
* . ^short = "AT e-Diagnose Condition Diagnosen"
* subject only Reference(AtEdiagPatient)
* meta.tag from AtEDiagDiagnosenAcuteOrChronic (required)
