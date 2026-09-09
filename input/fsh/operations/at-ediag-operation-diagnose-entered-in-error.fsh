Instance: AtDiagDiagnoseEnteredInError
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $entered-in-error"
Description: """Die `$entered-in-error`-Operation storniert eine bestimmte Diagnose in der e-Diagnose Fachanwendung."""
Usage: #definition

* id = "at-ediag-operation-diagnose-entered-in-error"
* name = "AtDiagDiagnoseEnteredInError"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer eine Diagnose in der e-Diagnose Fachanwendung stornieren, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Die zu stornierende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Die Diagnose (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID in der e-Diagnose Fachanwendung storniert.
  1. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[practitioner]` wird von der e-Diagnose Fachanwendung der GDA, der die Stornierung durchführt, dokumentiert.
  2. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[datetime]` wird von der e-Diagnose Fachanwendung das Datum und die Uhrzeit der Stornierung dokumentiert.
  3. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[reason]` wird der Grund für die Stornierung, der vom GDA angegeben werden kann, festgehalten.
2. Ist die Diagnose Teil der jeweiligen Summary-Liste, wird sie aus der Summary-Liste entfernt.

### Validierung / Fehlerbehandlung

- Die zu stornierende Diagnose muss in der e-Diagnose Fachanwendung vorhanden sein.
"""
* affectsState = true  // Ändert den Zustand am Server
* code = #delete
* resource[0] = http://hl7.org/fhir/resource-types#Condition
* resource[+] = http://hl7.org/fhir/resource-types#Procedure
* resource[+] = http://hl7.org/fhir/resource-types#AllergyIntolerance
* system = false       
* type = false 
* instance = true   // Id von Instanz muss beim Aufruf bekannt sein

* parameter[+]
* parameter[=].name = #reason
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Grund für die Stornierung der Diagnose."
* parameter[=].type = #string