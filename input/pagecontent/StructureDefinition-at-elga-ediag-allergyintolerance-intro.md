### Definition

AllergyIntolerance dient der Dokumentation einer klinischen Einschätzung einer Allergie oder Intoleranz sowie einer bestehenden oder potenziellen Überempfindlichkeit gegenüber einer bestimmten Substanz oder Substanzklasse und des damit verbundenen Risikos einer unerwünschten Reaktion bei Exposition.

### Profilinformationen

#### clinicalStatus und verificationStatus

Die Elemente `clinicalStatus` und `verificationStatus` stehen fachlich in engem Zusammenhang: Der `clinicalStatus` beschreibt, ob ein Zustand aktuell besteht, der `verificationStatus` gibt an, wie gesichert diese Aussage ist. Die FHIR-Basisspezifikation lässt viele Kombinationen dieser beiden Werte zu. Für e-Diagnose sind jedoch nur die in der folgenden Tabelle angeführten Kombinationen relevant und erlaubt. Andere Kombinationen sind im Rahmen von e-Diagnose nicht zu verwenden.

| `clinicalStatus` | `verificationStatus` | Fachliche Übersetzung |
|---|---|---|
| `active` | `unconfirmed` | nicht gesichert |
| `active` | `presumed` | Verdacht auf |
| `active` | `confirmed` | gesichert |
| `resolved` | `refuted` | Widerlegt/Ausschluss von |
{: .grid}

#### MustSupport-Kennzeichnung

Im Sinne der [Designentscheidungen](design_choices.html#kennzeichnung-der-relevanten-datenfelder) wurden alle relevanten Elemente mit MustSupport gekennzeichnet. 

In Bezug auf die verbotenen Elementen wird hervorgehoben, dass Freitext nur in `reaction.note.text` festgehalten werden darf. Für alle anderen verbotenen Elemente wird eine entsprechende Begründung angegeben.