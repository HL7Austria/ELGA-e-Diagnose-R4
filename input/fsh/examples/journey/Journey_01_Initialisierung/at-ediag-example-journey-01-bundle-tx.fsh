Instance: At-Ediag-Journey-01-Bundle-Liste-Tx
InstanceOf: AtEdiagBundleListeTx 
Title: "Beispiel Journey 01 Transaction Bundle"
Description: "Beispiel eines Transaction Bundles, mit leerem Mediaktionsplan (referenziert List-Ressource ohne Einträge)."
Usage: #example

* type = #transaction
* timestamp = "2026-03-01T08:10:00+00:00"

// LIST 
* entry[list].fullUrl = "urn:uuid:3b2f7c16-1c47-4c08-a4ef-9b4d8c7c5f12"
* entry[list].resource = ListExample02
* entry[list].request.method = #POST
* entry[list].request.url = "List"


// CONDITION 
* entry[condition][0].fullUrl = "urn:uuid:9c1f1d2a-aaaa-bbbb-cccc-123456789abc"
* entry[condition][0].resource = DiagnoseCurrentlyRelevantExample
* entry[condition][0].request.method = #POST
* entry[condition][0].request.url = "Condition"

