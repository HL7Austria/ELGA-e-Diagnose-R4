Instance: AtEdiagConditionRecorder
InstanceOf: SearchParameter
Title: "Condition Recorder"
Usage: #definition
* id = "at-elga-ediag-searchparameter-condition-recorder"
* name = "ConditionRecorder"
* status = #active
* description = "Erlaubt die Suche nach dem GDA, der die Diagnose in der e-Diagnose erfasst bzw. dokumentiert hat."
* code = #recorder
* base = #Condition
* type = #reference
* expression = "Condition.recorder"