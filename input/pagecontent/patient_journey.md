
Das folgende Anwendungsbeispiel beschreibt anhand einer fiktiven **Patient Journey**, wie die klinisch relevanten Informationen eines Patienten im Rahmen der e-Diagnose aufgebaut, ergänzt und aktualisiert werden. Dabei werden Diagnosen, Prozeduren sowie Allergien und Intoleranzen strukturiert erfasst und einzelne Einträge über die jeweiligen Summary-Listen hervorgehoben.

Die Patient Journey zeigt den Lebenszyklus der e-Diagnose von der erstmaligen Initialisierung der Summary-Listen über das Hinzufügen und Aktualisieren einzelner Einträge bis hin zur Korrektur bzw. Löschung eines Eintrags.

{% include patient_journey_animation.md %}

### 1. Arztbesuch - Erstvorstellung und Initialisierung der e-Diagnose

**Abruf und Initialisierung der Summary-Listen**

[Dr Musterärztin Melanie](Practitioner-PractitionerExample.html) sieht [Max Mustermann](Patient-PatientExample.html) am **3. März 2026** erstmals in ihrer Ordination. Zur besseren klinischen Einschätzung ruft sie die vorhandenen medizinischen Informationen aus der e-Diagnose ab.

Für Herrn Mustermann existieren bisher noch keine Summary-Listen, weshalb diese initialisiert werden. Für den Patienten wird für jede Kategorie eine leere Summary-Liste angelegt. Diese referenziert den Patienten [Max Mustermann](Patient-PatientExample.html), die [e-Diagnose-Fachanwendung](Device-DeviceExample.html) als erstellendes System sowie das Initialisierungsdatum. Außerdem wird im Rahmen der Initialisierung der `List.emptyReason` auf `notstarted` gesetzt als Begründung dafür, warum die Summary-Liste leer ist, siehe: 
- [Beispiel für eine leere Allergy-Summary-Liste](List-AllergyListEmpty.html) 
- [Beispiel für eine leere Condition-Summary-Liste](List-ConditionListEmpty.html) 
- [Beispiel für eine leere Proceduren-Summary-Liste](List-ProcedureListEmpty.html) 

**Erfassung bestehender Diagnosen und Allergien**

Im Rahmen der Anamnese und körperlichen Untersuchung erhebt die Ärztin die aktuellen gesundheitlichen Probleme sowie bereits länger bestehende Grunderkrankungen und Allergien des Patienten. 
Herr Mustermann berichtet über einen seit mehreren Jahren bestehenden, mit Lisinopril 10 mg medikamentös behandelten Bluthochdruck. 
Weiters gibt Herr Mustermann an, seit seiner Kindheit an einer Penicillinallergie zu leiden. 

Aktuell bestehen bei Herrn Mustermann Schmerzen beim Schlucken und Fieber über 38,5°C. Bei der körperlichen Untersuchung zeigt sich eine eitrige Angina.
Aufgrund der bekannten Penicillinallergie wird auf eine Behandlung mit Amoxicillin verzichtet. Die Ärztin entscheidet sich für eine antibiotische Behandlung mit Clarithromycin. Zusätzlich wird Mexalen 500 mg bei Bedarf zur Schmerz- und Fieberbehandlung verordnet.

Die relevanten Informationen werden in den jeweiligen Ressourcen dokumentiert. Für die [Hypertonie](Condition-ConditionEntry01.html) und [Suppurative tonsillitis](Condition-ConditionEntry02.html) werden jeweils eine Condition angelegt. Die Hypertonie wird dabei explizit in der Summary-Liste der Diagnosen angelegt, damit sie auch anderen GDA in Zukunft bei Abruf der Summary-Liste in dieser angezeigit wird. 
Für die [Amoxicillin](AllergyIntolerance-AllergyEntry01.html)-Allergie wird eine AllergyIntolerance angelegt. Aufgrund der medizinischen Relevanz wird dieser Eintrag durch Dr. Musterärztin in der Summary-Liste der Allergien und Intoleranzen gespeichrt.

**Abruf der Summary-Listen und aller Diagnoseeinträge**

Bei einem neuerlichen Abruf der e-Diagnose werden die eingetragenen Summary-Einträge (Hypertonie und Amoxicillin-Allergie) in den jeweiligen Kategorien der Summary-Listen zurückgegeben [Condition-Summary-Liste](List-ConditionList01.html) und [Allergy-Summary-Liste](List-AllergyList01.html). 

