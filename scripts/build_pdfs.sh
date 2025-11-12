#!/usr/bin/env bash
set -euo pipefail


mkdir -p build
while IFS= read -r md; do
base=$(basename "$md" .md)
out="build/${base}.pdf"
echo "[Typst] $md -> $out"
typst compile templates/render-md.typ "$out" -i path="$md"
# Optional: stamp commit/date via Typst inputs or post-processing if desired.


done < <(scripts/list_md.sh)


ls -lh build
