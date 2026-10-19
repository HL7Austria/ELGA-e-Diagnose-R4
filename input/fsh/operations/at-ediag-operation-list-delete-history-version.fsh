Instance: AtEdiagListDeleteHistoryVersion
InstanceOf: OperationDefinition
Title: "e-Diagnose Operation $delete-history-version"
Description: """Die `$delete-history-version`-Operation löscht eine bestimmte Version einer Summary-Liste aus der e-Diagnose Fachanwendung."""
Usage: #definition

* id = "at-ediag-operation-list-delete-history-version"
* name = "AtDiagListDeleteHistoryVersion"
* status = #active
* kind = #operation
* experimental = false
* purpose = """
### Wer ruft diese Operation in welchem Zusammenhang auf?

Möchte der ELGA-Teilnehmer eine Version einer Summary-Liste aus der e-Diagnose Fachanwendung löschen, muss diese Operation ausgeführt werden.

### Anwendungskontext

Die Teilnehmerrechte können – abgesehen vom Widerspruch über die ELGA-Widerspruchstelle (WIST) und der Unterstützung durch die ELGA-Ombudsstelle (OBST) – ausschließlich über das Zugangsportal gemäß § 23 Abs. 1 GTelG 2012 ausgeübt werden.

### Voraussetzung für den Aufruf

- Es sind Versionen der Summary-Liste vorhanden, die gelöscht werden können.

### Detaillierte Business-Logik

1. Die Version einer Summary-Liste wird anhand der übergebenen `versionId` aus der e-Diagnose Fachanwendung gelöscht.
2. Wurde die letzte Version einer Summary-Liste gelöscht, erstellt die e-Diagnose Fachanwendung automatisch eine neue Summary-Liste mit `List.emptyReason=nilknown`. Als Autor (`List.source`) der Summary-Liste wird der Patient dokumentiert.

### Validierung / Fehlerbehandlung

- Die zu löschende Version der Summary-Liste muss in der e-Diagnose Fachanwendung vorhanden sein.
"""
* affectsState = true  // Ändert den Zustand am Server
* code = #delete-history-version
* resource[0] = $cs-resource-types#List
* system = false       
* type = false 
* instance = true   // Id von Instanz muss beim Aufruf bekannt sein

* parameter[+]
* parameter[=].name = #versionId
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Die versionId der zu löschenden Version der Summary-Liste."
* parameter[=].type = #id

* parameter[+]
* parameter[=].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Die gelöschte Version der Summary-Liste."
* parameter[=].type = #List
* parameter[=].targetProfile[+] = Canonical(AtEdiagList)
