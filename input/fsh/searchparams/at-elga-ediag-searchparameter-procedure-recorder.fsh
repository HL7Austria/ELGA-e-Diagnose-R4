Instance: at-elga-ediag-searchparameter-procedure-recorder
InstanceOf: SearchParameter
Usage: #definition
* name = "Procedure Recorder"
* status = #active
* description = "Erlaubt die Suche nach dem GDA, der die Diagnose in der e-Diagnose erfasst bzw. dokumentiert hat."
* code = #recorder
* base = #Procedure
* type = #reference
* expression = "Procedure.recorder"