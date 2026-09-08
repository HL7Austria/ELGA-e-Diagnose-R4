{% include styleheader.md %}

Die strukturierte Dokumentation und der Austausch von Conditions, Procedures und AllergiesIntolerances sind eine wesentliche Grundlage für die medizinische Versorgung. Die eDiagnose soll diese Informationen übergreifend in ELGA verfügbar machen und damit eine gesamthafte Übersicht über den Gesundheitszustand sowie die weitere Behandlung unterstützen. Zudem soll sie die Grundlage für die Austrian Patient Summary (APS) schaffen.


### Fachliches Umfeld & Datenkategorien
Die IPS unterscheidet mehrere Datenkategorien. Diese werden im Rahmen der Konzeption der eDiagnose berücksichtigt, insbesondere im Hinblick auf die spätere Verwendung der Daten für die APS.


| IPS-Datenkategorie | FHIR-Ressource | Verwendung in der eDiagnose |
|---|---|---|
| **Problem List** | Conditions | Diagnosen-Summary-Liste |
| **History of Past Problems** | Conditions | Diagnosen-Summary-Einträge |
| **History of Procedures** | Procedures | Prozeduren-Summary-Einträge |
| **Allergies and Intolerances** | AllergiesIntolerances | Allergie- und Intoleranzen-Summary-Einträge |

[![diagram](summary_listen_dokumentstruktur.png){: style="width: 60%"}](summary_listen_dokumentstruktur.png)

