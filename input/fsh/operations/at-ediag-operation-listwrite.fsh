Instance: AtDiagListWrite
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $write"  
Description: """Die `$write`-Operation wird aufgerufen, wenn eine Summary-Liste geschrieben wird."""
Usage: #definition

* id = "at-ediag-operation-list-write"
* name = "AtDiagListWrite"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA die Summary-Liste für eine bestimmte Art von Einträgen (Diagnosen, Prozeduren, Allergien) aktualisieren (Einträge werden hinzugefügt/entfernt)
oder möchte der GDA die Reihenfolge der Einträge ändern, so muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Der GDA hat durch einen [vorangegangenen Abruf](use_case_read.html#aktuelle-summary-liste-abrufen) die aktuelle `versionId` der Summary-Liste ermittelt. Diese muss beim Aufruf dieser Operation als `If-Match`-Header mitgeschickt werden.

### Detaillierte Business-Logik

1. Nach erfolgreicher Validierung wird die Summary-Liste gespeichert.

### Validierung / Fehlerbehandlung

* Die übermittelte List-Ressource wird laut Profil geprüft.
* Der übermittelte `If-Match`-Header stimmt mit der `versionId` der Ressource am Server überein.
* Für die List-Ressource gilt außerdem `entry.item.empty() implies emptyReason.coding.exists(system='http://terminology.hl7.org/CodeSystem/list-empty-reason' and code='nilknown')`.
"""
* affectsState = true  // Ändert den Zustand am Server
* system = false       
* type = true   // Aufruf auf Typeebene (Ressourcentyp)
* instance = false   // Id von Instanz muss beim Aufruf nicht bekannt sein, nur Patient-ID
* code = #write
* resource[0] = $cs-resource-types#List

* parameter[+]
* parameter[=].name = #list   
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der Parameter dient der Übermittlung der Summary-Liste."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)

* parameter[+]
* parameter[=].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Die Summary-Liste, die nach erfolgreichem Aufruf der Operation gespeichert wurde."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)
