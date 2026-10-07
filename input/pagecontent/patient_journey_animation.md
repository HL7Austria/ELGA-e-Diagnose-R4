<style>
.pj{
  --bg:#f3f5f9;
  --surface:#ffffff;
  --ink:#12182b;
  --ink-2:#4b556e;
  --ink-3:#7d869b;
  --line:#dbe0ea;
  --track:#e3e7ef;
  --blue:#3b62b5;
  --blue-soft:#e9eff9;
  --gold-field:#fdf4d6;
  --gold-line:#c9a227;
  --gold-ink:#7a5c05;
  --brick:#a33b32;
  --brick-soft:#f8e7e4;
  --grow:#2f7d4f;
  --grow-soft:#e3f2e9;
}

.pj,.pj *{box-sizing:border-box}
.pj{
  position:relative;max-width:1080px;margin:0 auto;padding:28px 22px 0;
  background:var(--bg);color:var(--ink);
  font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
  font-size:15px;line-height:1.5
}
.pj .sr{position:absolute;width:1px;height:1px;opacity:0;pointer-events:none}

.pj-title{font-size:26px;font-weight:700;letter-spacing:-.015em;margin:0 0 14px;text-wrap:balance}

.pj .legend{display:flex;flex-wrap:wrap;gap:6px 22px;margin:0 0 18px;font-size:13px;color:var(--ink-2)}
.pj .legend span{display:inline-flex;align-items:center;gap:8px}
.pj .sw{width:24px;height:14px;border-radius:4px}
.pj .sw-g{border:1.5px dashed var(--blue)}
.pj .sw-s{border:1.5px solid var(--gold-line);background:var(--gold-field)}
.pj .sw-n{width:9px;height:9px;border-radius:50%;background:var(--grow)}
.pj .sw-x{width:9px;height:9px;border-radius:50%;background:var(--brick)}

/* caption of the current step */
.pj .caption{border-left:3px solid var(--blue);padding:2px 0 2px 14px;margin:0 0 26px;min-height:48px}
.pj .caption p{margin:0;max-width:72ch;color:var(--ink-2)}
.pj .caption b{color:var(--ink);font-weight:600}
.pj .caption .d{font-variant-numeric:tabular-nums;color:var(--blue);font-weight:600;margin-right:6px}

/* three categories */
.pj .cats{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:20px;align-items:stretch}
.pj .cat{display:flex;flex-direction:column;min-width:0}
.pj .cat-t{font-size:15px;font-weight:600;margin:0 0 10px}
.pj .gesamt{
  position:relative;flex:1;border:1.5px dashed var(--blue);border-radius:12px;
  padding:22px 12px 12px;display:flex;flex-direction:column;gap:12px;min-height:170px
}
.pj .gesamt::before{
  content:"Gesamtansicht";position:absolute;top:-9px;left:12px;padding:0 6px;background:var(--bg);
  font-size:10px;font-weight:600;letter-spacing:.11em;text-transform:uppercase;color:var(--blue)
}
.pj .field{background:var(--gold-field);border:1.5px solid var(--gold-line);border-radius:9px;padding:9px 10px 11px}
.pj .field-t{display:block;font-size:11px;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:var(--gold-ink);margin-bottom:8px}
.pj .empty{margin:0;font-size:12px;color:var(--gold-ink);opacity:.8}

.pj .tags{list-style:none;margin:0;padding:0;display:flex;flex-wrap:wrap;gap:6px}
.pj .tag{
  display:inline-flex;align-items:center;gap:7px;padding:4px 10px 4px 8px;border-radius:999px;
  background:var(--surface);border:1px solid var(--line);font-size:13px;font-weight:500
}
.pj .field .tag{border-color:var(--gold-line)}
.pj .tag::before{content:"";width:8px;height:8px;border-radius:50%;background:var(--blue);opacity:.55;flex:none}
.pj .tag::after{font-size:9px;font-weight:700;letter-spacing:.06em;text-transform:uppercase}
.pj .tag a{color:inherit;text-decoration:none}
.pj .tag a:hover,.pj .tag a:focus-visible{text-decoration:underline}
/* cancelled entry remains visible in the Gesamtansicht */
.pj .tag.void{background:var(--brick-soft);border-color:var(--brick);color:var(--brick)}
.pj .tag.void::before{background:var(--brick);opacity:1}
.pj .tag.void span{text-decoration:line-through;text-decoration-thickness:1.5px}
.pj .tag.void::after{content:"storniert"}

