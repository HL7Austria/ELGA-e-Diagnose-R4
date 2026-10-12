Instance: ConditionDeleteResponse01
InstanceOf: Parameters
Title: "Parameters der Antwort auf $delete einer Diagnose"
Description: "Beispiel der Ausgabeparameter der $delete-Operation, nachdem Max Mustermann die Diagnose Candida-Balanitis (ConditionEntry05) über das Portal gelöscht hat."
Usage: #example

// Antwort auf POST /Condition/ConditionEntry05/$delete
// Die Diagnose war nicht Teil der Summary-Liste, daher wird kein list-Parameter zurückgeliefert.
* parameter[0].name = "diagnose"
* parameter[=].resource = ConditionEntry05
