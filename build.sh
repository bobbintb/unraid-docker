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
echo "Extracting ${filename} to ${dir}"

files_to_extract=("bzimage" "bzroot" "bzroot-gui" "bzfirmware" "bzmodules")
unzip "$filename" "${files_to_extract[@]}" -d "$dir"

cd ./"$dir" || exit
mkdir root
mkdir firmware
root=$(realpath ./root)
firmware=$(realpath ./firmware)

##### bzroot #####
cp bzroot "$root"
cd "$root" || exit
lsinitrd --unpack bzroot
cd ..

##### bzfirmware #####
unsquashfs -d $root/usr bzfirmware
rsync -a $firmware/ $root/usr
tar -cf bzarchive.tar -C $root .
rm -dr $root
mv bzarchive.tar ../
