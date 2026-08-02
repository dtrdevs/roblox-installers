#!/bin/bash
set -e

BASE="https://setup.rbxcdn.com/channel/zmacarm64/mac/arm64"
VERSION=$(curl -fsSL "$BASE/version" | sed 's/^version-//')

curl -fL "$BASE/${VERSION}-RobloxPlayer.zip" -o RobloxPlayer.zip
unzip -oq RobloxPlayer.zip

rm -rf "$HOME/Applications/RobloxPlayer.app"
mkdir -p "$HOME/Applications"
mv RobloxPlayer.app "$HOME/Applications/"

rm RobloxPlayer.zip

echo "Installed to $HOME/Applications/RobloxPlayer.app"
