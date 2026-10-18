#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"

mkdir -p "$BIN_DIR" "$DESKTOP_DIR" "$ICON_DIR"

# Install icon
if [ -f "$DIR/resources/icons/phasefoundry-code.png" ]; then
    cp "$DIR/resources/icons/phasefoundry-code.png" "$ICON_DIR/phasefoundry-code.png"
    echo "Installed icon to $ICON_DIR"
fi

# Install desktop shortcut
if [ -f "$DIR/scripts/phasefoundry-code.desktop" ]; then
    cp "$DIR/scripts/phasefoundry-code.desktop" "$DESKTOP_DIR/phasefoundry-code.desktop"
    update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
    echo "Installed desktop entry to $DESKTOP_DIR"
fi

# Ensure scripts are executable
chmod +x "$DIR/scripts/phasefoundry" "$DIR/scripts/phasefoundry-code"

echo "PhaseFoundry Code installed successfully!"
echo "Run 'phasefoundry' for CLI or 'phasefoundry-code' for Desktop GUI."
