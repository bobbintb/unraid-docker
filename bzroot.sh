. ./download.sh

##### bzroot #####
unzip "$filename" "bzroot" -d "$dir"
cd ./"$dir" || exit
mkdir root
root=$(realpath ./root)
cp bzroot "$root"
cd "$root" || exit
wget https://slackware.uk/slackware/slackware64-current/slackware64/a/dracut-107-x86_64-1.txz
installpkg dracut-107-x86_64-1.txz
rm dracut-107-x86_64-1.txz
lsinitrd --unpack bzroot
rm bzroot
rm ../bzroot
cd ..
tar -cf bzroot.tar -C ./root .
mv bzroot.tar ../bzroot/
