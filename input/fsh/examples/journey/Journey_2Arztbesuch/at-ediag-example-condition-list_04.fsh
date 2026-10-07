Instance: ConditionList04
InstanceOf: AtEdiagList
Title: "Condition Summary-Liste (Zweiter Arztbesuch - korrigiert)"
Description: "Beispiel einer Summary-Liste, nachdem der stornierte Eintrag durch die korrekt erfasste Diagnose ersetzt wurde."
Usage: #example

* status = #current
* mode = #working

* code = $cs-loinc#11450-4

* subject = Reference(PatientExample)

* date = "2026-03-09T10:35:00+00:00"

* source = Reference(PractitionerExample)

* entry[0].item = Reference(ConditionEntry01)
* entry[1].item = Reference(ConditionEntry06)
