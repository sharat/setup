#!/bin/bash
# Shell aliases and gh aliases, for both macOS and Omarchy.
set -euo pipefail

REPO="${REPO:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
ALIASES="$REPO/common/aliases.sh"

case "$(basename "${SHELL:-bash}")" in
  zsh) RC=~/.zshrc ;;
  *) [[ $(uname -s) == Darwin ]] && RC=~/.bash_profile || RC=~/.bashrc ;;
esac

if ! grep -qF "$ALIASES" "$RC" 2>/dev/null; then
  printf '\n# Personal aliases (github.com/sharat/setup)\n[[ -r "%s" ]] && source "%s"\n' "$ALIASES" "$ALIASES" >>"$RC"
  echo "shell: added aliases to $RC"
fi

if command -v gh >/dev/null; then
  gh alias import "$REPO/common/gh-aliases.yml" --clobber
else
  echo "gh: not installed, skipping gh aliases"
fi
