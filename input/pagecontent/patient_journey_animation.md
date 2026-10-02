<style>
:root{
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
@media (prefers-color-scheme: dark){
  :root:not([data-theme="light"]){
    --bg:#0e1119;
    --surface:#161a24;
    --ink:#e9ecf3;
    --ink-2:#a7b0c3;
    --ink-3:#7f889c;
    --line:#2a3040;
    --track:#262c3a;
    --blue:#8badf0;
    --blue-soft:#1a2333;
    --gold-field:#2b2413;
    --gold-line:#a8842a;
    --gold-ink:#e6c76b;
    --brick:#e59187;
    --brick-soft:#2e1d1b;
    --grow:#71c496;
    --grow-soft:#16261d;
  }
}
:root[data-theme="dark"]{
  --bg:#0e1119;
  --surface:#161a24;
  --ink:#e9ecf3;
  --ink-2:#a7b0c3;
  --ink-3:#7f889c;
  --line:#2a3040;
  --track:#262c3a;
  --blue:#8badf0;
  --blue-soft:#1a2333;
  --gold-field:#2b2413;
  --gold-line:#a8842a;
  --gold-ink:#e6c76b;
  --brick:#e59187;
  --brick-soft:#2e1d1b;
  --grow:#71c496;
  --grow-soft:#16261d;
}

*{box-sizing:border-box}
body{
  background:var(--bg);color:var(--ink);
  font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
  font-size:15px;line-height:1.5
}

.pj{position:relative;max-width:1080px;margin:0 auto;padding:28px 22px 0}
.sr{position:absolute;width:1px;height:1px;opacity:0;pointer-events:none}

h1{font-size:26px;font-weight:700;letter-spacing:-.015em;margin:0 0 14px;text-wrap:balance}

.legend{display:flex;flex-wrap:wrap;gap:6px 22px;margin:0 0 18px;font-size:13px;color:var(--ink-2)}
.legend span{display:inline-flex;align-items:center;gap:8px}
.sw{width:24px;height:14px;border-radius:4px}
.sw-g{border:1.5px dashed var(--blue)}
.sw-s{border:1.5px solid var(--gold-line);background:var(--gold-field)}
.sw-n{width:9px;height:9px;border-radius:50%;background:var(--grow)}
.sw-x{width:9px;height:9px;border-radius:50%;background:var(--brick)}

/* caption of the current step */
.caption{border-left:3px solid var(--blue);padding:2px 0 2px 14px;margin:0 0 26px;min-height:48px}
.caption p{margin:0;max-width:72ch;color:var(--ink-2)}
.caption b{color:var(--ink);font-weight:600}
.caption .d{font-variant-numeric:tabular-nums;color:var(--blue);font-weight:600;margin-right:6px}

/* three categories */
.cats{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:20px;align-items:stretch}
.cat{display:flex;flex-direction:column;min-width:0}
.cat h2{font-size:15px;font-weight:600;margin:0 0 10px}
.gesamt{
  position:relative;flex:1;border:1.5px dashed var(--blue);border-radius:12px;
  padding:22px 12px 12px;display:flex;flex-direction:column;gap:12px;min-height:170px
}
.gesamt::before{
  content:"Gesamtansicht";position:absolute;top:-9px;left:12px;padding:0 6px;background:var(--bg);
  font-size:10px;font-weight:600;letter-spacing:.11em;text-transform:uppercase;color:var(--blue)
}
.field{background:var(--gold-field);border:1.5px solid var(--gold-line);border-radius:9px;padding:9px 10px 11px}
.field-t{display:block;font-size:11px;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:var(--gold-ink);margin-bottom:8px}
.empty{margin:0;font-size:12px;color:var(--gold-ink);opacity:.8}

.tags{list-style:none;margin:0;padding:0;display:flex;flex-wrap:wrap;gap:6px}
.tag{
  display:inline-flex;align-items:center;gap:7px;padding:4px 10px 4px 8px;border-radius:999px;
  background:var(--surface);border:1px solid var(--line);font-size:13px;font-weight:500
}
.field .tag{border-color:var(--gold-line)}
.tag::before{content:"";width:8px;height:8px;border-radius:50%;background:var(--blue);opacity:.55;flex:none}
.tag::after{font-size:9px;font-weight:700;letter-spacing:.06em;text-transform:uppercase}

/* exchange between client and server */
.wire{margin:28px 0 0;padding-top:18px;border-top:1px solid var(--line)}
.wire h2{font-size:11px;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:var(--ink-3);margin:0 0 10px}
.lanes{display:flex;justify-content:space-between;gap:12px;font-size:12px;font-weight:600;color:var(--ink-2);margin-bottom:9px}
.msgs{display:flex;flex-direction:column;gap:5px}
.msg{display:flex;flex-wrap:wrap;align-items:baseline;gap:4px 10px;padding:6px 11px;border-radius:7px;font-size:12.5px;color:var(--ink-2)}
.msg code{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12px;font-weight:600;color:var(--ink);overflow-wrap:anywhere}
.msg .t{min-width:0}
.req{background:var(--blue-soft);border-left:3px solid var(--blue);margin-right:12%}
.req::after{content:"\2192";margin-left:auto;padding-left:8px;color:var(--blue);font-weight:700}
.res{background:var(--surface);border-right:3px solid var(--line);margin-left:12%;text-align:right}
.res::before{content:"\2190";margin-right:auto;padding-right:8px;color:var(--ink-3);font-weight:700}
.note{font-size:12px;font-style:italic;color:var(--ink-3);text-align:center;padding:1px 10px;margin:0}

/* timeline (radio labels) */
.bar{
  position:sticky;bottom:0;margin:30px -22px 0;padding:14px 22px 16px;
  background:var(--bg);border-top:1px solid var(--line)
}
.stops{position:relative;display:grid;grid-template-columns:repeat(5,1fr)}
.line,.fill{position:absolute;top:7px;height:3px;border-radius:2px}
.line{left:10%;right:10%;background:var(--track)}
.fill{left:10%;width:0;background:var(--blue)}
.stop{position:relative;display:flex;flex-direction:column;align-items:center;gap:3px;cursor:pointer;padding:0 4px;text-align:center}
.dot{width:17px;height:17px;border-radius:50%;background:var(--surface);border:2px solid var(--line)}
.stop .d{font-size:12px;font-variant-numeric:tabular-nums;color:var(--ink-2)}
.stop .n{font-size:11px;color:var(--ink-3)}
.stop:hover .dot{border-color:var(--blue)}

/* ---------- state per step (no JavaScript) ---------- */
#s0:checked ~ * .st:not(.on0),
#s1:checked ~ * .st:not(.on1),
#s2:checked ~ * .st:not(.on2),
#s3:checked ~ * .st:not(.on3),
#s4:checked ~ * .st:not(.on4){display:none}

/* newly added in this step */
#s1:checked ~ * .new1,
#s2:checked ~ * .new2{border-color:var(--grow);box-shadow:0 0 0 2px var(--grow-soft)}
#s1:checked ~ * .new1::after,
#s2:checked ~ * .new2::after{content:"neu";color:var(--grow)}

/* removed in this step */
#s3:checked ~ * .gone3,
#s4:checked ~ * .gone4{background:var(--brick-soft);border-color:var(--brick);color:var(--brick)}
#s3:checked ~ * .gone3::before,
#s4:checked ~ * .gone4::before{background:var(--brick);opacity:1}
#s3:checked ~ * .gone3 span,
#s4:checked ~ * .gone4 span{text-decoration:line-through;text-decoration-thickness:1.5px}
#s3:checked ~ * .gone3::after,
#s4:checked ~ * .gone4::after{content:attr(data-gone)}

/* timeline: progress + current stop */
#s1:checked ~ .bar .fill{width:20%}
#s2:checked ~ .bar .fill{width:40%}
#s3:checked ~ .bar .fill{width:60%}
#s4:checked ~ .bar .fill{width:80%}
#s0:checked ~ .bar [for="s0"] .dot,
#s1:checked ~ .bar [for="s1"] .dot,
#s2:checked ~ .bar [for="s2"] .dot,
#s3:checked ~ .bar [for="s3"] .dot,
#s4:checked ~ .bar [for="s4"] .dot{background:var(--blue);border-color:var(--blue);box-shadow:0 0 0 4px var(--surface)}
#s0:checked ~ .bar [for="s0"] .d,
#s1:checked ~ .bar [for="s1"] .d,
#s2:checked ~ .bar [for="s2"] .d,
#s3:checked ~ .bar [for="s3"] .d,
#s4:checked ~ .bar [for="s4"] .d{color:var(--blue);font-weight:600}
#s0:focus-visible ~ .bar [for="s0"] .dot,
#s1:focus-visible ~ .bar [for="s1"] .dot,
#s2:focus-visible ~ .bar [for="s2"] .dot,
#s3:focus-visible ~ .bar [for="s3"] .dot,
#s4:focus-visible ~ .bar [for="s4"] .dot{outline:2px solid var(--blue);outline-offset:3px}

@media (prefers-reduced-motion:no-preference){
  .fill{transition:width .25s ease}
}
@media (max-width:820px){
  .cats{grid-template-columns:1fr}
  .gesamt{min-height:0}
  .stop .n{display:none}
  .req{margin-right:0}
  .res{margin-left:0}
}
</style>

<div class="pj">
  <input class="sr" type="radio" name="pj-step" id="s0" aria-label="03.03.2026 Initialisierung">
  <input class="sr" type="radio" name="pj-step" id="s1" aria-label="03.03.2026 1. Arztbesuch">
  <input class="sr" type="radio" name="pj-step" id="s2" aria-label="09.03.2026 2. Arztbesuch" checked>
  <input class="sr" type="radio" name="pj-step" id="s3" aria-label="09.03.2026 Storno">
  <input class="sr" type="radio" name="pj-step" id="s4" aria-label="20.04.2026 Löschung">

  <header>
    <h1>Patient Journey Max Mustermann</h1>
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
    <p class="st on2"><span class="d">09.03.2026</span><b>2. Arztbesuch.</b> Morbus Crohn und Koloskopie werden in die Summary-Listen aufgenommen. Die Hyperthyreose wurde irrtümlich erfasst.</p>
    <p class="st on3"><span class="d">09.03.2026</span><b>Storno.</b> Die Ärztin storniert die irrtümlich erfasste Hyperthyreose – sie wird aus der Summary-Liste entfernt.</p>
    <p class="st on4"><span class="d">20.04.2026</span><b>Löschung durch den Patienten.</b> Max Mustermann löscht die Candida-Balanitis über das Portal aus seiner Gesamtansicht.</p>
  </div>

  <div class="cats">
    <section class="cat">
      <h2>Diagnosen</h2>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0">leer</p>
          <ul class="tags">
            <li class="tag st on1 on2 on3 on4 new1"><span>Hypertonie</span></li>
            <li class="tag st on2 on3 on4 new2"><span>Morbus Crohn</span></li>
            <li class="tag st on2 on3 new2 gone3" data-gone="storniert"><span>Hyperthyreose</span></li>
          </ul>
        </div>
        <ul class="tags">
          <li class="tag st on1 on2 on3 on4 new1"><span>Eitrige Angina</span></li>
          <li class="tag st on2 on3 on4 new2"><span>Diarrhö</span></li>
          <li class="tag st on2 on3 on4 new2 gone4" data-gone="gelöscht"><span>Candida-Balanitis</span></li>
        </ul>
      </div>
    </section>

    <section class="cat">
      <h2>Prozeduren</h2>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0 on1">leer</p>
          <ul class="tags">
            <li class="tag st on2 on3 on4 new2"><span>Koloskopie</span></li>
          </ul>
        </div>
      </div>
    </section>

    <section class="cat">
      <h2>Allergien und Intoleranzen</h2>
      <div class="gesamt">
        <div class="field">
          <span class="field-t">Summary-Liste</span>
          <p class="empty st on0">leer</p>
          <ul class="tags">
            <li class="tag st on1 on2 on3 on4 new1"><span>Amoxicillin-Allergie</span></li>
          </ul>
        </div>
      </div>
    </section>
  </div>

  <section class="wire">
    <h2>Datenaustausch in diesem Schritt</h2>
    <div class="lanes"><span>Client &ndash; GDA-Software bzw. ELGA-Portal</span><span>e-Diagnose Fachanwendung</span></div>
    <div class="msgs">
      <!-- 0 Initialisierung -->
      <div class="msg req st on0"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">aktuelle Summary-Liste abrufen</span></div>
      <div class="msg res st on0"><code>200 Bundle</code><span class="t">leere Liste, emptyReason notstarted, v1</span></div>
      <p class="note st on0">ebenso für 47519-4 (Prozeduren) und 48765-2 (Allergien) · List.source = Device</p>

      <!-- 1 Erstvorstellung -->
      <div class="msg req st on1"><code>POST /Condition</code><span class="t">2× Diagnose, dazu 1× POST /AllergyIntolerance</span></div>
      <div class="msg res st on1"><code>201 Created</code><span class="t">je eine id pro Eintrag</span></div>
      <div class="msg req st on1"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Liste inkl. versionId holen</span></div>
      <div class="msg res st on1"><code>200 Bundle</code><span class="t">List v1, leer</span></div>
      <div class="msg req st on1"><code>POST /List/$write</code><span class="t">Parameters: code, list (+ Hypertonie) · If-Match: W/"1"</span></div>
      <div class="msg res st on1"><code>200 OK</code><span class="t">List v2 gespeichert</span></div>
      <p class="note st on1">gleicher Ablauf für die Allergie-Summary-Liste (48765-2)</p>

      <!-- 2 Zweiter Arztbesuch -->
      <div class="msg req st on2"><code>POST /Condition</code><span class="t">4× Diagnose, dazu 1× POST /Procedure</span></div>
      <div class="msg res st on2"><code>201 Created</code><span class="t">je eine id pro Eintrag</span></div>
      <div class="msg req st on2"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Liste inkl. versionId holen</span></div>
      <div class="msg res st on2"><code>200 Bundle</code><span class="t">List v2, 1 Eintrag</span></div>
      <div class="msg req st on2"><code>POST /List/$write</code><span class="t">+ Morbus Crohn, + Hyperthyreose · If-Match: W/"2"</span></div>
      <div class="msg res st on2"><code>200 OK</code><span class="t">List v3 gespeichert</span></div>
      <p class="note st on2">ebenso für die Prozeduren-Liste (47519-4) mit der Koloskopie</p>

      <!-- 3 Storno -->
      <div class="msg req st on3"><code>POST /Condition/[id]/$entered-in-error</code><span class="t">Parameters: reason = "Diagnose irrtümlich erfasst"</span></div>
      <div class="msg res st on3"><code>200 OK</code><span class="t">Storno vermerkt: practitioner, datetime, reason</span></div>
      <p class="note st on3">die Fachanwendung entfernt den Eintrag selbst aus der Summary-Liste – kein $write durch den Client</p>
      <div class="msg req st on3"><code>GET /List?code=11450-4&amp;_include=*</code><span class="t">Ergebnis prüfen</span></div>
      <div class="msg res st on3"><code>200 Bundle</code><span class="t">List v4, ohne Hyperthyreose</span></div>

      <!-- 4 Löschung -->
      <div class="msg req st on4"><code>POST /Condition/[id]/$delete</code><span class="t">durch den ELGA-Teilnehmer über das Portal</span></div>
      <div class="msg res st on4"><code>200 OK</code><span class="t">Eintrag unwiderruflich gelöscht</span></div>
      <p class="note st on4">wäre der Eintrag in der Summary-Liste: neue Listenversion ohne ihn, List.source = Patient</p>
    </div>
  </section>

  <nav class="bar" aria-label="Zeitpunkt wählen">
    <div class="stops">
      <span class="line"></span><span class="fill"></span>
      <label class="stop" for="s0"><span class="dot"></span><span class="d">03.03.2026</span><span class="n">Initialisierung</span></label>
      <label class="stop" for="s1"><span class="dot"></span><span class="d">03.03.2026</span><span class="n">1. Arztbesuch</span></label>
      <label class="stop" for="s2"><span class="dot"></span><span class="d">09.03.2026</span><span class="n">2. Arztbesuch</span></label>
      <label class="stop" for="s3"><span class="dot"></span><span class="d">09.03.2026</span><span class="n">Storno</span></label>
      <label class="stop" for="s4"><span class="dot"></span><span class="d">20.04.2026</span><span class="n">Löschung</span></label>
    </div>
  </nav>
</div>
