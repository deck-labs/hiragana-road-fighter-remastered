#!/usr/bin/env bash
# ==============================================================================
# Quick Download & Launch Shortcut for Hiragana Road Fighter: Remastered Edition
# Usage:
#   curl -sSL https://raw.githubusercontent.com/deck-labs/hiragana-road-fighter-remastered/main/download.sh | bash
# ==============================================================================
set -e

APPIMAGE="Hiragana_Road_Fighter_Remastered-x86_64.AppImage"
URL="https://github.com/deck-labs/hiragana-road-fighter-remastered/releases/download/v1.0.0/${APPIMAGE}"
FALLBACK_URL="https://github.com/deck-labs/hiragana-road-fighter-remastered/releases/latest/download/${APPIMAGE}"

echo "=== Downloading Hiragana Road Fighter: Remastered Edition ==="
if ! curl -L --progress-bar -f -o "${APPIMAGE}" "${URL}"; then
    echo "Falling back to latest release asset..."
    curl -L --progress-bar -f -o "${APPIMAGE}" "${FALLBACK_URL}"
fi
chmod +x "${APPIMAGE}"

echo "=== Download complete! ==="
echo "AppImage saved to: $(pwd)/${APPIMAGE}"
echo "To run the game anytime: ./${APPIMAGE}"

if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
    echo "Launching game..."
    exec ./"${APPIMAGE}" "$@"
fi
