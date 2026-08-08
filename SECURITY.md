# Security Policy

## Intended use

SumScan SastBot is intended for defensive security, authorized source-code review,
software quality assurance, remediation and Application Security workflows.

Only scan repositories and code for which you have ownership or explicit permission.

## Local-first design

Built-in SumScan analysis runs locally and does not require a SumScan-operated cloud
database. Scan history and reports are stored on the local device.

Optional third-party integrations can have different data-processing characteristics.
For example, natural neural voice may use an online text-to-speech service, and GitHub
features use the user's local Git/GitHub CLI authentication. Review third-party terms
and configuration before enabling optional services.

## Reporting security issues

Please report security issues privately to:

connect.sumon.mahmud@gmail.com

Include the affected version, operating system, reproduction steps and impact.
Do not include real credentials, customer data or confidential source code in the report.

## Security guarantees

No security-analysis product can guarantee that software is free from vulnerabilities.
SumScan findings may include false positives and false negatives. Human validation is required.
