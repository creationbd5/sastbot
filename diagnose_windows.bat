@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title SumScan SastBot Diagnostics

echo ============================================================
echo              SumScan SastBot Diagnostics
echo ============================================================
echo.
echo Folder:
echo %CD%
echo.

echo --- Python commands found ---
where py
where python
echo.

echo --- Python versions ---
py -3 --version
python --version
echo.

echo --- pip ---
py -3 -m pip --version
python -m pip --version
echo.

echo --- GUI dependencies ---
py -3 -c "import PySide6, pygments; print('py launcher: PySide6', PySide6.__version__, 'Pygments', pygments.__version__)"
python -c "import PySide6, pygments; print('python: PySide6', PySide6.__version__, 'Pygments', pygments.__version__)"
echo.

echo --- SumScan import check ---
py -3 -c "import sys; sys.path.insert(0, r'%CD%'); import sumscan.core.engine; print('Core import OK')"
python -c "import sys; sys.path.insert(0, r'%CD%'); import sumscan.core.engine; print('Core import OK')"
echo.

if exist startup_error.log (
    echo --- startup_error.log exists ---
    type startup_error.log
) else (
    echo No startup_error.log currently exists.
)

echo.
echo Take a screenshot of this window if anything says ERROR or Traceback.
echo.
pause
endlocal
