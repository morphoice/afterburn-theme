# Afterburn Theme

Dark purple color theme for VS Code.

## Installation

### Option 1: Clone directly into extensions folder

```bash
# macOS / Linux
git clone https://github.com/morphoice/afterburn-theme.git ~/.vscode/extensions/morphoice.afterburn-theme-1.0.0

# Windows
git clone https://github.com/morphoice/afterburn-theme.git %USERPROFILE%\.vscode\extensions\morphoice.afterburn-theme-1.0.0
```

Restart VS Code, then select the theme:
**Preferences > Color Theme > Afterburn Dark**

### Option 2: Install from .vsix

1. Download or build the `.vsix`:
   ```bash
   npm install -g @vscode/vsce
   cd afterburn-theme
   vsce package
   ```
2. Install:
   ```bash
   code --install-extension afterburn-theme-1.0.0.vsix
   ```

### Updating

```bash
cd ~/.vscode/extensions/morphoice.afterburn-theme-1.0.0
git pull
```

Restart VS Code to apply changes.

## Palette

`PALETTE.md` describes the surface scale the theme is built on;
`palette.json` holds the same values for other tools (schema:
`palette.schema.json`).

## Claude Code extension

`patch-claude-code.sh` recolours the Claude Code VS Code extension to the
Afterburn accent (`#f59d08`) — brand orange, focus rings, the send button and
the spinner in auto mode. It keeps the originals as `index.css.orig` /
`index.js.orig`. Re-run it after every extension update, then
**Developer: Reload Window**.
