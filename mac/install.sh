#!/bin/bash
# macOS-specific setup. Shared aliases and gh aliases are handled by common/install.sh.
set -euo pipefail

REPO="${REPO:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

command -v eza >/dev/null || echo "mac: tip: brew install eza (for the l/ll/la aliases)"
