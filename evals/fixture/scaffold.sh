#!/usr/bin/env bash
# Copies the fixture into the empty eval workspace. Usage: scaffold.sh bare|guided
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
cp -R "$here/repo/." .
if [ "$1" = guided ]; then cp -R "$here/guidelines/." .; fi
