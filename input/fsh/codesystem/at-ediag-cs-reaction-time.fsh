CodeSystem: AtEdiagReactionTimeCS
Id: at-ediag-reaction-time-cs
Title: "Reaktionszeit Codes"
Description: "Zeitlicher Verlauf der Manifestation"
* ^status = #active
* ^experimental = true
* ^caseSensitive = true

// neue Namen für die Codes
// https://hub.kbv.de/spaces/ALDOK1X0X0/pages/375456332/Weitere+m%C3%B6gliche+Inhalte#Weiterem%C3%B6glicheInhalte-ArtderReaktion%2FzeitlicherVerlaufderReaktion
// codes noch aktualisieren/anders benennen
// extension soll verpflichtend ausgefüllt werden

* #lt6h "<6 Stunden"
* #btw6_24h "6-24 Stunden"
* #gt24h ">24 Stunden"
* #unknown "Unbekannt"