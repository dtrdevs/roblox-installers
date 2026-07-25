#!/bin/bash
set -euo pipefail

[[ "$(uname)" == "Darwin" ]] || {
    echo "This script only supports macOS."
    exit 1
}

[[ "$(uname -m)" == "arm64" ]] || {
    echo "This script is intended for Apple Silicon Macs."
    exit 1
}

BASE="https://setup.rbxcdn.com/channel/zmacarm64/mac/arm64"

echo "Fetching latest version..."
VERSION="$(curl -fsSL "$BASE/version")"

echo "Downloading Roblox $VERSION..."
curl -fL "$BASE/${VERSION}-RobloxPlayer.zip" -o RobloxPlayer.zip

echo "Extracting..."
unzip -o RobloxPlayer.zip

echo "Done."
echo "RobloxPlayer.app has been extracted to:"
pwd
