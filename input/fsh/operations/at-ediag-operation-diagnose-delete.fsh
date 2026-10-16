Instance: AtDiagDiagnoseDelete
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $delete"
Description: """Die `$delete`-Operation löscht einen bestimmten Eintrag aus der e-Diagnose Fachanwendung."""
Usage: #definition

* id = "at-ediag-operation-diagnose-delete"
* name = "AtDiagDiagnoseDelete"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer einen Eintrag aus der e-Diagnose Fachanwendung löschen, muss diese Operation ausgeführt werden.

### Anwendungskontext

Die Teilnehmerrechte können – abgesehen vom Widerspruch über die ELGA-Widerspruchstelle (WIST) und der Unterstützung durch die ELGA-Ombudsstelle (OBST) – ausschließlich über das Zugangsportal gemäß § 23 Abs. 1 GTelG 2012 ausgeübt werden.

### Voraussetzung für den Aufruf

- Der zu löschende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.

### Detaillierte Business-Logik

1. Der Eintrag (Condition, Procedure oder AllergyIntolerance) wird anhand der übergebenen ID aus der e-Diagnose Fachanwendung gelöscht.
2. Ist der Eintrag Teil der jeweiligen Summary-Liste, wird er auch aus der Summary-Liste entfernt.
  1. Als `List.source` wird in diesem Fall der Patient angegeben.

### Validierung / Fehlerbehandlung

- Der zu löschende Eintrag muss in der e-Diagnose Fachanwendung vorhanden sein.
"""
* affectsState = true  // Ändert den Zustand am Server
* code = #delete
* resource[0] = $cs-resource-types#Condition
* resource[+] = $cs-resource-types#Procedure
* resource[+] = $cs-resource-types#AllergyIntolerance
* system = false       
* type = false 
* instance = true   // Id von Instanz muss beim Aufruf bekannt sein

* parameter[+]
* parameter[=].name = #diagnose
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der gelöschte Eintrag."
* parameter[=].type = #Resource
* parameter[=].targetProfile[+] = Canonical(AtEdiagCondition)
* parameter[=].targetProfile[+] = Canonical(AtEdiagProcedure)
* parameter[=].targetProfile[+] = Canonical(AtEdiagAllergyIntolerance)

* parameter[+]
* parameter[=].name = #list
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Die Summary-Liste, aus der der Eintrag gegebenenfalls gelöscht wurde."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)