#!/usr/bin/env bash
set -e

APP_PATH="/Applications/DaVinci Resolve/DaVinci Resolve.app"
TEST_ONLY=false

if [[ "$1" == "--dry-run" || "$1" == "--test" ]]; then
  TEST_ONLY=true
  echo "🔍 Mode TEST (Dry-Run) activé pour DaVinci Resolve Studio"
fi

if [ -d "$APP_PATH" ]; then
  LOCAL_VER=$(defaults read "$APP_PATH/Contents/Info.plist" CFBundleShortVersionString)
else
  LOCAL_VER="0.0.0"
fi

USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

ONLINE_INFO=$(curl -s -H "User-Agent: $USER_AGENT" \
  "https://www.blackmagicdesign.com/api/support/latest-stable-version/davinci-resolve-studio/mac")

ONLINE_VER=$(echo "$ONLINE_INFO" | python3 -c "import sys, json; d=json.load(sys.stdin)['mac']; print(f\"{d['major']}.{d['minor']}.{d['releaseNum']}\")")
DOWNLOAD_ID=$(echo "$ONLINE_INFO" | python3 -c "import sys, json; print(json.load(sys.stdin)['mac']['downloadId'])")

if [ -z "$DOWNLOAD_ID" ] || [ -z "$ONLINE_VER" ]; then
  echo "❌ ERREUR : Impossible de récupérer la version ou l'ID de téléchargement."
  exit 1
fi

echo "Version locale : $LOCAL_VER | Version en ligne : $ONLINE_VER"

if [ "$LOCAL_VER" = "$ONLINE_VER" ] && [ "$TEST_ONLY" = false ]; then
  echo "✅ DaVinci Resolve Studio est déjà à jour."
  exit 0
fi

REQ_JSON='{"firstname":"Nix","lastname":"User","email":"user@domain.com","phone":"0000000000","country":"fr","state":"IDF","city":"Paris","street":"1 rue","product":"DaVinci Resolve Studio"}'

DOWNLOAD_URL=$(curl -s -X POST "https://www.blackmagicdesign.com/api/register/us/download/$DOWNLOAD_ID" \
  -H "Host: www.blackmagicdesign.com" \
  -H "Origin: https://www.blackmagicdesign.com" \
  -H "Referer: https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion" \
  -H "User-Agent: $USER_AGENT" \
  -H "Content-Type: application/json;charset=UTF-8" \
  -d "$REQ_JSON" | tr -d '"' | tr -d '\n')

if [[ ! "$DOWNLOAD_URL" == http* ]]; then
  echo "❌ ERREUR : URL invalide ($DOWNLOAD_URL)"
  exit 1
fi

if [ "$TEST_ONLY" = true ]; then
  HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" -I -L "$DOWNLOAD_URL")
  if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "🎉 TEST RÉUSSI : URL fonctionnelle (HTTP 200)."
    exit 0
  else
    echo "❌ ÉCHEC HTTP $HTTP_STATUS"
    exit 1
  fi
fi

TMP_DIR=$(mktemp -d)
curl -L -o "$TMP_DIR/resolve.zip" "$DOWNLOAD_URL"
unzip -q "$TMP_DIR/resolve.zip" -d "$TMP_DIR"
DMG_FILE=$(find "$TMP_DIR" -name "*.dmg" | head -n 1)

hdiutil attach "$DMG_FILE" -mountpoint /Volumes/DaVinciInstaller -quiet
PKG_FILE=$(find /Volumes/DaVinciInstaller -name "*.pkg" | head -n 1)
sudo installer -pkg "$PKG_FILE" -target /
hdiutil detach /Volumes/DaVinciInstaller -quiet

rm -rf "$TMP_DIR"
echo "🎉 DaVinci Resolve Studio $ONLINE_VER installé !"
