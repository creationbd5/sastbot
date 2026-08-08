# SumScan SastBot 1.0

**First Edition**

SumScan SastBot is a local-first desktop Application Security and DevSecOps workbench
for secure source-code review. It combines built-in SAST analysis with optional external
security engines, GitHub repository workflows, remediation guidance, quality gates and
developer-friendly reporting.

Copyright (c) 2026 Md Sumon Mahmud. All Rights Reserved.

## What it does

- Multi-language static source-code security checks.
- Python AST security analysis.
- Optional Semgrep, Bandit, Trivy, Gitleaks and Tree-sitter integration.
- DevSecOps checks for CI/CD, Docker, Kubernetes and environment configuration.
- CWE-linked findings with severity, impact and remediation.
- Secure Fix Preview, editable local fix suggestion and verification re-scan.
- GitHub account/repository workflow using local GitHub CLI authentication.
- Security score, quality gate and technical-debt estimates.
- Interactive HTML, executive PDF, SARIF 2.1.0, JSON and CSV reports.
- Local scan history.
- Animated SUMI security guide and voice assistance.
- Same PySide6 desktop interface on Windows and Kali/Linux.

## Quick start

### Windows

1. Install Python 3.11 or newer.
2. Download and **extract** the release ZIP.
3. Double-click:

```text
run_windows.bat
```

If the GUI does not start:

```text
diagnose_windows.bat
```

### Kali Linux / Debian-based Linux

```bash
chmod +x install_kali.sh run_linux.sh
./install_kali.sh
./run_linux.sh
```

Full instructions: [docs/QUICKSTART.md](docs/QUICKSTART.md)

## Analysis engines

SumScan ships with built-in analyzers so the application works immediately.

Optional engines can be managed from **Engine Manager**:

| Engine | Primary use |
|---|---|
| Semgrep | Multi-language SAST |
| Bandit | Python security |
| Trivy | SCA, filesystem and configuration analysis |
| Gitleaks | Secret detection |
| Tree-sitter | Structural multi-language parsing |

Optional engines are not required for the GUI to run.

## Built-in language coverage

The core rule pack includes checks for:

- Python
- JavaScript / TypeScript
- PHP
- Java
- C#
- Go
- Ruby
- C / C++
- Kotlin

External analyzers can extend language and framework coverage.

## GitHub workflow

The GitHub page uses GitHub CLI authentication. SumScan does not ask users to enter
their GitHub password or Personal Access Token into the application.

Typical flow:

```text
Connect GitHub
→ Select repository
→ Clone temporary local copy
→ Confirm scan
→ Review findings
→ Preview secure fix
→ Apply to local working copy
→ Re-scan
```

Remote GitHub code is not automatically modified or pushed by SumScan.

See [docs/GITHUB_INTEGRATION.md](docs/GITHUB_INTEGRATION.md).

## Privacy and trust

Built-in SumScan scanning is local-first:

- no SumScan cloud database is required;
- local scan history and reports remain on the user's device;
- repository write access is not required for scanning;
- source changes require explicit confirmation;
- optional third-party services have their own privacy/security characteristics.

SumScan deliberately does **not** claim that any software is “100% secure.”
Automated security analysis can produce false positives and false negatives.

## Repository structure

```text
.
├── main.py
├── pyproject.toml
├── requirements.txt
├── requirements-optional.txt
├── run_windows.bat
├── run_linux.sh
├── install_kali.sh
├── build_windows_exe.bat
├── build_linux.sh
├── LICENSE.txt
├── SECURITY.md
├── CHANGELOG.md
├── THIRD_PARTY_NOTICES.md
├── docs/
├── examples/
├── tests/
└── sumscan/
    ├── assets/
    ├── core/
    ├── integrations/
    └── ui/
```

## Development checks

```bash
python -m unittest discover -s tests -v
python -m compileall -q main.py sumscan
```

## Important limitations

SumScan SastBot is a practical local AppSec/DevSecOps workbench, not a guarantee of
software security and not a complete replacement for manual security review or mature
enterprise platforms with organization-wide governance and deep interprocedural analysis.

Always validate findings and code changes before production use.

## Author

**Md Sumon Mahmud**

- GitHub: https://github.com/creationbd5
- Email: connect.sumon.mahmud@gmail.com
- Website: www.sumonmahmud.com

See [LICENSE.txt](LICENSE.txt) for licensing and usage terms.
