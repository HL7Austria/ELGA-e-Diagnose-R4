ValueSet: ElgaListStatusVS
Title: "ELGA List Status"
Description: "Zulässige Ausprägungen des Status einer List-Ressource in ELGA."
* ^status = #active
* ^experimental = true
* http://hl7.org/fhir/list-status#current "Standardstatus für eine aktuell gültige Liste."
* http://hl7.org/fhir/list-status#retired "Status für eine Liste, die nicht mehr aktuell ist. Außerdem könnte dies der Fall sein, wenn der Patient verstorben ist. Die Liste bleibt bis zum Ende der Aufbewahrungsfrist erhalten, wird aber nicht mehr aktualisiert."


