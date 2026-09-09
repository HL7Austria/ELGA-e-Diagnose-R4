Instance: AtDiagDiagnoseDelete
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $delete"  //TODO
Description: """Die `$delete`-Operation löscht eine bestimmte Diagnose aus der e-Diagnose Fachanwendung."""
Usage: #definition

* id = "at-ediag-operation-diagnose-delete"
* name = "AtDiagDiagnoseDelete"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer eine Diagnose aus der e-Diagnose Fachanwendung löschen, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Die zu löschende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Die Diagnose (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID aus der e-Diagnose Fachanwendung gelöscht.
2. Ist die Diagnose Teil der jeweiligen Summary-Liste, wird sie auch aus der Summary-Liste entfernt.
  1. Als `List.source` wird in diesem Fall der Patient angegeben.

### Validierung / Fehlerbehandlung

- Die zu löschende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.
"""
* affectsState = true  // Ändert den Zustand am Server
* code = #delete
* resource[0] = http://hl7.org/fhir/resource-types#Condition
* resource[+] = http://hl7.org/fhir/resource-types#Procedure
* resource[+] = http://hl7.org/fhir/resource-types#AllergyIntolerance
* system = false       
* type = false 
* instance = true   // Id von Instanz muss beim Aufruf bekannt sein