{% include styleheader.md %}
Das folgende Anwendungsbeispiel beschreibt anhand einer fiktiven **Patient Journey**, wie die klinisch relevanten Informationen eines Patienten im Rahmen der e-Diagnose aufgebaut, ergänzt und aktualisiert werden. Dabei werden Diagnosen, Prozeduren sowie Allergien und Intoleranzen strukturiert erfasst und einzelne Einträge über die jeweiligen Summary-Listen hervorgehoben.

Die Patient Journey zeigt den Lebenszyklus der e-Diagnose von der erstmaligen Initialisierung der Summary-Listen über das Hinzufügen und Aktualisieren einzelner Einträge bis hin zur Korrektur bzw. Löschung eines Eintrags.


### 1. Arztbesuch – Erstvorstellung und Initialisierung der e-Diagnose

[Dr Musterärztin Melanie](Practitioner-PractitionerExample.html) sieht [Max Mustermann](Patient-PatientExample.html) am **3. März 2026** erstmals in ihrer Ordination. Zur besseren klinischen Einschätzung ruft sie die vorhandenen medizinischen Informationen aus der e-Diagnose ab.


**Abruf und Initialisierung der Summary-Listen**

Für Herrn Mustermann existieren bisher noch keine Summary-Listen, weshalb diese initialisiert werden. Für den Patienten wird für jede Kategorie eine leere Summary-Liste angelegt. Diese enthält den Patienten [Max Mustermann](Patient-PatientExample.html), die erstellende e-Diagnose [Fachanwendung](Device-DeviceExample.html) sowie das Datum der letzten Aktualisierung. Da noch keine Einträge vorhanden sind, wird zusätzlich der Grund für die leere Liste über `List.emptyReason` mit dem Code `notstarted` (siehe [Beispiel für ](List-ListExample01.html)) angegeben.


**Erfassung bestehender Diagnosen und Allergien**

Im Rahmen der Anamnese und körperlichen Untersuchung erhebt die Ärztin die aktuellen gesundheitlichen Probleme sowie bereits länger bestehende Grunderkrankungen und Allergien des Patienten. 
Herr Mustermann berichtet über einen seit mehreren Jahren bestehenden, mit Lisinopril 10 mg medikamentös behandelten Bluthochdruck. 
Weiters gibt Herr Mustermann an, seit seiner Kindheit an einer Penicillinallergie zu leiden. 

Aktuell bestehen bei Herrn Mustermann Schmerzen beim Schlucken und Fieber über 38,5 Grad. Bei der körperlichen Untersuchung zeigt sich eine eitrige Angina.
Aufgrund der bekannten Penicillinallergie wird auf eine Behandlung mit Amoxicillin verzichtet. Die Ärztin entscheidet sich für eine antibiotische Behandlung mit Clarithromycin. Zusätzlich wird Mexalen 500 mg bei Bedarf zur Schmerz- und Fieberbehandlung verordnet.

Die relevanten Informationen werden in den jeweiligen Ressourcen dokumentiert. Für die [Hypertonie](Condition-ConditionSummaryExample1.html) und [Suppurative tonsillitis](Condition-ConditionGesamtlisteExample1.html) werden jeweils eine Condition und für die [Amoxicillin](AllergyIntolerance-AllergySummaryExample1.html)-Allergie eine AllergyIntolerance angelegt.

Bei einem neuerlichen Abruf der e-Diagnose werden die eingetragenen Summary-Einträge (Hypertonie und Amoxicillin-Allergie) in den jeweiligen Kategorien der Summary-Listen zurückgegeben [Condition-Summary-Liste](List-ListConditionExample1.html) und [Allergy-Summary-Liste](List-ListAllergyExample1.html). 

Um eine Gesamtansicht aller Diagnoseeinträge zu erhalten, ruft Dr. Musterärztin ein [alle Einträge](uc_ediag_01_lesen.html#alle-einträge-abrufen) ab.


### 2. Arztbesuch - Auftreten von Nebenwirkungen und Bearbeitung der Gesamtansicht

Die Symptome der eitrigen Angina haben sich durch die antibiotische Therapie deutlich gebessert. 
Allerdings berichtet Herr Mustermann bei seinem Ordinationsbesuch am **9. März 2026** über Durchfall sowie einem Juckreiz im Genitalbereich. 

Bei der Untersuchung stellt Dr. Musterärztin eine Pilzinfektion fest, die vermutlich im Zusammenhang mit der vorausgegangenen Antibiothikatherapie steht. 

Herr Mustermann berichtet weiters, dass seit Beginn der Antibiotikatherapie Beschwerden seines seit 2010 bestehenden Morbus Crohn aufgetreten sind und er vermutet, dass die Behandlung einen Schub ausgelöst hat.

Dr. Musterärztin berücksichtigt diese Angabe bei der weiteren Beurteilung. Da Durchfall sowohl als Nebenwirkung der Antibiotikatherapie als auch im Rahmen eines Morbus-Crohn-Schubs auftreten kann, wird die Ursache entsprechend abgeklärt.
Im weiteren Gespräch erfährt Dr. Musterärztin, dass die letzte durchgeführte Koloskopie am 23. September 2025 stattgefunden hat.

Dr. Musterärztin hält die Erkrankungen [Morbus Crohn](Condition-ConditionGesamtlisteExample4.html), [Medikamenteninduzierte Diarrhö](Condition-ConditionGesamtlisteExample3.html), [Candida Balanitis](Condition-ConditionGesamtlisteExample2.html) und die [Coloskopie](Procedure-ProcedureSummaryExample1.html) als Prozedur fest. Zur Behandlung der Candida-Balanitis verordnet sie Clotrimazol 1 % Creme zur lokalen Anwendung. Bezüglich der Diarrhö wird Herr Mustermann angewiesen, auf eine ausreichende Flüssigkeitszufuhr zu achten. Aufgrund der bestehenden Morbus-Crohn-Erkrankung und der vorausgegangenen Antibiotikatherapie erfolgt eine weitere klinische Abklärung der Beschwerden.


### ELGA-Teilnehmer - Eintrag löschen

**20. April 2026** nimmt Herr Mustermann Einsicht in seine e-Diagnose. Dabei stellt er fest, dass die im März 2026 dokumentierte Pilzinfektion weiterhin in seiner Gesamtansicht aufscheint. Herr Mustermann möchte das nicht. Er entscheidet sich daher, diesen Eintrag als ELGA-Teilnehmer zu löschen (siehe [Eintrag löschen](uc_ediag_03_teilnehmer.html#eintrag-löschen)). Der Eintrag wird aus der Gesamtansicht entfernt. 
