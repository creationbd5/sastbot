@REM Copyright (c) 2026 Md Sumon Mahmud. All Rights Reserved.
@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title SumScan SastBot 1.0

echo ============================================================
echo                    SumScan SastBot 1.0
echo ============================================================
echo.

set "PY_CMD="
where py >nul 2>nul
if not errorlevel 1 set "PY_CMD=py -3"

if not defined PY_CMD (
    where python >nul 2>nul
    if not errorlevel 1 set "PY_CMD=python"
)

if not defined PY_CMD (
    echo [ERROR] Python 3.11+ was not found.
    echo Install Python from python.org and enable "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)

echo [1/3] Checking Python...
%PY_CMD% --version
if errorlevel 1 goto :failed

echo.
echo [2/3] Checking application dependencies...
%PY_CMD% -c "import PySide6, pygments, reportlab; print('Dependencies OK')" >nul 2>nul
if errorlevel 1 (
    echo Installing required Python packages...
    %PY_CMD% -m pip --version >nul 2>nul
    if errorlevel 1 %PY_CMD% -m ensurepip --upgrade
    %PY_CMD% -m pip install --disable-pip-version-check -r "%CD%\requirements.txt"
    if errorlevel 1 (
        echo Retrying with per-user installation...
        %PY_CMD% -m pip install --user --disable-pip-version-check -r "%CD%\requirements.txt"
        if errorlevel 1 goto :failed
    )
)

echo.
echo [3/3] Starting SumScan SastBot...
%PY_CMD% "%CD%\main.py"
if errorlevel 1 goto :app_failed
exit /b 0

:app_failed
echo.
echo [ERROR] SumScan SastBot stopped during startup.
echo Review: %CD%\startup_error.log
echo Or run: diagnose_windows.bat
pause
exit /b 1

:failed
echo.
echo [ERROR] SumScan SastBot setup failed.
echo Run diagnose_windows.bat for details.
pause
exit /b 1
