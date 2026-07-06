{% include styleheader.md %}

<!-- Interaktionen mit Listenressourcen -->
Listenressourcen bilden die organisatorische Struktur der e-Diagnose und dienen der Zusammenstellung fachlicher Einzelressourcen zu den Kategorien Diagnosen, Prozeduren sowie Allergien und Intoleranzen. Die Zugehörigkeit zu einer Liste bestimmt die fachliche Relevanz einer Ressource (meta.tag=relevant). Die nachfolgenden Sub-Use-Cases beschreiben die Initialisierung und Verwaltung dieser Listen sowie das Aufnehmen, Entfernen und Umordnen von Einträgen. 
Fachliche Änderungen an Diagnosen, Prozeduren sowie Allergien und Intoleranzen erfolgen ausschließlich über die jeweiligen Einzelressourcen. 

###  Interaktionen mit Listenressourcen 

#### Sub_UC_eDiag_06_01 - Nach Initialisierung leere Liste bestätigen
ToDo: Die Überprüfung aus diesem UC wird bereits bei List-Read durchgeführt. Teil des ELGA Core. emptyReason #nilknown. Im eDiag wir müssen zusätzlich angeben welcher ListType es ist. Eine leere Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine relevanten Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von relevanten Einträgen und ist von einer
noch nicht befüllten Liste zu unterscheiden.

<div>{% include_relative plantuml/diagram_uc_06_00.svg %}</div>

### Sub_UC_eDiag_06_02 - Bestehende Ressource in eine Liste aufnehmen
Nach dem Erfassen einer neuen medizinischen Ressource [Sub_UC_eDiag_06_09](uc_ediag_06_int_res.html#sub-uc-ediag-06-09) kann diese in eine Liste aufgenommen werden. Die Fachanwendung kennzeichnet die Ressource anschließend als relevant (meta.tag = relevant). 



#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_02.svg %}</div>
   


### Sub_UC_eDiag_06_03 - Bestehende Listeinträge fachlich bearbeiten
TODo: Der GDA kann Einträge in einer Liste fachlich bearbeiten - stimmt nicht mehr? 1. Schritt, ich erstelle eine neue poten: 2 Schritt: Will ich sie verknüpfen, muss ich auf die bestehenden Ressourcen zugreifen mit dem Identifier 123, der muss vom Client zwischengespeichert werden, damit dieser an die FA mitgesendet werden kann. 
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_03.svg %}</div>




### Sub_UC_eDiag_06_04 - Reihenfolge von Listeinträge ändern
Der GDA kann die Reihenfolge der Listeinträge ändern. Die Einträge selbst bleiben dabei unverändert. Evtl. auch in den ELGA Core mitnehmen. 
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_04.svg %}</div>


### Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen
Die Referenz auf die Ressource wird aus der Liste entfernt (removed). Die referenzierte Ressource bleibt unverändert bestehen. Die Fachanwendung entfernt die Kennzeichnung als relevant (meta.tag = relevant).

#### Ablauf
List.entry wird entfernt, die referenzierte Ressource bleibt bestehen.
<div>{% include_relative plantuml/diagram_uc_06_05.svg %}</div>



### Sub_UC_eDiag_06_07 - Eintrag innerhalb einer Liste durch ELGA-Teilnehmer:in löschen 
ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt
Ausblenden und Löschen? Löscht der Teilnehmer einen Eintrag, muss die Historienversion mitgelöscht werden? Betsehende Referenzen auf gelöschte Ressourcen.
Lösche ich C, sage ich such mir alle List-Versionen mit C, und lösch mir alle C. Wie weit greifen, muss ich mich als Bürger durch alle Vorversionen durchklicken. 
FHIR Spezifikation über Historie - nachlesen, wie die Regel ist! Was bedeutet eine Aktualisierung auf eine historische Version? 

### Sub_UC_eDiag_06_08 - Liste durch ELGA-Teilnehmer:in löschen 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?

