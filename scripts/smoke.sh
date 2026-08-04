#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Fail if someone accidentally adds claim-like files
if find . -type f \( -iname '*claim*' -o -iname '*provisional*.pdf' -o -iname '*specification*.pdf' \) ! -path './.git/*' ! -name 'non-cloneable-ip.md' | grep -q .; then
  echo "FAIL: claim/spec artifacts present in public teaser"
  find . -type f \( -iname '*claim*' -o -iname '*provisional*.pdf' -o -iname '*specification*.pdf' \) ! -path './.git/*'
  exit 1
fi
test -f README.md
test -f docs/public-boundary.md
test -f docs/non-cloneable-ip.md
rg -q 'No claims' README.md
echo "patents teaser smoke PASS"
