#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
URLS_FILE="$ROOT_DIR/urls.txt"

if [[ -n "${PING_URLS:-}" ]]; then
  IFS=$'\n' read -r -d '' -a URLS < <(printf '%s\0' "$PING_URLS") || true
elif [[ -f "$URLS_FILE" ]]; then
  mapfile -t URLS < <(grep -vE '^(#|\s*$)' "$URLS_FILE" || true)
else
  echo "No URLs"
  exit 0
fi

for url in "${URLS[@]}"; do
  echo "Ping $url"
  curl -sS -o /dev/null --max-time 15 "$url" || echo "Fail: $url"
  sleep 1
done
