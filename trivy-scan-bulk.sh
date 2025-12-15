#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <image_list_file>"
    exit 1
fi

IMAGE_LIST="$1"

if [ ! -f "$IMAGE_LIST" ]; then
    echo "Error: File not found: $IMAGE_LIST"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

while IFS= read -r IMAGE || [ -n "$IMAGE" ]; do
    [[ -z "$IMAGE" || "$IMAGE" =~ ^# ]] && continue

    SAFE_NAME=$(echo "$IMAGE" | tr '/:@' '___')
    CSV_FILE="${SAFE_NAME}.csv"

    echo "----------------------------------------"
    "$SCRIPT_DIR/trivy-scan-image.sh" "$IMAGE" "$CSV_FILE"
done < "$IMAGE_LIST"

echo "[✓] Bulk scan completed"
