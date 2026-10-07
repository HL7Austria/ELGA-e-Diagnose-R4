Instance: ConditionList03
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Zweiter Arztbesuch - nach Stornierung)"
Description: "Beispiel einer Summary-Liste, nachdem die e-Diagnose-Fachanwendung den stornierten Eintrag entfernt hat."
Usage: #example

* meta.versionId = "4"

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

// Zeitpunkt der Stornierung (ConditionEntry03EnteredInError: 2026-03-09T10:30:00+01:00)
* date = "2026-03-09T09:30:00+00:00"

// Änderung erfolgt durch die e-Diagnose-Fachanwendung, nicht durch den GDA
* source = Reference(DeviceExample)

* entry[0].item = Reference(ConditionEntry01)
