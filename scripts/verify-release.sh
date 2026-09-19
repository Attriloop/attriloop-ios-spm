#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || ! -f "$1" ]]; then
  echo "usage: scripts/verify-release.sh /path/to/AttriloopSDK.xcframework.zip" >&2
  exit 2
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ZIP="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
EXPECTED="$(swift package --package-path "$ROOT" dump-package | python3 -c 'import json,sys; package=json.load(sys.stdin); targets=[target for target in package["targets"] if target["name"] == "AttriloopSDK" and target["type"] == "binary"]; assert len(targets) == 1; print(targets[0]["checksum"])')"
ACTUAL="$(swift package compute-checksum "$ZIP")"

if [[ "$ACTUAL" != "$EXPECTED" ]]; then
  echo "ZIP checksum does not match Package.swift: expected $EXPECTED, got $ACTUAL" >&2
  exit 1
fi

STAGING="$(mktemp -d /tmp/attriloop-release-check.XXXXXX)"
trap 'rm -rf "$STAGING"' EXIT
unzip -q "$ZIP" -d "$STAGING"
XCFRAMEWORK="$STAGING/AttriloopSDK.xcframework"
if [[ ! -d "$XCFRAMEWORK" ]]; then
  echo "ZIP must contain AttriloopSDK.xcframework at its root" >&2
  exit 1
fi
if find "$STAGING" -name '*.dSYM' -print -quit | grep -q .; then
  echo "Customer ZIP must not include dSYMs" >&2
  exit 1
fi
if ! find "$XCFRAMEWORK" -name PrivacyInfo.xcprivacy -print -quit | grep -q .; then
  echo "XCFramework is missing PrivacyInfo.xcprivacy" >&2
  exit 1
fi
codesign --verify --strict "$XCFRAMEWORK"
echo "Verified checksum, privacy manifest, and XCFramework signature: $ACTUAL"
