#!/usr/bin/env bash
# Setzt die Akzentfarben der Claude-Code-Extension auf die Afterburn-Palette.
# Nach jedem Update der Extension erneut ausfuehren.
set -euo pipefail

EXT_DIR=$(ls -d ~/.vscode/extensions/anthropic.claude-code-*/webview 2>/dev/null | sort -V | tail -1)
[ -z "$EXT_DIR" ] && { echo "Claude-Code-Extension nicht gefunden"; exit 1; }
cd "$EXT_DIR"
echo "Extension: $EXT_DIR"

[ -f index.css.orig ] || cp index.css index.css.orig
[ -f index.js.orig ]  || cp index.js  index.js.orig

python3 - <<'PY'
import re
css=open('index.css',encoding='utf-8').read()
# 1) Altes Terracotta -> Amber (falls Update es zurueckgebracht hat)
css=re.sub(r'(?i)#d97757','#f59d08',css)
css=re.sub(r'(?i)#c6613f','#c28010',css)
# 2) Markenfarben an themebare Keys haengen, Hex bleibt Fallback
ACCENT='#f59d08'
EDGE='#443c5d'
MANUAL='#9a94b8'
sub=[('--app-claude-orange:#f59d08;',              '--app-claude-orange:'+ACCENT+';'),
     ('--app-claude-clay-button-orange:#c28010;',  '--app-claude-clay-button-orange:'+ACCENT+';'),
     ('--app-warning-accent:#e5a54b;',             '--app-warning-accent:'+ACCENT+';'),
     ('--app-input-active-border:var(--vscode-inputOption-activeBorder);',
      '--app-input-active-border:'+ACCENT+';'),
     ('--app-input-border:var(--vscode-inlineChatInput-border,var(--vscode-input-border,var(--vscode-widget-border,#7f7f7f66)));',
      '--app-input-border:'+EDGE+';')]
for a,b in sub:
    if a in css: css=css.replace(a,b)
# 3) Funke an die Markenfarbe statt an den dunklen Button-Ton
css=css.replace('.spark_UCAeZQ{display:block;color:var(--app-claude-clay-button-orange)',
                '.spark_UCAeZQ{display:block;color:var(--app-claude-orange)')
# 4) Fokusring im auto-/bypassPermissions-Modus: Rot -> Akzent
css=css.replace('[data-permission-mode=auto]:focus-within{--focus-ring-color:var(--app-error-foreground)}',
                '[data-permission-mode=auto]:focus-within{--focus-ring-color:'+ACCENT+'}')
# 5) Fokusring im manual/default-Modus: Basisregel -> neutrales Grau
for cls in ('cKsPxg','UCAeZQ'):
    css=css.replace('.inputContainer_%s:focus-within{--focus-ring-color:var(--app-claude-orange);'%cls,
                    '.inputContainer_%s:focus-within{--focus-ring-color:%s;'%(cls,MANUAL))
# 6) Senden-Button im auto-Modus: nur die Flaeche Rot -> Akzent (Icon bleibt hell)
css=css.replace('.sendButton_gGYT1w[data-permission-mode=bypassPermissions],.sendButton_gGYT1w[data-permission-mode=auto]{color:var(--app-button-foreground);background-color:var(--app-error-foreground)}',
                '.sendButton_gGYT1w[data-permission-mode=bypassPermissions],.sendButton_gGYT1w[data-permission-mode=auto]{color:var(--app-button-foreground);background-color:'+ACCENT+'}')
# 7) Spinner-Glyphe im auto-/bypassPermissions-Modus: Rot -> Akzent
css=css.replace('.container_hc5dvw[data-permission-mode=auto] .icon_hc5dvw{color:var(--app-error-foreground)',
                '.container_hc5dvw[data-permission-mode=auto] .icon_hc5dvw{color:'+ACCENT)
open('index.css','w',encoding='utf-8').write(css)

js=open('index.js',encoding='utf-8').read()
js=re.sub(r'(?i)#d97757','#f59d08',js)
js=re.sub(r'(?i)#c6613f','#c28010',js)
open('index.js','w',encoding='utf-8').write(js)
PY

echo "Patch angewendet. Originale liegen als index.css.orig / index.js.orig."
echo "VS Code neu laden: Developer: Reload Window"