/* exchange between client and server */
.pj .wire{margin:28px 0 0;padding-top:18px;border-top:1px solid var(--line)}
.pj .wire-t{font-size:11px;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:var(--ink-3);margin:0 0 10px}
.pj .lanes{display:flex;justify-content:space-between;gap:12px;font-size:12px;font-weight:600;color:var(--ink-2);margin-bottom:9px}
.pj .msgs{display:flex;flex-direction:column;gap:5px}
.pj .msg{display:flex;flex-wrap:wrap;align-items:baseline;gap:4px 10px;padding:6px 11px;border-radius:7px;font-size:12.5px;color:var(--ink-2)}
.pj .msg code{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12px;font-weight:600;color:var(--ink);overflow-wrap:anywhere}
.pj .msg .t{min-width:0}
.pj .msg a,.pj .note a{color:var(--blue);text-decoration:underline;text-underline-offset:2px}
.pj .req{background:var(--blue-soft);border-left:3px solid var(--blue);margin-right:12%}
.pj .req::after{content:"\2192";margin-left:auto;padding-left:8px;color:var(--blue);font-weight:700}
.pj .res{background:var(--surface);border-right:3px solid var(--line);margin-left:12%;text-align:right}
.pj .res::before{content:"\2190";margin-right:auto;padding-right:8px;color:var(--ink-3);font-weight:700}
.pj .note{font-size:12px;font-style:italic;color:var(--ink-3);text-align:center;padding:1px 10px;margin:0}

/* timeline (radio labels) */
.pj .bar{
  position:sticky;bottom:0;margin:30px -22px 0;padding:14px 22px 16px;
  background:var(--bg);border-top:1px solid var(--line);
  display:flex;align-items:flex-start;gap:10px
}
.pj .stops{position:relative;flex:1;min-width:0;display:grid;grid-template-columns:repeat(5,1fr)}
/* previous / next step (one label per step, shown via .st) */
.pj .nav{flex:none;width:34px}
.pj .arrow{
  display:flex;align-items:center;justify-content:center;width:34px;height:34px;margin-top:-8px;
  border-radius:50%;border:1.5px solid var(--line);background:var(--surface);
  color:var(--blue);font-size:20px;line-height:1;cursor:pointer;user-select:none
}
.pj .arrow:hover{border-color:var(--blue);background:var(--blue-soft)}
.pj .arrow.off{color:var(--ink-3);opacity:.45;cursor:default}
.pj .arrow.off:hover{border-color:var(--line);background:var(--surface)}
.pj .line,.pj .fill{position:absolute;top:7px;height:3px;border-radius:2px}
.pj .line{left:10%;right:10%;background:var(--track)}
.pj .fill{left:10%;width:0;background:var(--blue)}
.pj .stop{position:relative;display:flex;flex-direction:column;align-items:center;gap:3px;cursor:pointer;padding:0 4px;text-align:center}
.pj .dot{width:17px;height:17px;border-radius:50%;background:var(--surface);border:2px solid var(--line)}
.pj .stop .d{font-size:12px;font-variant-numeric:tabular-nums;color:var(--ink-2)}
.pj .stop .n{font-size:11px;color:var(--ink-3)}
.pj .stop:hover .dot{border-color:var(--blue)}

/* ---------- state per step (no JavaScript) ---------- */
.pj #s0:checked ~ * .st:not(.on0),
.pj #s1:checked ~ * .st:not(.on1),
.pj #s2:checked ~ * .st:not(.on2),
.pj #s3:checked ~ * .st:not(.on3),
.pj #s4:checked ~ * .st:not(.on4){display:none}

/* newly added in this step */
.pj #s1:checked ~ * .new1,
.pj #s2:checked ~ * .new2,
.pj #s3:checked ~ * .new3{border-color:var(--grow);box-shadow:0 0 0 2px var(--grow-soft)}
.pj #s1:checked ~ * .new1::after,
.pj #s2:checked ~ * .new2::after,
.pj #s3:checked ~ * .new3::after{content:"neu";color:var(--grow)}

