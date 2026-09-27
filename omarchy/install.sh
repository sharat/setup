#!/bin/bash
# Omarchy: Hyprland look'n'feel and Atom themes.
set -euo pipefail

REPO="${REPO:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
HERE="$REPO/omarchy"
OMARCHY_PATH="${OMARCHY_PATH:-/usr/share/omarchy}"
STAMP="$(date +%s)"

# Rounded squircle corners, gaps
target=~/.config/hypr/looknfeel.lua
[[ -e $target && ! -L $target ]] && cp "$target" "$target.bak.$STAMP"
ln -sfn "$HERE/hypr/looknfeel.lua" "$target"
echo "hypr: linked looknfeel.lua"

# Themes: stock base theme + our overrides
for theme_dir in "$HERE"/themes/*/; do
  name="$(basename "$theme_dir")"
  base="$(cat "$theme_dir/base")"
  dest=~/.config/omarchy/themes/$name
  rm -rf "$dest"
  cp -r "$OMARCHY_PATH/themes/$base" "$dest"
  rm -f "$dest"/{neovim.lua,vscode.json,shell.lock.toml}
  find "$theme_dir" -maxdepth 1 -type f ! -name base -exec cp {} "$dest"/ \;
  echo "themes: installed $name (based on $base)"
done
echo "Apply a theme with: omarchy theme set atom-night"
