#!/bin/bash
# Set up shell aliases, gh aliases, Hyprland look'n'feel and Atom themes on an Omarchy machine.
# Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%s)"

backup() { [[ -e $1 && ! -L $1 ]] && cp "$1" "$1.bak.$STAMP" || true; }

# Bash aliases: source them from ~/.bashrc
SOURCE_LINE="[[ -r \"$REPO/bash/aliases.sh\" ]] && source \"$REPO/bash/aliases.sh\""
if ! grep -qF "$REPO/bash/aliases.sh" ~/.bashrc 2>/dev/null; then
  printf '\n# Personal aliases (github.com/sharat/setup)\n%s\n' "$SOURCE_LINE" >>~/.bashrc
  echo "bash: added aliases to ~/.bashrc"
fi

# GitHub CLI aliases
if command -v gh >/dev/null; then
  gh alias import "$REPO/gh/aliases.yml" --clobber
else
  echo "gh: not installed, skipping aliases"
fi

# Hyprland look'n'feel (rounded squircle corners, gaps)
if [[ -d ~/.config/hypr ]]; then
  backup ~/.config/hypr/looknfeel.lua
  ln -sfn "$REPO/hypr/looknfeel.lua" ~/.config/hypr/looknfeel.lua
  echo "hypr: linked looknfeel.lua"
fi

# Omarchy themes: stock base theme + our overrides
if [[ -n ${OMARCHY_PATH:-} && -d $OMARCHY_PATH/themes ]]; then
  for theme_dir in "$REPO"/themes/*/; do
    name="$(basename "$theme_dir")"
    base="$(cat "$theme_dir/base")"
    dest=~/.config/omarchy/themes/$name
    rm -rf "$dest"
    cp -r "$OMARCHY_PATH/themes/$base" "$dest"
    rm -f "$dest"/{neovim.lua,vscode.json,shell.lock.toml}
    find "$theme_dir" -maxdepth 1 -type f ! -name base -exec cp {} "$dest"/ \;
    echo "themes: installed $name (based on $base)"
  done
else
  echo "themes: Omarchy not found, skipping"
fi

echo "Done. Open a new terminal, and apply a theme with: omarchy theme set atom-night"
