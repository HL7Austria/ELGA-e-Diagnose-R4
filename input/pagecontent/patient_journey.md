{% include styleheader.md %}
Das folgende Anwendungsbeispiel beschreibt anhand einer fiktiven **Patient Journey**, wie die klinisch relevanten Informationen eines Patienten im Rahmen der e-Diagnose aufgebaut, ergänzt und aktualisiert werden. Dabei werden Diagnosen, Prozeduren sowie Allergien und Intoleranzen strukturiert erfasst und einzelne Summary-Einträge über die jeweilige Summary-Listen zusammengeführt.

Die Patient Journey zeigt den Lebenszyklus der e-Diagnose von der erstmaligen Initialisierung der Summary-Liste über das Hinzufügen und Aktualisieren einzelner Einträge bis hin zur Korrektur bzw. Löschung eines Eintrags.


### 1. Arztbesuch – Erstvorstellung und Initialisierung der e-Diagnose

[Dr Musterärztin Melanie](Practitioner-PractitionerExample.html) sieht [Max Mustermann](Patient-PatientExample.html) am **3. März 2026** erstmals in ihrer Ordination. Zur besseren klinischen Einschätzung ruft sie die vorhandenen medizinischen Informationen aus der e-Diagnose ab.


**Abruf und Initialisierung der Summary-Liste**

Für Herrn Mustermann existiert bisher noch keine strukturierte e-Diagnose-Summary-Liste. Die e-Diagnose wird daher erstmals initialisiert. Für den Patienten wird eine leere Summary-Liste angelegt. Diese enthält den Patienten [Max Mustermann](Patient-PatientExample.html), die erstellende e-Diagnose [Fachanwendung](Device-DeviceExample.html) sowie das Datum der letzten Aktualisierung. Da noch keine Einträge vorhanden sind, wird zusätzlich der Grund für die leere Liste über List.emptyReason mit dem Code [Notstarted](List-ListExample01.html) angegeben.


**Erfassung bestehender Diagnosen und Allergien**

Im Rahmen der Anamnese und körperlichen Untersuchung erhebt die Ärztin die aktuellen gesundheitlichen Probleme sowie bereits länger bestehende Grunderkrankungen und Allergien des Patienten. 
Herr Mustermann berichtet über einen seit mehreren Jahren bestehenden, mit Lisimopril 10 mg medikamentös behandelten Bluthochdruck. Momentan bestehen bei Herrn Mustermann Schmerzen beim Schlucken und Fieber über 38,5 Grad. Die körperliche Untersuchung ergibt eine eitrige Angina.
Herr Mustermann gibt an, seit seiner Kindheit an einer Penicillinallergie zu leiden. Da Herr Mustermann aufgrund seiner bekannten Penicillinallergie kein Amoxicillin erhalten darf, entscheidet sich die Ärztin für eine Behandlung mit Clarithromycin und Mexalen 500 mg bei Bedarf zur Schmerzbehandlung.

Die relevanten Informationen werden in den jeweiligen Ressourcen dokumentiert. Für die [Hypertonie](Condition-ConditionSummaryExample.html) und [Suppurative tonsillitis](Condition-ConditionGesamtlisteExample1.html) werden jeweils eine Condition und für die [Amoxicillin](AllergyIntolerance-AllergyExample.html)-Allergie eine AllergyIntolerance angelegt.
Bei einem neuerlichen Abruf der e-Diagnose werden die eingetragenen Summary-Einträge (Hypertonie und Amoxicillin-Allergie) in den jeweiligen Kategorien der Summary-Listen zurückgegeben [Condtion-Summary-Liste](List-ListConditionExample.html) und [Allergy-Summary-Liste](List-ListAllergyExample.html). Um eine Gesamtansicht aller Diagnoseneinträge zu erhalten führt Dr. Musterärztin ein [Einträge abrufen](uc_ediag_01_lesen.html#einträge-abrufen) aus.


### 2.Arztbesuch - Auftreten von Nebenwirkungen

Die Symptome der eitrige Angina haben sich duch die Einnahme der antibiotischen Therapie deutlich gebessert. Allerdings berichtet Herr Mustermann bei seinem Ordinationsbesuch am **6. März 2026** über Durchfall, sowie einem Juckreiz im Genitalbeeich. Bei der Untersuchung stellt Dr. Musterärztin eine Pilzinfektion fest, die vermutlich im Zusammenhang mit der vorausgegangen Antibiothikatherapie steht. 

Für die [Medikamenteninduzierte Diarrhö](Condition-ConditionGesamtlisteExample3.html) und die diagnostizierte [Candida-Balanitis](Condition-ConditionGesamtlisteExample2.html) werden entsprechende Einträge in der Gesamtansicht aller Diagnoseneinträge angelegt. 





