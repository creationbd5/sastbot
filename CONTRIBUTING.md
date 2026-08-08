# Contributing

Thank you for your interest in SumScan SastBot.

Before opening a pull request:

1. Keep changes defensive and appropriate for authorized security analysis.
2. Do not add destructive exploitation, credential theft or stealth/persistence functionality.
3. Add or update tests for analyzer/rule changes.
4. Keep rule IDs stable and unique.
5. Document new third-party dependencies.
6. Run:
   `python -m unittest discover -s tests -v`
   and
   `python -m compileall -q main.py sumscan`

By contributing, you confirm that you have the right to submit the contribution and
that it may be incorporated into this project subject to the repository's license.
