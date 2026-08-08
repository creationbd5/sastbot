@REM Copyright (c) 2026 Md Sumon Mahmud. All Rights Reserved.
@echo off
setlocal
cd /d "%~dp0"
title Build SumScan SastBot 1.0

python -m pip install -r requirements.txt pyinstaller
python -m PyInstaller --noconfirm --clean --windowed ^
  --name "SumScan-SastBot" ^
  --icon "sumscan\assets\logo.ico" ^
  --add-data "sumscan\assets;sumscan\assets" ^
  main.py

echo.
echo Build complete. Check dist\SumScan-SastBot\
pause
