{% include styleheader.md %}
Das folgende Anwendungsbeispiel beschreibt anhand einer fiktiven **Patient Journey**, wie die klinisch relevanten Informationen eines Patienten im Rahmen der e-Diagnose aufgebaut, ergänzt und aktualisiert werden. Dabei werden Diagnosen, Prozeduren sowie Allergien und Intoleranzen strukturiert erfasst und einzelne Summary-Einträge über die jeweiligen Summary-Listen zusammengeführt.

Die Patient Journey zeigt den Lebenszyklus der e-Diagnose von der erstmaligen Initialisierung der Summary-Liste über das Hinzufügen und Aktualisieren einzelner Einträge bis hin zur Korrektur bzw. Löschung eines Eintrags.


### 1. Arztbesuch – Erstvorstellung und Initialisierung der e-Diagnose

[Dr Musterärztin Melanie](Practitioner-PractitionerExample.html) sieht [Max Mustermann](Patient-PatientExample.html) am **3. März 2026** erstmals in ihrer Ordination. Zur besseren klinischen Einschätzung ruft sie die vorhandenen medizinischen Informationen aus der e-Diagnose ab.


**Abruf und Initialisierung der Summary-Liste**

Für Herrn Mustermann existiert bisher noch keine strukturierte e-Diagnose-Summary-Liste. Die e-Diagnose wird daher erstmals initialisiert. Für den Patienten wird eine leere Summary-Liste angelegt. Diese enthält eine Referenz auf den Patienten [Max Mustermann](Patient-PatientExample.html), die erstellende e-Diagnose-[Fachanwendung](Device-DeviceExample.html) sowie das Datum der letzten Aktualisierung. Da noch keine Einträge vorhanden sind, wird zusätzlich der Grund für die leere Liste über List.emptyReason mit dem Code [Notstarted](List-ListExample01.html) angegeben.


**Erfassung bestehender Diagnosen und Allergien**

Im Rahmen der Anamnese und körperlichen Untersuchung erhebt die Ärztin die aktuellen gesundheitlichen Probleme sowie bereits länger bestehende Grunderkrankungen und Allergien des Patienten. 
Herr Mustermann berichtet über einen seit mehreren Jahren bestehenden, mit Lisinopril 10 mg medikamentös behandelten Bluthochdruck. 
Weiters gibt Herr Mustermann an, seit seiner Kindheit an einer Penicillinallergie zu leiden. 

Aktuell bestehen bei Herrn Mustermann Schmerzen beim Schlucken und Fieber über 38,5°C. Bei der körperlichen Untersuchung zeigt sich eine eitrige Angina.
Aufgrund der bekannten Penicillinallergie wird auf eine Behandlung mit Amoxicillin verzichtet. Die Ärztin entscheidet sich für eine antibiotische Behandlung mit Clarithromycin. Zusätzlich wird Mexalen 500 mg bei Bedarf zur Schmerz- und Fieberbehandlung verordnet.

Die relevanten Informationen werden in den jeweiligen Ressourcen dokumentiert. Für die [Hypertonie](Condition-ConditionSummaryExample1.html) und [Suppurative tonsillitis](Condition-ConditionGesamtlisteExample1.html) wird jeweils eine Condition und für die [Amoxicillin](AllergyIntolerance-AllergyExample1.html)-Allergie eine AllergyIntolerance angelegt.

Bei einem neuerlichen Abruf der e-Diagnose werden die eingetragenen Summary-Einträge (Hypertonie und Amoxicillin-Allergie) in den jeweiligen Kategorien der Summary-Listen zurückgegeben [Condition-Summary-Liste](List-ListConditionExample1.html) und [Allergy-Summary-Liste](List-ListAllergyExample1.html). 