/* removed in this step */
.pj #s3:checked ~ * .gone3,
.pj #s4:checked ~ * .gone4{background:var(--brick-soft);border-color:var(--brick);color:var(--brick)}
.pj #s3:checked ~ * .gone3::before,
.pj #s4:checked ~ * .gone4::before{background:var(--brick);opacity:1}
.pj #s3:checked ~ * .gone3 span,
.pj #s4:checked ~ * .gone4 span{text-decoration:line-through;text-decoration-thickness:1.5px}
.pj #s3:checked ~ * .gone3::after,
.pj #s4:checked ~ * .gone4::after{content:attr(data-gone)}

/* timeline: progress + current stop */
.pj #s1:checked ~ .bar .fill{width:20%}
.pj #s2:checked ~ .bar .fill{width:40%}
.pj #s3:checked ~ .bar .fill{width:60%}
.pj #s4:checked ~ .bar .fill{width:80%}
.pj #s0:checked ~ .bar [for="s0"] .dot,
.pj #s1:checked ~ .bar [for="s1"] .dot,
.pj #s2:checked ~ .bar [for="s2"] .dot,
.pj #s3:checked ~ .bar [for="s3"] .dot,
.pj #s4:checked ~ .bar [for="s4"] .dot{background:var(--blue);border-color:var(--blue);box-shadow:0 0 0 4px var(--surface)}
.pj #s0:checked ~ .bar [for="s0"] .d,
.pj #s1:checked ~ .bar [for="s1"] .d,
.pj #s2:checked ~ .bar [for="s2"] .d,
.pj #s3:checked ~ .bar [for="s3"] .d,
.pj #s4:checked ~ .bar [for="s4"] .d{color:var(--blue);font-weight:600}
.pj #s0:focus-visible ~ .bar [for="s0"] .dot,
.pj #s1:focus-visible ~ .bar [for="s1"] .dot,
.pj #s2:focus-visible ~ .bar [for="s2"] .dot,
.pj #s3:focus-visible ~ .bar [for="s3"] .dot,
.pj #s4:focus-visible ~ .bar [for="s4"] .dot{outline:2px solid var(--blue);outline-offset:3px}

@media (prefers-reduced-motion:no-preference){
  .pj .fill{transition:width .25s ease}
}
@media (max-width:820px){
  .pj .cats{grid-template-columns:1fr}
  .pj .gesamt{min-height:0}
  .pj .stop .n{display:none}
  .pj .req{margin-right:0}
  .pj .res{margin-left:0}
}
</style>

