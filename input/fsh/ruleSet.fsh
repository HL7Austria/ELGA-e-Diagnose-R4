RuleSet: AtEDiagIdentifierRuleSet

* identifier 0..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* identifier contains 
  businessIdentifier 0..1

* identifier[businessIdentifier].system = Canonical(AtEdiagBusinessIdentifier)
* identifier[businessIdentifier].value 1..1
* identifier[businessIdentifier] ^short = "Identifier innerhalb der e-Diagnose für einen Eintrag."
* identifier[businessIdentifier] ^definition = "Dieser Identifier wird von der Fachanwendung e-Diagnose vergeben, sollte dieser durch den Client nicht gesetzt werden. Ein Client kann diesen Identifier nutzen, um einzelne Einträge im Zuge einer Bearbeitung miteinander zu verknüpfen."