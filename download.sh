#!/bin/bash
json=$(curl -s https://releases.unraid.net/usb-creator)
version="${1:-$(echo "$json" | jq -r '.os_list[0].name')}"
url=$(echo "$json" | jq -r '.. | objects | select(.name == "'"$version"'") | .url')

if [ -z "$url" ]; then
  echo "URL for '${version}' not found, exiting."
  exit 1
fi

filename=$(basename "${url}")
dir="${filename%.*}"

if [ ! -f "$filename" ]; then
  echo "Downloading ${version} from:"
  echo "$url"
  wget "$url"
fi

echo "Cleaning out workspace..."
rm -rf "$dir"
