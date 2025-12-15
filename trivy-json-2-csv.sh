#!/bin/bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_name> <output_csv>"
    exit 1
fi

IMAGE="$1"
CSV_OUT="$2"
JSON_TMP="$(mktemp)"

command -v trivy >/dev/null || { echo "trivy not installed"; exit 1; }
command -v jq >/dev/null || { echo "jq not installed"; exit 1; }

echo "[*] Scanning image: $IMAGE"

trivy image "$IMAGE" -f json -o "$JSON_TMP"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/trivy-json-2-csv.sh" "$JSON_TMP" "$CSV_OUT"

rm -f "$JSON_TMP"

echo "[+] CSV generated: $CSV_OUT"
