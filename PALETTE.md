# Afterburn — Flächenpalette

Gemeinsame Grundlage für das VS-Code-Theme *Afterburn* und die PyQt-Anwendung
*Filer*. Dieses Dokument beschreibt ausschließlich die **Flächen** (Hintergründe,
Auswahl, Kanten). Vordergrund-, Akzent- und Syntaxfarben sind nicht Gegenstand.

Beide Projekte teilen dieselbe Farbachse: **Hue 252–255°** (Blauviolett). Die
Skala vereinheitlicht die bisher gewachsenen Einzelwerte zu acht Stufen mit
gleichmäßig wachsenden Abständen.

## Die Skala

| Stufe | Name | Hex | H | S | L | Weiß darauf |
|---|---|---|---|---|---|---|
| **00** | Abgrund | `#0c071d` | 254° | 61% | 7% | 19,7:1 |
| **10** | Grund | `#151028` | 252° | 43% | 11% | 18,5:1 |
| **20** | Fläche | `#1e1735` | 254° | 39% | 15% | 17,1:1 |
| **30** | Erhoben | `#2a2343` | 253° | 31% | 20% | 14,8:1 |
| **40** | Schwebend | `#373050` | 253° | 25% | 25% | 12,3:1 |
| **50** | Kante | `#443c5d` | 255° | 22% | 30% | 10,2:1 |
| **60** | Auswahl | `#524875` | 253° | 24% | 37% | 8,3:1 |
| **70** | Gedimmt | `#6d638c` | 255° | 17% | 47% | 5,5:1 |

**Konstruktionsprinzip:** Hue bleibt bei ~254°. Die Helligkeit steigt in
Schritten von 4–5 Prozentpunkten pro Stufe, die Sättigung fällt dabei von 61 %
auf 17 %. Tiefe Flächen sind also satt und farbig, höher liegende zunehmend
neutral — das hält die hellen Stufen ruhig, obwohl sie mehr Fläche tragen.

Die Abstände zwischen benachbarten Stufen wachsen bewusst von 1,07:1 auf 1,50:1.
Im dunklen Bereich genügen kleine Unterschiede zur Trennung; weiter oben braucht
es mehr, damit die Stufen unterscheidbar bleiben.

## Verwendung

### 00 — Abgrund `#0c071d`
Die tiefste Fläche. **Terminal**, Dateiansicht in Filer, inaktive Tabs.
Signalisiert „hier liegt nichts darüber". Sparsam einsetzen: mehr als zwei
Abgrund-Flächen nebeneinander lassen die Oberfläche löchrig wirken.

### 10 — Grund `#151028`
Der Fensterrahmen. **Sidebar, Titelleiste, Aktivitätsleiste, Statusleiste,
Panel-Hintergrund.** Alles, was das Fenster begrenzt und nicht Arbeitsfläche ist.
Die häufigste Fläche nach Stufe 20.

### 20 — Fläche `#1e1735`
Die Arbeitsfläche. **Editor, Dateiliste, Gutter, Minimap, Breadcrumb.** Der Ort,
an dem der Inhalt steht. Liegt bewusst *über* dem Grund (Stufe 10), damit sich
die Arbeitsfläche vom Rahmen abhebt.

> Diese Stufe ist der Bezugspunkt: Kontrastangaben in diesem Dokument beziehen
> sich, wo nicht anders vermerkt, auf `#1e1735`.

### 30 — Erhoben `#2a2343`
Zwischenebene. **Sektionsköpfe in der Sidebar, gruppierende Flächen,
eingebettete Bereiche.** Für Elemente, die zur Arbeitsfläche gehören, sich aber
absetzen sollen, ohne wie ein Popup zu wirken.

### 40 — Schwebend `#373050`
Alles, was über der Oberfläche liegt. **Menüs, Popups, Eingabefelder,
Dropdowns, Quick Input, Widgets, aktiver Tab.** In Filer die Titel- und
Werkzeugleiste (`panel_bg`).

Der aktive Tab teilt sich diese Stufe mit den Menüs, weil beide dasselbe
aussagen: *dieses Element ist gerade vorn.* Der Kontrast zu den inaktiven Tabs
(Stufe 00) beträgt 1,60:1 — deutlich sichtbar, ohne zu schreien.

### 50 — Kante `#443c5d`
**Trennlinien, Rahmen, Spaltengrenzen, Menütrenner.** Nie als Fläche verwenden.

Gegenüber der Arbeitsfläche 1,67:1, gegenüber Menüs (Stufe 40) 1,21:1 — eine
Trennlinie bleibt damit auch *innerhalb* eines Menüs erkennbar. Filers alter
Wert `#3a3454` erreichte dort nur 1,06:1 und war praktisch unsichtbar.

### 60 — Auswahl `#524875`
**Selektierte Zeilen, markierter Text, aktive Zeile, ausgewählter Menüeintrag.**
Die hellste Fläche, die noch als Hintergrund funktioniert: Weiß darauf erreicht
8,3:1.

Alternativ als Akzentfarbe mit niedriger Deckkraft über der darunterliegenden
Stufe — das ist der Weg, den VS Code für Listenauswahl bevorzugt und der bei
wechselnden Untergründen robuster ist.

