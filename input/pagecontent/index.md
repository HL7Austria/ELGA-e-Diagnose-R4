# e-Diagnose (DRAFT)

Dieser Leitfaden beschreibt die Einführung der ELGA-Anwendung **e-Diagnose**, die eine standardisierte Erfassung, Dokumentation und Verwaltung von Diagnosen, Prozeduren, Allergien, Intoleranzen und Warnungen in Österreich ermöglicht.

Ziel der Anwendung ist es, einen schnellen Zugriff auf die bestehenden Informationen zu ermöglichen, Doppeluntersuchungen zu vermeiden und die Behandlungsqualität nachhaltig zu verbessern. 
Mit der **e-Diagnose** wird der Informationsaustausch zu Diagnosen, Allergien, Intoleranzen, Prozeduren, Warnungen und medizinischen Problemen im intra- und extramuralen Bereich deutlich vereinfacht. 

Die Anwendung bietet eine **vollständige, gemeinsame Dokumentation in ELGA** und bildet gleichzeitig die **Grundlage für die Patient Summary**.

[![diagram](ediag_datenkategorien.png){: style="width: 90%"}](ediag_datenkategorien.png)

Die technische Umsetzung der eDiagnose erfolgt auf Basis des HL7® FHIR®-Standards, um eine nachhaltige, interoperable und kosteneffiziente Lösung zu gewährleisten. Die vorliegende Implementierung leistet einen Beitrag zur Weiterentwicklung sowohl der österreichischen eHealth-Strategie als auch der Anforderungen des European Health Data Space (EHDS). In Anbetracht der ab 2029 vorgesehenen Sekundärnutzung medizinischer Daten im EHDS werden durch diesen Implementation Guide die technischen Grundlagen geschaffen, um eine datenschutzkonforme Nutzung strukturierter klinischer Informationen – insbesondere Diagnosen, Prozeduren, Allergien, Intoerlanzen und Warnungen – für gemeinwohlorientierte Forschung, Qualitätssicherung und gesundheitspolitische Steuerung zu ermöglichen.

Der Implementation Guide umfasst zudem die Definition der FHIR-APIs für die Integration der eDiagnose in die ELGA-Infrastruktur sowie den standardisierten Austausch, die Speicherung und die Verarbeitung von Diagnosen, Prozeduren, Allergien, Intoleranzen und Warnungen zwischen den beteiligten Gesundheitssystemen. Dadurch wird eine semantisch interoperable und sektorenübergreifende Verfügbarkeit dieser Informationen unterstützt.