Um eine Gesamtansicht aller Diagnoseneinträge zu erhalten, führt Dr. Musterärztin die Funktion [Einträge abrufen](uc_ediag_01_lesen.html#einträge-abrufen) aus.


### 2. Arztbesuch - Auftreten von Nebenwirkungen und Bearbeitung

Die Symptome der eitrigen Angina haben sich durch die antibiotische Therapie deutlich gebessert. 
Allerdings berichtet Herr Mustermann bei seinem Ordinationsbesuch am **9. März 2026** über Durchfall und Juckreiz im Genitalbereich. 

Bei der Untersuchung stellt Dr. Musterärztin eine Pilzinfektion fest, die vermutlich im Zusammenhang mit der vorausgegangenen Antibiotikatherapie steht. 

Herr Mustermann berichtet weiters, dass seit Beginn der Antibiotikatherapie Beschwerden seines seit 2010 bestehenden Morbus Crohn aufgetreten sind und er vermutet, dass die Behandlung einen Schub ausgelöst hat.

Dr. Musterärztin berücksichtigt diese Angabe bei der weiteren Beurteilung. Da Durchfall sowohl als Nebenwirkung der Antibiotikatherapie als auch im Rahmen eines Morbus-Crohn-Schubs auftreten kann, wird die Ursache entsprechend abgeklärt.
Im weiteren Gespräch erfährt Dr. Musterärztin, dass die letzte durchgeführte Koloskopie am 23. September 2025 stattgefunden hat.

Zur Behandlung der Candida-Balanitis verordnet sie Clotrimazol 1 % Creme zur lokalen Anwendung. Bezüglich der Diarrhö wird Herr Mustermann angewiesen, auf eine ausreichende Flüssigkeitszufuhr zu achten. Aufgrund der bestehenden Morbus-Crohn-Erkrankung und der vorausgegangenen Antibiotikatherapie erfolgt eine weitere klinische Abklärung der Beschwerden.

Dr. Musterärztin hält die Erkrankungen [Morbus Crohn](Condition-ConditionSummaryExample2.html) in der Summary-Liste der Diagnosen, [Medikamenteninduzierte Diarrhö](Condition-ConditionGesamtlisteExample3.html), [Candida Balanitis](Condition-ConditionGesamtlisteExample2.html) in der Gesamtansicht aller Diagnosen und die durchgeführte Untersuchung [Koloskopie](Procedure-ProcedureSummaryExample1.html) in der Summary-Liste der Prozeduren fest. 

Dr. Musterärztin ruft die [Condition-Summary-Liste](List-ListConditionExample2.html) und [Procedure-Summary-Liste](List-ListProcedureExample1.html). Dabei fällt ihr ein Fehler auf. In der Summary-Liste befindet sich eine Diagnose, die nicht zu Max Mustermanns Diagnosen gehört. Sie führt die Funktion [Eintrag in der Summary-Liste bearbeiten](uc_ediag_02_schreiben.html#eintrag-in-der-summary_liste-bearbeiten) aus und der Eintrag wird als [Entered-in-Error](Condition-ConditionSummaryExample3.html) gekennzeichnet und anschließend [Condition-Summary-Liste](List-ListConditionExample3.html) entfernt.


### ELGA-Teilnehmer - Eintrag löschen
Am **20. April 2026** nimmt Herr Mustermann über das Portal Einsicht in seine e-Diagnose. Dabei stellt er fest, dass die im März 2026 dokumentierte Pilzinfektion weiterhin in seiner Gesamtansicht aufscheint. Herr Mustermann möchte, dass dieser Eintrag entfernt wird. Er wählt die Diagnose aus und führt ein [Eintrag löschen](uc_ediag_03_teilnehmer.html#eintrag-löschen) aus. 

Dieser Eintrag wird daraufhin aus der Gesamtansicht aller Diagnosen gelöscht. Ist die Diagnose auch Bestandteil der Summary-Liste der Diagnosen, wird sie ebenfalls aus dieser entfernt. In diesem Fall wird List.source auf den Patienten gesetzt.
