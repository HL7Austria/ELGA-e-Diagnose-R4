Instance: at-elga-ediag-searchparameter-condition-recorder
InstanceOf: SearchParameter
Usage: #definition
* name = "Condition Recorder"
* status = #active
* description = "Erlaubt die Suche nach dem GDA, der die Diagnose in der e-Diagnose erfasst bzw. dokumentiert hat."
* code = #recorder
* base = #Condition
* type = #reference
* expression = "Condition.recorder"