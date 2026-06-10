Profile: AtEdiagBundleListeCl
Parent: Bundle
Id: at-elga-ediag-bundle-liste-cl
Title: "AT ELGA e-Diagnose Collection Bundle"
Description: "Das Bundle vom Typ Collection bestehend aus List und klinischen Kontextressourcen"


//* identifier 0..1 MS
//* identifier ^short = "Persistenter Identifikator für das Bundle. Verwendung prüfen."

* type 1..1 MS
* type = #collection
* type ^short = "Art des Bundles."

* timestamp 1..1 MS
* timestamp ^short = "Zeitpunkt der Erstellung des Bundles."

//* link 0..0
//* link ^short = "Verweise auf weiterführende Informationen zum Bundle. Verwendung prüfen." 

// Slicing legt fest, welche Entries erlaubt sind -> Unterscheidung der Slices anhand von Pfad und Typ 
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.ordered = true

* entry contains
    list 1..1 and
    condition 0..* and
    procedure 0..* and
    allergyIntolerance 0..* 

// Liste
* entry[list].resource only AtEdiagList
* entry[condition].resource only AtEdiagCondition
* entry[procedure].resource only AtEdiagProcedure
* entry[allergyIntolerance].resource only AtEdiagAllergyIntolerance

//* entry.link 0..0
//* entry.link ^short = "Verweise auf weiterführende Informationen zu diesem Entry. Verwendung prüfen."

//* entry.fullUrl ^short = "Eindeutige URL für den Eintrag im Bundle. Verwendung prüfen."

// TODO Fachlich abklären, ob Patient und Practitioner auch im Bundle enthalten sein müssen -> damit in der History verfügbar 