# =============================================================================
# SumScan SastBot
# Copyright (c) 2026 Md Sumon Mahmud. All Rights Reserved.
#
# Author  : Sumon Mahmud
# GitHub  : https://github.com/creationbd5
# Email   : connect.sumon.mahmud@gmail.com
# Website : www.sumonmahmud.com
#
# Intended for authorized defensive security, secure code review, software
# quality assurance, remediation, and Application Security (AppSec).
# See LICENSE.txt for full terms, limitations, and third-party notices.
# =============================================================================

import sys
import traceback
from pathlib import Path

APP_DIR = Path(__file__).resolve().parent
ERROR_LOG = APP_DIR / "startup_error.log"

def write_startup_error():
    try:
        ERROR_LOG.write_text(traceback.format_exc(), encoding="utf-8")
    except Exception:
        pass

def show_windows_error(message):
    try:
        if sys.platform.startswith("win"):
            import ctypes
            ctypes.windll.user32.MessageBoxW(
                0,
                message,
                "SumScan SastBot - Startup Error",
                0x10,
            )
    except Exception:
        pass

try:
    from PySide6.QtGui import QIcon
    from PySide6.QtWidgets import QApplication
    from sumscan.ui.main_window import MainWindow
except Exception:
    write_startup_error()
    msg = (
        "SumScan SastBot could not load its GUI components.\n\n"
        "Open startup_error.log in the application folder for details."
    )
    print(msg)
    show_windows_error(msg)
    raise

def main():
    try:
        app = QApplication(sys.argv)
        app.setApplicationName("SumScan SastBot")
        app.setOrganizationName("SumScan")

        logo = APP_DIR / "sumscan" / "assets" / "logo.svg"
        if logo.exists():
            app.setWindowIcon(QIcon(str(logo)))

        window = MainWindow()
        window.show()
        return app.exec()
    except Exception:
        write_startup_error()
        msg = (
            "SumScan SastBot encountered a startup error.\n\n"
            "Open startup_error.log in the application folder for details."
        )
        print(msg)
        show_windows_error(msg)
        raise

if __name__ == "__main__":
    sys.exit(main())
