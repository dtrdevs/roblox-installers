#!/bin/bash

set -euo pipefail

ROBLOX_URL="https://setup.rbxcdn.com/channel/zmacarm64/mac/arm64/Roblox.dmg"
TEMP_DIR="$(mktemp -d)"
DMG_PATH="${TEMP_DIR}/Roblox.dmg"
MOUNT_POINT="${TEMP_DIR}/roblox_mount"

cleanup() {
    if [ -d "${MOUNT_POINT}" ]; then
        hdiutil detach "${MOUNT_POINT}" -force 2>/dev/null || true
    fi
    rm -rf "${TEMP_DIR}"
}
trap cleanup EXIT

curl -sSL --progress-bar "${ROBLOX_URL}" -o "${DMG_PATH}"

mkdir -p "${MOUNT_POINT}"
hdiutil attach "${DMG_PATH}" -mountpoint "${MOUNT_POINT}" -nobrowse -quiet

INSTALLER_APP=$(find "${MOUNT_POINT}" -maxdepth 2 -name "*.app" | head -n 1)

if [ -z "${INSTALLER_APP}" ]; then
    echo "Error: Could not find installer application inside DMG."
    exit 1
fi

open -W "${INSTALLER_APP}"
