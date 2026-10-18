#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ELECTRON_VER="42.3.3"
TMP_DIR="/tmp/electron-win"
DIST_DIR="$DIR/dist/PhaseFoundry-Code-win32-x64"
ZIP_OUT="$DIR/dist/PhaseFoundry-Code-v1.19.2-Windows-x64.zip"

echo "=== Building PhaseFoundry Code for Windows (x64) ==="
mkdir -p "$TMP_DIR" "$DIR/dist"

# Download Windows Electron runtime if not present
if [ ! -f "$TMP_DIR/electron-win32.zip" ]; then
    echo "Downloading Electron v$ELECTRON_VER for Windows..."
    curl -L -o "$TMP_DIR/electron-win32.zip" "https://github.com/electron/electron/releases/download/v${ELECTRON_VER}/electron-v${ELECTRON_VER}-win32-x64.zip"
fi

# Extract to dist directory
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"
echo "Extracting Windows Electron binaries..."
unzip -q -o "$TMP_DIR/electron-win32.zip" -d "$DIST_DIR"

# Rename electron.exe to PhaseFoundry Code.exe
if [ -f "$DIST_DIR/electron.exe" ]; then
    mv "$DIST_DIR/electron.exe" "$DIST_DIR/PhaseFoundry Code.exe"
fi

# Copy icon
if [ -f "$DIR/resources/icons/icon.ico" ]; then
    cp "$DIR/resources/icons/icon.ico" "$DIST_DIR/PhaseFoundry Code.ico"
fi

# Assemble resources/app
echo "Packaging application files..."
APP_DIR="$DIST_DIR/resources/app"
mkdir -p "$APP_DIR"

cp -a "$DIR/out" "$APP_DIR/"
cp -a "$DIR/resources" "$APP_DIR/"
cp -a "$DIR/package.json" "$APP_DIR/"

# Assemble node_modules with win32 native modules
mkdir -p "$APP_DIR/node_modules"
cp -a "$DIR/node_modules/." "$APP_DIR/node_modules/"

echo "Creating portable zip archive..."
cd "$DIR/dist"
rm -f "$ZIP_OUT"
zip -r -q "$ZIP_OUT" "PhaseFoundry-Code-win32-x64"

echo ""
echo "============================================================"
echo "SUCCESS! PhaseFoundry Code for Windows is ready:"
echo "Folder:  $DIST_DIR"
echo "Archive: $ZIP_OUT"
echo "Executable: $DIST_DIR/PhaseFoundry Code.exe"
echo "============================================================"
