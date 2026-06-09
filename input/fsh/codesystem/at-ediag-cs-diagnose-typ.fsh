CodeSystem: AtEdiagDiagnosisType
Id: at-ediag-diagnose-type
Title: "AT e-Diagnose Diagnose Typ"
Description: "Zuordnung in currently relevant und not currently relevant"
* ^status = #active
* ^experimental = true
* ^caseSensitive = true
* #relevant "currently relevant"
* #notrelevant "not currently relevant"

ValueSet: ElgaListEntryFlagVS
Title: "ELGA List.entry.flag Value Set"
Description: "ValueSet für zulässige Ausprägungen Ausprägungen des Flags eines List.Entries in ELGA."
* ^experimental = true
* include codes from system ElgaListEntryFlagCS