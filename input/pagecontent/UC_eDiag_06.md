{% include styleheader.md %}

<!-- Technische Use Cases - Diagnosen schreiben, bearbeiten, korrigieren -->

Die e-Diagnose ermöglicht die Verwaltung von Diagnosen, Prozeduren sowie Allergien und Intoleranzen für ELGA-Teilnehmer:innen.

Zur Bearbeitung der e-Diagnose werden zwei Arten von Interaktionen unterstützt:
- Interaktionen auf Ebene der relevanten Listen (List-Ressourcen)
- Interaktionen auf Ebene der fachlichen Einzelressourcen (z. B. Condition, Procedure, AllergyIntolerance)

Vor der Durchführung von Änderungen werden die aktuellen Datenbestände geladen. Anschließend können relevante Listen bearbeitet sowie fachliche Einzelressourcen erfasst, geändert, storniert oder gelöscht werden.

Die folgende Darstellung gibt einen Überblick über die in der e-Diagnose verwalteten Kategorien sowie die möglichen Interaktionen auf Listen- und Einzelressourcenebene.

[![diagram](ediag_kategorie.png){: style="width: 60%"}](ediag_kategorie.png)

Die e-Diagnose Fachanwendung unterstützt das Laden, Erfassen, Bearbeiten, Stornieren und Löschen von Diagnosen, Prozeduren, Allergien und Intoleranzen sowie die Verwaltung relevanter Listen. Die nachfolgenden Sub-Use-Cases beschreiben die dafür erforderlichen Interaktionen und Transaktionen.

###  Interaktionen mit relevanten Listenressourcen
#### Sub_UC_eDiag_06_01 - Bestehende Listen relevanter Einträge laden
#### Sub_UC_eDiag_06_02 - Neue Einträge zu einer Liste hinzufügen
#### Sub_UC_eDiag_06_03 - Bestehende Einträge innerhalb einer Liste fachlich bearbeiten
#### Sub_UC_eDiag_06_04 - Reihenfolge von Einträgen innerhalb einer Liste ändern
#### Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen
#### Sub_UC_eDiag_06_06 - Bestehende Einträge aus der Gesamtansicht in eine Liste übernehmen
#### Sub_UC_eDiag_06_07 - Einträge innerhalb einer Liste stornieren

#### Interaktionen mit fachlichen Einzelressourcen 
### Sub_UC_eDiag_06_08 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfassen
### Sub_UC_eDiag_06_09 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen bearbeiten
### Sub_UC_eDiag_06_10 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen stornieren
### Sub_UC_eDiag_06_11 - Diagnosen, Prozeduren sowie Allergien und Intoleranzen löschen