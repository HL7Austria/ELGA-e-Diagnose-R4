Instance: AtDiagListWrite
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $write"  //TODO
Description: """Die $write Operation wird aufgerufen, wenn eine Summary-Liste geschrieben wird."""
Usage: #definition

* id = "at-ediag-operation-list-write"
* name = "AtDiagListWrite"
* status = #draft
* kind = #operation
* affectsState = true  // Ändert den Zustand am Server
* system = false       
* type = true   // Aufruf auf Typeebene (Ressourcentyp)
* instance = false   // Id von Instanz muss beim Aufruf nicht bekannt sein, nur Patient-ID
* code = #write
* resource[0] = http://hl7.org/fhir/resource-types#List
* parameter[+]
* parameter[=].name = #code   // prüfen
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der Parameter gibt an, welche Art von Einträgen in der Summary-Liste enthalten sind. Der Wert muss aus dem Value-Set [AtEdiagListCodeVS](ValueSet-at-ediag-list-code-vs.html) stammen."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(AtEdiagListCodeVS)
* parameter[+]
* parameter[=].name = #list   
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der Parameter dient der Übermittlung der Summary-Liste."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)
