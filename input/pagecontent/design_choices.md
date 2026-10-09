

In Arbeit.

- Nur `POST` für Einträge.
- Liste mit `GET` und $write
  - ob History für Liste nötig, wird in https://github.com/HL7Austria/ELGA-e-Diagnose-R4/issues/13 noch diskutiert
- Info über unsicherheit bezüglich Patient Compartment
- Abgrenzung zwischen e-Diagnose Anwendungsfällen und allem, was eine Client-Applikation vielleicht noch implementieren kann/soll

<a name="logische-referenzen"></a>
### Informationen über GDA und Patienten

Stammdaten zu Gesundheitsdiensteanbietern (GDA) und Patienten werden ausschließlich von der e-Diagnose-Fachanwendung, bzw. von den darüberliegenden zentralen Registern, verwaltet. Client-Anwendungen dürfen daher keine eigenen `Patient`-, `Practitioner`-, `PractitionerRole`- oder `Organization`-Ressourcen übermitteln. Es genügt, diese über ihren Identifier als logische Referenz (`Reference.identifier`) anzugeben:

- **GDA:** OID des GDA laut GDA-Index (GDA-I)
- **Patient:** bereichsspezifisches Personenkennzeichen Gesundheit (bPK-GH)

Die e-Diagnose-Fachanwendung löst diese Identifier gegen den GDA-I bzw. den Zentralen Patientenindex (ZPI) auf. Bei Bedarf legt sie die zugehörigen Ressourcen an und ersetzt die logischen Referenzen durch Referenzen auf diese Ressourcen. Beim Abruf von Daten enthalten die Ressourcen daher die aufgelösten Referenzen; die referenzierten Ressourcen können über die Fachanwendung abgerufen werden.

Bei Referenzen, die auf mehrere Ressourcentypen verweisen können (z. B. `recorder`, `asserter` oder `List.source`), ergibt sich aus dem jewiligen `Reference.identifer.system`, ob es sich um eine OID oder ein bPK-GH handelt. Die e-Diagnose-Fachanwendung kann daraus den Identifier eindeutig zuordnen. Verweise auf Einträge (`List.entry.item`) sind hingegen immer Referenzen auf bereits in der e-Diagnose-Fachanwendung gespeicherte Ressourcen (`Reference.reference`).

<div class="note-to-balloters" markdown="1">
Aktuell wird in einer AG des TC FHIR daran gearbeitet, wie die e-Diagnose-Fachanwendung die Informationen aus dem GDA-I auf Basis einer OID auf die `Practitioner`-, `PractitionerRole`- und/oder `Organization`-Ressourcen umlegt.
</div>

| | Übermittelt durch die Client-Anwendung | Gespeichert bzw. abgerufen von der Fachanwendung |
|---|---|---|
| Referenz | logisch (`Reference.identifier`) | aufgelöst (`Reference.reference`) |
| Patient | `subject.identifier.system` = `urn:oid:1.2.40.0.10.2.1.1.149`<br/>`subject.identifier.value` = bPK-GH | `subject.reference` = `Patient/PatientExample` |
| GDA | `recorder.identifier.system` = `urn:ietf:rfc:3986`<br/>`recorder.identifier.value` = OID laut GDA-I | `recorder.reference` = `Practitioner/PractitionerExample` |

Das folgende Beispiel zeigt denselben Eintrag einmal als übermittelte und einmal als gespeicherte Ressource:

<table class="grid">
  <tr>
    <th>Request: <a href="AllergyIntolerance-AllergyEntry01Request.html">AllergyEntry01Request</a></th>
    <th>Gespeichert: <a href="AllergyIntolerance-AllergyEntry01.html">AllergyEntry01</a></th>
  </tr>
  <tr>
    <td>{% fragment AllergyIntolerance/AllergyEntry01Request JSON EXCEPT:patient|recorder %}</td>
    <td>{% fragment AllergyIntolerance/AllergyEntry01 JSON EXCEPT:patient|recorder %} </td>
  </tr>
</table>

**Konvention für die Beispiele:** Beispiele mit dem Suffix `Request` (z. B. [ConditionEntry01Request](Condition-ConditionEntry01Request.html), [AllergyEntry01Request](AllergyIntolerance-AllergyEntry01Request.html), [ProcedureEntry01Request](Procedure-ProcedureEntry01Request.html) sowie die in den `$write`-Parametern übermittelten Summary-Listen) zeigen die Ressource so, wie sie die Client-Anwendung übermittelt, also mit logischen Referenzen. Alle anderen Beispiele zeigen die Ressource so, wie sie die e-Diagnose-Fachanwendung speichert und zurückliefert, also mit aufgelösten Referenzen. Für die übrigen Einträge der [Patient Journey](patient_journey.html) gilt dasselbe Muster; auf eigene Request-Beispiele wird verzichtet.
