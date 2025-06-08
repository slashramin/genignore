#!/bin/bash
# genignore.sh - Generate a .gitignore file for any language/framework using gitignore.io

set -e

API_URL="https://www.toptal.com/developers/gitignore/api"
BACKUP_SUFFIX=".bak"

print_help() {
  echo "genignore.sh - Instantly generate a .gitignore for any project."
  echo
  echo "Usage:"
  echo "  $0 language1,language2,... [--append]"
  echo
  echo "Options:"
  echo "  --append     Append to existing .gitignore instead of overwriting."
  echo "  --help       Show this help message."
  echo
  echo "Examples:"
  echo "  $0 python,visualstudiocode,linux"
  echo "  $0 node,macos --append"
  echo
  echo "Supported keywords: https://www.toptal.com/developers/gitignore"
  exit 0
}

if [[ "$1" == "--help" || "$1" == "-h" || "$#" -eq 0 ]]; then
  print_help
fi

LANGS=$1
MODE="overwrite"

if [[ "$2" == "--append" ]]; then
  MODE="append"
fi

# Backup existing .gitignore
if [ -f ".gitignore" ]; then
  cp .gitignore ".gitignore${BACKUP_SUFFIX}"
  echo "🗂️  Existing .gitignore found and backed up as .gitignore${BACKUP_SUFFIX}"
fi

# Fetch from gitignore.io
echo "⏳ Generating .gitignore for: $LANGS"
RESPONSE=$(curl -fsSL "${API_URL}/${LANGS}" || true)

if [[ -z "$RESPONSE" ]]; then
  echo "❌ Failed to fetch .gitignore. Please check your internet connection or language keywords."
  exit 1
fi

if [[ "$MODE" == "append" && -f .gitignore ]]; then
  echo "$RESPONSE" >> .gitignore
  echo "✅ Appended new rules to existing .gitignore."
else
  echo "$RESPONSE" > .gitignore
  echo "✅ .gitignore generated for: $LANGS"
fi

echo "🔎 You can browse all supported keywords at:"
echo "    https://www.toptal.com/developers/gitignore"
