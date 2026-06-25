Instance: AtDiagListWrite
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation für List-Write"  //TODO
Description: "Die $list-write Operation wird aufgerufen, wenn eine Liste geschrieben wird."
Usage: #definition

* id = "at-ediag-operation-listwrite"
* name = "AtDiagListWrite"
* status = #draft
* kind = #operation
* affectsState = true  // Ändert den Zustand am Server
* system = false       
* type = true   // Aufruf auf Typeebene (Ressourcentyp)
* instance = false   // Id von Instanz muss beim Aufruf nicht bekannt sein, nur Patient-ID
* code = #write
* resource[0] = http://hl7.org/fhir/resource-types#Condition
* resource[1] = http://hl7.org/fhir/resource-types#Procedure
* resource[2] = http://hl7.org/fhir/resource-types#AllergyIntolerance
* parameter[+]
* parameter[=].name = #id   // prüfen
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der *id* Parameter dient der Zuordnung des Patienten."
* parameter[=].type = #string
* parameter[+]
* parameter[=].name = #list   
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der *list* Parameter dient der Übermittlung der Liste des Patienten."
* parameter[=].type = #Bundle
* parameter[=].targetProfile[+] = Canonical(AtEdiagBundleListeTx)  // Transaction Bundle
* parameter[+]
* parameter[=].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Der *return* Parameter gibt Auskunft über den Erfolg der Operation."
* parameter[=].type = #Resource
* parameter[=].targetProfile[+] = Canonical(OperationOutcome)