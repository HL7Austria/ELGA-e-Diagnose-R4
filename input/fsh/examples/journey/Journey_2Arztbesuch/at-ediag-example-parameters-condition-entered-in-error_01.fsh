Instance: ConditionEnteredInErrorParameters01
InstanceOf: Parameters
Title: "Parameters für $entered-in-error einer Diagnose"
Description: "Beispiel der Eingabeparameter der $entered-in-error-Operation, mit der Dr. Musterärztin die fehlerhaft codierte Diagnose Morbus Crohn (ConditionEntry03) storniert."
Usage: #example

// POST /Condition/ConditionEntry03/$entered-in-error
* parameter[0].name = "reason"
* parameter[=].valueString = "Falscher Code ausgewählt"
