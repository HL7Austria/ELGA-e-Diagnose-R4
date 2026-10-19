Instance: ProcedureReport
InstanceOf: SearchParameter
Title: "Procedure Report"
Usage: #definition
* id = "at-elga-ediag-searchparameter-procedure-report"
* name = "ProcedureReport"
* status = #active
* description = "Erlaubt die Suche nach Verweisen auf e-Befunde als medizinische Evidenz."
* code = #report
* base = #Procedure
* type = #reference
* expression = "Procedure.report"