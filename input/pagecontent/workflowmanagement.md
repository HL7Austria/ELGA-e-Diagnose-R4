### Überblick der Statusänderungen der e-Diagnose Ressourcen

#### Status des List.entry.flags 

Ein Eintrag in die Summary-Liste kann, abhängig vom jeweiligen Use Case, einen unterschiedlichen Status einnehmen. Dieser Status wird sowohl beispielsweise in der Condition-Ressource selbst als auch auf List-Ebene im Element List.entry.flag dokumentiert.

Das *flag*-Element eines Entries der List-Ressource beschreibt die **Art der Änderung eines Eintrags auf Listenebene** und kann folgende Status einnehmen:<br>

| Status | Beschreibung |
|--------|------|
| **New** | Neuer Eintrag wird der Liste hinzugefügt |
| **Unchanged** | Bestehender Eintrag wird beibehalten/zur Kenntnis genommen |
|  **Removed**  | Bestehender Eintrag wird entfernt |

<br>
<div>{% include_relative plantuml/stateDiagram_list_flag.svg %}</div>
<br>

#### Auswirkung der Zugriffsart auf List.entry.flags

Je nach Zugriffsart ([List-History-Read](uc_ediag_01_lesen.html#vergangene-versionen-einer-summary-liste-abrufen-list-history-read), [List-Read](uc_ediag_01_lesen.html#liste-und-zugehörige-ressourcen-abrufen-list-read) oder [List-Write](uc_ediag_02_schreiben.html#liste-aktualisieren-list-write)) ergeben sich unterschiedliche Auswirkungen auf die Verarbeitung dieser Status sowie auf die enthaltenen Ressourcen in den jeweiligen Listen.



<table>
<thead>
<tr>
<th>Status</th>
<th>"List-History-Read"-Zugriff</th>
<th>"List-Read"-Zugriff</th>
<th>"List-Write"-Zugriff</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>new</b></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA mit <i>new</i> geflaggt wurden, bleiben beim "List-History-Read"-Zugriff <b>unchanged</b>.</li><li>Beim Abruf sind die neuen Einträge im resultierenden Collection-Bundle enthalten.</li></ul></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA mit <i>new</i> geflaggt wurden, werden beim "List-Read"-Zugriff von der <b>Fachanwendung</b> als <b>unchanged</b> geflaggt.</li><li>Die betreffenden Einträge sind beim Abruf im resultierenden Collection-Bundle enthalten.</li></ul></td>
<td><ul><li>List-Entries, die beim "List-Write"-Zugriff vom aktuellen GDA mit <i>new</i> geflaggt wurden, werden der Liste neu hinzugefügt.</li><li>Die Einträge müssen zuvor durch einen separaten Request angelegt worden sein.</li></ul></td>
</tr>
<tr>
<td><b>unchanged</b></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA mit <i>unchanged</i> geflaggt wurden, bleiben beim "List-History-Read"-Zugriff <b>unchanged</b>.</li><li>Beim Abruf sind die unveränderten Einträge im resultierenden Collection-Bundle enthalten.</li></ul></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA als <i>unchanged</i> geflaggt wurden, bleiben beim "List-Read"-Zugriff von der Fachanwendung unverändert.</li><li>Die betreffenden Einträge sind beim Abruf im resultierenden Collection-Bundle enthalten.</li></ul></td>
<td><ul><li>List-Entries, die vom aktuellen GDA nicht verändert wurden, bleiben beim "List-Write"-Zugriff mit <i>unchanged</i> geflaggt.</li></ul></td>
</tr>
<tr>
<td><b>removed</b></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA mit <i>removed</i> geflaggt wurden, bleiben beim "List-History-Read"-Zugriff <b>unchanged</b>.</li><li>Beim Abruf sind die zum Entfernen markierten Einträge im resultierenden Collection-Bundle enthalten.</li></ul></td>
<td><ul><li>List-Entries, die vom Vorgänger-GDA mit <i>removed</i> geflaggt wurden, werden beim "List-Read"-Zugriff von der <b>Fachanwendung aus der Liste entfernt</b>.</li><li>Die betreffenden Einträge sind beim Abruf im resultierenden Collection-Bundle <b>nicht enthalten</b>.</li></ul></td>
<td><ul><li>List-Entries, die beim "List-Write"-Zugriff vom aktuellen GDA mit <i>removed</i> geflaggt wurden, werden beim nächsten "List-Read"-Zugriff aus der Liste entfernt.</li></ul></td>
</tr>
</tbody>
</table>


#### Statustabelle 
In Bearbeitung