#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: ./scripts/add-style.sh <style-index> <absolute-source-project-path>"
  exit 1
fi

STYLE_INDEX="$1"
SOURCE_PROJECT="$2"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="$REPO_ROOT/docs/$STYLE_INDEX"
BACKUP_DIR="$REPO_ROOT/.backups"
TS="$(date +%Y%m%d-%H%M%S)"

if [ ! -d "$SOURCE_PROJECT" ]; then
  echo "Source project not found: $SOURCE_PROJECT"
  exit 1
fi

pushd "$SOURCE_PROJECT" >/dev/null
npm run build -- --base="/$STYLE_INDEX/"
popd >/dev/null

if [ -d "$TARGET_DIR" ] && [ "$(find "$TARGET_DIR" -mindepth 1 | wc -l | tr -d ' ')" != "0" ]; then
  mkdir -p "$BACKUP_DIR"
  mv "$TARGET_DIR" "$BACKUP_DIR/$STYLE_INDEX-$TS"
fi
mkdir -p "$TARGET_DIR"
cp -R "$SOURCE_PROJECT/dist"/* "$TARGET_DIR"/

echo "Copied style $STYLE_INDEX into $TARGET_DIR"
