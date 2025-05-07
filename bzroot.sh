. ./download.sh

##### bzroot #####
unzip "$filename" "bzroot" -d "$dir"
cd ./"$dir" || exit
mkdir root
root=$(realpath ./root)
cp bzroot "$root"
cd "$root" || exit
lsinitrd --unpack bzroot
rm bzroot
rm ../bzroot
cd ..
tar -cf bzroot.tar -C ./root .
mv bzroot.tar ../bzroot/
