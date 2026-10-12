Instance: ConditionEnteredInErrorResponse01
InstanceOf: Parameters
Title: "Parameters der Antwort auf $entered-in-error einer Diagnose"
Description: "Beispiel der Ausgabeparameter der $entered-in-error-Operation, nachdem Dr. Musterärztin die fehlerhaft codierte Diagnose Morbus Crohn (ConditionEntry03) storniert hat."
Usage: #example

// Antwort auf POST /Condition/ConditionEntry03/$entered-in-error
* parameter[0].name = "diagnose"
* parameter[=].resource = ConditionEntry03EnteredInError

// Die Diagnose war Teil der Summary-Liste, daher wird die neue Version der Liste (Version 4) mitgeliefert.
* parameter[+].name = "list"
* parameter[=].resource = ConditionList03