<div class="pj">
  <input class="sr" type="radio" name="pj-step" id="s0" aria-label="03.03.2026 Initialisierung" checked>
  <input class="sr" type="radio" name="pj-step" id="s1" aria-label="03.03.2026 1. Arztbesuch">
  <input class="sr" type="radio" name="pj-step" id="s2" aria-label="09.03.2026 2. Arztbesuch">
  <input class="sr" type="radio" name="pj-step" id="s3" aria-label="09.03.2026 Storno und Korrektur">
  <input class="sr" type="radio" name="pj-step" id="s4" aria-label="20.04.2026 Löschung">

  <header>
    <p class="pj-title" role="heading" aria-level="2">Patient Journey Max Mustermann</p>
    <div class="legend">
      <span><i class="sw sw-g"></i>Gesamtansicht – alle Einträge</span>
      <span><i class="sw sw-s"></i>Summary-Liste</span>
      <span><i class="sw sw-n"></i>neu</span>
      <span><i class="sw sw-x"></i>storniert / gelöscht</span>
    </div>
  </header>

  <div class="caption">
    <p class="st on0"><span class="d">03.03.2026</span><b>Initialisierung.</b> Die e-Diagnose Fachanwendung legt je Kategorie eine leere Summary-Liste an.</p>
    <p class="st on1"><span class="d">03.03.2026</span><b>1. Arztbesuch.</b> Hypertonie und Amoxicillin-Allergie kommen in die Summary-Listen, die akute Angina nur in die Gesamtansicht.</p>
    <p class="st on2"><span class="d">09.03.2026</span><b>2. Arztbesuch.</b> Morbus Crohn und Koloskopie werden in die Summary-Listen aufgenommen – Morbus Crohn allerdings irrtümlich mit dem Code für Hyperthyreose. Diarrhö und Candida-Balanitis kommen nur in die Gesamtansicht.</p>
    <p class="st on3"><span class="d">09.03.2026</span><b>Storno und Korrektur.</b> Die Ärztin storniert den falsch codierten Eintrag, die Fachanwendung entfernt ihn aus der Summary-Liste. Danach erfasst sie Morbus Crohn korrekt und nimmt ihn in die Summary-Liste auf.</p>
    <p class="st on4"><span class="d">20.04.2026</span><b>Löschung durch den Patienten.</b> Max Mustermann löscht die Candida-Balanitis über das Portal aus seiner Gesamtansicht. Der stornierte Eintrag bleibt in der Gesamtansicht sichtbar.</p>
  </div>

  <div class="cats">
    <section class="cat">
      <p class="cat-t" role="heading" aria-level="3">Diagnosen</p>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0">leer</p>
          <ul class="tags">
            <li class="tag st on1 on2 on3 on4 new1"><a href="Condition-ConditionEntry01.html"><span>Hypertonie</span></a></li>
            <li class="tag st on2 on3 new2 gone3" data-gone="storniert"><a href="Condition-ConditionEntry03.html"><span>Morbus Crohn (Code: Hyperthyreose)</span></a></li>
            <li class="tag st on3 on4 new3"><a href="Condition-ConditionEntry06.html"><span>Morbus Crohn</span></a></li>
          </ul>
        </div>
        <ul class="tags">
          <li class="tag st on1 on2 on3 on4 new1"><a href="Condition-ConditionEntry02.html"><span>Eitrige Angina</span></a></li>
          <li class="tag st on2 on3 on4 new2"><a href="Condition-ConditionEntry04.html"><span>Diarrhö</span></a></li>
          <li class="tag st on2 on3 on4 new2 gone4" data-gone="gelöscht"><a href="Condition-ConditionEntry05.html"><span>Candida-Balanitis</span></a></li>
          <li class="tag void st on3 on4"><a href="Condition-ConditionEntry03EnteredInError.html"><span>Morbus Crohn (Code: Hyperthyreose)</span></a></li>
        </ul>
      </div>
    </section>

    <section class="cat">
      <p class="cat-t" role="heading" aria-level="3">Prozeduren</p>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0 on1">leer</p>
          <ul class="tags">
            <li class="tag st on2 on3 on4 new2"><a href="Procedure-ProcedureEntry01.html"><span>Koloskopie</span></a></li>
          </ul>
        </div>
      </div>
    </section>

    <section class="cat">
      <p class="cat-t" role="heading" aria-level="3">Allergien und Intoleranzen</p>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0">leer</p>
          <ul class="tags">
            <li class="tag st on1 on2 on3 on4 new1"><a href="AllergyIntolerance-AllergyEntry01.html"><span>Amoxicillin-Allergie</span></a></li>
          </ul>
        </div>
      </div>
    </section>
  </div>

  <section class="wire">
    <p class="wire-t" role="heading" aria-level="3">Datenaustausch in diesem Schritt</p>
    <div class="lanes"><span>Client &ndash; GDA-Software bzw. ELGA-Portal</span><span>e-Diagnose Fachanwendung</span></div>
    <div class="msgs">
      <!-- 0 Initialisierung -->
      <div class="msg req st on0"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">aktuelle Summary-Liste abrufen</span></div>
      <div class="msg res st on0"><code>200 Bundle</code><span class="t"><a href="List-ConditionListEmpty.html">leere Liste</a>, emptyReason notstarted, v1</span></div>
      <p class="note st on0">ebenso für <a href="List-ProcedureListEmpty.html">47519-4 (Prozeduren)</a> und <a href="List-AllergyListEmpty.html">48765-2 (Allergien)</a> · List.source = <a href="Device-DeviceExample.html">e-Diagnose Fachanwendung</a></p>

      <!-- 1 Erstvorstellung -->
      <div class="msg req st on1"><code>POST /Condition</code><span class="t">2× Diagnose (<a href="Condition-ConditionEntry01.html">Hypertonie</a>, <a href="Condition-ConditionEntry02.html">Angina</a>), dazu 1× POST /AllergyIntolerance (<a href="AllergyIntolerance-AllergyEntry01.html">Amoxicillin</a>)</span></div>
      <div class="msg res st on1"><code>201 Created</code><span class="t">je eine id pro Eintrag</span></div>
      <div class="msg req st on1"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Liste inkl. versionId holen</span></div>
      <div class="msg res st on1"><code>200 Bundle</code><span class="t"><a href="List-ConditionListEmpty.html">List v1, leer</a></span></div>
      <div class="msg req st on1"><code>POST /List/$write</code><span class="t"><a href="Parameters-ConditionListWrite01.html">Parameters</a>: code, list (+ Hypertonie) · If-Match: W/"1"</span></div>
      <div class="msg res st on1"><code>200 OK</code><span class="t"><a href="List-ConditionList01.html">List v2</a> gespeichert</span></div>
      <p class="note st on1">gleicher Ablauf für die Allergie-Summary-Liste (48765-2): <a href="Parameters-AllergyListWrite01.html">$write</a> → <a href="List-AllergyList01.html">List v2</a></p>
      <div class="msg req st on1"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Summary-Liste erneut abrufen</span></div>
      <div class="msg res st on1"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionListSearchSet01.html">List v2 + Hypertonie</a> · Allergien: <a href="Bundle-AllergyListSearchSet01.html">List v2 + Amoxicillin</a></span></div>
      <div class="msg req st on1"><code>GET /Condition?patient=[id]</code><span class="t">Gesamtansicht abrufen</span></div>
      <div class="msg res st on1"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionSearchSet01.html">2 Diagnosen</a></span></div>

      <!-- 2 Zweiter Arztbesuch -->
      <div class="msg req st on2"><code>POST /Condition</code><span class="t">3× Diagnose (<a href="Condition-ConditionEntry03.html">Morbus Crohn, falsch codiert</a>, <a href="Condition-ConditionEntry04.html">Diarrhö</a>, <a href="Condition-ConditionEntry05.html">Candida</a>), dazu 1× POST /Procedure (<a href="Procedure-ProcedureEntry01.html">Koloskopie</a>)</span></div>
      <div class="msg res st on2"><code>201 Created</code><span class="t">je eine id pro Eintrag</span></div>
      <div class="msg req st on2"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Liste inkl. versionId holen</span></div>
      <div class="msg res st on2"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionListSearchSet01.html">List v2, 1 Eintrag</a></span></div>
      <div class="msg req st on2"><code>POST /List/$write</code><span class="t"><a href="Parameters-ConditionListWrite02.html">Parameters</a>: + Morbus Crohn (Code: Hyperthyreose) · If-Match: W/"2"</span></div>
      <div class="msg res st on2"><code>200 OK</code><span class="t"><a href="List-ConditionList02.html">List v3</a> gespeichert</span></div>
      <p class="note st on2">ebenso für die Prozeduren-Liste (47519-4): <a href="Parameters-ProcedureListWrite01.html">$write</a> mit If-Match: W/"1" → <a href="Bundle-ProcedureListSearchSet01.html">List v2 + Koloskopie</a></p>

      <!-- 3 Storno und Korrektur -->
      <div class="msg req st on3"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Summary-Liste prüfen</span></div>
      <div class="msg res st on3"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionListSearchSet02.html">List v3</a> – falscher Code für Morbus Crohn</span></div>
      <div class="msg req st on3"><code>POST /Condition/[id]/$entered-in-error</code><span class="t"><a href="Parameters-ConditionEnteredInErrorParameters01.html">Parameters</a>: reason = "Falscher Code ausgewählt"</span></div>
      <div class="msg res st on3"><code>200 OK</code><span class="t"><a href="Condition-ConditionEntry03EnteredInError.html">Storno vermerkt</a>: practitioner, datetime, reason</span></div>
      <p class="note st on3">die Fachanwendung entfernt den Eintrag selbst aus der Summary-Liste – kein $write durch den Client · <a href="Bundle-ConditionListSearchSet03.html">List v4</a>, List.source = e-Diagnose Fachanwendung</p>
      <div class="msg req st on3"><code>POST /Condition</code><span class="t"><a href="Condition-ConditionEntry06.html">Morbus Crohn</a>, korrekt codiert</span></div>
      <div class="msg res st on3"><code>201 Created</code><span class="t">neue id</span></div>
      <div class="msg req st on3"><code>POST /List/$write</code><span class="t"><a href="Parameters-ConditionListWrite03.html">Parameters</a>: + Morbus Crohn · If-Match: W/"4"</span></div>
      <div class="msg res st on3"><code>200 OK</code><span class="t"><a href="Bundle-ConditionListSearchSet04.html">List v5</a> gespeichert</span></div>

      <!-- 4 Löschung -->
      <div class="msg req st on4"><code>GET /Condition?patient=[id]</code><span class="t">Gesamtansicht über das Portal abrufen</span></div>
      <div class="msg res st on4"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionSearchSet02.html">6 Diagnosen</a>, inkl. storniertem Eintrag</span></div>
      <div class="msg req st on4"><code>POST /Condition/[id]/$delete</code><span class="t">Candida-Balanitis, durch den ELGA-Teilnehmer über das Portal</span></div>
      <div class="msg res st on4"><code>200 OK</code><span class="t">Eintrag unwiderruflich gelöscht</span></div>
      <div class="msg req st on4"><code>GET /Condition?patient=[id]</code><span class="t">Ergebnis prüfen</span></div>
      <div class="msg res st on4"><code>200 Bundle</code><span class="t"><a href="Bundle-ConditionSearchSet03.html">5 Diagnosen</a>, ohne Candida-Balanitis</span></div>
      <p class="note st on4">wäre der Eintrag in der Summary-Liste: neue Listenversion ohne ihn, List.source = Patient</p>
    </div>
  </section>

  <nav class="bar" aria-label="Zeitpunkt wählen">
    <div class="nav">
      <span class="arrow off st on0" aria-hidden="true">&#8249;</span>
      <label class="arrow st on1" for="s0" title="Zurück: 03.03.2026 Initialisierung">&#8249;</label>
      <label class="arrow st on2" for="s1" title="Zurück: 03.03.2026 1. Arztbesuch">&#8249;</label>
      <label class="arrow st on3" for="s2" title="Zurück: 09.03.2026 2. Arztbesuch">&#8249;</label>
      <label class="arrow st on4" for="s3" title="Zurück: 09.03.2026 Storno &amp; Korrektur">&#8249;</label>
    </div>
    <div class="stops">
      <span class="line"></span><span class="fill"></span>
      <label class="stop" for="s0"><span class="dot"></span><span class="d">03.03.2026</span><span class="n">Initialisierung</span></label>
      <label class="stop" for="s1"><span class="dot"></span><span class="d">03.03.2026</span><span class="n">1. Arztbesuch</span></label>
      <label class="stop" for="s2"><span class="dot"></span><span class="d">09.03.2026</span><span class="n">2. Arztbesuch</span></label>
      <label class="stop" for="s3"><span class="dot"></span><span class="d">09.03.2026</span><span class="n">Storno &amp; Korrektur</span></label>
      <label class="stop" for="s4"><span class="dot"></span><span class="d">20.04.2026</span><span class="n">Löschung</span></label>
    </div>
    <div class="nav">
      <label class="arrow st on0" for="s1" title="Weiter: 03.03.2026 1. Arztbesuch">&#8250;</label>
      <label class="arrow st on1" for="s2" title="Weiter: 09.03.2026 2. Arztbesuch">&#8250;</label>
      <label class="arrow st on2" for="s3" title="Weiter: 09.03.2026 Storno &amp; Korrektur">&#8250;</label>
      <label class="arrow st on3" for="s4" title="Weiter: 20.04.2026 Löschung">&#8250;</label>
      <span class="arrow off st on4" aria-hidden="true">&#8250;</span>
    </div>
  </nav>
</div>
