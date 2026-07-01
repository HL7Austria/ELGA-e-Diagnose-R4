{% include styleheader.md %}

<!-- Interaktionen mit Listenressourcen -->
Listenressourcen bilden die organisatorische Struktur der e-Diagnose und dienen der Zusammenstellung fachlicher Einzelressourcen zu den Kategorien Diagnosen, Prozeduren sowie Allergien und Intoleranzen. Die Zugehörigkeit zu einer Liste bestimmt die fachliche Relevanz einer Ressource (meta.tag=relevant). Die nachfolgenden Sub-Use-Cases beschreiben die Initialisierung und Verwaltung dieser Listen sowie das Aufnehmen, Entfernen und Umordnen von Einträgen. 
ToDo: Fachliche Änderungen an Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfolgen ausschließlich über die jeweiligen Einzelressourcen. - korrekt?

###  Interaktionen mit Listenressourcen 

#### Sub_UC_eDiag_06_01 - Nach Initialisierung leere Liste bestätigen
ToDo: Die Überprüfung aus diesem UC wird bereits bei List-Read durchgeführt.

<div>{% include_relative plantuml/diagram_uc_06_00.svg %}</div>

### Sub_UC_eDiag_06_02 - Bestehende Ressource in eine Liste aufnehmen
Nach dem Erfassen einer neuen medizinischen Ressource [Sub_UC_eDiag_06_09](uc_ediag_06_int_res.html#sub-uc-ediag-06-09) kann diese in eine Liste aufgenommen werden. Die Fachanwendung kennzeichnet die Ressource anschließend als relevant (meta.tag = relevant).


#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_02.svg %}</div>
   
### Sub_UC-eDiag_06_00 - Leere Liste 
Eine leere Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine relevanten Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von relevanten Einträgen und ist von einer
noch nicht befüllten Liste zu unterscheiden.

#### Ablauf




### Sub_UC_eDiag_06_03 - Bestehende Listeinträge fachlich bearbeiten
TODo: Der GDA kann Einträge in einer Liste fachlich bearbeiten - stimmt nicht mehr?
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_03.svg %}</div>




### Sub_UC_eDiag_06_04 - Reihenfolge von Listeinträge ändern
Der GDA kann die Reihenfolge der Listeinträge ändern. Die Einträge selbst bleiben dabei unverändert.
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_04.svg %}</div>


### Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen
Die Referenz auf die Ressource wird aus der Liste entfernt. Die referenzierte Ressource bleibt unverändert bestehen. Die Fachanwendung entfernt die Kennzeichnung als relevant (meta.tag = relevant).

#### Ablauf
List.entry wird entfernt, die referenzierte Ressource bleibt bestehen.
<div>{% include_relative plantuml/diagram_uc_06_05.svg %}</div>

### Sub_UC_eDiag_06_06 - Bestehende Einträge aus der Gesamtansicht in eine Liste übernehmen
ToDo: Brauchen wir diesen UC noch, oder reicht dafür 02 neue Einträge in einer Liste aufnehmen? Voraussetzung ist, die Ressource existiert bereits


### Sub_UC_eDiag_06_07 - Eintrag innerhalb einer Liste durch ELGA-Teilnehmer:in löschen 
ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt

### Sub_UC_eDiag_06_08 - Liste durch ELGA-Teilnehmer:in löschen 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?

