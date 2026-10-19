Instance: AtDiagDiagnoseEnteredInError
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $entered-in-error"
Description: """Die `$entered-in-error`-Operation storniert einen bestimmten Eintrag in der e-Diagnose Fachanwendung."""
Usage: #definition

* id = "at-ediag-operation-diagnose-entered-in-error"
* name = "AtDiagDiagnoseEnteredInError"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der GDA einen Eintrag in der e-Diagnose Fachanwendung stornieren, muss diese Operation ausgeführt werden.

### Voraussetzung für den Aufruf

- Der zu stornierende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Der Eintrag (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID in der e-Diagnose Fachanwendung storniert.
  1. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[practitioner]` wird durch die e-Diagnose Fachanwendung der GDA, der die Stornierung durchführt, dokumentiert.
  2. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[datetime]` wird  durch die e-Diagnose Fachanwendung das Datum und die Uhrzeit der Stornierung dokumentiert.
  3. Als `[Condition|Procedure|AllergyIntolerance].extension[entered-in-error].extension[reason]` wird der Grund für die Stornierung, der vom GDA angegeben werden **kann**, festgehalten.
2. Alle weiteren Informationen des Eintrags bleiben unverändert erhalten.
3. Ist der Eintrag Teil der jeweiligen Summary-Liste, wird er aus der Summary-Liste entfernt. Als Autor (`List.source`) der Summary-Liste wird der GDA dokumentiert.
  1. Ist es der letzte Eintrag, der aus der jeweiligen Summary-Liste entfernt wurde, erhält die Summary-Liste `List.emptyReason=nilknown`.

### Validierung / Fehlerbehandlung

- Der zu stornierende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.
"""
* affectsState = true  // Ändert den Zustand am Server
* code = #entered-in-error
* resource[0] = $cs-resource-types#Condition
* resource[+] = $cs-resource-types#Procedure
* resource[+] = $cs-resource-types#AllergyIntolerance
* system = false       
* type = false 
* instance = true   // Id von Instanz muss beim Aufruf bekannt sein

* parameter[+]
* parameter[=].name = #reason
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Grund für die Stornierung des Eintrags."
* parameter[=].type = #string

* parameter[+]
* parameter[=].name = #diagnose
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der aktualisierte Eintrag nach der Stornierung."
* parameter[=].type = #Resource
* parameter[=].targetProfile[+] = Canonical(AtEdiagCondition)
* parameter[=].targetProfile[+] = Canonical(AtEdiagProcedure)
* parameter[=].targetProfile[+] = Canonical(AtEdiagAllergyIntolerance)

* parameter[+]
* parameter[=].name = #list
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Die Summary-Liste, aus der der Eintrag gegebenenfalls entfernt wurde."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)