Instance: AtEdiagListRead
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation für List-Read"
Description: "Die $list-read Operation wird aufgerufen, wenn eine Liste mit der Intention zu schreiben gelesen wird."
Usage: #definition

* id = "at-ediag-operation-listread"
* name = "AtEdiagListRead"
* status = #draft
* kind = #operation
* affectsState = true  // Ändert den Zustand am Server; zu klären Version-ID
* system = false       // Aufruf erfolgt auf Systemebene, wenn noch kein Plan erstellt wurde 
* type = true   // Aufruf auf Typeebene (Ressourcentyp), wenn bereits ein Plan erstellt wurde
* instance = false   // Id von Instanz muss beim Aufruf nicht bekannt sein, nur Patient-ID
* code = #list-read
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
* parameter[=].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Der *return* Parameter gibt Auskunft über den Erfolg der Operation."
* parameter[=].type = #Resource
* parameter[=].targetProfile[+] = Canonical(OperationOutcome)
* parameter[+]
* parameter[=].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Der *return* Parameter gibt Auskunft über den Erfolg der Operation."
* parameter[=].type = #Bundle
// ToDo: * parameter[=].targetProfile[+] = Canonical(AtEdiagBundleListeCl)  // Collection Bundle