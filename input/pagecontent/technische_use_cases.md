{% include styleheader.md %}

<!-- Technische Use Cases -->

Im folgenden Kapiteln werden die fachlichen Anwendungsfälle der e-Diagnose in Form technischer Use Cases beschrieben. Die zugehörigen Sequenzdiagramme veranschaulichen die beteiligten Akteure sowie die jeweiligen Abläufe.

<div>{% include_relative plantuml/diagram_interaction.svg %}</div>


### Diagnosen, Prozeduren sowie Allergien und Intoleranzen lesen
ToDo: Klären, ob hier oder in einen eigenen UC-lesen, weil hier schreiben ist? Ist die Standardoperation plan.read - get.search mit suchparameter? Wir brauchen einen Standardfall lesen und ich habe den Fall dass ich einen tiefgang machen möchte und diese lesen will. 


### Technische Use Cases - Diagnosen schreiben, bearbeiten, korrigieren
Die e-Diagnose ermöglicht die Verwaltung von Diagnosen, Prozeduren sowie Allergien und Intoleranzen für ELGA-Teilnehmer:innen. Die Fachanwendung unterstützt das Laden, Erfassen, Bearbeiten, Stornieren und Löschen von Diagnosen, Prozeduren, Allergien und Intoleranzen sowie die Verwaltung in der Gesamtansicht. Die nachfolgenden Sub-Use-Cases beschreiben die dafür erforderlichen Interaktionen und Transaktionen.

Die nachfolgend beschriebenen Use Cases basieren auf zwei Arten von Interaktionen:

- [Interaktionen mit Listenressourcen](uc_ediag_06_int_list.html)
- [Interaktionen mit fachlichen Einzelressourcen ](uc_ediag_06_int_res.html)


Vor der Durchführung von Änderungen werden die aktuellen Datenbestände geladen. Anschließend können Listen bearbeitet sowie fachliche Einzelressourcen (z. B. Condition, Procedure, AllergyIntolerance) erfasst, geändert, storniert oder gelöscht werden.
Die folgende Darstellung gibt einen Überblick über die in der e-Diagnose verwalteten Kategorien sowie deren Zuordnung auf den jeweiligen Listen- und Einzelressourcenebene.

[![diagram](ediag_kategorie.png){: style="width: 60%"}](ediag_kategorie.png)





