Profile: AtEdiagBundleListeTx
Parent: Bundle
Id: at-elga-ediag-bundle-liste-tx
Title: "AT ELGA e-Diagnose Liste Transaction Bundle"
Description: "Das Bundle vom Typ Transaction dient dem schreibenden Zugriff auf die Liste bestehend aus: 
 - 1..1 List: Liste mit Referenzen auf Listeinträge und zur Abbildung von Reihenfolge und Änderungsstatus
 - 0..* Listeinträge: je nach Kontext Diagnose, Prozedure, Allergien und Intoleranzen oder Alerts"

//* identifier 0..1 MS
//* identifier ^short = "Persistenter Identifikator für das Bundle."

//* type 1..1 MS
//* type = #transaction
//* type ^short = "Art des Bundles. Für schreibenden Zugriff immer Typ \"transaction\"."
 
//* timestamp 1..1 MS
//* timestamp ^short = "Zeitpunkt der Erstellung des Bundles. Verwendung prüfen."

//* link 0..0
//* link ^short = "Verweise auf weiterführende Informationen zum Bundle. Verwendung prüfen." 

// Slicing legt fest, welche Entries erlaubt sind -> Unterscheidung der Slices anhand von Pfad und Typ 
//* entry ^slicing.discriminator[+].type = #type   
//* entry ^slicing.discriminator[=].path = "resource"
//* entry ^slicing.rules = #closed  // als Entries sind nur list und medicationrequest erlaubt
//* entry ^slicing.ordered = true  // erstes Entry soll die Liste sein

////* entry contains 
    //Medikationsplan 1..1 and    
    //Medikationsplaneintrag 0..*
// Liste
//* entry[Medikationsplan].resource 1..1
//* entry[Medikationsplan].resource only AtEmedListMedikationsplan
// Medikationsplaneinträge
//* entry[Medikationsplaneintrag].resource 1..1
//* entry[Medikationsplaneintrag].resource only AtEmedMRPlaneintrag
// * entry[MagistraleZubereitung].resource 1..1
// * entry[MagistraleZubereitung].resource only AtEmedMedication

//* entry.link 0..0
//* entry.link ^short = "Verweise auf weiterführende Informationen zu diesem Entry. Verwendung prüfen."

//* entry.fullUrl ^short = "Eindeutige URL für den Eintrag im Bundle. "

// TODO Fachlich abklären, ob Patient und Practitioner auch im Bundle enthalten sein müssen -> damit in der History verfügbar 