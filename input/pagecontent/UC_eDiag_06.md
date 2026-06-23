{% include styleheader.md %}

<!-- Technische Use Cases - Diagnosen schreiben, bearbeiten, korrigieren -->

Die e-Diagnose ermöglicht die Verwaltung von Diagnosen, Prozeduren sowie Allergien und Intoleranzen für ELGA-Teilnehmer:innen.

Zur Bearbeitung der e-Diagnose werden zwei Arten von Interaktionen unterstützt:
- Interaktionen auf Ebene der Listen (List-Ressourcen)
- Interaktionen auf Ebene der fachlichen Einzelressourcen (z. B. Condition, Procedure, AllergyIntolerance)

Vor der Durchführung von Änderungen werden die aktuellen Datenbestände geladen. Anschließend können Listen bearbeitet sowie fachliche Einzelressourcen erfasst, geändert, storniert oder gelöscht werden.

Die folgende Darstellung gibt einen Überblick über die in der e-Diagnose verwalteten Kategorien sowie die möglichen Interaktionen auf Listen- und Einzelressourcenebene.

[![diagram](ediag_kategorie.png){: style="width: 60%"}](ediag_kategorie.png)

Die e-Diagnose Fachanwendung unterstützt das Laden, Erfassen, Bearbeiten, Stornieren und Löschen von Diagnosen, Prozeduren, Allergien und Intoleranzen sowie die Verwaltung in der Gesamtansicht. Die nachfolgenden Sub-Use-Cases beschreiben die dafür erforderlichen Interaktionen und Transaktionen.

###  Interaktionen mit Listenressourcen

#### Sub_UC_eDiag_06_01 - Liste initialisieren
Die in initiale Erstellung einer Liste erfolgt durch die e-Diagnose-Fachanwendung.

Ruft ein GDA die Liste eines Patienten zum Zweck der Bearbeitung ab ($list-read), prüft die Fachanwendung, ob bereits eine Liste vorhanden ist: existiert noch keine Liste, wird dieser im Hintergrund automatisch initial angelegt (siehe [List-Read](interactions.html#list-read)).

Der GDA erhält in diesem Fall ein Collection Bundle mit einer leeren Liste (List) mit **emptyReason** ***notstarted*** zurück. Der enthaltene list.identifer dient der zur späteren Integritätsprüfung beim Schreibvorgang.

Dieser Status *emptyReason* **kennzeichnet ausschließlich den Initialzustand** (keine Einträge in der Liste) und trifft keine Aussage darüber, ob die Person eine Diagnose, Prozedur, Allergie oder eine Intoleranz hat.

##### Ablauf

<div>{% include_relative plantuml/diagram_uc_06_01.svg %}</div>


#### Sub_UC_eDiag_06_02 - Neue Einträge in einer Liste erstellen
Ein GDA kann einen oder mehrere neue Einträge in der Liste von Diagnosen, Prozeduren, Allergien und Intoleranzen erfassen.
Hierfür führt dieser GDA ein $list-read aus und bearbeitet das von der Fachanwendung übermittelte Collection Bundle:
* Im Element **List.source** wird der aktuelle GDA dokumentiert, das Element **List.date** wird auf den aktuellen Zeitpunkt aktualisiert.
* Die entsprechende Ressource (**Condition, Procedure oder AllergyIntolerance**) wird neu erstellt und in der **List-Ressource** referenziert.
* Das **List.entry.flag** der referenzierten Ressource erhält den Wert **new**.
* Die Ressource erhält die für den jeweiligen Ressourcentyp zulässigen Statuswert (siehe [Statustabelle](worflowmanagement.html#statustabelle)).
* Die Ressource enthält die fachlich erforderlichen Informationen gemäß Ressourcentyp (siehe )
   




#### Sub_UC_eDiag_06_03 - Bestehende Einträge innerhalb einer Liste fachlich bearbeiten
#### Sub_UC_eDiag_06_04 - Reihenfolge von Einträgen innerhalb einer Liste ändern
#### Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen
#### Sub_UC_eDiag_06_06 - Bestehende Einträge aus der Gesamtansicht in eine Liste übernehmen
#### Sub_UC_eDiag_06_07 - Einträge innerhalb einer Liste stornieren
#### Sub_UC_eDiag_06_08 - Eintrag innerhalb einer Liste durch ELGA-Teilnehmer:in löschen (ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt)
#### Sub_UC_eDiag_06_09 - Liste durch ELGA-Teilnehmer:in löschen (ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?)

### Interaktionen mit fachlichen Einzelressourcen 
#### Sub_UC_eDiag_06_10 Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
#### Sub_UC_eDiag_06_11- Diagnosen, Prozeduren sowie Allergien und Intoleranzen bearbeiten
#### Sub_UC_eDiag_06_12 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
#### Sub_UC_eDiag_06_13 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen löschen
#### Sub_UC_eDiag_06_14 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen durch ELGA-Teilnehmer:in ausblenden (ToDo: fachliche Entscheidung) 