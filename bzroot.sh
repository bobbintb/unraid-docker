. ./download.sh

##### bzroot #####
cp bzroot "$root"
cd "$root" || exit
lsinitrd --unpack bzroot
cd ..
