#!/bin/bash
# Usage: ./new_version.sh [1|2|3] [company-name]
set -e

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 [1|2|3] [company-name]"
  echo "  1 = fullstack"
  echo "  2 = frontend"
  echo "  3 = backend"
  exit 1
fi

case "$1" in
  1) PREFIX="fullstack";;
  2) PREFIX="frontend";;
  3) PREFIX="backend";;
  *) echo "Invalid type: $1. Use 1, 2, or 3."; exit 1;;
esac

BRANCH="$PREFIX/$2"
git checkout -b "$BRANCH"
./build.sh
git add build/
git commit -m "Build resume PDF for $PREFIX/$2"
git push origin "$BRANCH"
echo "New branch '$BRANCH' created and PDF pushed." 