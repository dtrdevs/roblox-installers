#!/bin/bash
set -euo pipefail

[[ "$(uname)" == "Darwin" ]] || {
    echo "This script only supports macOS."
    exit 1
}

[[ "$(uname -m)" == "x86_64" ]] || {
    echo "This script is intended for Intel Macs."
    exit 1
}

BASE="https://setup.rbxcdn.com/channel/zmac/mac"

echo "Fetching latest version..."
VERSION="$(curl -fsSL "$BASE/version")"

echo "Downloading Roblox $VERSION..."
curl -fL "$BASE/${VERSION}-RobloxPlayer.zip" -o RobloxPlayer.zip

echo "Extracting..."
unzip -o RobloxPlayer.zip

echo "Done."
echo "RobloxPlayer.app has been extracted to:"
pwd
