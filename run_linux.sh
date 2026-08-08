#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "=============================================="
echo "             SumScan SastBot 1.0"
echo "=============================================="

command -v python3 >/dev/null 2>&1 || { echo "[ERROR] python3 not found."; exit 1; }

if [ ! -d ".venv" ]; then
  echo "[1/3] Creating local Python environment..."
  python3 -m venv .venv
fi

echo "[2/3] Checking Python dependencies..."
.venv/bin/python -m pip install --disable-pip-version-check -r requirements.txt

echo "[3/3] Starting SumScan SastBot..."
exec .venv/bin/python main.py
