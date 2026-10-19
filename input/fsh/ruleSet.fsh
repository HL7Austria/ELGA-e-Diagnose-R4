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
* identifier[businessIdentifier].system = Canonical(AtEdiagBusinessIdentifierCS)
* identifier[businessIdentifier].value 1..1 MS
* identifier[businessIdentifier] ^short = "Identifier innerhalb der e-Diagnose für einen Eintrag."
* identifier[businessIdentifier] ^definition = "Ein Client kann diesen Identifier nutzen, um einzelne Einträge im Zuge einer Bearbeitung miteinander zu verknüpfen. Sollte dieser Identifier durch den Client nicht gesetzt werden, wird er von der Fachanwendung e-Diagnose vergeben."

RuleSet: AtEDiagAsserterRuleSet

* obeys contained-asserter

* contained 0..1 MS
* contained only AtEdiagRelatedPerson
* contained ^short = "Eingebettete Bezugsperson, die als asserter referenziert wird."

// contained nur für die als asserter referenzierte Bezugsperson
Invariant: contained-asserter
Description: "Eine eingebettete Ressource (contained) ist nur zulässig, wenn sie als asserter referenziert wird."
Severity: #error
Expression: "contained.exists() implies asserter.reference = '#' + contained.id"