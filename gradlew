#!/usr/bin/env sh
# Lightweight Gradle launcher for GitHub Actions and environments with Gradle installed.
# The GitHub workflow installs the exact Gradle version before calling this script.
set -eu
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi
printf '%s\n' 'Gradle is not installed. Install Gradle 9.3.1 or use the included GitHub Actions workflow.' >&2
exit 1
