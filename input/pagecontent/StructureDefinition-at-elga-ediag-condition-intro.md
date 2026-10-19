### Definition

Dokumentiert Diagnosen und klinisch relevante Gesundheitszustände einer Person, einschließlich Erkrankungen, Symptome, allgemeiner Zustandsbeschreibungen (Findings), familiärer Vorbelastungen sowie sonstiger gesundheitlich relevanter Probleme oder Risiken. Sie bildet eine fachliche Feststellung zu einem Gesundheitsaspekt ab und kann sowohl aktuelle als auch vergangene Zustände umfassen. 

### clinicalStatus und verificationStatus

Die Elemente `clinicalStatus` und `verificationStatus` stehen fachlich in engem Zusammenhang: Der `clinicalStatus` beschreibt, ob ein Zustand aktuell besteht, der `verificationStatus` gibt an, wie gesichert diese Aussage ist. Die FHIR-Basisspezifikation lässt viele Kombinationen dieser beiden Werte zu. Für e-Diagnose sind jedoch nur die in der folgenden Tabelle angeführten Kombinationen relevant und erlaubt. Andere Kombinationen sind im Rahmen von e-Diagnose nicht zu verwenden.

| `clinicalStatus` | `verificationStatus` | Fachliche Übersetzung |
|---|---|---|
| `active` | `provisional` | Verdacht auf |
| `active` | `differential` | Differentialdiagnose |
| `active` | - | gesichert |
| `inactive` | `refuted` | Ausschluss von |
| `inactive` | - | Zustand nach |
{: .grid}

### MustSupport-Kennzeichnung

Im Sinne der [Designentscheidungen](design_choices.html#mustsupport-kennzeichnung-von-relevanten-elementen) wurden alle relevanten Elemente mit MustSupport gekennzeichnet. 

In Bezug auf die verbotenen Elemente wird hervorgehoben, dass Freitext nur in `note.text` festgehalten werden darf. Für alle anderen verbotenen Elemente wird eine entsprechende Begründung angegeben.