CodeSystem: AtEdiagBusinessIdentifier
Id: at-ediag-codesystem-business-identifier
Title: "AT e-Diagnose Business Identifier CS"
Description: """Dieses CodeSystem enthält kein Konzepte sondern dient als System für den [Business Identifier einzelner Einträge](design_choices.html#update-entry) in der e-Diagnose. Ein Client kann diesen Identifier nutzen, um einzelne Einträge im Zuge einer Bearbeitung miteinander zu verknüpfen. Sollte dieser Identifier durch den Client nicht gesetzt werden, wird er von der Fachanwendung e-Diagnose vergeben."""
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #not-present