Um eine Gesamtansicht aller Diagnoseeinträge zu erhalten, ruft Dr. Musterärztin [alle Einträge](use_case_read.html#alle-einträge-abrufen) ab
und erhält [alle dokumentierten Diagnosen](Bundle-ConditionSearchSet01.html) von Herrn Mustermann.

### 2. Arztbesuch - Auftreten von Nebenwirkungen und Bearbeitung

**Neue Beschwerden und diagnostische Abklärung**

Die Symptome der eitrigen Angina haben sich durch die antibiotische Therapie deutlich gebessert. 
Allerdings berichtet Herr Mustermann bei seinem Ordinationsbesuch am **9. März 2026** über Durchfall und Juckreiz im Genitalbereich. 

Bei der Untersuchung stellt Dr. Musterärztin eine Pilzinfektion fest, die vermutlich im Zusammenhang mit der vorausgegangenen Antibiotikatherapie steht. 

Herr Mustermann berichtet weiters, dass seit Beginn der Antibiotikatherapie Beschwerden aufgrund seines seit 2010 bestehenden Morbus Crohn aufgetreten sind und er vermutet, dass die Behandlung einen Schub ausgelöst hat.

Dr. Musterärztin berücksichtigt diese Angabe bei der weiteren Beurteilung. Da Durchfall sowohl als Nebenwirkung der Antibiotikatherapie als auch im Rahmen eines Morbus-Crohn-Schubs auftreten kann, wird die Ursache entsprechend abgeklärt.
Im weiteren Gespräch erfährt Dr. Musterärztin, dass die letzte durchgeführte Koloskopie am 23. September 2025 stattgefunden hat.

**Behandlung und Dokumentation**

Zur Behandlung der Candida-Balanitis verordnet sie Clotrimazol 1 % Creme zur lokalen Anwendung. Bezüglich der Diarrhö wird Herr Mustermann angewiesen, auf eine ausreichende Flüssigkeitszufuhr zu achten. Aufgrund der bestehenden Morbus-Crohn-Erkrankung und der vorausgegangenen Antibiotikatherapie erfolgt eine weitere klinische Abklärung der Beschwerden.

Dr. Musterärztin dokumentiert die Diagnosen [Morbus Crohn](Condition-ConditionEntry03.html), [Medikamenteninduzierte Diarrhö](Condition-ConditionEntry04.html), sowie [Candida Balanitis](Condition-ConditionEntry05.html). Die [Koloskopie](Procedure-ProcedureEntry01.html) wird als Prozedur dokumentiert.  Die Diagnose Morbus Crohn sowie die Prozedur Koloskopie werden durch Dr. Musterärztin in die jeweilige Summary-Liste aufgenommen.

**Abruf und Korrektur der Summary-Listen**

Dr. Musterärztin befürchtet, dass ihr bei einer Diagnose ein Fehler unterlaufen ist und ruft die [Condition-Summary-Liste](List-ConditionList02.html) ab, wobei ihr auffällt, dass sie einen falschen Code für Morbus Crohn gewählt hat. Sie storniert den [Eintrag mit dem falschen Code](Condition-ConditionEnteredInError.html). Der in Folge durch die e-Diagnose-Fachanwendung aus der [Condition-Summary-Liste](List-ConditionList03.html) entfernt wird. Anschließend erfasst sie [Morbus Crohn](Condition-ConditionEntry06.html) richtig und nimmt die Diagnose in die Summary-Liste auf.

### ELGA-Teilnehmer - Eintrag löschen

Am **20. April 2026** nimmt Herr Mustermann über das Portal Einsicht in seine e-Diagnose und ruft [alle Diagnosen](Bundle-ConditionSearchSet02.html) ab. Dabei stellt er fest, dass die im März 2026 dokumentierte Pilzinfektion in seiner Gesamtansicht aufscheint. Herr Mustermann möchte das nicht und [löscht](use_case_participant.html#eintrag-löschen) den Eintrag.

Dieser Eintrag wird daraufhin aus der Gesamtansicht [aller Diagnosen](Bundle-ConditionSearchSet03.html) gelöscht. Ist die Diagnose auch Bestandteil der Summary-Liste der Diagnosen, wird sie ebenfalls aus dieser entfernt. In diesem Fall wird List.source auf den Patienten gesetzt.
