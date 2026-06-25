{% include styleheader.md %}

<!-- Interaktionen mit Listenressourcen -->
Listenressourcen bilden die organisatorische Struktur der e-Diagnose und dienen der Zusammenfassung fachlicher Einzelressourcen zu den Kategorien Diagnosen, Prozeduren sowie Allergien und Intoleranzen. Die nachfolgenden Sub-Use-Cases beschreiben die Initialisierung, Verwaltung und Pflege dieser Listen, einschließlich des Hinzufügens, Bearbeitens, Umordnens und Entfernens von Einträgen sowie der Übernahme von Einträgen aus der Gesamtansicht.

<<<<<<< HEAD
###  Interaktionen mit Listenressourcen

#### Sub_UC_eDiag_06_01 - Nach Initialisierung leere Liste bestätigen
=======
### Sub_UC_eDiag_06_01 - Liste initialisieren
Die initiale Erstellung einer Liste erfolgt durch die e-Diagnose-Fachanwendung.

Ruft ein GDA die Liste eines Patienten zum Zweck der Bearbeitung ab ($list-read), prüft die Fachanwendung, ob bereits eine Liste vorhanden ist: existiert noch keine Liste, wird dieser im Hintergrund automatisch initial angelegt (siehe [List-Read](interactions.html#list-read)).

Der GDA erhält in diesem Fall ein Collection Bundle mit einer leeren Liste (List) mit **emptyReason** ***notstarted*** zurück. Der enthaltene list.identifer dient der zur späteren Integritätsprüfung beim Schreibvorgang.

Dieser Status *emptyReason* **kennzeichnet ausschließlich den Initialzustand** (keine Einträge in der Liste) und trifft keine Aussage darüber, ob die Person eine Diagnose, Prozedur, Allergie oder eine Intoleranz hat.

#### Ablauf

<div>{% include_relative plantuml/diagram_uc_06_01.svg %}</div>
>>>>>>> edd8156 (update read interaction)

<div>{% include_relative plantuml/diagram_uc_06_00.svg %}</div>

### Sub_UC_eDiag_06_02 - Neue Einträge in einer Liste erstellen
Ein GDA kann einen oder mehrere neue Einträge in der Liste von Diagnosen, Prozeduren, Allergien und Intoleranzen erfassen.
Hierfür führt dieser GDA ein $list-read aus und bearbeitet das von der Fachanwendung übermittelte Collection Bundle:

* Im Element **List.source** wird der aktuelle GDA dokumentiert, das Element **List.date** wird auf den aktuellen Zeitpunkt aktualisiert.
* Die entsprechende Ressource (**Condition, Procedure oder AllergyIntolerance**) wird neu erstellt und in der **List-Ressource** referenziert.
* Das **List.entry.flag** der referenzierten Ressource erhält den Wert **new**.
* Die Ressource erhält die für den jeweiligen Ressourcentyp zulässigen Statuswert (siehe [Statustabelle](workflowmanagement.html#statustabelle)).
* Die Ressource enthält die fachlich erforderlichen Informationen gemäß Ressourcentyp (siehe [ResourceProfiles](artifacts.html#structures_resource_profil)).
* Der **Meta-Tag der Ressource** kennzeichnet die Zugehörigkeit zur Liste Diagnosen, Prozeduren bzw. Allergien und Intoleranzen.
* Im Anschluss übermittlet der GDA mittels **POST $ListWrite** die aktualsiierte Liste in einem Transaction Bundle-

#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_02.svg %}</div>
   
### Sub_UC-eDiag_06_00 - Leere Liste 
Eine leere Liste mit dem Wert **emptyReason = nilknown** bedeutet, dass für den Patienten derzeit keine relevanten Einträge vorliegen. Der Status dokumentiert somit explizit das Fehlen von relevanten Einträgen und ist von einer
noch nicht befüllten Liste zu unterscheiden.

#### Ablauf




### Sub_UC_eDiag_06_03 - Bestehende Einträge innerhalb einer Liste fachlich bearbeiten
Der GDA kann Einträge in einer Liste fachlich bearbeiten.
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_03.svg %}</div>




### Sub_UC_eDiag_06_04 - Reihenfolge von Einträgen innerhalb einer Liste ändern
Der GDA kann die Reihenfolge der Listeinträge ändern. Die Einträge selbst bleiben dabei unverändert.
#### Ablauf
<div>{% include_relative plantuml/diagram_uc_06_04.svg %}</div>


### Sub_UC_eDiag_06_05 - Einträge aus einer Liste entfernen
ToDo:Wird der Eintrag nur aus der List-Ressource entfernt oder wird die referenzierte Ressource (Condition, Procedure, AllergyIntolerance) ebenfalls gelöscht/inaktiviert? 
Dieser Fall tritt ein, wenn ein relevanter Eintrag aus der relevanten Liste zu einem nicht-relevanten Eintrag in der Gesamtansicht wird. Und in diesem müssen wir auf den Sub_UC_eDiag_06_11 verweisen. Denn es muss auch das flag geändert werden. Weil in der Gesamtansicht es bestehen bleibt. 

#### Ablauf
List.entry wird entfernt, die referenzierte Ressource bleibt bestehen.
<div>{% include_relative plantuml/diagram_uc_06_05.svg %}</div>

### Sub_UC_eDiag_06_06 - Bestehende Einträge aus der Gesamtansicht in eine Liste übernehmen
ToDo: Workflow aus einem nicht-relevanten Eintrag einen relevanten zu machen. 


### Sub_UC_eDiag_06_07 - Eintrag innerhalb einer Liste durch ELGA-Teilnehmer:in löschen 
ToDo: Aus Liste entfernen, Ressource bleibt bestehen, verliert nur Listzugehörigkeit oder Löschen - Ressource wird vollständig entfernt

### Sub_UC_eDiag_06_08 - Liste durch ELGA-Teilnehmer:in löschen 
ToDo: fachliche Auswirkungen klären; gesamte List-Ressouce löschen, alle Referenzen - alle enthaltenen Diagnosen?

