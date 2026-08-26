Profile: AtElgaEdiagReference
Parent: Reference
Id: at-elga-ediag-reference
Title: "AT ELGA e-Diagnose Reference"
Description: """Das AT e-Diagnose Reference-Profil schränkt den Reference-Datentyp insofern ein, dass Referenzen auf Patient, Practitioner und Organization ein bestimmtes `identifier.system` verlangen."""

* obeys reference-identifier-system

* reference 0..0
* identifier 1..1
  * system 1..1
  * value 1..1
* type 1..1

Invariant: reference-identifier-system
Description: "Für Referenzen auf Patient MUSS `identifier.system` den Wert `urn:oid:1.2.40.0.10.2.1.1.149` haben. Für Referenzen auf Practitioner und Organization MUSS `identifier.system` den Wert `urn:ietf:rfc:3986` haben."
Severity: #error
Expression: "(type != 'Patient' and type != 'Practitioner' and type != 'Organization') or ((type = 'Patient' and identifier.system = 'urn:oid:1.2.40.0.10.2.1.1.149') or ((type = 'Practitioner' or type = 'Organization') and identifier.system = 'urn:ietf:rfc:3986'))"
