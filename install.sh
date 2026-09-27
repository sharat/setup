#!/bin/bash
# Set up this machine from the repo. Detects macOS or Omarchy. Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export REPO

case "$(uname -s)" in
  Darwin) platform=mac ;;
  Linux) [[ -d /usr/share/omarchy ]] && platform=omarchy || { echo "Unsupported Linux (not Omarchy)"; exit 1; } ;;
  *) echo "Unsupported OS: $(uname -s)"; exit 1 ;;
esac

echo "Platform: $platform"
"$REPO/common/install.sh"
"$REPO/$platform/install.sh"
echo "Done. Open a new terminal to pick up the aliases."
