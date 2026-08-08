#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "================================================"
echo "          SumScan SastBot 1.0 • Kali Setup"
echo "================================================"

sudo apt-get update
sudo apt-get install -y \
  python3 python3-venv python3-pip \
  git gh \
  libxcb-cursor0 libxkbcommon-x11-0 libegl1 \
  espeak-ng

python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r requirements.txt

echo
echo "Installation complete."
echo "Start SumScan with: ./run_linux.sh"
echo "Optional analyzers are managed inside Engine Manager."
