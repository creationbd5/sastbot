#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
python3 -m pip install -r requirements.txt pyinstaller
python3 -m PyInstaller --noconfirm --clean --windowed \
  --name "SumScan-SastBot" \
  --add-data "sumscan/assets:sumscan/assets" \
  main.py
echo "Build complete: dist/SumScan-SastBot"
