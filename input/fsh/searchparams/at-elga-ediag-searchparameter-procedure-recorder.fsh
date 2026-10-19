Instance: ProcedureRecorder
InstanceOf: SearchParameter
Title: "Procedure Recorder"
Usage: #definition
* id = "at-elga-ediag-searchparameter-procedure-recorder"
* name = "ProcedureRecorder"
* status = #active
* description = "Erlaubt die Suche nach dem GDA, der die Prozedur in der e-Diagnose erfasst bzw. dokumentiert hat."
* code = #recorder
* base = #Procedure
* type = #reference
* expression = "Procedure.recorder"