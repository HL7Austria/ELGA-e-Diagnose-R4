RuleSet: AtEDiagIdentifierRuleSet

* identifier 0..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* identifier contains 
  businessIdentifier 0..1 MS

* identifier[businessIdentifier].use 0..0
* identifier[businessIdentifier].system 1..1 MS
* identifier[businessIdentifier].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[businessIdentifier].value 1..1 MS
* identifier[businessIdentifier] ^short = "Identifier innerhalb der e-Diagnose für einen Eintrag."
* identifier[businessIdentifier] ^definition = "Ein Client kann diesen Identifier nutzen, um einzelne Einträge im Zuge einer Bearbeitung miteinander zu verknüpfen. Sollte dieser Identifier durch den Client nicht gesetzt werden, wird er von der Fachanwendung e-Diagnose vergeben."
