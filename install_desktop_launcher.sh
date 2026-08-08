#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
APP_DIR="$(pwd)"
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"
DESKTOP_DIR="$HOME/.local/share/applications"
mkdir -p "$ICON_DIR" "$DESKTOP_DIR"
cp sumscan/assets/logo_256.png "$ICON_DIR/sumscan-sastbot.png"
cat > "$DESKTOP_DIR/sumscan-sastbot.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=SumScan SastBot
Comment=Application Security and DevSecOps Source Code Analysis
Exec=$APP_DIR/run_linux.sh
Icon=sumscan-sastbot
Terminal=false
Categories=Development;Security;
EOF
chmod +x "$DESKTOP_DIR/sumscan-sastbot.desktop"
echo "Desktop launcher installed."
