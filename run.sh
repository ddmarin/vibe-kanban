#!/bin/bash
set -e

REPO="ddmarin/vibe-kanban"
TAG="v0.1.11-macos-arm64"
CACHE_DIR="$HOME/.vibe-kanban/bin"

mkdir -p "$CACHE_DIR"

# Download if not cached
if [ ! -f "$CACHE_DIR/vibe-kanban" ]; then
  echo "Downloading vibe-kanban..."
  curl -fSL "https://github.com/$REPO/releases/download/$TAG/vibe-kanban.zip" -o "$CACHE_DIR/vibe-kanban.zip"
  unzip -o -q "$CACHE_DIR/vibe-kanban.zip" -d "$CACHE_DIR"
  rm "$CACHE_DIR/vibe-kanban.zip"
  chmod +x "$CACHE_DIR/vibe-kanban"
  xattr -d com.apple.quarantine "$CACHE_DIR/vibe-kanban" 2>/dev/null || true
  echo "Installed to $CACHE_DIR/vibe-kanban"
fi

exec "$CACHE_DIR/vibe-kanban" "$@"