### 70 — Gedimmt `#6d638c`
Keine Fläche mehr, sondern **schwacher Vordergrund**: deaktivierte Menüeinträge,
Scrollbar-Griffe (und deren Hover-Zustand), Icon-Schatten, Platzhaltertext.

Bei 5,5:1 gegen Stufe 20 erfüllt die Stufe AA für normalen Text, aber nicht AAA.
Für dauerhaft lesbaren Text ist sie zu schwach — sie ist für *bewusst
zurückgenommene* Elemente gedacht.

## Zuordnung VS Code

| Stufe | Theme-Keys |
|---|---|
| 00 | `terminal.background`, `tab.inactiveBackground`, `editorGroupHeader.tabsBackground` |
| 10 | `sideBar.background`, `activityBar.background`, `titleBar.activeBackground`, `panel.background`, `statusBar.background`, `notifications.background` |
| 20 | `editor.background`, `editorGutter.background`, `minimap.background`, `breadcrumb.background`, `editorGroupHeader.noTabsBackground`, `editorBracketMatch.background` (+ Alpha `9a`) |
| 30 | `sideBarSectionHeader.background` |
| 40 | `tab.activeBackground`, `menu.background`, `quickInput.background`, `editorWidget.background`, `input.background`, `dropdown.background` |
| 50 | Randfarben — derzeit projektseitig auf transparent gesetzt |
| 60 | `editor.selectionBackground`, `list.activeSelectionBackground`, `menu.selectionBackground` |
| 70 | `scrollbarSlider.background`, `input.placeholderForeground`, `menu.separatorBackground` |

## Zuordnung Filer

| Stufe | THEME-Schlüssel |
|---|---|
| 00 | `view_bg`, `term_bg` |
| 10 | `sidebar_bg` |
| 20 | *(in Filer nicht belegt — Dateiansicht nutzt 00)* |
| 30 | `menu_bg` |
| 40 | `panel_bg` |
| 50 | `column_border`, `menu_sep` |
| 60 | `selection_bg`, `sidebar_sel_bg`, `menu_sel_bg` |
| 70 | `menu_dim_fg`, Scrollbar-Hover |

### Transparenz

Filer verwendet für Dateiansicht und Terminal `rgba(...)` mit Alpha 190/255
(≈ 74,5 %), um den Desktop durchscheinen zu lassen. Die Skala führt deckende
Werte; für den transparenten Einsatz sind dies die Entsprechungen, die auf
schwarzem Untergrund die jeweilige Stufe ergeben:

| Stufe | Deckend | Als rgba |
|---|---|---|
| 00 | `#0c071d` | `rgba(16, 9, 39, 190)` |
| 10 | `#151028` | `rgba(28, 21, 54, 190)` |
| 20 | `#1e1735` | `rgba(40, 31, 71, 190)` |

Über hellem Desktop-Hintergrund verschiebt sich die tatsächliche Farbe nach
oben. Wo die Stufe verlässlich sitzen muss, gehört der deckende Wert eingesetzt.

## Regeln

1. **Keine Zwischenwerte.** Wird eine Abstufung gebraucht, die es nicht gibt,
   ist das ein Hinweis auf eine unklare Hierarchie — nicht auf eine fehlende
   Stufe.
2. **Kein Stufensprung nach unten.** Ein Element, das über einem anderen liegt,
   bekommt nie eine dunklere Stufe. Popups sind heller als ihr Untergrund.
3. **Höchstens drei Flächenstufen im Blick.** Mehr Ebenen gleichzeitig sind
   nicht mehr als Hierarchie lesbar.
4. **Kanten nur bei echtem Bedarf.** Wo zwei Stufen aneinandergrenzen, trennt
   der Helligkeitsunterschied bereits; eine zusätzliche Linie ist dann Rauschen.
5. **Hue nicht verändern.** Abweichungen von ~254° fallen sofort als Fremdkörper
   auf. Farbigkeit entsteht über die Akzentfarben, nicht über die Flächen.

## Abweichungen im Ist-Zustand

Die folgenden Werte sind derzeit im Einsatz und weichen von der Skala ab. Alle
liegen unter einer Abweichung, die im Betrieb auffällt (RGB-Distanz ≤ 16),
sollten aber bei der nächsten Überarbeitung angeglichen werden.

| Ort | Ist | Soll | Abweichung |
|---|---|---|---|
| VS Code `statusBar`/`notifications` | `#1b1236` | 10 `#151028` | 12,7 |
| VS Code `sideBarSectionHeader` | `#1d1638` | 30 `#2a2343` | 16,4 |
| VS Code `editor.background` u. a. | `#1e1734` | 20 `#1e1735` | 1,0 |
| Filer `menu_bg` | `#2d244a` | 30 `#2a2343` | 7,7 |
| Filer `column_border`/`menu_sep` | `#3a3454` | 50 `#443c5d` | 15,7 |
| Filer `selection_bg` | `#52477f` | 60 `#524875` | 10,0 |
| Filer `menu_dim_fg` | `#66618a` | 70 `#6d638c` | 7,5 |

Bereits angeglichen: `tab.activeBackground` und alle Popup-Flächen liegen exakt
auf Stufe 40 (`#373050`), `panel_bg` in Filer ebenso.
