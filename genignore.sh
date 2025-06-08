#!/bin/bash
# genignore.sh - Generate .gitignore file for any language/framework using gitignore.io

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 language1,language2,..."
  echo "Example: $0 python,node,visualstudiocode"
  exit 1
fi

curl -sL "https://www.toptal.com/developers/gitignore/api/$1" -o .gitignore

if [ $? -eq 0 ]; then
  echo "✅ .gitignore generated for: $1"
  echo "You can find the list of supported keywords at:"
  echo "https://www.toptal.com/developers/gitignore"
else
  echo "❌ Failed to generate .gitignore"
fi
