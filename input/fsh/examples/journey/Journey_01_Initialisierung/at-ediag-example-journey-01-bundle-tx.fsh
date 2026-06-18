Instance: At-Ediag-Journey-01-Bundle-Liste-Tx
InstanceOf: AtEdiagBundleListeTx 
Title: "Beispiel Journey 01 Transaction Bundle"
Description: "Beispiel eines Transaction Bundles, mit leerem Mediaktionsplan (referenziert List-Ressource ohne Einträge)."
Usage: #example

* type = #transaction
* timestamp = "2026-03-01T08:10:00+00:00"
* entry[list].resource = ListExample02
* entry[list].fullUrl = "urn:uuid:3b2f7c16-1c47-4c08-a4ef-9b4d8c7c5f12"
* entry[condition][0].resource = DiagnoseCurrentlyRelevantExample

