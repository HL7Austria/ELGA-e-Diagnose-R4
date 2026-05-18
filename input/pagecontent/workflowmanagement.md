### Überblick der Statusänderungen der e-Diagnose Ressourcen

#### Status des List.entry.flags 

Ein Diagnoseeintrag kann, abhängig vom jeweiligen Use Case, unterschiedliche Status einnehmen. Dieser Status wird sowohl in der Condition-Ressource selbst als auch auf List-Ebene im Element List.entry.flag dokumentiert.

Das *flag*-Element eines Entries der List-Ressource beschreibt die **Art der Änderung eines Diagnoseeintrags auf Listenebene** und kann folgende Status einnehmen:<br>

| Status | Beschreibung |
|--------|------|
| **New** | Neuer Diagnoseeintrag wird der Liste hinzugefügt |
| **Unchanged** | Bestehender Diagnoseeintrag wird beibehalten/zur Kenntnis genommen |
|  **Changed**  | Bestehender Diagnoseeintrag wird geändert |
|  **Removed**  | Bestehender Diagnoseeintrag wird entfernt |

<br>
<div>{% include_relative plantuml/stateDiagram_list_flag.svg %}</div>
<br>

#### Auswirkung der Zugriffsart auf List.entry.flags und Bundle-Inhalte

Je nach Zugriffsart (Read-only, Read-to-Write oder Write) ergeben sich unterschiedliche Auswirkungen auf die Verarbeitung dieser Status sowie auf die enthaltenen Ressourcen in den jeweiligen Bundles (siehe [Zugriffsarten auf Diagnoseneinträge](interactions.html#zugriffsarten-auf-den-medikationsplan)). ToDo: Begrifflichkeiten anpassen!!!
<br>

| Status | Read-only-Zugriff | Read-to-Write-Zugriff | Write-Zugriff |
|--------|------|------|------|
| **new** |- List-Entries, die vom Vorgänger-GDA mit *new* geflaggt wurden, bleiben beim read-only-Zugriff **unverändert**.<br>- Die neuen MedicationRequests sind im Collection Bundle enthalten.|- List-Entries, die vom Vorgänger-GDA mit *new* geflaggt wurden, werden beim Read-to-Write-Zugriff von der **Fachanwendung** als **unchanged** geflaggt.<br>- Die betreffenden MedicationRequests sind im Collection Bundle enthalten.|- List-Entries, die beim schreibenden Zugriff vom aktuellen GDA mit *new* geflaggt wurden, werden dem Medikationsplan neu hinzugefügt.<br>- Die betreffenden MedicationRequests müssen im Transaction Bundle **enthalten** sein.|
| **unchanged** |- List-Entries, die vom Vorgänger-GDA mit *unchanged* geflaggt wurden, bleiben beim read-only-Zugriff **unverändert**.<br>- Die unveränderten MedicationRequests sind im Collection Bundle enthalten. |- List-Entries, die vom Vorgänger-GDA als *unchanged* geflaggt wurden, bleiben beim Read-to-Write-Zugriff von der Fachanwendung unverändert.<br>- Die betreffenden MedicationRequests sind im Collection Bundle enthalten.|- List-Entries, die vom aktuellen GDA nicht verändert wurden, bleiben beim schreibenden Zugriff mit *unchanged* geflaggt. Sie gelten somit als zur Kenntnis genommen.<br>-  Die betreffenden MedicationRequests sind nicht im Transaction Bundle enthalten, sondern werden in der Liste **nur referenziert**.|
|  **changed**  |- List-Entries, die vom Vorgänger-GDA mit *changed* geflaggt wurden, bleiben beim read-only-Zugriff **unverändert**.<br>- Die geänderten MedicationRequests sind im Collection Bundle enthalten.|- List-Entries, die vom Vorgänger-GDA mit *changed* geflaggt wurden, werden beim Read-to-Write-Zugriff von der **Fachanwendung** als **unchanged** geflaggt.<br>- Die betreffenden MedicationRequests sind im Collection Bundle enthalten. |- List-Entries, die vom aktuellen GDA mit *changed* geflaggt werden, wurden geändert.<br>- Die betreffenden MedicationRequests müssen im Transaction Bundle **enthalten** sein.|
|  **removed**  |- List-Entries, die vom Vorgänger-GDA mit *removed* geflaggt wurden, bleiben beim read-only-Zugriff **unverändert**.<br>- Die zum Entfernen markierten MedicationRequests sind im Collection Bundle enthalten. |- List-Entries, die vom Vorgänger-GDA mit *removed* geflaggt wurden, werden beim Read-to-Write-Zugriff von der **Fachanwendung entfernt**.<br>- Die betreffenden MedicationRequests sind im Collection Bundle **nicht enthalten**.|- List-Entries, die beim schreibenden Zugriff vom aktuellen GDA mit *removed* geflaggt wurden, sollen aus dem Medikationsplan entfernt werden.<br>- Die betreffenden MedicationRequests werden u.a. mit dem entsprechenden Status geflaggt und müssen im Transaction Bundle **enthalten** sein. |

<br>

#### Statustabelle 
In Bearbeitung